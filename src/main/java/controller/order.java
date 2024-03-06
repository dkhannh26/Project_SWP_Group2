/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.DAOcart;
import DAO.DAOorder;
import DAO.DAOproduct;
import DAO.DAOsize;
import entity.orders;
import entity.product;
import entity.size;
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
        String size = request.getParameter("size");
        int totalQ = 0;
        int temp = 0;
        int quanS =0;
        int quantityP = 0;
        String username = "son";
        String urlPath = request.getServletPath();
        long currentTimeMillis = System.currentTimeMillis();
        Date currentDate = new Date(currentTimeMillis);
        String address = request.getParameter("address");
        String status = "wait";
        String phoneNumber = request.getParameter("phoneNumber");
        String usernameStaff = request.getParameter("usernameStaff");
        String id = request.getParameter("id");
        DAOcart daoCart = new DAOcart();
        List<entity.cart> list2 = daoCart.getAll(username);
        DAOorder daoOrder = new DAOorder();
        DAOproduct daoProduct = new DAOproduct();
        List<product> list3 = daoProduct.getAll();
        DAOsize daoSize = new DAOsize();
        List<size> list4 = daoSize.getAll();
        System.out.println(size);
        switch (urlPath) {
            case INSERT_ORDERS:
                daoOrder.insertOrder(address, currentDate, status, phoneNumber, username, usernameStaff);
                int orderID = daoOrder.getOrderId();
                System.out.println(id);
                if (id != null) {
                    int id2 = Integer.parseInt(id);
                    for (int i = 0; i < list3.size(); i++) {
                        if (list3.get(i).getId() == id2) {
                            if (list3.get(i).getQuantity() > 0) {
                                quantityP = list3.get(i).getQuantity() - 1;
                                daoOrder.insertOrderDetail(1, id2, orderID);
                                daoProduct.updateQuan(quantityP, list3.get(i).getId());
                                response.sendRedirect("productList");
                            }
                            if (list3.get(i).getQuantity() <= 0) {
                                String nameP = list3.get(i).getName();
                                String quanP = String.valueOf(list3.get(i).getQuantity());
                                String ms = "<script>\n"
                                        + "        alert(\"Sold out! " + nameP + "Only have " + quanP + "left\")\n"
                                        + "    </script>";
                                request.setAttribute("ms", ms);
                                request.setAttribute("productList", list3);
                                request.getRequestDispatcher("product.jsp").forward(request, response);
                            }
                        }
                    }
                }
                if (id == null) {
                    for (int i = 0; i < list3.size(); i++) {
                        temp = 0;
                        totalQ = 0;
                        for (int j = 0; j < list2.size(); j++) {
                            if (list3.get(i).getId() == list2.get(j).getProductID()) {
                                if (list3.get(i).getQuantity() >= list2.get(j).getQuantity()) {
                                    if (temp == 0) {
                                        for (int k = 0; k < list2.size(); k++) {
                                            if (list2.get(i).getProductID() == list2.get(k).getProductID()) {
                                                totalQ = totalQ + list2.get(k).getQuantity();
                                                quanS = list2.get(k).getQuantity();
                                            }
                                        }
                                        daoOrder.insertOrderDetail(totalQ, list2.get(j).getProductID(), orderID);
                                        daoProduct.updateQuan(totalQ, list2.get(j).getProductID());
                                        daoCart.deleteCart(list2.get(j).getProductID(), username);
                                        temp++;
                                    }
                                }
                                if (list3.get(i).getQuantity() < list2.get(j).getQuantity()) {
                                    String nameP = list3.get(i).getName();
                                    String quanP = String.valueOf(list3.get(i).getQuantity());
                                    String ms = "<script>\n"
                                            + "        alert(\"Sold out! " + nameP + "Only have " + quanP + "left\")\n"
                                            + "    </script>";
                                    request.setAttribute("ms", ms);
                                    request.setAttribute("productList", list3);
                                    request.getRequestDispatcher("product.jsp").forward(request, response);
                                    temp++;
                                }
                            }
                        }
                    }
                    if (totalQ != 0) {
                        response.sendRedirect("productList");
                    }
                }

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
