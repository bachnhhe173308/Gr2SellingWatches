/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DBContext.OrderDBContext;
import Model.Cart;
import Model.Order;
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
public class MyOrderController extends HttpServlet {
   
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
         // Code to handle displaying the cart
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        // Forward to a JSP page to display the cart
        request.setAttribute("cart", cart);
        
        request.getRequestDispatcher("/myorder.jsp").forward(request, response);
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
        User user = (User) request.getSession().getAttribute("user");
        if (user != null) {
            OrderDBContext orderDB = new OrderDBContext();
            List<Order> orders = orderDB.getAllOrdersByUser(user);
            request.setAttribute("orders", orders);
            request.getRequestDispatcher("myorder.jsp").forward(request, response);
        } else {
            response.sendRedirect("login.jsp");
        }
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
    String orderDate = request.getParameter("orderDate");
    
    // Kiểm tra xem ngày đặt hàng có được nhập không
    if (orderDate != null && !orderDate.isEmpty()) {
        User user = (User) request.getSession().getAttribute("user");
        if (user != null) {
            OrderDBContext orderDB = new OrderDBContext();
            List<Order> orders = orderDB.getOrdersByOrderDate(user, orderDate);
            request.setAttribute("orders", orders);
            request.getRequestDispatcher("myorder.jsp").forward(request, response);
        } else {
            response.sendRedirect("login.jsp");
        }
    } else {
        // Nếu ngày không được nhập, điều hướng lại về trang myorder.jsp
        doGet(request, response);
    }
}
}
