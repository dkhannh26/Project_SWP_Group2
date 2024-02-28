<%-- 
    Document   : index.jsp
    Created on : Feb 26, 2024, 7:24:30 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="http://localhost:8080/Project_SWP_Group2/login" method="post">
            Username<input type="text" name="username">
            Password<input type="text" name="password">
            <button>Submit</button><br>
            <a href="signup.jsp">sign up</a><br>
            <a href="forgot.jsp">forgot password</a><br>

        </form>
    </body>
</html>
