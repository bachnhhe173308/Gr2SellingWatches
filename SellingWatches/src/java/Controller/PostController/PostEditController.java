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
import java.nio.file.Files;
import java.nio.file.Path;
import Model.Blog;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import java.nio.file.Paths;

/**
 *
 * @author pc
 */
@MultipartConfig
public class PostEditController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int postId = Integer.parseInt(request.getParameter("id"));
        BlogDBContext db = new BlogDBContext();
        Blog b = db.getAllBlogDetail(postId);
        request.setAttribute("post", b);
        request.setAttribute("postId", postId);
        request.getRequestDispatcher("editPost.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("postId"));
            String title = request.getParameter("titleUpdate");
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
            db.editPost(b, id, fileName);
            // Sau khi tạo bài đăng thành công
            response.sendRedirect("editPost.jsp?success=true");
        } catch (Exception e) {

        }

    }

}
