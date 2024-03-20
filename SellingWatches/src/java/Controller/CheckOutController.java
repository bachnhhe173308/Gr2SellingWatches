/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DBContext.OrderDBContext;
import DBContext.ProductDBContext;
import DBContext.UserDBContext;
import Model.Cart;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class CheckOutController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Cart cart = (Cart) session.getAttribute("cart");

        if (user != null && cart != null) {
            request.setAttribute("user", user);
            request.setAttribute("cart", cart);
           
            request.getRequestDispatcher("/checkout.jsp").forward(request, response);
        } else {
            // Redirect to login or cart page if necessary
            response.sendRedirect("login.jsp");
        }
    }

  
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    HttpSession session = request.getSession();
    User user = (User) session.getAttribute("user");
    Cart cart = (Cart) session.getAttribute("cart");
    // Retrieve form data
    String userIDR = request.getParameter("UserID");
    int userID =Integer.parseInt(userIDR);
    String fullName = request.getParameter("fullName");
    String email = request.getParameter("email");
    String address = request.getParameter("address");
    String phone = request.getParameter("phone");
    
    // Update the User object
    if (user != null) {
        user.setFullname(fullName);
        user.setMail(email);
        user.setAddress(address);
        user.setPhone(phone);
        
        // Update the user in the database
        UserDBContext userDB = new UserDBContext(); // Giả sử bạn đã khởi tạo và cấu hình đối tượng UserDBContext
        boolean updateSuccess = userDB.updateFullNameMailAddressPhoneByID(userID, fullName, email, address, phone);
        
        if (updateSuccess) {
            // Cập nhật thành công, cập nhật session
            session.setAttribute("user", user);
            // Redirect to a confirmation page
            ProductDBContext productDB = new ProductDBContext();
        // Delete existing cart items for this user
        OrderDBContext orderDB = new OrderDBContext();
        orderDB.addOrder(user, cart);
        session.removeAttribute("cart");
        productDB.deleteCart(userID);

            
            response.sendRedirect("confirmation.jsp"); // Adjust as needed
        } else {
            // Handle the error, maybe redirect to an error page or show an error message
            response.sendRedirect("errorPage.jsp"); // Adjust as needed
        }
    } else {
        // User not found in session, redirect to login page or error page
        response.sendRedirect("login.jsp"); // Adjust as needed
    }
}

   
    


    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
