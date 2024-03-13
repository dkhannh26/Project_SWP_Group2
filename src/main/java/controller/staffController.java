/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import DAO.DAOstaff;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import static url.customerURL.URL_LOGIN_CUSTOMER;
import static url.staffURL.URL_LOGIN_STAFF;

/**
 *
 * @author thinh
 */

@WebServlet(name = "staffController", urlPatterns = {URL_LOGIN_STAFF})
public class staffController extends HttpServlet {

    DAOstaff daoStaff = new DAOstaff();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String urlPath = request.getServletPath();
        switch (urlPath) {
            case URL_LOGIN_STAFF:
                login(request, response);
                break;

        }
    }

    protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String input = request.getParameter("input");
        String password = request.getParameter("password");
        password = getMd5(password);
        boolean isSuccess = daoStaff.checkLogin(input, password);
        if (isSuccess) {
            if (input.equals("admin")) {
                response.sendRedirect("/Project_SWP_Group2/statistic?date=none&year=2024");
            } else {
                request.getRequestDispatcher("/index.jsp").forward(request, response);

            }
        } else {
            request.setAttribute("message", "<div id=\"message\" style=\"color: red\">Incorrect username or password</div>");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }

    }

    public static String getMd5(String input) {
        try {

            // Static getInstance method is called with hashing MD5
            MessageDigest md = MessageDigest.getInstance("MD5");

            // digest() method is called to calculate message digest
            // of an input digest() return array of byte
            byte[] messageDigest = md.digest(input.getBytes());

            // Convert byte array into signum representation
            BigInteger no = new BigInteger(1, messageDigest);

            // Convert message digest into hex value
            String hashtext = no.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        } // For specifying wrong message digest algorithms
        catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
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
