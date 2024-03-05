<%-- 
    Document   : payment
    Created on : Feb 28, 2024, 10:29:40 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <title>Payment</title>
        <link rel="stylesheet" href="./payment.css">
        <link rel="icon" href="LG.png" type="image/x-icon">
    </head>
    <style>
        body{
            margin: 5% 0;
            font-family: "Quicksand", sans-serif;
            color: #444;
        }
        a{
            text-decoration: none;
            color: rgb(58, 132, 180);
        }
        #accountinfo p{
            margin: 0;
        }

        .account{
            width: 80%;
            height: 80%;
            background-color: rgb(214, 214, 214);
        }
        input{
            width: 100%;
            padding: 10px;
            margin: 10px 0;
        }
        #product{
            width: 100%;
        }
        .address{
            padding: 5px 20px;
            background-color: rgb(239, 240, 240);
        }
        .address input {
            border: none;
        }

        .methods{
            margin: 20px 0;
        }
        .methods img{
            margin: 10px;
        }
        .deli{
            border: gray solid 1px;
        }
        #complete input{
            border: none;
            background-color: rgb(82, 177, 255);
            color: white;
            font-weight: 1000;
            padding: 10px 0;
        }
        #complete input:hover{
            background-color: rgb(31, 99, 187);
            transition: 0.2s;
        }
        .col-md-5{
            padding: 5% 5% 5% 2%;
            background-color:  rgb(239, 240, 240);
        }
        .col-md-7{
            margin: 0;
        }
        .error{
            color:red;
        }



    </style>
    <body>

        <div class="container">
            <div class="row">

                <div class="col-md-7">
                    <form action="insertOrders" method="get" id="payment">

                        <h1>DOTAI</h1>
                        <h6><b>SHIPMENT DETAILS</b></h6>

                        <div class="row">
                            <div class="col-2"><img class="account"
                                                    src="https://cdn.icon-icons.com/icons2/3054/PNG/512/account_profile_user_icon_190494.png"
                                                    alt=""></div>
                            <div id="accountinfo" class="col-10">
                                <p></p>
                                <a href="">Sign out</a>
                            </div>
                        </div>
                        <input type="text" placeholder="Your numberphone" name="phoneNumber" id="phoneNumber">


                        <div>
                            <b>Default address</b>
                            <div class="address"><input type="text" name="address"
                                                        value="600, Nguyen Van Cu Street, An Binh Ward, Ninh Kieu District, Can Tho City.">
                            </div>
                        </div>

                        <div>
                            <input type="text" id="newaddress" name="newaddress" placeholder="Add new address">
                        </div>


                        <div class="methods">
                            <b>Payment methods</b><br>
                            <div class="deli">
                                <img src="https://hstatic.net/0/0/global/design/seller/image/payment/other.svg?v=6"
                                     alt="">Payment
                            </div>
                        </div>                    
                        <div class="row">
                            <div id="back" class="col-8">
                                <a href="loadCart">CART</a>
                            </div>
                            <div id="complete" class="col-4">
                                <input type="submit" value="COMPLETE">
                            </div>
                        </div>
                    </form>


                </div>

                <div class="col-md-5">
                    <div class="row">
                        <c:set var="quantityList" value="" scope="request"/>
                        <c:set var="quantityListTemp" value="" />
                        <c:forEach items="${requestScope.cartList}" var="cart">

                            <div class="col-2">
                                <img id="product"
                                     src="${picUrlMap[cart.productID]}"
                                     alt="">
                            </div>
                            <div class="col-8">
                                <b>${nameProduct[cart.productID]}</b>
                                <p>${cart.quantity}</p>
                                <c:set var="quantityListTemp" value="${quantityListTemp},${cart.quantity}" />
                            </div>
                            <div class="col-2">
                                <p class="price">${cart.price}</p>
                            </div>
                        </c:forEach>
                        <c:set var="quantityList" value="${fn:split(quantityListTemp, ',')}" scope="request"/>
                    </div>
                    <div class="row">
                        <div class="col-2">
                            <p class="price">${cart.price}</p>
                        </div>
                    </div>                  
                    <hr>

                    <div id="line" class="row">
                        <div class="col-10">
                            <h5>Total</h5>
                        </div>
                        <div class="col-2">
                            <h5 class="price">${sum}</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/jquery-3.7.0.min.js"></script> 
        <script src="js/jquery.validate.min.js"></script> 
        <script>
            var validator = $("#payment").validate(
                    {
                        rules: {
                            phoneNumber: {
                                required: true,
                                minlength: 10,
                                digits: true
                            },
                            newaddress:{
                                minlength: 3
                            }

                        },
                        messages: {
                            phoneNumber: {
                                required: "Phone number is required",
                                digits: "Please enter only digits"
                            },
                            newaddress:{
                            }
                        }
                    }
            );
        </script>

    </body>


</html>
