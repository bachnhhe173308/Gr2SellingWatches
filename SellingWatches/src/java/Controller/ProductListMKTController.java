/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DBContext.ProductDBContext;
import Model.Product;
import java.io.IOException;
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
public class ProductListMKTController extends HttpServlet {

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
        if (request.getParameter("name") == null
                && request.getParameter("gender") == null
                && request.getParameter("brand") == null
                && request.getParameter("status") == null) {
            ProductDBContext proDB = new ProductDBContext();
            int totalProduct = proDB.getTotalProduct();
            int endPage = totalProduct / 8;
            if (totalProduct % 8 != 0) {
                endPage++;
            }
            String indexP = request.getParameter("index");
            if (indexP == null) {
                indexP = "1";
            }
            int index = Integer.parseInt(indexP);
            List<Product> products = proDB.getAllProduct(index);
            HttpSession session = request.getSession();
            session.removeAttribute("endPageProduct");
            session.setAttribute("endPageProduct", endPage);
            session.removeAttribute("allProducts");
            session.setAttribute("allProducts", products);
        } else {
            String name = request.getParameter("name");
            String gender = request.getParameter("gender");
            String brand = request.getParameter("brand");
            String status = request.getParameter("status");
            ProductDBContext proDB = new ProductDBContext();
            int totalProduct = proDB.getNumberProductWithSearch(name, gender, brand, status);
            int endPage = totalProduct / 8;
            if (totalProduct % 8 != 0) {
                endPage++;
            }
            String indexP = request.getParameter("index");
            if (indexP == null) {
                indexP = "1";
            }
            int index = Integer.parseInt(indexP);
            List<Product> products = proDB.searchProduct(name, gender, brand, status, index);
            HttpSession session = request.getSession();
            session.removeAttribute("endPageProduct");
            session.setAttribute("endPageProduct", endPage);
            session.removeAttribute("allProducts");
            session.setAttribute("allProducts", products);
        }
        request.getRequestDispatcher("productlist.jsp").forward(request, response);

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
//        String name = request.getParameter("name");
//        String gender = request.getParameter("gender");
//        String brand = request.getParameter("brand");
//        String status = request.getParameter("status");
//        ProductDBContext proDB = new ProductDBContext();
//        int totalProduct = proDB.getNumberProductWithSearch(name, gender, brand, status);
//        int endPage = totalProduct / 8;
//        if (totalProduct % 8 != 0) {
//            endPage++;
//        }
//        String indexP = request.getParameter("index");
//        if (indexP == null) {
//            indexP = "1";
//        }
//        int index = Integer.parseInt(indexP);
//        List<Product> products = proDB.searchProduct(name, gender, brand, status, index);
//        HttpSession session = request.getSession();
//        session.removeAttribute("endPageProduct");
//        session.setAttribute("endPageProduct", endPage);
//        session.removeAttribute("allProducts");
//        session.setAttribute("allProducts", products);
//        request.getRequestDispatcher("productlist.jsp").forward(request, response);
    }

}
