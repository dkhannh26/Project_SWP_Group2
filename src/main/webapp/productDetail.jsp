<%-- 
    Document   : productDetail
    Created on : Feb 27, 2024, 8:34:03 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <title>Profile</title>
        <link rel="icon" href="LG.png" type="image/x-icon">
        ${ms}
    </head>
    <style>
        .container {
            margin: 10% auto;
        }

        .row {
            margin: 20px 0;
        }

        #left img {
            width: 100%;
        }

        #right img {
            width: 100%;
        }

        #highlight {
            color: #a0816c;
            margin: 0px 0;
        }

        .quan {
            display: flex;
            border: rgb(230, 230, 230) solid 1px;
        }

        .quan button {
            padding: 10px 25px;
            width: 30%;
            font-size: 16px;
            border: none;
        }

        .quan input {
            border: none;
            width: 41%;
            text-align: center;
        }

        .add button {
            border: #c0a47f solid 1px;
            background-color: #c0a47f;
            width: 100%;
            padding: 10px 30px;
            text-align: center;
            color: white;
            font-weight: 500;
        }

        .add button:hover {
            background-color: white;
            color: #c0a47f;
            transition: 0.5s;
        }

        .sale {
            background-color: rgb(233, 231, 231);
            text-align: center;
            color: red;
            font-weight: 800;
        }

        .oriprice {
            text-decoration: line-through;
        }

        .price {
            color: red;
            font-weight: 800;
        }
    </style>
    <body>
        <form action="cartInsert" method="get">
            <div class="container">
                <div class="row">
                    <div id="left" class="col-md-6">
                        <img src="${p.picURL}"
                             alt="">
                    </div>
                    <div id="right" class="col-md-6">
                        <div>
                            <h3 id="highlight">${p.name}</h3>
                            <p name="id"><b>SKU: </b>${p.id}</p>
                        </div>
                        <div class="row">
                            <div class="col-2">
                                <div class="sale">SALE: ${promoMap[p.promoID]}%</div>
                            </div>
                            <div class="col-2">
                                <div class="oriprice">${p.price}</div>
                            </div>
                            <div class="col-2">
                                <div class="price">${p.price - ((p.price * promoMap[p.promoID])/100)}</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-3">Size:</div>
                            <div class="col-9">
                                S M L
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="quan">
                                    <button id="decrementButton" type="button">-</button>
                                    <input type="text" id="numberInput" value="1">
                                    <button id="incrementButton" type="button">+</button>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="add">
                                    <button id="check" type="button">ADD PRODUCT TO CART</button>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <h6 id="highlight">PRODUCT INFORMATION</h6>
                        <img src="./size.jpg" alt="">
                        <input type="hidden" name="id" class="id" value="${p.id}">
                        <input type="hidden" name="price" class="price" value="${p.price - ((p.price * promoMap[p.promoID])/100)}">
                        <input type="hidden" name="quantity" id="quantityInput" value="1">

                    </div>
                </div>
            </div>
        </form>




        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const decrementButton = document.getElementById('decrementButton');
                const incrementButton = document.getElementById('incrementButton');
                const numberInput = document.getElementById('numberInput');
                const quantityInput = document.getElementById('quantityInput');
                const check = document.getElementById('check');
                decrementButton.addEventListener('click', function () {
                    let currentValue = parseInt(numberInput.value);
                    if (currentValue > 1) {
                        numberInput.value = currentValue - 1;
                        quantityInput.value = currentValue - 1;
                    }
                });

                incrementButton.addEventListener('click', function () {
                    let currentValue = parseInt(numberInput.value);
                    numberInput.value = currentValue + 1;
                    quantityInput.value = currentValue + 1;

                });
                check.addEventListener('click', function () {
                    if(quantityInput.value > ${p.quantity}){
                        alert("sold out");
                     window.location = "productDetail?id=${p.id}";
                    }else{
                        document.getElementById("check").removeAttribute("type");
                    }
                        

                });
            });

        </script>
    </body>

</html>