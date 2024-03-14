/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.DAOcategory;
import DAO.DAOcustomer;
import DAO.DAOproduct;
import DAO.DAOstaff;
import com.google.gson.Gson;
import entity.customer;
import entity.product;
import entity.staff;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import payLoad.ResponseData;
import static url.customerURL.URL_LOGIN_CUSTOMER;
import static url.staffURL.URL_ACCOUNT_MANAGEMENT_STAFF;
import static url.staffURL.URL_ADD_PRODUCT_STAFF;
import static url.staffURL.URL_BOTH_DELETE_STAFF;
import static url.staffURL.URL_CUSTOMER_DELETE_STAFF;
import static url.staffURL.URL_LOGIN_STAFF;
import static url.staffURL.URL_PRODUCT_DELETE_STAFF;
import static url.staffURL.URL_PRODUCT_MANAGEMENT_STAFF;
import static url.staffURL.URL_PROFILE_STAFF;
import static url.staffURL.URL_SEARCH_ACCOUNT_STAFF;
import static url.staffURL.URL_SEARCH_PRODUCT_STAFF;
import static url.staffURL.URL_SORT_PRODUCT_STAFF;
import static url.staffURL.URL_STAFF_DELETE_STAFF;
import static url.staffURL.URL_UPDATE_ACCOUNT_STAFF;
import static url.staffURL.URL_UPDATE_PRODUCT_STAFF;

/**
 *
 * @author thinh
 */
@WebServlet(name = "staffController", urlPatterns = {URL_UPDATE_ACCOUNT_STAFF, URL_ADD_PRODUCT_STAFF, URL_UPDATE_PRODUCT_STAFF, URL_BOTH_DELETE_STAFF, URL_CUSTOMER_DELETE_STAFF, URL_STAFF_DELETE_STAFF, URL_SEARCH_ACCOUNT_STAFF, URL_ACCOUNT_MANAGEMENT_STAFF, URL_PRODUCT_DELETE_STAFF, URL_LOGIN_STAFF, URL_PRODUCT_MANAGEMENT_STAFF, URL_SORT_PRODUCT_STAFF, URL_SEARCH_PRODUCT_STAFF, URL_PROFILE_STAFF})
public class staffController extends HttpServlet {

    DAOstaff daoStaff = new DAOstaff();
    DAOcustomer daoCustomer = new DAOcustomer();
    DAOproduct daoProduct = new DAOproduct();
    DAOcategory daoCategory = new DAOcategory();
    private Gson gson = new Gson();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String urlPath = request.getServletPath();
        switch (urlPath) {
            case URL_LOGIN_STAFF:
                login(request, response);
                break;
            case URL_PRODUCT_MANAGEMENT_STAFF:
                listProduct(request, response);
                break;
            case URL_SORT_PRODUCT_STAFF:
                sort(request, response);
                break;
            case URL_SEARCH_PRODUCT_STAFF:
                searchProduct(request, response);
                break;
            case URL_PROFILE_STAFF:
                profile(request, response);
                break;
            case URL_PRODUCT_DELETE_STAFF:
                deleteProduct(request, response);
                break;
            case URL_ACCOUNT_MANAGEMENT_STAFF:
                accountList(request, response);
                break;
            case URL_SEARCH_ACCOUNT_STAFF:
                searchAccount(request, response);
                break;
            case URL_STAFF_DELETE_STAFF:
                deleteStaff(request, response);
                break;
            case URL_CUSTOMER_DELETE_STAFF:
                deleteCustomer(request, response);
                break;
            case URL_BOTH_DELETE_STAFF:
                deleteBoth(request, response);
                break;
            case URL_UPDATE_PRODUCT_STAFF:
                updateProduct(request, response);
                break;
            case URL_ADD_PRODUCT_STAFF:

                addProduct(request, response);
                break;
            case URL_UPDATE_ACCOUNT_STAFF:
                updateAccount(request, response);
                break;
        }
    }

    protected void updateAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String fullName = request.getParameter("fullname");
        String phone = request.getParameter("phone");

       boolean isSuccess = daoStaff.updateStaffProfile(email, address, phone, fullName) && daoCustomer.updateUserProfile(email, address, phone, fullName);
        ResponseData data = new ResponseData();
        data.setIsSuccess(isSuccess);
        data.setData("");
        data.setDescription("");
        String json = gson.toJson(data);
        PrintWriter pw = response.getWriter();
        pw.print(json);
        pw.flush();
    }

    protected void addProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("name");
        String quantity = request.getParameter("quantity");
        String promo = request.getParameter("promo");
        String price = request.getParameter("price");
        String gender = request.getParameter("gender");
        String type = request.getParameter("type");
        String des = request.getParameter("des");
        String url = request.getParameter("url");
        //        /Project_SWP_Group2/images/female-dress-size.webp
