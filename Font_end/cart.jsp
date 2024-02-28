<%-- 
    Document   : cart
    Created on : Feb 27, 2024, 9:57:29 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <title>Profile</title>

    </head>
    <style>
        body {
            font-family: "Quicksand", sans-serif;
            margin: 0 10%;
            color: #444;
        }

        .content {
            text-align: center;
            border-bottom: #a0816c solid 2px;
            margin: 5% 0;
        }

        #highlight {
            color: #a0816c;
        }

        .product {
            margin: 5% 0;
        }

        .product img {
            width: 100%;
            height: 100%;
        }

        .quan {
            display: flex;
            border: rgb(230, 230, 230) solid 1px;
            width: 40%;
            margin: 20px 0;
        }

        .quan button {
            /* padding: 5% 25px; */
            width: 30%;
            font-size: 16px;
            border: none;
        }

        .quan input {
            border: none;
            width: 41%;
            text-align: center;
        }

        #price {
            color: red;
        }

        .info {
            border: #dddddd solid 1px;
            padding: 10px;
        }

        .payment{
            width: 100%;
            padding: 10px 0;
            border: none;
            background-color: rgb(255, 207, 49);
            color:#65b9c4;
            font-weight: 1000;
        }
        .payment:hover{
            background-color: red;
            color: white;
            transition: 0.7s;
        }

        .note li{
            font-size: 12px;
            list-style: none;
        }

        .policy{
            margin: 10% 0;
            border: #81e7f5 solid 1px;
            background-color: #d7f0f3;
            padding: 10px;
        }
    </style>
    <body>
        <div class="content">
            <h2 id="highlight">Your Cart</h2>
        </div>
        <c:forEach items="${requestScope.cartList}" var="cart">


            <div class="row">
                <div class="col-md-8">
                    <div class="status">
                        <p>You currently have <b>2 products</b> in your cart</p>
                    </div>
                    <div class="product">
                        <div class="row">
                            <div class="col-2">
                                <img src="https://product.hstatic.net/1000296747/product/d3a5a3cf2dd77268fb54481ebcce161d_e9c60a724acb45b4978c53249ba5dbb6_medium.jpeg" alt="">
                            </div>
                            <div class="col-8">
                                <b id="highlight">DOTAI - Striped wool cardigan</b>
                                <p>S</p>
                                <div class="quan">
                                    <input type="number" id="quantity_${cart.getProductID()}" name="quantity" value="${cart.getQuantity()}">
                                    <button onclick="incrementQuantity(this)" data-product-id="${cart.getProductID()}">+</button>
                                    <button onclick="decrementQuantity(this)" data-product-id="${cart.getProductID()}">-</button>
                                </div>
                                <b>${cart.getPrice()}</b>
                            </div>
                            <div class="col-2">
                                Recycle Bin
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-10"><b>Into money:</b></div>
                            <div class="col-2" id="price"><b>${cart.getPrice()}</b></div>

                        </div>
                    </div>
                </div>
            </c:forEach>
            <div class="col-md-4">
                <div class="info">
                    <b id="highlight">Order Information</b>
                    <hr>
                    <div class="row">
                        <b class="col-7">Total:</b>
                        <h4 class="col-5"><b id="price">${sum}</b></h4>
                    </div>
                    <hr>
                    <ul class="note">
                        <li>Shipping fees will be calculated at the checkout page.</li>
                        <li>You can also enter a discount code at the checkout page.</li>
                    </ul>
                    <button class="payment">PAYMENT</button>
                </div>
                <div class="policy">
                    <b>Purchase policy:</b>
                    <p>Currently, we only apply payments for orders with a minimum value of <b>0 VND</b> or more.</p>
                </div>
            </div>
        </div>
        <input type="hidden" name="id" class="id" value="${cart.getProductID()}">



        <script>
            document.addEventListener('DOMContentLoaded', function () {
                function incrementQuantity(button) {
                    const input = button.parentElement.querySelector('input[type="number"]');
                    if (input) {
                        const quantity = parseInt(input.value) + 1;
                        input.value = quantity;
                        const id = button.dataset.productId;
                        window.location.href = `cartIncrease?id=${id}&quantity=${quantity}`;
                    }
                }

                function decrementQuantity(button) {
                    const input = button.parentElement.querySelector('input[type="number"]');
                    if (input && input.value > 1) {
                        const quantity = parseInt(input.value) - 1;
                        input.value = quantity;
                        const id = button.dataset.productId;
                        window.location.href = `cartDecrease?id=${id}&quantity=${quantity}`;
                    }
                }
            });
        </script>
    </body>

</html>
