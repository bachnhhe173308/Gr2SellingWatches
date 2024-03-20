/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DBContext.UserDBContext;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author Admin
 */
public class RegisterController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override

    
     protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        String username = request.getParameter("user");
//        String email = request.getParameter("email");
//        String phone = request.getParameter("phone");
//        String p = request.getParameter("pass");
//        String add = request.getParameter("address");
        
        UserDBContext UserDB = new UserDBContext();
        String username = request.getParameter("user");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("pass");
        String address = request.getParameter("address");
        String rolename = "Customer";
        int roleid = 1;
        boolean status = true;
        String avatar ="avatar1.jpg";
        String genderString = request.getParameter("gender");
        boolean gender = false; // Giả sử mặc định là Female
        if (genderString != null && genderString.equalsIgnoreCase("male")) {
            gender = true; // Nếu giới tính là male thì gán giá trị là 1
        }
          if (UserDB.existedEmail(email)) {
            String ms = "Email existed!";
            request.setAttribute("error", ms);
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        } else if (UserDB.existedPhoneNum(phone)) {
            String ms = "Phone existed!";
            request.setAttribute("error", ms);
            request.getRequestDispatcher("/register.jsp").forward(request, response); 
      
        } else {
            
            int UserID = UserDB.getMaxUserID()+1;
 
            User user = new User(UserID, roleid,email,password,address,phone,username,gender);
            UserDB.register(user);
           
            request.setAttribute("ms1", "Account successfully created!"); 
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}
