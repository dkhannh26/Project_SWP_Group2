/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.DAOcustomer;
import com.google.gson.Gson;
import entity.customer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Arrays;
import payLoad.ResponseData;
import static url.profileURL.URL_PROFILE;

/**
 *
 * @author thinh
 */
@WebServlet(name = "profileController", urlPatterns = {URL_PROFILE})
public class profileController extends HttpServlet {

    DAOcustomer daoCustomer = new DAOcustomer();
    private Gson gson = new Gson();

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
       
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         String urlPath = request.getServletPath();
        switch (urlPath) {
            case URL_PROFILE:
                viewProfile(request, response);
                break;

        }
    }

    
    
    private void viewProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        String input = "";
        for (Cookie cooky : cookies) {
            if (cooky.getName().equals("input")) {
                input = cooky.getValue();
                break;
            }
        }
        
       
        
        customer c = daoCustomer.getCustomerByEmailOrUsername(input);
        request.setAttribute("fullName", c.getFullName());
        request.setAttribute("email", c.getEmail());
        request.setAttribute("address", c.getAddress());
        request.setAttribute("phoneNumber", c.getPhoneNumber());
        request.getRequestDispatcher("profile.jsp").forward(request, response);
        
        
//        ResponseData data = new ResponseData();
//        data.setIsSuccess(true);
//        data.setDescription("");
//        data.setData(email);
//        String json = gson.toJson(data);
//        PrintWriter pw = response.getWriter();
//        pw.print(json);
//        pw.flush();
    }
    
   
}
