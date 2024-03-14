<%-- 
    Document   : staff
    Created on : Mar 11, 2024, 3:57:50 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <!-- bootstrap -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <!-- bootstrap icon -->
        <link href='https://fonts.googleapis.com/css?family=Quicksand' rel='stylesheet'> <!-- font family -->
        <link rel="icon" href="/images/LG.png" type="image/x-icon">
        <script src="https://kit.fontawesome.com/1bd876819f.js" crossorigin="anonymous"></script>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: "Quicksand", sans-serif;
            }

            html,
            body,
            .main,
            nav,
            .nav-list {
                height: 100%;
            }

            header {
                height: 50px;
                background-color: #a0816c;
            }

            .header-top,
            .admin-info {
                display: flex;
            }

            .header-top {
                max-width: 1200px;
                height: 100%;
                margin: 0 auto;
                align-items: center;
                justify-content: space-between;
            }

            .header-top * {
                color: white;
            }

            .logo {
                font-size: 1.5em;
            }

            .admin-name,
            .signout {
                margin: 0 10px;
            }

            .main {
                display: flex;
            }

            nav {
                width: 17%;
            }

            .nav-list {
                list-style-type: none;
                background-color: #b4acac;
                padding: 0;
                margin: 0;
            }

            .nav-list li {
                padding: 10px;
                cursor: pointer;
            }

            .nav-list li:hover {
                background-color: rgb(122, 117, 120);
            }

            .nav-list li * {
                text-decoration: none;
                color: white;
            }

            .main-content {
                width: 100%;
                padding: 70px;
            }

            .main-content>div {
                display: none;
            }

            /* product management */
            .add-goods-btn {
                text-align: right;
                margin-bottom: 10px;
            }
            .add-goods-btn button {
                border: none;
                background-color: #2f2b2b;
                padding: 8px;
                border-radius: 5px;
                margin-right: 0;
            }
            .add-goods-btn button a {
                text-decoration: none;
                color: white;
            }

            .product-table .table tbody tr th {
                width: 6%;
            }

            .product-table .table tbody tr th img {
                width: 100%;
            }

            .product-table .td-button {
                width: 15%;
            }

            /* product management */

            /* personal-info  */
            .personal-main {
                width: 50%;
                margin: 50px auto;
                box-shadow: rgba(0, 0, 0, 0.3) 0px 19px 38px, rgba(0, 0, 0, 0.22) 0px 15px 12px;
            }

            .personal-main table {
                width: 100%;
                border-collapse: collapse;
            }

            .personal-main table th,
            td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            /* personal-info  */

            /* accout-manage */
            .account-search {
                padding: 5px;
                outline: none;
                width: 20%;
            }

            .phoneNum-col {
                width: 12%;
            }

            /* accout-manage */

            /* statistic */
            .card-container {
                display: grid;
                grid-template-columns: 1fr 1fr 1fr 1fr;
                gap: 20px;
                margin: 20px 0;
            }

            .card {
                display: flex;
                flex-direction: column;
                justify-content: space-around;
                padding: 25px;
                color: white;
                border-radius: 30px;
                box-shadow: 0 6px 7px -4px rgba(0, 0, 0, 0.2);
            }

            .card:first-child {
                background-color: red;
            }

            .card:nth-child(2) {
                background-color: green;
            }

            .card:nth-child(3) {
                background-color: orange;
            }

            .card:nth-child(4) {
                background-color: blue;
            }

            .card-inner {
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .card-inner>span {
                font-size: 2em;
            }

            .card-inner h2 {
                font-size: 1.5em;
            }

            .card h1 {
                font-size: 1.5em;
            }

            input[type="date"] {
                border-radius: 5px;
                padding: 5px;
                font-size: 1.2em;
                color: white;
                background-color: mediumaquamarine;
                border: none;
                outline: none;
            }

            ::-webkit-calendar-picker-indicator {
                cursor: pointer;
                padding: 5px;
                background-color: white;
                border-radius: 2px;
                text-align: center;
            }

            /* statistic */

            /* order-manage */
            .order-main {
                border-radius: 0.8rem;
                overflow: auto;
                box-shadow: 0 .4rem .8rem #0005;
            }

            .order-table {
                width: 100%;
                overflow: overlay;
            }

            .order-table,
            th,
            td {
                padding: 1rem;
            }

            .order-table td {
                border: none;
            }

            .order-table thead {
                background-color: #7a777ffe;
            }

            .order-table tbody {
                background-color: #eff2f5;
            }

            .order-table tbody tr:hover {
                background-color: #fff6;
            }

            .tb-address {
                max-width: 300px;
            }

            .th-status {
                text-align: center;
            }

            .status {
                padding: 0.4rem 0;
                border-radius: 2rem;
                text-align: center;
                background-color: #ebc474;
                margin: 0;
            }

            .stt-pending {
                background-color: #ebc474;
            }

            .stt-delivering {
                background-color: #6fcaea;
            }

            .stt-delivered {
                background-color: #86e49d;
                color: #006b21;
            }

            .stt-cancelled {
                background-color: #d893a3;
                color: #b30021;
            }

            .order-table button {
                height: 37px;
                width: 37px;
                border: none;
                border-radius: 6px;
            }

            .accept-btn {
                background-color: rgb(59, 245, 59);
            }

            .reject-btn {
                background-color: red;
            }

            .view-btn {
                background-color: #7a777ffe;
                color: white;
            }

            .item {
                display: none;
            }

            /* .order-table thead, .order-table td {
                border: none;
            }
            .order-table thead, .order-table tbody {
                border-radius: .8rem;
            }
            .order-table thead {
                background-color: rgb(201 180 180);
            }
            .order-table tbody tr:hover {
                background-color: #fff6;
            } */
            /* order-manage */
            .red {
                background-color: #d893a3;
            color: #b30021;
            }

            .green {
                  background-color: #6fcaea;

            }
            .blue {
                
                background-color: #86e49d;
            color: #006b21;
            }


            /* .order-table thead, .order-table td {
                border: none;
            }
            .order-table thead, .order-table tbody {
                border-radius: .8rem;
            }
            .order-table thead {
                background-color: rgb(201 180 180);
            }
            .order-table tbody tr:hover {
                background-color: #fff6;
            } */
            /* order-manage */
        </style>
    </head>

    <body>
        <header>
            <div class="header-top">
                <div class="logo">DOTAI</div>
                <div class="admin-info">
                    <div class="admin-name"><i class="bi bi-person-fill"></i>: Staff</div>
                    <div class="signout"><i class="bi bi-box-arrow-right"></i> Sign out</div>
                </div>
            </div>
        </header>

        <div class="main">
            <nav>
                <ul class="nav-list">
                    <li class="nav-link" data-target="statistic">
                        <a href="#"><i class="fa-solid fa-chart-line"></i> <span>Statistical</span> </a>
                    </li>
                    <li class="nav-link" data-target="order-manage">
                        <a href="#" ><i class="bi bi-cart-fill"></i> <span>Orders management</span> </a>
                    </li>
                    <li class="nav-link" data-target="product-manage">
                        <a href="#" ><i class="bi bi-box"></i> <span>Products Management</span> </a>
                    </li>
                    <li class="nav-link" data-target="personal-info">
                        <a href="#" ><i class="bi bi-person-fill"></i> <span>Personal information</span> </a>
                    </li>
                </ul>
            </nav>

            <div class="main-content">
                <!-- product management -->
                <div class="product-manage">
                    <h3>Product Management</h3>
                    <hr>
                    <div class="filter">
                        <select name="filter-price  " id="filter-price">
                            <option value="volvo">Sort by price ascending</option>
                            <option value="volvo">Sort by price in descending</option>
                        </select>
                        <input type="text" placeholder="Search">
                        <!-- <button class="filter-add-btn">Add new product</button> -->
                    </div>
                    <div class="product-table">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Picture</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Category ID</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                    <!-- <th scope="col"></th> -->
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">
                                        <img src="/images/img1.jpg" alt="">
                                    </th>
                                    <td>DOTAI - Quần dài jeans ống rộng 8124</td>
                                    <td>12345</td>
                                    <td>1.000.000</td>
                                    <td>10</td>
                                    <!-- <td class="td-button">
                                        <button type="button" class="btn btn-primary">Update</button>
                                        <button type="button" class="btn btn-danger">Delete</button>
                                    </td> -->
                                </tr>

                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="statistic" style="display: block;">
                    <h3>Dashboard</h3>
                    <hr>
                    <div class="card-container">
                        <div class="card">
                            <div class="card-inner">
                                <h2>Products</h2>
                                <span><i class="bi bi-box"></i></span>
                            </div>
                            <h1>${numberOfProduct}</h1>
                        </div>

                        <div class="card">
                            <div class="card-inner">
                                <h2>Orders</h2>
                                <span><i class="bi bi-cart-fill"></i></span>
                            </div>
                            <h1>${numberOfOrder}</h1>
                        </div>

                        <div class="card">
                            <div class="card-inner">
                                <h2>Revenue</h2>
                                <span><i class="bi bi-currency-dollar"></i></span>
                            </div>
                            <h1>${revenue}</h1>
                        </div>

                        <div class="card">
                            <div class="card-inner">
                                <h2>Customers</h2>
                                <span><i class="bi bi-people"></i></span>
                            </div>
                            <h1>${numberOfCustomer}</h1>
                        </div>
                    </div>
                    <div>
                        <form action="statistic" method="get">
                            <input type="date" name="from"> - <input type="date" name="to">
                            <button name="date" value="date">Submit</button>
                            <h1>${dateFrom}   =>    ${dateTo} </h1>
                        </form>
                    </div>
                </div>

                <div class="order-manage">
                    <h3>Order Management</h3>
                    <hr>
                    <div class="order-main">
                        <table class="order-table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Address</th>
                                    <th>Order Date</th>
                                    <th class="th-status">Status</th>
                                    <th>Amount</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.orderList}" var="order">                               
                                    <tr>
                                        <td>${order.orderID}</td>
                                        <td>${order.usernameCustomer}</td>
                                        <td class="tb-address">${order.address}</td>
                                        <td>${order.date}</td>
                                        <td><p class="status stt-pending" id="id${order.orderID}" onchange="handleColor()">${order.status}</p></td>
                                        <td><strong><i class="bi bi-currency-dollar"></i>${order.total}</strong></td>
                                        <td class="action-btn">

                                            <c:if test="${order.status eq 'wait'}">
                                                <button class="accept-btn" onclick="updateOrderStatus(${order.orderID}, 'accept')"><i class="bi bi-check-lg"></i></button>
                                                <button class="reject-btn" onclick="updateOrderStatus(${order.orderID}, 'reject')"><i class="bi bi-x-lg"></i></button>
                                                </c:if>
                                            <button class="view-btn"><i class="bi bi-eye"></i></button>
                                        </td>
                                    </tr>
                                <tbody class="item">
                                    <c:forEach items="${requestScope.orderDetailList}" var="orderDetail">
                                        <c:if test="${order.orderID eq orderDetail.orderID}">
                                    <tr>
                                        <td></td>
                                        <td>
                                           ${orderDetail.productID}
                                        </td>
                                        <td>${nameProduct[orderDetail.productID]}</td>
                                        <td>${orderDetail.size_name}</td>
                                        <td>${orderDetail.quantity}</td>
                                        <td>${(priceProduct[orderDetail.productID] - (priceProduct[orderDetail.productID] * promoMap[promoID[orderDetail.productID]])/100) * orderDetail.quantity}</td>
                                        <td></td>
                                    </tr>
                                    </c:if>
                                    </c:forEach>
                                </tbody>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="personal-info">
                    <h3>Personal Information</h3>
                    <hr>
                    <div class="personal-main">
                        <table>
                            <tr>
                                <th>Fullname:</th>
                                <td>Thanh Dy</td>
                            </tr>
                            <tr>
                                <th>Phone number:</th>
                                <td>12345</td>
                            </tr>
                            <tr>
                                <th>Email:</th>
                                <td>xyz@gmail.com</td>
                            </tr>
                            <tr>
                                <th>Address:</th>
                                <td>Can Tho</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

        <script>
                                                    let status = document.querySelectorAll('.status');

                                                    status.forEach(element => {
                                                        if (element.innerHTML === 'reject') {
                                                            element.classList.add('red');
                                                        } else if (element.innerHTML === 'accept') {
                                                            element.classList.add('green');

                                                        }
                                                        else if (element.innerHTML === 'Received'){
                                                                element.classList.add('blue');
                                                            }
                                                    });

                                                    const handleColor = () => {
                                                        let status = document.querySelectorAll('.status');
                                                        status.forEach(element => {
                                                            if (element.innerHTML === 'reject') {
                                                                element.classList.add('red');
                                                            } else if (element.innerHTML === 'accept') {
                                                                element.classList.add('green');

                                                            }
                                                            else if (element.innerHTML === 'Received'){
                                                                element.classList.add('blue');
                                                            }
                                                        });
                                                    };


                                                    document.addEventListener('DOMContentLoaded', function () {
                                                        const links = document.querySelectorAll('.nav-link');
                                                        links.forEach(function (link) {
                                                            link.addEventListener('click', function (e) {
                                                                e.preventDefault();
                                                                const target = this.getAttribute('data-target');
                                                                const contentDivs = document.querySelectorAll('.main-content > div');
                                                                contentDivs.forEach(function (div) {
                                                                    if (div.classList.contains(target)) {
                                                                        div.style.display = 'block';
                                                                    } else {
                                                                        div.style.display = 'none';
                                                                    }
                                                                });
                                                            });
                                                        });
                                                    });

                                                    var acceptBtns = document.querySelectorAll('.accept-btn');
                                                    var rejectBtns = document.querySelectorAll('.reject-btn');

                                                    // Thiết lập sự kiện cho tất cả các nút
                                                    acceptBtns.forEach(function (btn) {
                                                        btn.addEventListener('click', hideButtons);
                                                    });

                                                    rejectBtns.forEach(function (btn) {
                                                        btn.addEventListener('click', hideButtons);
                                                    });

                                                    // Hàm để ẩn cả hai nút trong cùng một thẻ td
                                                    function hideButtons(event) {
                                                        var clickedBtn = event.target; // Lấy nút đã được nhấp vào
                                                        var tdElement = clickedBtn.closest('.action-btn'); // Tìm thẻ td gần nhất chứa nút đã được nhấp vào
                                                        var acceptBtn = tdElement.querySelector('.accept-btn'); // Lấy nút chấp nhận trong thẻ td
                                                        var rejectBtn = tdElement.querySelector('.reject-btn'); // Lấy nút từ chối trong thẻ td
                                                        acceptBtn.style.display = 'none';
                                                        rejectBtn.style.display = 'none';

                                                    }
                                                    function updateOrderStatus(orderId, status) {
                                                        let id = document.querySelector(`#id` + orderId);
                                                        $.ajax({
                                                            url: '/Project_SWP_Group2/orderUpdateStatus',
                                                            method: 'GET',
                                                            data: {
                                                                orderId: orderId,
                                                                status: status
                                                            },
                                                            success: function (response) {
                                                                console.log(id);
                                                                id.innerHTML = status;
                                                                
                                                                handleColor();
                                                            }
                                                        });
                                                    }
                                                    document.addEventListener("DOMContentLoaded", function () {
                                                        const viewBtn = document.querySelectorAll('.view-btn');
                                                        const dropdownItem = document.querySelectorAll('.item');
                                                        viewBtn.forEach(function (edit, i) {
                                                            edit.addEventListener('click', function () {
                                                                if (dropdownItem[i].style.display === "none") {
                                                                    dropdownItem[i].style.display = "contents";
                                                                } else {
                                                                    dropdownItem[i].style.display = "none";
                                                                }

                                                            });
                                                        })
                                                    });
        </script>
    </body>

</html>


