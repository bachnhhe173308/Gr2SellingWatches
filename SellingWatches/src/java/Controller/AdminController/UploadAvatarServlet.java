
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.AdminController;

import DBContext.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;


@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB
public class UploadAvatarServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("test.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
          PrintWriter out =response.getWriter();
        try{
            String userIDR = request.getParameter("userID");
            int userID =Integer.parseInt(userIDR);
            Part part =request.getPart("img");
            String realPath =request.getServletContext().getRealPath("/uploads");
            String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            if(!Files.exists(Paths.get(realPath))){
                Files.createDirectory(Paths.get(realPath));
            }
            part.write(realPath+"/"+filename);
            
          
            try{
                 
        // Instance of UserDBContext
        UserDBContext dbContext = new UserDBContext();     
        // Update user information
           dbContext.updateUserAvatar(userID, filename);
                
                 // Lấy URL của trang trước đó
    String referer = request.getHeader("Referer");
    
    // Chuyển hướng người dùng trở lại trang trước
    response.sendRedirect(referer); // Đảm bảo referer không null và hợp lệ trước khi sử dụng
            }catch(Exception e){
                out.println(e);
            }
            }catch(Exception e){
                out.println(e);       
        }
    }
}
