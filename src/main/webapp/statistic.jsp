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
        <link rel="icon" href="/Project_SWP_Group2/images/LG.png" type="image/x-icon">

        <script src="https://kit.fontawesome.com/1bd876819f.js" crossorigin="anonymous"></script>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
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
                background-color: #2f2b2b;
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
                background-color: #2f2b2b;
                padding: 0;
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
                scrollbar-width: none;
            }
            .main-content > div {
                display: none;
            }

            /* product management */
            .filter {
                padding: 8px;
            }

            .filter-add-btn {
                float: right;
                border: none;
                background-color: #2f2b2b;
                color: white;
                padding: 8px;
                border-radius: 5px;

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
            .personal-main table th, td {
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
            .card:nth-child(2){
                background-color: green;
            }
            .card:nth-child(3){
                background-color: orange;
            }
            .card:nth-child(4){
                background-color: blue;
            }
            .card-inner {
                display: flex;
                align-items: center;
                justify-content: space-between;
            }
            .card-inner > span {
                font-size: 50px;
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
        </style>
    </head>

    <body>
        <header>
            <div class="header-top">
                <div class="logo">DOTAI</div>
                <div class="admin-info">
                    <div class="admin-name"><i class="bi bi-person-fill"></i>: Admin</div>
                    <div class="signout"><a><a href="cookieHandle"><i class="bi bi-box-arrow-right"></i> Sign out</a></div>
                </div>
            </div>
        </header>

        <div class="main">
            <nav>
                <ul class="nav-list">
                    <li class="nav-link" data-target="statistic">
                        <a href="#"><i class="fa-solid fa-chart-line"></i> <span>Dashboard</span> </a>
                    </li>
                    <li class="nav-link" data-target="order-manage">
                        <a href="#" ><i class="bi bi-cart-fill"></i> <span>Order management</span> </a>
                    </li>
                    <li class="nav-link" data-target="product-manage">
                        <a href="#" ><i class="bi bi-box"></i> <span>Product Management</span> </a>
                    </li>
                    <li class="nav-link" data-target="account-manage">
                        <a href="#" ><i class="bi bi-person-badge-fill"></i> <span>Account management</span> </a>
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
                         <button class="filter-add-btn">Add new product</button> 
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
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>

                                    <td class="td-button">
                                        <button type="button" class="btn btn-primary">Update</button>
                                        <button type="button" class="btn btn-danger">Delete</button>
                                    </td>
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

                    </div>
                </div>

                <div class="account-manage">
                    <h3>Account Management</h3>
                    <hr>
                    <input type="text" placeholder="Enter usename to search" class="account-search form-control">
                    <div class="account-main">
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Username</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Address</th>
                                    <th scope="col">Fullname</th>
                                    <th scope="col" class="phoneNum-col">Phone number</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>dy</td>
                                    <td>duyttce171199@fpt.edu.vn</td>
                                    <td>Can Tho</td>
                                    <td>tran thanh duy</td>
                                    <td>1231456</td>
                                </tr>


                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="personal-info">
                    <h3>Personal Information</h3>
                    <hr>
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
                </div>
            </div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="/Project_SWP_Group2/js/jquery-3.7.0.min.js"></script>
        <script src="/Project_SWP_Group2/js/jquery.validate.min.js"></script>
        <script>

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
                                                    // T?o m?t hàng m?i
                                                    var newRow = document.createElement("tr");
                                                    // T?o các ô d? li?u cho t?ng tr??ng
                                                    var pictureCell = document.createElement("td");
                                                    var nameCell = document.createElement("td");
                                                    var categoryIdCell = document.createElement("td");
                                                    var priceCell = document.createElement("td");
                                                    var quantityCell = document.createElement("td");
                                                    // ??t n?i dung cho các ô d? li?u
                                                    pictureCell.innerHTML = '<img  style="width: 100px; height: 100px;object-fit: cover;" src="' + product.picURL + '" alt="Product Picture">';
                                                    nameCell.textContent = product.name;
                                                    categoryIdCell.textContent = product.categoryID;
                                                    priceCell.textContent = product.price;
                                                    quantityCell.textContent = product.quantity;
                                                    // Thêm các ô d? li?u vào hàng m?i
                                                    newRow.appendChild(pictureCell);
                                                    newRow.appendChild(nameCell);
                                                    newRow.appendChild(categoryIdCell);
                                                    newRow.appendChild(priceCell);
                                                    newRow.appendChild(quantityCell);
                                                    // Thêm hàng m?i vào tbody c?a b?ng
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
                                                    // T?o m?t hàng m?i
                                                    var newRow = document.createElement("tr");
                                                    // T?o các ô d? li?u cho t?ng tr??ng
                                                    var pictureCell = document.createElement("td");
                                                    var nameCell = document.createElement("td");
                                                    var categoryIdCell = document.createElement("td");
                                                    var priceCell = document.createElement("td");
                                                    var quantityCell = document.createElement("td");
                                                    // ??t n?i dung cho các ô d? li?u
                                                    pictureCell.innerHTML = '<img  style="width: 100px; height: 100px;object-fit: cover;" src="' + product.picURL + '" alt="Product Picture">';
                                                    nameCell.textContent = product.name;
                                                    categoryIdCell.textContent = product.categoryID;
                                                    priceCell.textContent = product.price;
                                                    quantityCell.textContent = product.quantity;
                                                    // Thêm các ô d? li?u vào hàng m?i
                                                    newRow.appendChild(pictureCell);
                                                    newRow.appendChild(nameCell);
                                                    newRow.appendChild(categoryIdCell);
                                                    newRow.appendChild(priceCell);
                                                    newRow.appendChild(quantityCell);
                                                    // Thêm hàng m?i vào tbody c?a b?ng
                                                    document.querySelector("table tbody").appendChild(newRow);
                                                })
                                            } else {
                                                alert("fail")
                                            }
                                        });
                            }
                            function getCookie(name) {
                                // Tách các cookie thành m?ng các c?p key-value
                                var cookies = document.cookie.split(';');

                                // Duy?t qua t?ng cookie ?? tìm ki?m cookie có tên mong mu?n
                                for (var i = 0; i < cookies.length; i++) {
                                    var cookie = cookies[i].trim(); // Lo?i b? kho?ng tr?ng ? ??u và cu?i

                                    // Ki?m tra xem cookie có b?t ??u b?ng tên mong mu?n không
                                    if (cookie.indexOf(name + '=') === 0) {
                                        // Tr? v? giá tr? c?a cookie
                                        return cookie.substring(name.length + 1); // L?y ph?n giá tr? c?a cookie (sau d?u '=')
                                    }
                                }

                                // N?u không tìm th?y cookie có tên mong mu?n, tr? v? null
                                return null;
                            }



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
                                                                var productList = data1.data;
                                                                productList.forEach(function (product) {
                                                                    // T?o m?t hàng m?i
                                                                    var newRow = document.createElement("tr");
                                                                    // T?o các ô d? li?u cho t?ng tr??ng
                                                                    var pictureCell = document.createElement("td");
                                                                    var nameCell = document.createElement("td");
                                                                    var categoryIdCell = document.createElement("td");
                                                                    var priceCell = document.createElement("td");
                                                                    var quantityCell = document.createElement("td");
                                                                    // ??t n?i dung cho các ô d? li?u
                                                                    pictureCell.innerHTML = '<img  style="width: 100px; height: 100px;object-fit: cover;" src="' + product.picURL + '" alt="Product Picture">';
                                                                    nameCell.textContent = product.name;
                                                                    categoryIdCell.textContent = product.categoryID;
                                                                    priceCell.textContent = product.price;
                                                                    quantityCell.textContent = product.quantity;
                                                                    // Thêm các ô d? li?u vào hàng m?i
                                                                    newRow.appendChild(pictureCell);
                                                                    newRow.appendChild(nameCell);
                                                                    newRow.appendChild(categoryIdCell);
                                                                    newRow.appendChild(priceCell);
                                                                    newRow.appendChild(quantityCell);
                                                                    // Thêm hàng m?i vào tbody c?a b?ng
                                                                    document.querySelector("table tbody").appendChild(newRow);
                                                                })
                                                            } else {
                                                                alert('fail');
                                                            }
                                                        });
                                                break;
                                            case 'personal-info':
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


                                                                // ??t n?i dung cho các ô d? li?u
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

                                                break;
                                        }
                                    });
                                });
                            });
        </script>
    </body>

</html>

