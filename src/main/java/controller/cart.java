/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.DAOcart;
import DAO.DAOproduct;
import entity.product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import static url.cartURL.URL_CART_INSERT;
import static url.cartURL.URL_CART_LIST;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "cart", urlPatterns = {URL_CART_INSERT, URL_CART_LIST})
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String urlPath = request.getServletPath();
        switch (urlPath) {
            case URL_CART_INSERT:
                String ms = "<script>\n"
                        + "        alert(\"Sold out!\")\n"
                        + "    </script>";
                int id = Integer.parseInt(request.getParameter("id"));
                int price = Integer.parseInt(request.getParameter("price"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                int totalQ = quantity;
                int temp = 0;
                int price2 = 0;
                List<product> list = product.getAll();
                List<entity.cart> list2 = cart.getAll(username);
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
                        price2 = quantity * list.get(i).getPrice();
                    }
                }
                for (int i = 0; i < list2.size(); i++) {
                    if (id == (list2.get(i).getProductID()) && username.equals(list2.get(i).getUsername())) {
                        quantity = list2.get(i).getQuantity() + quantity;
                        for (int j = 0; j < list.size(); j++) {
                            if (id == (list.get(j).getId()) && quantity <= (list.get(j).getQuantity())) {
                                price2 = quantity * list.get(j).getPrice();
                                cart.updateCart(username, id, quantity, price2);
                                temp++;
                            } if(quantity > (list.get(j).getQuantity()) && id == (list.get(j).getId())) {
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
                    cart.insertCart(quantity, price2, username, id);
                }
                response.sendRedirect("load");
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
