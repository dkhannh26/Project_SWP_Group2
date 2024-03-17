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
                height: 50px;
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
                height: calc(100% - 50px);
                /*                overflow-y: scroll;
                                scrollbar-width: none;*/
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
                overflow-y: scroll;
                /*scrollbar-width: none;*/
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
            .add-box {
                max-width: 50%;
                margin: 0 auto;
                padding: 20px;
                border: 1px solid #a0816c;
                border-radius: 5px;
            }
            .add-box h1 {
                text-align: center;
                color: #a0816c;
            }

            .add-box input {
                width: 100%;
                border: none;
                border-bottom: 1px solid #a0816c;
                margin: 15px 0;
                padding: 10px 5px;
                outline: none;
            }

            .add-box .row button {
                background-color: #a0816c;
                width: 100%;
                color: white;
                border: none;
                height: 35px;
            }
            .add-box select {
                width: 100%;
                border: none;
                border: 1px solid var(--bg-color);
                margin: 15px 0;
                padding: 10px 5px;
                outline: none;
            }

            .add-box select option {
                border: none;
            }
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

            .personal-btn {
                text-align: center;
                margin: 20px 0;
            }

            .personal-btn button {
                border: none;
                background-color: #a0816c;
                color: white;
                padding: 5px;
                border-radius: 5px;
                transition: all 0.3s ease;
            }

            .personal-btn button:hover {
                background-color: #af907b;
                transition: all 0.3s ease;
            }

            #edit-personal {
                display: none;
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
                background-color: #006b21;
            }
            .delivering {
                /*display: block;*/
            }
            .delivered{
                display: none;
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
                background-color: red;
            }

            .green {
                background-color: rgb(59, 245, 59);

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
                    <div class="signout"><a href="/Project_SWP_Group2/cookieHandle"><i class="bi bi-box-arrow-right"></i> Sign out</a></div>
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

                    <li class="nav-link" data-target="import-goods">
                        <a href="#"><i class="fa-solid fa-truck-ramp-box"></i> <span>Import goods management</span> </a>
                    </li>
                </ul>
            </nav>

            <div class="main-content">
                <!-- product management -->
                <div class="product-manage">
                    <h3>Product Management</h3>
                    <hr>
                    <div class="filter">
                        <!--<form action="" method="">-->
                        <select id="sortID"  id="filter-price" onchange="sort()">
                            <option value="Increase">Sort by price ascending</option>
                            <option value="Decrease">Sort by price in descending</option>
                        </select>
                        <!--<button class="btn-sort"> Submit</button>-->
                        <!--</form>-->
                        <!--<form action="" method="">-->
                        <input id="search" type="text" placeholder="Search" oninput="search()">
                        <!--<button class="btn-search"> Search</button>-->

                        <!--</form>-->
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
                    <div class="personal-box" id="personal-box">
                        <div class="personal-btn">
                            <button id="update-pro-btn" onclick="toggleEditPersonal(this)" data-name="" data-phone="" data-email="" data-address="">Edit personal information</button>
                        </div>
                        <div class="personal-main">
                            <table>
                                <tr id="fullName">
                                    <th>Fullname:</th>
                                    <!--<td>Thanh Dy</td>-->
                                </tr>
                                <tr id="phoneNumber">
                                    <th>Phone number:</th>
                                    <!--<td>12345</td>-->
                                </tr>
                                <tr id="email">
                                    <th>Email:</th>
                                    <!--<td>xyz@gmail.com</td>-->
                                </tr>
                                <tr id="address">
                                    <th>Address:</th>
                                    <!--<td>Can Tho</td>-->
                                </tr>
                            </table>
                        </div>
                        <div class="personal-btn">
                            <button onclick="toggleChangePassword()">Change password</button>
                        </div>
                    </div>

                    <div class="add-box container" id="edit-personal">
                        <h1>Edit information</h1>
                        <hr>
                        <div class="row">
                            <div class="col-md-12">
                                <input type="text" id="update-profile-name" placeholder="Fullname" >
                            </div>
                            <div class="col-md-12">
                                <input type="text" placeholder="Phone number" id="update-profile-phone">
                            </div>
                            <div class="col-md-12">
                                <input type="email" placeholder="Email" id="update-profile-email">
                            </div>
                            <div class="col-md-12">
                                <input type="text" placeholder="Address" id="update-profile-address">
                            </div>
                            <div class="col-md-6">
                                <button onclick="toggleEditPersonal(this)">CANCEL</button>
                            </div>
                            <div class="col-md-6">
                                <button id="edit-profile-btn" onclick="updateProfile(this)" data-id="">UPDATE</button>
                            </div>
                        </div>
                    </div>

                    <div class="add-box container" id="change-password" style="display: none">
                        <form action="" method="">

                            <h1>Change password</h1>
                            <hr>                           
                            <div class="row">
                                <div class="col-md-12">
                                    <input type="password" placeholder="Current password" id="currentPassword">
                                </div>
                                <div class="col-md-12">
                                    <input type="password" placeholder="New password" id="newPassword1">
                                </div>

                                <div class="col-md-12">
                                    <input type="password" placeholder="Confirm password" id="newPassword2">
                                </div>

                                <div id="message-changepass" class="message"></div>


                                <div class="col-md-6">
                                    <button id="cancel-changepass-btn">CANCEL</button>
                                </div>
                                <div class="col-md-6">
                                    <button class="btn-changePass" >CHANGE</button>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>

                <div class="import-goods">
                    <h3>Import goods</h3>
                    <hr>
                    <!-- <div class="add-goods-btn">
                        <button><a href="/admin/addProduct.html">Add import goods</a></button>
                    </div> -->
                    <div class="order-main">
                        <table class="order-table" >
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Quantity</th>
                                    <th>Order date</th>
                                    <th class="th-status">Status</th>
                                    <th>Total price</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody id="import-list">




                            </tbody> 
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="/Project_SWP_Group2/js/jquery-3.7.0.min.js"></script>
        <script src="/Project_SWP_Group2/js/jquery.validate.min.js"></script>
        <script>

                                    $(document).ready(function (e) {
                                        $('.btn-changePass').click(function (e) {
                                            e.preventDefault();
                                            var currentPass = document.getElementById("currentPassword").value;
                                            var newPassword1 = document.getElementById("newPassword1").value;
                                            var newPassword2 = document.getElementById("newPassword2").value;
                                            var input = getCookie("input");
                                            if (newPassword1 === newPassword2) {
                                                $.ajax({
                                                    method: "POST",
                                                    url: "http://localhost:8080/Project_SWP_Group2/staff/profile/changepass",
                                                    data: {
                                                        input: input,
                                                        currentPassword: currentPass,
                                                        newPassword: newPassword2
                                                    }
                                                })
                                                        .done(function (data) {
                                                            var data1 = JSON.parse(data);
                                                            console.log(data1);
                                                            if (data1.isSuccess) {
                                                                alert('Change password successfully')
                                                                ////                     
                                                            } else {
                                                                $("#message-changepass").html("Your current password is incorrect");
                                                                document.getElementById("message-changepass").style.color = "red";
                                                            }
                                                        });
                                            } else {
                                                $("#message-changepass").html("Password is not match!");
                                                document.getElementById("message-changepass").style.color = "red";
                                            }


                                        })

                                        $("#cancel-changepass-btn").click(function (event) {
                                            event.preventDefault(); // Prevent default form submission behavior
                                            toggleChangePassword(); // Hide the form
                                        });
                                    })

                                    function updateProfile(pro) {
                                        var username = pro.getAttribute('data-id');
                                        var email = document.getElementById('update-profile-email').value;
                                        var address = document.getElementById('update-profile-address').value;
                                        var fullname = document.getElementById('update-profile-name').value;
                                        var phone = document.getElementById('update-profile-phone').value;
                                        $.ajax({
                                            method: "POST",
                                            url: "http://localhost:8080/Project_SWP_Group2/staff/profile/update",
                                            data: {
                                                username: username,
                                                email: email,
                                                address: address,
                                                fullname: fullname,
                                                phone: phone
                                            }
                                        })
                                                .done(function (data) {
                                                    var data1 = JSON.parse(data);
                                                    //                                                    console.log(data1);
                                                    if (data1.isSuccess) {
                                                        alert("update successfully");
                                                        profile();
                                                    } else {
                                                        alert("fail")
                                                    }
                                                })
                                    }

                                    function toggleEditPersonal(profile) {
                                        var edit = document.getElementById('edit-personal');
                                        var personal = document.getElementById('personal-box');
                                        if (edit.style.display === "none") {
                                            edit.style.display = "block";
                                            personal.style.display = "none";
                                        } else {
                                            edit.style.display = "none";
                                            personal.style.display = "block";
                                        }

                                        var id = profile.getAttribute('data-id');
                                        document.getElementById('edit-profile-btn').setAttribute('data-id', id);
                                        var email = document.getElementById('update-profile-email');
                                        email.value = profile.getAttribute('data-email');
                                        var address = document.getElementById('update-profile-address');
                                        address.value = profile.getAttribute('data-address');
                                        var fullname = document.getElementById('update-profile-name');
                                        fullname.value = profile.getAttribute('data-name');
                                        var phone = document.getElementById('update-profile-phone');
                                        phone.value = profile.getAttribute('data-phone');
                                    }
                                    function toggleChangePassword() {
                                        var edit = document.getElementById('change-password');
                                        var personal = document.getElementById('personal-box');
                                        if (edit.style.display === "none") {
                                            edit.style.display = "block";
                                            personal.style.display = "none";
                                        } else {
                                            edit.style.display = "none";
                                            personal.style.display = "block";
                                        }
                                    }

                                    function search(e) {
                                        var input = document.getElementById('search').value;
                                        $.ajax({
                                            method: "POST",
                                            url: "http://localhost:8080/Project_SWP_Group2/staff/product/search",
                                            data: {
                                                input: input
                                            }
                                        })
                                                .done(function (data) {
                                                    var data1 = JSON.parse(data);
                                                    //                                                                    console.log(data1)
                                                    if (data1.isSuccess) {
                                                        document.querySelector("table tbody").innerHTML = ""
                                                        var productList = data1.data;
                                                        productList.forEach(function (product) {
                                                            // Tạo một hàng mới
                                                            var newRow = document.createElement("tr");
                                                            // Tạo các ô dữ liệu cho từng trường
                                                            var pictureCell = document.createElement("td");
                                                            var nameCell = document.createElement("td");
                                                            var categoryIdCell = document.createElement("td");
                                                            var priceCell = document.createElement("td");
                                                            var quantityCell = document.createElement("td");
                                                            // Đặt nội dung cho các ô dữ liệu
                                                            pictureCell.innerHTML = '<img  style="width: 100px; height: 100px;object-fit: cover;" src="' + product.picURL + '" alt="Product Picture">';
                                                            nameCell.textContent = product.name;
                                                            categoryIdCell.textContent = product.categoryID;
                                                            priceCell.textContent = product.price;
                                                            quantityCell.textContent = product.quantity;
                                                            // Thêm các ô dữ liệu vào hàng mới
                                                            newRow.appendChild(pictureCell);
                                                            newRow.appendChild(nameCell);
                                                            newRow.appendChild(categoryIdCell);
                                                            newRow.appendChild(priceCell);
                                                            newRow.appendChild(quantityCell);
                                                            // Thêm hàng mới vào tbody của bảng
                                                            document.querySelector("table tbody").appendChild(newRow);
                                                        })
                                                    } else {

                                                    }
                                                })
                                    }
                                    function sort(e) {
                                        var option = document.getElementById('sortID').value;
                                        $.ajax({
                                            method: "POST",
                                            url: "http://localhost:8080/Project_SWP_Group2/staff/product/sort",
                                            data: {
                                                option: option
                                            }

                                        })
                                                .done(function (data) {
                                                    var data1 = JSON.parse(data);
                                                    console.log(data1)
                                                    if (data1.isSuccess) {
                                                        document.querySelector("table tbody").innerHTML = ""
                                                        var productList = data1.data;
                                                        productList.forEach(function (product) {
                                                            // Tạo một hàng mới
                                                            var newRow = document.createElement("tr");
                                                            // Tạo các ô dữ liệu cho từng trường
                                                            var pictureCell = document.createElement("td");
                                                            var nameCell = document.createElement("td");
                                                            var categoryIdCell = document.createElement("td");
                                                            var priceCell = document.createElement("td");
                                                            var quantityCell = document.createElement("td");
                                                            // Đặt nội dung cho các ô dữ liệu
                                                            pictureCell.innerHTML = '<img  style="width: 100px; height: 100px;object-fit: cover;" src="' + product.picURL + '" alt="Product Picture">';
                                                            nameCell.textContent = product.name;
                                                            categoryIdCell.textContent = product.categoryID;
                                                            priceCell.textContent = product.price;
                                                            quantityCell.textContent = product.quantity;
                                                            // Thêm các ô dữ liệu vào hàng mới
                                                            newRow.appendChild(pictureCell);
                                                            newRow.appendChild(nameCell);
                                                            newRow.appendChild(categoryIdCell);
                                                            newRow.appendChild(priceCell);
                                                            newRow.appendChild(quantityCell);
                                                            // Thêm hàng mới vào tbody của bảng
                                                            document.querySelector("table tbody").appendChild(newRow);
                                                        })
                                                    } else {
                                                        alert("fail")
                                                    }
                                                });
                                    }
                                    function getCookie(name) {
                                        // Tách các cookie thành mảng các cặp key-value
                                        var cookies = document.cookie.split(';');
                                        // Duyệt qua từng cookie để tìm kiếm cookie có tên mong muốn
                                        for (var i = 0; i < cookies.length; i++) {
                                            var cookie = cookies[i].trim(); // Loại bỏ khoảng trắng ở đầu và cuối

                                            // Kiểm tra xem cookie có bắt đầu bằng tên mong muốn không
                                            if (cookie.indexOf(name + '=') === 0) {
                                                // Trả về giá trị của cookie
                                                return cookie.substring(name.length + 1); // Lấy phần giá trị của cookie (sau dấu '=')
                                            }
                                        }

                                        // Nếu không tìm thấy cookie có tên mong muốn, trả về null
                                        return null;
                                    }

                                    function profile() {
                                        var input = getCookie("input");
                                        $.ajax({
                                            method: "POST",
                                            url: "http://localhost:8080/Project_SWP_Group2/staff/profile",
                                            data: {
                                                input: input
                                            }
                                        })
                                                .done(function (data) {
                                                    var data1 = JSON.parse(data);
                                                    //                                                                            console.log(data1);
                                                    var cells = document.querySelectorAll("table td");
                                                    cells.forEach(function (cell) {
                                                        cell.remove();
                                                    });
                                                    //                                                                                    console.log(data1.data);
                                                    if (data1.isSuccess) {
                                                        var trName = document.getElementById("fullName");
                                                        var trEmail = document.getElementById("email");
                                                        var trAddress = document.getElementById("address");
                                                        var trPhone = document.getElementById("phoneNumber");
                                                        var info = data1.data;
                                                        var fullName = document.createElement("td");
                                                        var phoneNumber = document.createElement("td");
                                                        var address = document.createElement("td");
                                                        var email = document.createElement("td");
                                                        document.getElementById('update-pro-btn').setAttribute('data-name', info.fullName);
                                                        document.getElementById('update-pro-btn').setAttribute('data-phone', info.phoneNumber);
                                                        document.getElementById('update-pro-btn').setAttribute('data-email', info.email);
                                                        document.getElementById('update-pro-btn').setAttribute('data-address', info.address);
                                                        document.getElementById('update-pro-btn').setAttribute('data-id', info.username);
                                                        // Đặt nội dung cho các ô dữ liệu
                                                        fullName.textContent = info.fullName;
                                                        phoneNumber.textContent = info.phoneNumber;
                                                        address.textContent = info.address;
                                                        email.textContent = info.email;
                                                        trName.appendChild(fullName);
                                                        trEmail.appendChild(email);
                                                        trAddress.appendChild(address);
                                                        trPhone.appendChild(phoneNumber);
                                                    }
                                                });
                                    }

                                    function productList() {
                                        $.ajax({
                                            method: "POST",
                                            url: "http://localhost:8080/Project_SWP_Group2/staff/product",
                                            data: {
                                            }
                                        })
                                                .done(function (data) {
                                                    var data1 = JSON.parse(data);
                                                    //                                                                                    console.log(data1.data);
                                                    if (data1.isSuccess) {
                                                        document.querySelector("table tbody").innerHTML = ""
                                                        //                                                                                       
                                                        var productList = data1.data;
                                                        productList.forEach(function (product) {
                                                            // Tạo một hàng mới
                                                            var newRow = document.createElement("tr");
                                                            // Tạo các ô dữ liệu cho từng trường
                                                            var pictureCell = document.createElement("td");
                                                            var nameCell = document.createElement("td");
                                                            var categoryIdCell = document.createElement("td");
                                                            var priceCell = document.createElement("td");
                                                            var quantityCell = document.createElement("td");
                                                            // Đặt nội dung cho các ô dữ liệu
                                                            pictureCell.innerHTML = '<img  style="width: 100px; height: 100px;object-fit: cover;" src="' + product.picURL + '" alt="Product Picture">';
                                                            nameCell.textContent = product.name;
                                                            categoryIdCell.textContent = product.categoryID;
                                                            priceCell.textContent = product.price;
                                                            quantityCell.textContent = product.quantity;
                                                            // Thêm các ô dữ liệu vào hàng mới
                                                            newRow.appendChild(pictureCell);
                                                            newRow.appendChild(nameCell);
                                                            newRow.appendChild(categoryIdCell);
                                                            newRow.appendChild(priceCell);
                                                            newRow.appendChild(quantityCell);
                                                            // Thêm hàng mới vào tbody của bảng
                                                            document.querySelector("table tbody").appendChild(newRow);
                                                        })
                                                    } else {
                                                        alert('fail');
                                                    }
                                                });
                                    }

                                    function hideButtons(button) {
                                        var id = button.getAttribute("data-id");
//                                       
//                                        console.log(id);
                                        $.ajax({
                                            method: "POST",
                                            url: "http://localhost:8080/Project_SWP_Group2/staff/import/update",
                                            data: {
                                                id: id
                                            }
                                        })
                                                .done(function (data) {
                                                    // Kiểm tra phản hồi từ máy chủ
                                                    var data1 = JSON.parse(data);
                                                    if (data1.isSuccess) {
                                                        // Cập nhật nội dung và class của thẻ có class "status"
//                                                        button.classList.add('d-n');
                                                        listImport();
                                                    } else {
                                                        // Xử lý khi có lỗi từ máy chủ
                                                        console.error('Có lỗi khi cập nhật trạng thái.');
                                                    }
                                                })

                                    }


                                    function listImport() {
                                        $.ajax({
                                            method: "POST",
                                            url: "http://localhost:8080/Project_SWP_Group2/staff/import",
                                            data: {
                                            }
                                        })
                                                .done(function (data) {
                                                    var data1 = JSON.parse(data);
                                                    console.log(data1.data);
                                                    if (data1.isSuccess) {
                                                        document.querySelector("table #import-list").innerHTML = ""
                                                        var importList = data1.data.list;
                                                        var importDetailList = data1.data.listDetail;
                                                        console.log(importList);
                                                        var i = 0;
                                                        importList.forEach(function (item) {
                                                            var newDiv = document.createElement("div");
                                                            var newTr = document.createElement("tr");
//                                                            newTr.classList.add('class'+item.id)
                                                            var numCell = document.createElement("td");
                                                            var nameCell = document.createElement("td");
                                                            var quantityCell = document.createElement("td");
                                                            var dateCell = document.createElement("td");
                                                            var statusCell = document.createElement("td");
                                                            var priceCell = document.createElement("td");
                                                            var btnCell = document.createElement("td");
                                                            btnCell.classList.add('action-btn');
                                                            numCell.textContent = ++i;
                                                            nameCell.textContent = item.username;
                                                            quantityCell.textContent = item.quantity;
                                                            dateCell.textContent = item.date;
                                                            //statusCell.textContent = item.status;
                                                            statusCell.innerHTML = '<p class="status stt-' + item.status + '">' + item.status + '</p>';

                                                            priceCell.textContent = item.total;
                                                            btnCell.innerHTML = '<button class="view-btn"><i class="bi bi-eye"></i></button><button class="accept-btn ' + item.status + '" data-id="' + item.id + '"onclick="hideButtons(this)"><i class="bi bi-check-lg"></i></button>';

                                                            newDiv.appendChild(newTr);
                                                            newTr.appendChild(numCell);
                                                            newTr.appendChild(nameCell);
                                                            newTr.appendChild(quantityCell);
                                                            newTr.appendChild(dateCell);
                                                            newTr.appendChild(statusCell);
                                                            newTr.appendChild(priceCell);
                                                            newTr.appendChild(btnCell);

                                                            document.querySelector("table #import-list").appendChild(newTr);

                                                            var body = document.createElement("tbody");
                                                            body.classList.add("item");

                                                            importDetailList.forEach(function (detail) {

                                                                if (item.id === detail.importID) {
                                                                    var blankCell1 = document.createElement("td");
                                                                    var blankCell2 = document.createElement("td");
                                                                    var blankCell3 = document.createElement("td");

                                                                    var productNameCell = document.createElement("td");
                                                                    var quantityProductCell = document.createElement("td");
                                                                    var sizeCell = document.createElement("td");
                                                                    var priceProductCell = document.createElement("td");
                                                                    var newTrBody = document.createElement("tr");
                                                                    newTrBody.style.backgroundColor = "white";
                                                                    productNameCell.textContent = detail.productName;
                                                                    quantityProductCell.textContent = detail.quantity;
                                                                    sizeCell.textContent = detail.sizeName;
                                                                    priceProductCell.textContent = detail.price;
                                                                    newTrBody.appendChild(blankCell1);
                                                                    newTrBody.appendChild(productNameCell);
                                                                    newTrBody.appendChild(quantityProductCell);
                                                                    newTrBody.appendChild(sizeCell);
                                                                    newTrBody.appendChild(blankCell2);

                                                                    newTrBody.appendChild(priceProductCell);
                                                                    newTrBody.appendChild(blankCell3);

                                                                    body.appendChild(newTrBody);

                                                                }
                                                                document.querySelector("table #import-list").appendChild(body);

                                                            })


                                                        })
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

                                                        var acceptBtns = document.querySelectorAll('.accept-btn');
                                                        console.log(acceptBtns);

//                                                        var rejectBtns = document.querySelectorAll('.reject-btn');
                                                        // Thiết lập sự kiện cho tất cả các nút
//                                                        acceptBtns.forEach(function (btn) {
//                                                            btn.addEventListener('click', hideButtons);
//                                                        });
//                                                        rejectBtns.forEach(function (btn) {
//                                                            btn.addEventListener('click', hideButtons);
//                                                        });


                                                    }
                                                })
                                    }
                                    ;



                                    let status = document.querySelectorAll('.status');
                                    status.forEach(element => {
                                        if (element.innerHTML === 'reject') {
                                            element.classList.add('red');
                                        } else if (element.innerHTML === 'accept') {
                                            element.classList.add('green');
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

                                                switch (target) {
                                                    case 'product-manage':
                                                        productList();
                                                        break;
                                                    case 'personal-info':
                                                        profile();
                                                        break;
                                                    case 'import-goods':

                                                        listImport();
                                                        break;
                                                }


                                            });
                                        });
                                    });


//                                    
        </script>
    </body>

</html>


