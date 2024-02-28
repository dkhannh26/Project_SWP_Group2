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
        <style>
            .item {
                width: 100px;
                height: 500px;
            }

            img {
                width: 100%;
            }
        </style>
    </head>
    <body>
        <div class="product">

            <c:forEach items="${requestScope.productList}" var="product">
                <div class="item">
                    <a href="productDetail?id=${product.getId()}"><img src="${product.getPicURL()}" alt="levent"></a>
                    
                    <p>${product.getName()}</p>
                    <p>${product.getQuantity()}</p>
                    <p>${product.getCategoryID()}</p>
                    <p>${product.getPromoID()}</p>
                    <p>${product.getDescription()}</p>
                   
                    <!------------>

                    <c:set var="formattedPrice">
                        <fmt:formatNumber type="number" value="${product.getPrice()}" pattern="###,###" />
                    </c:set>
             
                    <p>${formattedPrice} VND</p>
                    

                    <a  href ="updateProduct?id=${product.getId()}">Update</a>
                    <a  href="#" onclick="doDelete('${product.getId()}')">Delete </a> 
                </div>
            </c:forEach> 



        </div>

        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Do you want to delete this product (" + id + ")?")) {
                    window.location = "deleteProduct?id=" + id;
                }
            }
        </script>
    </body>
</html>
