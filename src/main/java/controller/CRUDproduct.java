/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.DAOproduct;
import entity.product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import static url.productURL.DELETE_PRODUCT;
import static url.productURL.UPDATE_JSP_PRODUCT;
import static url.productURL.UPDATE_PRODUCT;

/**
 *
 * @author LENOVO
 */
@WebServlet({UPDATE_JSP_PRODUCT, DELETE_PRODUCT, UPDATE_PRODUCT})
public class CRUDproduct extends HttpServlet {

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
            out.println("<title>Servlet CRUDproduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CRUDproduct at " + request.getContextPath() + "</h1>");
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

        String urlPath = request.getServletPath();
        switch (urlPath) {
            case UPDATE_JSP_PRODUCT:
                String id = request.getParameter("id");
                DAOproduct dao = new DAOproduct();
                product c = dao.getProductById(id);
                request.setAttribute("product", c);
                request.getRequestDispatcher("updateProduct.jsp").forward(request, response);
                break;
            case UPDATE_PRODUCT:
                
//                   Enter id <input type="number" name="id" id="pro_id" value="${c.id}" required min="0"><br>
//            Enter quan: <input type="number" name="quantity" id="pro_quan" value="${c.quantity}"><br>
//            Enter name <input type="text" name="name" id="pro_name" value="${c.name}" required ><br>
//            Enter sale <input type="number" name="promo" id="pro_sale" value="${c.promoID}" required><br>
//            Enter type <input type="number" name="category" id="pro_sale" value="${c.categoryID}" required><br>
//            Enter price <input type="number" name="price" id="price" value="${c.price}" required><br>
//            Enter pic <input type="text" name="pic" id="pro_pic" value="${c.picURL}" required><br>
//            Enter des <input type="text" name="des" id="pro_des" value="${c.description}" required><br>
   
                String quantity = request.getParameter("pro_quan");
                String productId = request.getParameter("id");
                String categoryId = request.getParameter("category");
                String promoId = request.getParameter("promo");
                String name = request.getParameter("name");
                String price = request.getParameter("price");
                String pic = request.getParameter("pic");
                String des = request.getParameter("des");

                DAOproduct updateProduct = new DAOproduct();
                int quanInt = Integer.parseInt(quantity);
                int priceInt = Integer.parseInt(price);
                int idInt = Integer.parseInt(productId);
                int categoryInt = Integer.parseInt(categoryId);
                int promoInt = Integer.parseInt(promoId);

                product product = new product( idInt,  quanInt,  priceInt,  categoryInt,  promoInt,  name,  des,  pic);
//                updateProduct.update(product);

                response.sendRedirect("productList");

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
