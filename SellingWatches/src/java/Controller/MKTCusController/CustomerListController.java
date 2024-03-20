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
import java.util.ArrayList;
import java.util.List;
import Model.User;

/**
 *
 * @author THINKPAD
 */
public class CustomerListController extends HttpServlet {

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
            out.println("<title>Servlet CustomerListController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerListController at " + request.getContextPath() + "</h1>");
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
        UserDBContext userDAO = new UserDBContext();
        ArrayList<User> customerFullList = new ArrayList<>();
        customerFullList = userDAO.getUserByRoleID(1);
        int size = customerFullList.size();
        //phan trang
//        int page, numperpage = 3;
//        int size = customerFullList.size();
//        int numpage = (size % numperpage == 0 ? (size / numperpage) : (size / numperpage) + 1);
//        String xpage = request.getParameter("page");
//        if (xpage == null) {
//            page = 1;
//        } else {
//            page = Integer.parseInt(xpage);
//        }
//        int start, end;
//        start = (page - 1) * numperpage;
//        end = Math.min(page * numperpage, size);
//        ArrayList<User> listUserPaging = userDAO.getListByPage(customerFullList, start, end);
//        request.setAttribute("listUserPaging", listUserPaging);
//        request.setAttribute("pageChosing", page);
//        request.setAttribute("numPage", numpage);
        pagination(request, response, size, customerFullList);

        request.getRequestDispatcher("customerList.jsp").forward(request, response);
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
        String statusSearch = request.getParameter("statusSearch");
        String Fullname = request.getParameter("Fullname");
        String Email = request.getParameter("Email");
        String Phone = request.getParameter("Phone");
        UserDBContext userDAO = new UserDBContext();
        ArrayList<User> userList = userDAO.searchCustomer(Fullname, Email, Phone,statusSearch);
        pagination(request, response, userList.size(), userList);        
        request.getRequestDispatcher("customerList.jsp").forward(request, response);    
    }

    private void Reset(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    private void pagination(HttpServletRequest request, HttpServletResponse response, int size, ArrayList list) throws ServletException, IOException{
        int page, numperpage = 3;        
        int numpage = (size % numperpage == 0 ? (size / numperpage) : (size / numperpage) + 1);
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * numperpage;
        end = Math.min(page * numperpage, size);
        UserDBContext userDAO = new UserDBContext();
        ArrayList<User> listUserPaging = userDAO.getListByPage(list, start, end);        
        request.setAttribute("listUserPaging", listUserPaging);
        request.setAttribute("pageChosing", page);
        request.setAttribute("numPage", numpage);
        
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
