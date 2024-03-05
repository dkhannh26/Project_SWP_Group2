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
                        <p>You currently have <b>${quanP} products</b> in your cart</p>
                    </div>
                    <div class="product">
                        <div class="row">
                            <div class="col-2">
                                <img src="${picUrlMap[cart.productID]}" alt="">
                            </div>
                            <div class="col-8">
                                <b id="highlight">${nameProduct[cart.productID]}</b>
                                <p>S</p>
                                <div class="quan">
                                    <input type="number" name="quantity" value="${cart.quantity}">
                                    <button onclick="incrementQuantity(this)" data-product-id="${cart.productID}">+</button>
                                    <button onclick="decrementQuantity(this)" data-product-id="${cart.productID}">-</button>
                                    <input type="hidden" name="id" class="id" value="${cart.productID}">
                                    <input type="hidden" name="price" class="price" value="${cart.price}">
                                    <input type="hidden" name="quantity" class="quantity" value="${cart.quantity}">
                                </div>
                                <b>${cart.getPrice()}</b>
                            </div>
                            <div class="col-2">
                                <button class="btn btn-danger" onclick="deleteCartItem(this)" data-product-id="${cart.productID}">Delete</button>
                                <input type="hidden" name="price" class="price" value="${cart.price}">
                                <input type="hidden" name="quantity" class="quantity" value="${cart.quantity}">
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
                    <form action="payment" method="get">
                        <button class="payment">PAYMENT</button>
                    </form>
                </div>
                <div class="policy">
                    <b>Purchase policy:</b>
                    <p>Currently, we only apply payments for orders with a minimum value of <b>0 VND</b> or more.</p>
                </div>
            </div>
        </div>
        <script>
            function incrementQuantity(button) {
                const input = button.parentElement.querySelector('input[type="number"]');
                const quantity = parseInt(input.value) + 1;
                input.value = parseInt(input.value) + 1;
                const id = button.getAttribute('data-product-id');
                const price = button.parentElement.querySelector('.price').value;
                // Sử dụng orderName, address, và phoneNumber để thực hiện việc gửi dữ liệu lên servlet
                window.location.href = 'cartIncrease?id=' + id + "&price=" + price + "&quantity=" + quantity;
            }

            function decrementQuantity(button) {
                const input = button.parentElement.querySelector('input[type="number"]');
                if (input.value > 1) {
                    const quantity = parseInt(input.value) - 1;
                    input.value = parseInt(input.value) - 1;
                    const id = button.getAttribute('data-product-id');
                    const price = button.parentElement.querySelector('.price').value;
                    window.location.href = 'cartDecrease?id=' + id + "&price=" + price + "&quantity=" + quantity;
                }
            }
            function deleteCartItem(button) {
                var option = confirm('Are you sure to delete');
                if (option === true) {
                    const id = button.getAttribute('data-product-id');
                    const price = button.parentElement.querySelector('.price').value;
                    const quantity = button.parentElement.querySelector('.quantity').value;
                    window.location.href = 'cartDelete?id=' + id + "&price=" + price + "&quantity=" + quantity;
                }
            }
        </script>
    </body>
</html>
