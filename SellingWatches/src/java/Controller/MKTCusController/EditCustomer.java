/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.MKTCusController;

import DBContext.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Model.User;

/**
 *
 * @author THINKPAD
 */
public class EditCustomer extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet EditCustomer</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditCustomer at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int customerID = Integer.parseInt(request.getParameter("CusID"));
        UserDBContext userDAO = new UserDBContext();
        User customer = userDAO.getUserByUserID(customerID);
        request.setAttribute("customerGetFromID", customer);
        
        request.getRequestDispatcher("editCustomer.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int CusID = Integer.parseInt(request.getParameter("CusID"));
        String Fullname = request.getParameter("Fullname");
        String gender = request.getParameter("gender");
        String Phone = request.getParameter("Phone");
        String CusStatus = request.getParameter("CusStatus");
        if (CusStatus != null && CusStatus.equals("checked")) {
            CusStatus = "true";
        } else {
            CusStatus = "false";
        }
        UserDBContext userDAO = new UserDBContext();
        userDAO.updateByUserID(CusID, Fullname, gender, Phone, CusStatus);
                     
        
        String noticeUpdate = "Update Customer " +CusID+ " complete";
        request.setAttribute("noticeUpdate", noticeUpdate);
        
        
        CustomerListController customerListController = new CustomerListController();
        customerListController.doGet(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
