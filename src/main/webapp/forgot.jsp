<%-- 
    Document   : forgot
    Created on : Feb 28, 2024, 11:26:55 AM
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
        <form action="http://localhost:8080/Project_SWP_Group2/login/forgot" method="POST">
            <label>Email</label>
            <input type="text" name="email"/>
            <input type="hidden" name="code"/>

            <button>Send code</button>
        </form>
        <div>${message}</div>
    </body>
</html>
