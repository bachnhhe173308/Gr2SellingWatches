/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.SliderController;

import DBContext.SliderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Paths;
import Model.Slider;

/**
 *
 * @author THINKPAD
 */
@MultipartConfig
public class EditSlider extends HttpServlet {

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
            out.println("<title>Servlet EditSlider</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditSlider at " + request.getContextPath() + "</h1>");
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
        String SliderID = request.getParameter("SliderID");
        SliderDAO sliderDAO = new SliderDAO();
        Slider slider = sliderDAO.getSliderBySliderID(SliderID);
        request.setAttribute("sliderGetFromID", slider);
        request.getRequestDispatcher("editSlider.jsp").forward(request, response);
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
        int SliderID = Integer.parseInt(request.getParameter("SliderID"));
        String SliderTitle = request.getParameter("SliderTitle");
//        String SliderImage = request.getParameter("SliderImage");

        Part part = request.getPart("sliderImage-upload");
        String realPath = request.getServletContext().getRealPath("/uploads");
        String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
        if (!Files.exists(Paths.get(realPath))) {
            Files.createDirectory(Paths.get(realPath));
        }
        part.write(realPath + "/" + filename);
        String saveFileName = "uploads" + "/" + filename;        

        String Backlink = request.getParameter("Backlink");
        String SliderStatus = request.getParameter("SliderStatus");
        if (SliderStatus != null && SliderStatus.equals("checked")) {
            SliderStatus = "true";
        } else {
            SliderStatus = "false";
        }
        SliderDAO sliderDAO = new SliderDAO();
        sliderDAO.updateSlider(SliderID, SliderTitle, saveFileName, Backlink, SliderStatus);

        String noticeUpdate = "Update slider " + SliderID + " complete";
        request.setAttribute("noticeUpdate", noticeUpdate);
        SliderListController sliderListController = new SliderListController();
        sliderListController.doGet(request, response);
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
