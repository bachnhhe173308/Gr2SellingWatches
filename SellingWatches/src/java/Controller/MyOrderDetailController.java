/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DBContext.OrderDBContext;
import Model.Order;
import Model.OrderDetail;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Admin
 */
public class MyOrderDetailController extends HttpServlet {
   
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MyOrderDetailController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MyOrderDetailController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
      protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // Lấy thông tin người dùng từ session
    HttpSession session = request.getSession();
    User user = (User) session.getAttribute("user");
    
    // Lấy thông tin chi tiết đơn hàng từ request parameter
    int orderId = Integer.parseInt(request.getParameter("orderId"));
    OrderDBContext orderDB = new OrderDBContext();
    List<OrderDetail> orderDetails = orderDB.getOrderDetailsByOrderId(orderId);
    
    // Lấy thông tin đơn hàng từ orderId
    Order order = orderDB.getOrderById(orderId); // Giả sử có phương thức này để lấy thông tin đơn hàng từ orderId
    
    // Truyền thông tin người dùng, đơn hàng và chi tiết đơn hàng vào request attribute
    request.setAttribute("user", user);
    request.setAttribute("order", order);
    request.setAttribute("orderDetails", orderDetails);
    
    // Forward hoặc redirect đến myorderdetail.jsp
    request.getRequestDispatcher("myorderdetail.jsp").forward(request, response);
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
        processRequest(request, response);
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
