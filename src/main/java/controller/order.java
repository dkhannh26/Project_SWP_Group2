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
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;
import static url.orderURL.INSERT_ORDERS;
import static url.orderURL.INSERT_ORDERS_DETAILS;
import static url.orderURL.URL_ORDER_LIST;
import static url.orderURL.URL_UPDATE_STATUS;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "order", urlPatterns = {INSERT_ORDERS, INSERT_ORDERS_DETAILS, URL_ORDER_LIST, URL_UPDATE_STATUS})
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
        int total = 0;
        int totalQ = 0;
        int temp = 0;
        int quanS = 0;
        int quantityP = 0;
        String username = "";
        Cookie arr[] = request.getCookies();
        for (Cookie o : arr) {
            if (o.getName().equals("input")) {
                username = o.getValue();
            }
        }
        String urlPath = request.getServletPath();
        long currentTimeMillis = System.currentTimeMillis();
        Date currentDate = new Date(currentTimeMillis);
        String address = request.getParameter("address");
        String status = "wait";
        String phoneNumber = request.getParameter("phoneNumber");
        String usernameStaff = request.getParameter("usernameStaff");
        String id = request.getParameter("id");
        String total1 = request.getParameter("total");
        System.out.println(total1 + "sddfdsafsd");
        if (total1 != null) {
            total = Integer.parseInt(total1);
        }
        DAOcart daoCart = new DAOcart();
        List<entity.cart> cartList = daoCart.getAll(username);
        DAOorder daoOrder = new DAOorder();
        List<orders> orderList = daoOrder.getAll();
        DAOproduct daoProduct = new DAOproduct();
        List<product> productList = daoProduct.getAll();
        DAOsize daoSize = new DAOsize();
        List<size> sizeList = daoSize.getAll();
        switch (urlPath) {
            case INSERT_ORDERS:
                daoOrder.insertOrder(address, currentDate, status, phoneNumber, username, usernameStaff, total);
                int orderID = daoOrder.getOrderId();
                System.out.println(id);
                if (id != null) {
                    int id2 = Integer.parseInt(id);
                    for (int i = 0; i < productList.size(); i++) {
                        if (productList.get(i).getId() == id2) {
                            if (productList.get(i).getQuantity() > 0) {
                                quantityP = productList.get(i).getQuantity() - 1;
                                daoOrder.insertOrderDetail(1, size, id2, orderID);
                                daoProduct.updateQuan(quantityP, productList.get(i).getId());
                                response.sendRedirect("productList");
                            }
                            if (productList.get(i).getQuantity() <= 0) {
                                String nameP = productList.get(i).getName();
                                String quanP = String.valueOf(productList.get(i).getQuantity());
                                String ms = "<script>\n"
                                        + "        alert(\"Sold out! " + nameP + "Only have " + quanP + "left\")\n"
                                        + "    </script>";
                                request.setAttribute("ms", ms);
                                request.setAttribute("productList", productList);
                                request.getRequestDispatcher("product.jsp").forward(request, response);
                            }
                        }
                    }
                }
                if (id == null) {
                    for (int i = 0; i < productList.size(); i++) {
                        temp = 0;
                        totalQ = 0;
                        String sizeP = "";
                        for (int j = 0; j < cartList.size(); j++) {
                            if (productList.get(i).getId() == cartList.get(j).getProductID()) {
                                if (productList.get(i).getQuantity() >= cartList.get(j).getQuantity()) {
                                    for (int k = 0; k < sizeList.size(); k++) {
                                        if (cartList.get(j).getProductID() == sizeList.get(k).getProduct_id() && cartList.get(j).getSize_name().equals(sizeList.get(k).getSize_name())) {
                                            totalQ = totalQ + cartList.get(j).getQuantity();
                                            sizeP = sizeList.get(k).getSize_name();
                                            quanS = sizeList.get(k).getQuantity() - cartList.get(j).getQuantity();
//                                            daoSize.updateQuanSize(quanS, sizeList.get(k).getProduct_id(), sizeList.get(k).getSize_name());
                                        }
                                    }
                                    daoOrder.insertOrderDetail(totalQ, sizeP, cartList.get(j).getProductID(), orderID);
//                                    daoProduct.updateQuan(totalQ, cartList.get(j).getProductID());
                                    daoCart.deleteCart(cartList.get(j).getProductID(), username);
                                    totalQ = 0;
                                }
                                if (productList.get(i).getQuantity() < cartList.get(j).getQuantity()) {
                                    String nameP = productList.get(i).getName();
                                    String quanP = String.valueOf(productList.get(i).getQuantity());
                                    String ms = "<script>\n"
                                            + "        alert(\"Sold out! " + nameP + "Only have " + quanP + "left\")\n"
                                            + "    </script>";
                                    request.setAttribute("ms", ms);
                                    request.setAttribute("productList", productList);
                                    request.getRequestDispatcher("product.jsp").forward(request, response);
                                    temp++;
                                }
                            }
                        }
                    }
                    if (temp == 0) {
                        response.sendRedirect("productList");
                    }
                }
                break;
            case URL_ORDER_LIST:
                int numberOfOrder = 0;
                int numberOfProduct = 0;
                int revenue = 0;
                int numberOfCustomer = 0;
                DAO.DAOproduct DAOproduct = new DAOproduct();
                String date = request.getParameter("date");

                if (date.equals("date")) {
                    String dateFrom = request.getParameter("from");
                    String dateTo = request.getParameter("to");
                    request.setAttribute("dateFrom", dateFrom);
                    request.setAttribute("dateTo", dateTo);

                    numberOfOrder = DAOproduct.getNumberOfOrderByDate(dateFrom, dateTo);
                    numberOfProduct = DAOproduct.getNumberOfProductByDate(dateFrom, dateTo);
                    revenue = DAOproduct.getRevenueByDate(dateFrom, dateTo);
                    numberOfCustomer = DAOproduct.getNumberOfCustomerByDate(dateFrom, dateTo);

                    request.setAttribute("numberOfProduct", numberOfProduct);
                    request.setAttribute("numberOfOrder", numberOfOrder);
                    request.setAttribute("revenue", revenue);
                    request.setAttribute("numberOfCustomer", numberOfCustomer);
                } else {
                    numberOfProduct = DAOproduct.getNumberOfProduct();
                    numberOfOrder = DAOproduct.getNumberOfOrder();
                    revenue = DAOproduct.getRevenue();
                    numberOfCustomer = DAOproduct.getNumberOfCustomer();

                    request.setAttribute("numberOfOrder", numberOfOrder);
                    request.setAttribute("numberOfProduct", numberOfProduct);
                    request.setAttribute("revenue", revenue);
                    request.setAttribute("numberOfCustomer", numberOfCustomer);

                }
                request.setAttribute("orderList", orderList);

                request.getRequestDispatcher("staff.jsp").forward(request, response);
                break;
            case URL_UPDATE_STATUS:
                System.out.println("dfkjadsfdsn");
                int orderId = Integer.parseInt(request.getParameter("orderId"));
                String newStatus = request.getParameter("status");
                daoOrder.updateStatus(newStatus, orderId);
                response.getWriter().write("success");

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
