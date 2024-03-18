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

                <link rel="icon" href="/Project_SWP_Group2/images/LG1.png" type="image/x-icon">
        <style>
            .error {
                color: red;
            }
        </style>
    </head>
    <body>
        <c:set var="c" value="${requestScope.product}"/>
        <form action="updateProduct" method="get" id="updateForm">

            <!--int id, int quantity, int price, int categoryID, int promoID, String name, String description, String picURL-->
            <input type="hidden" name="id" id="pro_id" value="${c.id}" required min="0"><br>
            Enter quan: <input type="number" name="quantity" id="pro_quan" value="${c.quantity}"><br>
            Enter name <input type="text" name="name" id="pro_name" value="${c.name}" required ><br>
            Enter promo ID <input type="number" name="promo" id="pro_sale" value="${c.promoID}" min="1" max="2"><br>
            Enter category ID: <input type="number" name="category" id="pro_sale" value="${c.categoryID}" min="1" max="4"><br>
            Enter price <input type="number" name="price" id="price" value="${c.price}" min="0"><br>
            Enter pic <input type="text" name="pic" id="pro_pic" value="${c.picURL}" required><br>
            Enter des <input type="text" name="des" id="pro_des" value="${c.description}" required><br>
            <input type="submit"/>
        </form>

        <script src="js/jquery-3.7.0.min.js"></script> 
        <script src="js/jquery.validate.min.js"></script> 
        <script>

            var validator = $("#updateForm").validate({
                rules: {
                    quantity: {
                        required: true
                    },
                    id: {
                        required: true

                    },
                    name: "required",
                    promo: {
                        required: true,
                        min: 1,
                        max: 2
                    },
                    category: {
                        required: true,
                        min: 1,
                        max: 4
                    },
                    price: {
                        required: true,
                        min: 0
                    },
                    des: "required",
                    pic: "required"

                },
                messages: {
                    quantity: {
                        required: "Quantity is required",
                    },
                    id: {
                        required: "Id product is required",
                    },
                    name: "Name is required",
                    promo: {
                        require:"Category ID is required",
                        min: "Promo ID is invalid",
                        max: "Promo ID is invalid",
                    },
                    category: {
                        require:"Category ID is required",
                        min: "Category ID is invalid",
                        max: "Category ID is invalid",
                    },
                    price: {
                        required: "Price is required",
                        min: "Price is not less than 0"
                    },
                    des: "Description is required",
                    pic: "Picture URL is required"

                }
            });</script> 
    </body>
</html>
