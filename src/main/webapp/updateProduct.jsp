<%-- 
    Document   : updateProduct
    Created on : Feb 27, 2024, 8:27:32 PM
    Author     : LENOVO
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <c:set var="c" value="${requestScope.product}"/>
         <form action="updateProduct" method="get">

<!--int id, int quantity, int price, int categoryID, int promoID, String name, String description, String picURL-->
            Enter id <input type="number" name="id" id="pro_id" value="${c.id}" required min="0"><br>
            Enter quan: <input type="number" name="quantity" id="pro_quan" value="${c.quantity}"><br>
            Enter name <input type="text" name="name" id="pro_name" value="${c.name}" required ><br>
            Enter sale <input type="number" name="promo" id="pro_sale" value="${c.promoID}" required><br>
            Enter type <input type="number" name="category" id="pro_sale" value="${c.categoryID}" required><br>
            Enter price <input type="number" name="price" id="price" value="${c.price}" required><br>
            Enter pic <input type="text" name="pic" id="pro_pic" value="${c.picURL}" required><br>
            Enter des <input type="text" name="des" id="pro_des" value="${c.description}" required><br>
            <input type="submit"/>
        </form>
    </body>
</html>
