/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.MKTCusController;

import DBContext.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import Model.User;

/**
 *
 * @author THINKPAD
 */
public class ChangePassController extends HttpServlet {
   
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
            out.println("<title>Servlet ChangePassController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePassController at " + request.getContextPath () + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("changepass.jsp").forward(request, response);
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
        String RealOldPassword = (String) session.getAttribute("pass");
        String oldPassword = request.getParameter("currentpass");
        String newPassword = request.getParameter("newpass");
        String confirmPassword = request.getParameter("confirmpass");
        String regex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\\S+$).{6,}$";
        //validate
        if(!RealOldPassword.equals(oldPassword)){
            request.setAttribute("error","Mật khẩu hiện tại không đúng" );
            request.getRequestDispatcher("changepass.jsp").forward(request, response);
            return;
        }
        else if (oldPassword == null || oldPassword.isEmpty()) {
            request.setAttribute("error", "Mật khẩu hiện tại không hợp lệ");
            request.getRequestDispatcher("changepass.jsp").forward(request, response);
            return;
        }
        
        else if (newPassword == null || newPassword.isEmpty()) {
            request.setAttribute("error", "Mật khẩu hiện tại không hợp lệ");
            request.getRequestDispatcher("changepass.jsp").forward(request, response);
            return;
        }
        
        else if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu xác nhận không khớp");
            request.getRequestDispatcher("changepass.jsp").forward(request, response);
            return;
        }
        else if (newPassword.matches(regex) == false){
            request.setAttribute("error", "Mật khẩu không đủ an toàn, mật khẩu cần dài hơn 6 kí tự, có ít nhất 1 kí tự viết hoa, 1 kí tự viết thường và 1 chữ số ");
            request.getRequestDispatcher("changepass.jsp").forward(request, response);
            return;
        }
        
        //update db
        try {           
           User newUser = (User) session.getAttribute("account");
           UserDBContext userdao = new UserDBContext();
           userdao.updatePass(newUser.getMail(), newPassword);

            // Gửi phản hồi cho người dùng
            request.setAttribute("success", "Mật khẩu đã được thay đổi thành công");
            request.getRequestDispatcher("changepass.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("changepass.jsp?error=database_error");
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
