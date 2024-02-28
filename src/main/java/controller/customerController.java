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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import payLoad.ResponseData;
import static url.customerURL.URL_FORGOT_PASS;
import static url.customerURL.URL_LOGIN;
import static url.customerURL.URL_SIGNUP;

/**
 *
 * @author thinh
 */
@WebServlet(name = "customerController", urlPatterns = {URL_LOGIN, URL_SIGNUP, URL_FORGOT_PASS})
public class customerController extends HttpServlet {

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
            out.println("<title>Servlet customerController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet customerController at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private Gson gson = new Gson();
    DAOcustomer daoCustomer = new DAOcustomer();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        String urlPath = request.getServletPath();
        switch (urlPath) {
            case URL_LOGIN:
                login(request, response);
                break;
            case URL_SIGNUP:
                signUp(request, response);
                break;
            case URL_FORGOT_PASS:
                forgotPass(request, response);
                break;
        }
    }

    protected void forgotPass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        boolean isSuccess = daoCustomer.checkEmail(email);
        String mess = "";
        if (isSuccess) {
            HttpSession s = request.getSession();    
            final String userName = "dotaiverify@gmail.com"; // Tài khoản email gửi
            final String password = "uclz vips nxek dzbl"; // Mật khẩu email gửi

            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP server của bạn
            props.put("mail.smtp.port", "587"); // Cổng SMTP của bạn (thường là 587 hoặc 25)

            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");

            javax.mail.Session session = javax.mail.Session.getInstance(props, new javax.mail.Authenticator() {
                protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                    return new javax.mail.PasswordAuthentication(userName, password);
                }
            });

            String code = generateRandomString(5);
            s.setAttribute("code", code);
//                mess = "Username: " + userSend + "\nPassword: " + newPass;
            mess = "Your code: " + code;
            try {
                Message message = new MimeMessage(session);
                message.setFrom(new InternetAddress(userName));
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
                message.setSubject("Forget Password");
                message.setText(mess);
                Transport.send(message);

//                    System.out.println("OK");
            } catch (Exception e) {
                System.out.println(e);
            }
//                String md5 = getMd5(newPass).toUpperCase();
//                dao.updatePassword(userSend, md5);
            request.setAttribute("message", "Please enter the code sent to your email to continue");
            request.setAttribute("emailReceive", email);
            s.setAttribute("emailReceive", email);
//            request.getRequestDispatcher("forgetPassNext.jsp").forward(request, response);
        } else {
                        request.setAttribute("message", "Your email does not exist");

        }
    }
    
    
    
       public static String generateRandomString(int length) {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder randomString = new StringBuilder(length);
        Random random = new Random();

        for (int i = 0; i < length; i++) {
            int index = random.nextInt(characters.length());
            char randomChar = characters.charAt(index);
            randomString.append(randomChar);
        }

        return randomString.toString();
    }

    protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        password = getMd5(password);
        boolean isSuccess = daoCustomer.checkLogin(username, password);
        if (isSuccess) {
            request.getRequestDispatcher("product.jsp").forward(request, response);

        } else {
            request.getRequestDispatcher("index.jsp").forward(request, response);

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

    protected void signUp(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        password = getMd5(password);
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");

        customer c = new customer(username, email, password, address, phoneNumber);

        boolean isSuccess = daoCustomer.signUp(c);
        ResponseData data = new ResponseData();
        data.setIsSuccess(isSuccess);
        data.setData("");
        data.setDescription("");
        String json = gson.toJson(data);
        PrintWriter pw = response.getWriter();
        pw.print(json);
        pw.flush();

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

    public static void main(String[] args) {

    }
}
