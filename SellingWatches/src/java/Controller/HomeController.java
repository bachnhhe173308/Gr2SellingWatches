/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DBContext.ProductDBContext;
import DBContext.SliderDAO;
import Model.Brand;
import Model.Product;
import Model.Slider;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class HomeController extends HttpServlet {

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
        ProductDBContext ProDB = new ProductDBContext();
//        int totalProduct = ProDB.getTotalProduct();
//        int endPage = totalProduct / 8;
//        if (totalProduct % 8 != 0) {
//            endPage++;
//        }
//        request.setAttribute("endPage", endPage);
        SliderDAO sliderDAO = new SliderDAO();
        ArrayList<Slider> slider_list = new ArrayList<>();
        slider_list = sliderDAO.getSliderActived();
        request.setAttribute("sliderlist", slider_list);
        
        List<Product> hot_products = ProDB.pagingProductByDate();
        List<Product> best_products = ProDB.pagingProductByDiscount();
        List<Product> newProducts = ProDB.getProductIdOrderByDate();
        List<Brand> brand = ProDB.getAllBrand();
        HttpSession session = request.getSession();
        List<Product> lastestProduct = ProDB.getThreeLastestProducts();
        session.setAttribute("lastestP", lastestProduct);
        session.setAttribute("hot_products", hot_products);
        session.setAttribute("best_products", best_products);
        session.setAttribute("newProducts", newProducts);
        session.setAttribute("brand", brand);
        request.getRequestDispatcher("home.jsp").forward(request, response);
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
