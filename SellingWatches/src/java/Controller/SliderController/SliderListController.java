/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.SliderController;

import DBContext.SliderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import Model.Slider;

/**
 *
 * @author THINKPAD
 */
public class SliderListController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SliderListController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SliderListController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SliderDAO sliderDAO = new SliderDAO();
        ArrayList<Slider> all_slider = new ArrayList<>();
        all_slider = sliderDAO.getAllSlider();
        request.setAttribute("sliderList", all_slider);
        request.getRequestDispatcher("SliderList.jsp").forward(request, response);
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
        String action = request.getParameter("action");        
        if ("Search".equals(action)) {
            Search(request, response);
        } else if ("Reset".equals(action)) {
            Reset(request, response);
        }               
    }
    private void Search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SliderDAO sliderDAO = new SliderDAO();
        ArrayList<Slider> sliderList = new ArrayList<>();
        String statusSearch = request.getParameter("statusSearch");        
        String sliderTitle = request.getParameter("searchByTitle");
        String backLink = request.getParameter("searchByBackLink");
        sliderList = sliderDAO.searchSlider(sliderTitle, backLink, statusSearch);
        request.setAttribute("statusSearch", statusSearch);
        request.setAttribute("sliderList", sliderList);
        request.getRequestDispatcher("SliderList.jsp").forward(request, response);
    }

    private void Reset(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
