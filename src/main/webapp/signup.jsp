<%-- 
    Document   : signup
    Created on : Feb 27, 2024, 9:22:36 PM
    Author     : thinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="" method="">  
            Username<input type="text" id="username" name="username">
            Password<input type="text" id="password" name="password">
            Email<input type="text" id="email" name="email">
            Address<input type="text" id="address" name="address">
            Phone Number<input type="text" id="phoneNumber" name="phoneNumber">
            Full Name<input type="text" id="fullName" name="fullName">

            <button class="btn-resgister">Register</button>
        </form>

        <script src="js/jquery-3.7.0.min.js"></script>
        <script src="js/jquery.validate.min.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>
