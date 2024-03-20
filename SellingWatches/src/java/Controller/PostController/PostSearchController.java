/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.PostController;

import DBContext.BlogDBContext;
import Model.Blog;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Admin
 */
public class PostSearchController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.setCharacterEncoding("UTF-8");
            String searchTerm = request.getParameter("searchTerm");
            String indexString = request.getParameter("index");
            int index = Integer.parseInt(indexString);

            BlogDBContext db = new BlogDBContext();
            //phan trang
            int countPage = db.countPage1(searchTerm);
            int pageSize = 3;
            int endPage = 0;
            endPage = countPage / pageSize;
            if (countPage % pageSize != 0) {
                endPage++;
            }
            //hien thi list blogs theo phan trang
            List<Blog> list = db.getPostListSearch(searchTerm, index, pageSize);
            if (list.isEmpty()) {
                request.setAttribute("notFound", "No post found!");
            } else {
                int foundList = db.coutPostFound(searchTerm);
                request.setAttribute("found1", foundList);
            }
            request.setAttribute("endPage", endPage);
            request.setAttribute("list", list);
            request.setAttribute("searchTerm", searchTerm);
            request.getRequestDispatcher("postSearch.jsp").forward(request, response);
        } catch (Exception e) {

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
        int blogId = Integer.parseInt(request.getParameter("id"));
        int newStatus = Integer.parseInt(request.getParameter("status"));
        BlogDBContext db = new BlogDBContext();
        db.changePostStatus(newStatus, blogId);
        request.setAttribute("status", newStatus);
        request.getRequestDispatcher("postSearch.jsp").forward(request, response);
    }
}
