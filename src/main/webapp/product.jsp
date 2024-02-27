<%-- 
    Document   : product.jsp
    Created on : Feb 27, 2024, 6:21:56 PM
    Author     : LENOVO
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <div class="product">

        <c:forEach items="${requestScope.listProduct}" var="product">
            <div class="col-3 item">
                <a href=""><img src="${product.getPicURL()}" alt="levent"></a>
                <p>${product.getName()}</p>
            </div>
        </c:forEach> 

     

    </div>

    </body>
</html>
