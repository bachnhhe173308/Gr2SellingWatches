/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DBContext.UserDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

/**
 *
 * @author Admin
 */
public class ForgotPasswordController extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Hiển thị trang forgotpassword.jsp khi người dùng yêu cầu
        request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
    }

   protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    // Xử lý đặt lại mật khẩu ở đây
    String email = request.getParameter("email");
    String newPassword = request.getParameter("newPassword");
    String confirmPassword = request.getParameter("confirmPassword");

    // Kiểm tra mật khẩu mới và xác nhận mật khẩu
    if (!newPassword.equals(confirmPassword)) {
        // Mật khẩu mới và xác nhận mật khẩu không khớp
        request.setAttribute("error", "New password and confirm password do not match");
        request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
    } else {
        // Cập nhật mật khẩu mới trong cơ sở dữ liệu
         UserDBContext userDB = new UserDBContext();
        //DAO.INSTANCE.updatePasswordByEmail(email, newPassword);
        userDB.updatePass(email, newPassword);
        // Hiển thị thông báo thành công
        request.setAttribute("message", "Password reset successfully");
        request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
    }

    }
}
