/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.DAOcart;
import DAO.DAOproduct;
import DAO.DAOpromo;
import entity.product;
import entity.promo;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import static url.cartURL.URL_CART_DECREASE;
import static url.cartURL.URL_CART_DELETE;
import static url.cartURL.URL_CART_INCREASE;
import static url.cartURL.URL_CART_INSERT;
import static url.cartURL.URL_CART_LIST;
import static url.cartURL.URL_PAYMENT;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "cart", urlPatterns = {URL_CART_INSERT, URL_CART_LIST, URL_CART_INCREASE, URL_CART_DECREASE, URL_CART_DELETE, URL_PAYMENT})
public class cart extends HttpServlet {

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
            out.println("<title>Servlet cart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet cart at " + request.getContextPath() + "</h1>");
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
    DAOproduct product = new DAOproduct();
    DAOcart cart = new DAOcart();
    String username = "son";
    DAOpromo promo = new DAOpromo();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String size = request.getParameter("size");
        System.out.println(size);
        int id = 0;
        float price = 0;
        int quantity = 0;
        String urlPath = request.getServletPath();
        String ms = "<script>\n"
                + "        alert(\"Sold out!\")\n"
                + "    </script>";
        String idParam = request.getParameter("id");
        String priceParam = request.getParameter("price");
        String quantityParam = request.getParameter("quantity");
        if (idParam != null) {
            id = Integer.parseInt(idParam);
        }
        if (priceParam != null) {
            price = Float.parseFloat(priceParam);
        }
        if (quantityParam != null) {
            quantity = Integer.parseInt(quantityParam);
        }
        int totalQ = quantity;
        List<product> list = product.getAll();
        List<promo> promoList = promo.getAll();
        List<entity.cart> list2 = cart.getAll(username);
        float price2 = 0;
        switch (urlPath) {
            case URL_CART_INSERT:
                int temp = 0;
                if (list2.size() > 0) {
                    for (int i = 0; i < list2.size(); i++) {
                        if (id == (list2.get(i).getProductID()) && username.equals(list2.get(i).getUsername())) {
                            totalQ = totalQ + list2.get(i).getQuantity();
                        }
                    }
                }
                for (int i = 0; i < list.size(); i++) {
                    if (id == (list.get(i).getId())) {
                        int pro_id = list.get(i).getId();
                        product p = product.getProductById(pro_id);
                        price2 = quantity * price;
                    }
                }
                for (int i = 0; i < list2.size(); i++) {
                    if (id == (list2.get(i).getProductID()) && username.equals(list2.get(i).getUsername()) && size.equals(list2.get(i).getSize_name())) {
                        quantity = list2.get(i).getQuantity() + quantity;
                        for (int j = 0; j < list.size(); j++) {
                            if (id == (list.get(j).getId()) && quantity < (list.get(j).getQuantity())) {
                                price2 = quantity * price;
                                cart.updateCart(username, id, quantity, price2,size);
                                temp++;
                            }
                            if (quantity > (list.get(j).getQuantity()) && id == (list.get(j).getId())) {
                                product p = product.getProductById(id);
                                request.setAttribute("ms", ms);
                                request.setAttribute("p", p);
                                request.getRequestDispatcher("productDetail.jsp").forward(request, response);
                                temp++;
                            }
                        }

                    }
                }
                if (temp == 0) {
                    cart.insertCart(quantity, price2, username, id,size);
                }
                response.sendRedirect("loadCart");
                break;
            case URL_CART_INCREASE:
                for (int i = 0; i < list2.size(); i++) {
                    if (id == (list2.get(i).getProductID()) && username.equals(list2.get(i).getUsername()) && size.equals(list2.get(i).getSize_name())) {
                        for (int j = 0; j < list.size(); j++) {
                            int id3 = list.get(j).getId();
                            if (id == (list.get(j).getId()) && quantity < (list.get(j).getQuantity())) {
                                System.out.println(quantity + " " + list.get(j).getQuantity());
                                price2 = quantity * (list.get(j).getPrice() - ((list.get(j).getPrice() * promoList.get(list.get(j).getPromoID() - 1).getPromoPercent()) / 100));
                                cart.updateCart(username, id, quantity, price2,size);
                            }
                            if (quantity > (list.get(j).getQuantity()) && id == (list.get(j).getId())) {
                                product p = product.getProductById(id);
                                request.setAttribute("ms", ms);
                                request.setAttribute("p", p);
                                request.getRequestDispatcher("productDetail.jsp").forward(request, response);
                            }
                        }

                    }
                }
                response.sendRedirect("loadCart");
                break;
            case URL_CART_DECREASE:
                for (int i = 0; i < list2.size(); i++) {
                    if (id == (list2.get(i).getProductID()) && username.equals(list2.get(i).getUsername()) && size.equals(list2.get(i).getSize_name())) {
                        for (int j = 0; j < list.size(); j++) {
                            if (id == (list.get(j).getId()) && quantity <= (list.get(j).getQuantity())) {
                                price2 = quantity * (list.get(j).getPrice() - ((list.get(j).getPrice() * promoList.get(list.get(j).getPromoID() - 1).getPromoPercent()) / 100));
                                cart.updateCart(username, id, quantity, price2,size);
                            }
                            if (quantity > (list.get(j).getQuantity()) && id == (list.get(j).getId())) {
                                product p = product.getProductById(id);
                                request.setAttribute("ms", ms);
                                request.setAttribute("p", p);
                                request.getRequestDispatcher("productDetail.jsp").forward(request, response);
                            }
                        }

                    }
                }
                response.sendRedirect("loadCart");
                break;
            case URL_CART_DELETE:
                cart.deleteCartBySize(id, username,size);
                response.sendRedirect("loadCart?size=" +size);
                break;
            case URL_PAYMENT:
                response.sendRedirect("loadPayment?size=" +size);
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
