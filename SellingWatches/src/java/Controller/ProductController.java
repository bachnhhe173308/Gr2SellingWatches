/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DBContext.ProductDBContext;
import Model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Product> products = new ArrayList<>();
        ProductDBContext proDB = new ProductDBContext();
        int gender, brandId, endPage, totalProduct, index;
        String indexP;
        if(request.getParameter("productName") != null){
            String productName = request.getParameter("productName");
            totalProduct = proDB.getTotalProductWithName(productName);
            endPage = totalProduct/9;
            if(totalProduct % 9 != 0){
                endPage++;
            }
            indexP = request.getParameter("index");
            if(indexP == null){
                indexP = "1";
            }
            index = Integer.parseInt(indexP);
            products = proDB.getProductByName(productName, index);
        }
        else if (request.getParameter("gender") != null) {
            gender = Integer.parseInt(request.getParameter("gender"));
            totalProduct = proDB.getTotalProductWithGender(gender);
            endPage = totalProduct / 9;
            if (totalProduct % 9 != 0) {
                endPage++;
            }
            indexP = request.getParameter("index");
            if (indexP == null) {
                indexP = "1";
            }
            index = Integer.parseInt(indexP);
            products = proDB.getProductByGender(gender, index);

        } else if (request.getParameter("brand") != null) {
            brandId = Integer.parseInt(request.getParameter("brand"));
            totalProduct = proDB.getTotalProductWithBrand(brandId);
            endPage = totalProduct / 9;
            if (totalProduct % 9 != 0) {
                endPage++;
            }
            indexP = request.getParameter("index");
            if (indexP == null) {
                indexP = "1";
            }
            index = Integer.parseInt(indexP);
            products = proDB.getProductByBrand(brandId, index);
        } else {
            totalProduct = proDB.getTotalProduct();
            endPage = totalProduct / 9;
            if (totalProduct % 9 != 0) {
                endPage++;
            }
            indexP = request.getParameter("index");
            if (indexP == null) {
                indexP = "1";
            }
            index = Integer.parseInt(indexP);
            products = proDB.pagingProduct(index);
        }
        request.setAttribute("endPage", endPage);
        request.setAttribute("products", products);

        request.getRequestDispatcher("product.jsp").forward(request, response);
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

}
