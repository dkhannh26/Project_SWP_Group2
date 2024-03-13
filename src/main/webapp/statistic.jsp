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
            /*chart*/
            .chart {
                display: flex;
                align-items: center;
            }
            .chart-heading {
                font-family: "Rubik", sans-serif;
                color: #023047;
                text-transform: uppercase;
                font-size: 24px;
                text-align: center;
            }

            .chart-container {
                width: 380px;
            }

            .chart-container-col{
                width: 500px;
            }

            .programming-stats {
                font-family: "Rubik", sans-serif;
                display: flex;
                align-items: center;
                gap: 24px;
                margin: 0 auto;
                width: fit-content;
                box-shadow: 0 4px 12px -2px rgba(0, 0, 0, 0.3);
                border-radius: 20px;
                padding: 8px 32px;
                color: #023047;
                transition: all 400ms ease;
            }

            .programming-stats:hover {
                transform: scale(1.02);
                box-shadow: 0 4px 16px -7px rgba(0, 0, 0, 0.3);
            }

            .programming-stats .details ul {
                list-style: none;
                padding: 0;
            }

            .programming-stats .details ul li {
                font-size: 16px;
                margin: 12px 0;
                text-transform: uppercase;
            }

            .programming-stats .details .percentage {
                font-weight: 700;
                color: #e63946;
            }
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
                        <select name="filter-price  " id="filter-price">
                            <option value="volvo">Sort by price ascending</option>
                            <option value="volvo">Sort by price in descending</option>
                        </select>
                        <input type="text" placeholder="Search">
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
                                <!--                            <tr>
                                                                <th scope="row">
                                                                    <img src="/images/img1.jpg" alt="">
                                                                </th>
                                                                <td>NOOBITA - Qu?n dài jeans ?ng r?ng 8124</td>
                                                                <td>12345</td>
                                                                <td>1.000.000</td>
                                                                <td>10</td>
                                                                <td class="td-button">
                                                                    <button type="button" class="btn btn-primary">Update</button>
                                                                    <button type="button" class="btn btn-danger">Delete</button>
                                                                </td>
                                                            </tr>-->

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
                            <select id="mySelect" name="year">
                                <option value="">--Select Year--</option>
                                <option value="2024">2024</option>
                                <option value="2023">2023</option>
                                <option value="2022">2022</option>
                                <option value="2021">2021</option>
                            </select>
                            <button name="date" value="date">Submit</button>
                            <h1>   </h1>
                        </form>
                    </div>

                    <div class="chart">
                        <div class="chart-container">
                            <canvas class="my-chart"></canvas>
                        </div>

                        <div class="chart-container-col">
                            <canvas class="my-chart-line" width="1000"  height="900"></canvas>
                        </div>
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

        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
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



            const chartData = {
                labels: ["1", "2", "3", "4"],
                data: [${quarter1},${quarter2},${quarter3},${quarter4}],
            };
//    data: [${quarter1},${quarter2},${quarter3},${quarter4}],     

            const myChart = document.querySelector(".my-chart");
            const ul = document.querySelector(".programming-stats .details ul");

            new Chart(myChart, {
                type: "doughnut",
                data: {
                    labels: chartData.labels,
                    datasets: [
                        {
                            label: "Quarter revenue",
                            data: chartData.data,
                        },
                    ],
                }

            });


            const ctx = document.querySelector('.my-chart-line');

            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', ],
                    datasets: [{
                            label: 'monthly revenue',
                            data: [${revenue1},${revenue2},${revenue3},${revenue4},${revenue5},${revenue6},${revenue7},${revenue8},${revenue9},${revenue10},${revenue11},${revenue12}],
                            borderWidth: 1,
                            backgroundColor: 'rgba(231, 189, 111, 0.799)',
                            barThickness: 30
                        }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });

            const populateUl = () => {
                chartData.labels.forEach((l, i) => {
                    let li = document.createElement("li");
                    li.innerHTML = `${l}: <span class='percentage'>${chartData.data[i]}%</span>`;
                    ul.appendChild(li);
                });
            };

            populateUl();
        </script>
    </body>

</html>

