/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.PostController;

import DBContext.BlogDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import Model.Blog;
import Model.User;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author pc
 */
@MultipartConfig
public class PostDetailController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.getRequestDispatcher("postDetail.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            String title = request.getParameter("title");
            String shortDescription = request.getParameter("shortDescription");
            String content = request.getParameter("content");
            Part part = request.getPart("image");
            String realPath = request.getServletContext().getRealPath("/images");
            String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            if (!Files.exists(Paths.get(realPath))) {
                Files.createDirectory(Paths.get(realPath));
            }
            part.write(realPath + "/" + fileName);
            Blog b = new Blog();
            b.setTitle(title);
            b.setShortDescription(shortDescription);
            b.setContent(content);
            BlogDBContext db = new BlogDBContext();
            db.createPost(b, user.getUserID(), fileName);
            System.out.println(fileName);
             //Sau khi tạo bài đăng thành công
            response.sendRedirect("postDetail.jsp?success=true");
        } catch (Exception e) {
            System.out.println(e);
        }
        
    }
    
}
