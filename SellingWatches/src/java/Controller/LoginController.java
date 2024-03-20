/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DBContext.ProductDBContext;
import DBContext.UserDBContext;
import Model.Cart;
import Model.Item;
import Model.Product;
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
public class LoginController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Lấy dữ liệu từ form
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Tạo instance của UserDBContext để truy cập cơ sở dữ liệu
        UserDBContext userDB = new UserDBContext();

        // Kiểm tra thông tin đăng nhập
        User user = userDB.getUserByEmailAndPassword(email, password); // Giả sử bạn đã thêm phương thức này vào UserDBContext

        if (user != null) {
            // Đăng nhập thành công, lưu thông tin người dùng vào session
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            
            ProductDBContext productDB = new ProductDBContext();
            Cart userCart = productDB.getUserCart(user.getUserID()); // Assuming getUserID() is a method in your User class
            session.setAttribute("cart", userCart); // Add the cart to the session
  
            response.sendRedirect("home"); // Giả sử bạn có trang home.jsp
        } else {
            // Đăng nhập thất bại, quay trở lại trang đăng nhập
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    public static void main(String[] args) {
        UserDBContext userDB = new UserDBContext();

        // Kiểm tra thông tin đăng nhập
        User user = userDB.getUserByEmailAndPassword("user@fpt.edu.vn", "user");
        System.out.println(user.getRoleID());
    }
}