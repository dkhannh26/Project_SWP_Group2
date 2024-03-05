/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.DAOcart;
import DAO.DAOorder;
import entity.orders;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;
import static url.orderURL.INSERT_ORDERS;
import static url.orderURL.INSERT_ORDERS_DETAILS;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "order", urlPatterns = {INSERT_ORDERS, INSERT_ORDERS_DETAILS})
public class order extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet order</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet order at " + request.getContextPath() + "</h1>");
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
        String username = "son";
        String urlPath = request.getServletPath();
        long currentTimeMillis = System.currentTimeMillis();
        Date currentDate = new Date(currentTimeMillis);
        String address = request.getParameter("address");
        String status = "wait";
        String phoneNumber = request.getParameter("phoneNumber");
        String usernameStaff = request.getParameter("usernameStaff");
        DAOcart daoCart = new DAOcart();
        List<entity.cart> list2 = daoCart.getAll(username);
        DAOorder daoOrder = new DAOorder();
        List<orders> list = daoOrder.getAll();
        switch (urlPath) {
            case INSERT_ORDERS:
                daoOrder.insertOrder(address, currentDate, status, phoneNumber, username, usernameStaff);
                int orderID = daoOrder.getOrderId();
                for (int i = 0; i < list2.size(); i++) {                   
                    daoOrder.insertOrderDetail(list2.get(i).getQuantity(),list2.get(i).getProductID(), orderID);                   
                }
                daoCart.deleteAllCart(username);
                response.sendRedirect("productList");
                break;
        }
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
        processRequest(request, response);
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
