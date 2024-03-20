/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DBContext.ProductDBContext;
import Model.Cart;
import Model.Item;
import Model.Product;
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
public class AddToCart extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
      int productId = Integer.parseInt(request.getParameter("productID"));
    HttpSession session = request.getSession();
    
        // Giả sử bạn lưu thông tin người dùng đăng nhập trong session với key là "user"
    if (session.getAttribute("user") == null) {
        // Nếu người dùng chưa đăng nhập, điều hướng họ đến trang đăng nhập
        // và có thể lưu trữ trang hiện tại để quay lại sau khi đăng nhập thành công
        session.setAttribute("lastPage", request.getHeader("Referer"));
        response.sendRedirect("login"); // Điều hướng đến trang đăng nhập
        return;
    }
    
    Cart cart = (Cart) session.getAttribute("cart");
    if (cart == null) {
        cart = new Cart();
        session.setAttribute("cart", cart);
    }
        
    ProductDBContext productDB = new ProductDBContext();
    Product product = productDB.getProductByID(productId);
             double price =product.getPriceDiscount();
    if (product != null) {
        cart.addItem(new Item(product, 1 , price)); // Assuming addItem handles new and existing items
    }
      session.setAttribute("cart", cart);
    // Lấy URL của trang trước đó
    String referer = request.getHeader("Referer");
    
    // Chuyển hướng người dùng trở lại trang trước
    response.sendRedirect(referer); // Đảm bảo referer không null và hợp lệ trước khi sử dụng

    
  
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