//        'C:\\fakepath\\banner.jpg'
        int categoryID = daoCategory.getIdType(type, gender);
        url = "/Project_SWP_Group2/images" + url.substring(11, url.length());

        product p = new product(Integer.parseInt(quantity), Integer.parseInt(price), categoryID, Integer.parseInt(promo), name, des, url);
        boolean isSuccess = daoProduct.insert(p);
        ResponseData data = new ResponseData();
        data.setIsSuccess(isSuccess);
        data.setData("");
        data.setDescription("");
        String json = gson.toJson(data);
        PrintWriter pw = response.getWriter();
        pw.print(json);
        pw.flush();
    }

    protected void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        product p = daoProduct.getProductById(Integer.parseInt(id));

        String name = request.getParameter("name");
        String promo = request.getParameter("promo");
        String price = request.getParameter("price");
        String description = request.getParameter("description");

        p.setName(name);
        p.setPromoID(Integer.parseInt(promo));
        p.setPrice(Integer.parseInt(price));
        p.setDescription(description);

        boolean isSuccess = daoProduct.update(p);

        ResponseData data = new ResponseData();
        data.setIsSuccess(isSuccess);
        data.setData("");
        data.setDescription("");
        String json = gson.toJson(data);
        PrintWriter pw = response.getWriter();
        pw.print(json);
        pw.flush();
    }

    protected void deleteBoth(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");

        daoStaff.delete(username);
        daoCustomer.delete(username);

        ResponseData data = new ResponseData();
        data.setIsSuccess(true);
        data.setData("");
        data.setDescription("");
        String json = gson.toJson(data);
        PrintWriter pw = response.getWriter();
        pw.print(json);
        pw.flush();
    }

    protected void deleteStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");

        boolean isSuccess = daoStaff.delete(username);
        ResponseData data = new ResponseData();
        data.setIsSuccess(isSuccess);
        data.setData("");
        data.setDescription("");
        String json = gson.toJson(data);
        PrintWriter pw = response.getWriter();
        pw.print(json);
        pw.flush();
    }

    protected void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");

        boolean isSuccess = daoCustomer.delete(username);
        ResponseData data = new ResponseData();
        data.setIsSuccess(isSuccess);
        data.setData("");
        data.setDescription("");
        String json = gson.toJson(data);
        PrintWriter pw = response.getWriter();
        pw.print(json);
        pw.flush();
    }

    protected void searchAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String input = request.getParameter("input");
        input = "%" + input + "%";
        List<staff> list = daoStaff.search(input);
        ResponseData data = new ResponseData();
        data.setIsSuccess(true);
        data.setData(list);
        data.setDescription("");
        String json = gson.toJson(data);
        PrintWriter pw = response.getWriter();
        pw.print(json);
        pw.flush();
    }

    protected void accountList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<customer> listCustomer = daoCustomer.getAll();
        List<staff> listStaff = daoStaff.getAll();

        ResponseData data = new ResponseData();
        data.setIsSuccess(true);

        Map<String, Object> combinedData = new HashMap<>();
        combinedData.put("customers", listCustomer);
        combinedData.put("staffs", listStaff);
        data.setData(combinedData);

//        data.setData(listCustomer + listStaff);
        data.setDescription("");
        String json = gson.toJson(data);
        PrintWriter pw = response.getWriter();
        pw.print(json);
        pw.flush();
    }

    protected void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        boolean isSuccess = daoProduct.delete(Integer.parseInt(id));
        ResponseData data = new ResponseData();
        data.setIsSuccess(isSuccess);
        data.setData("");
        data.setDescription("");
        String json = gson.toJson(data);
        PrintWriter pw = response.getWriter();
        pw.print(json);
        pw.flush();
    }

    protected void profile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        String input = "";
        for (Cookie cooky : cookies) {
            if (cooky.getName().equals("input")) {
                input = cooky.getValue();
                break;
            }
        }
        staff c = null;
        if (!input.equals("")) {
            c = daoStaff.getStaffByEmailOrUsername(input);
        } else {

        }

        ResponseData data = new ResponseData();
        data.setIsSuccess(true);
        data.setData(c);
        data.setDescription("");
        String json = gson.toJson(data);
        PrintWriter pw = response.getWriter();
        pw.print(json);
        pw.flush();
    }

    protected void searchProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String input = request.getParameter("input");
        input = "%" + input + "%";
        List<product> productList = daoProduct.search(input);
        ResponseData data = new ResponseData();
        data.setIsSuccess(true);
        data.setData(productList);
        data.setDescription("");
        String json = gson.toJson(data);
        PrintWriter pw = response.getWriter();
        pw.print(json);
        pw.flush();
    }

    protected void sort(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String option = request.getParameter("option");
        List<product> productList = null;
        if (option.equals("Increase")) {
            productList = daoProduct.sortIncrease();
//            request.setAttribute("productList", productList);

        } else if (option.equals("Decrease")) {
            productList = daoProduct.sortDecrease();
//            request.setAttribute("productList", productList);
        }

        ResponseData data = new ResponseData();
        data.setIsSuccess(true);
        data.setData(productList);
        data.setDescription("");
        String json = gson.toJson(data);
        PrintWriter pw = response.getWriter();
        pw.print(json);
        pw.flush();
    }

    protected void listProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<product> list = daoProduct.getAll();
        request.setAttribute("productList", list);

        boolean isSuccess = false;
        if (list != null) {
            isSuccess = true;
        }

        ResponseData data = new ResponseData();
        data.setIsSuccess(isSuccess);
        data.setData(list);
        data.setDescription("");
        String json = gson.toJson(data);
        PrintWriter pw = response.getWriter();
        pw.print(json);
        pw.flush();
    }

    protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String input = request.getParameter("input");
        String password = request.getParameter("password");
        password = getMd5(password);
        boolean isSuccess = daoStaff.checkLogin(input, password);
        if (isSuccess) {
            if (input.equals("admin")) {
                response.sendRedirect("/Project_SWP_Group2/statistic?date=none");
            } else {
                request.getRequestDispatcher("/staff.jsp").forward(request, response);
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
