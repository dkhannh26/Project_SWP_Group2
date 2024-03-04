<%-- 
    Document   : profile
    Created on : Feb 28, 2024, 10:00:26 PM
    Author     : thinh
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./boostrap/bootstrap.min.css"/>
        <title>Profile</title>
        <link rel="icon" href="./images/LG.png" type="image/x-icon">
        <!-- font-awesome -->
        <script src="https://kit.fontawesome.com/1bd876819f.js" crossorigin="anonymous"></script>


        <style>
            body{
                height: 600px;
                font-family: "Quicksand", sans-serif;
                margin: 0 10%;
                color: #444;
            }

            .flex {
                display: flex;
            }

            .content{
                text-align: center;
                border-bottom:#a0816c solid 2px;
                margin: 5% 0;
            }

            .highlight{
                color: #a0816c;
            }

            .info-content{
                border-bottom:rgb(172, 162, 162) solid 1px;
                padding: 12px 0;
            }

            .user-name {
                background-color: #d9edf7;
                justify-content: space-between;
            }

            .user-name h6 {
                align-items: center;
                margin: 0;
                line-height: 2;
                margin-left: 10px;
            }

            .dropdown-container {
                display: none;
                text-align: center;
                width: 100%;
                background-color: #fbfbfb;
            }

            .dropdown-container .text-field {
                width: 90%;
                border: 1px solid #ebebeb;
                padding-left: 10px;
            }

            .dropdown-container .input-group .input-icon {
                width: 35px;
                height: 34px;
                line-height: 34px;
                background-color: #ebebeb;
            }

            .dropdown-container .input-group {
                padding: 20px 0 20px 25px;
            }

            .user-info .edit-info-btn button{
                color: #a0816c;
                border: none;
                background-color: #d9edf7;
            }

            .update-info-btn {
                padding-bottom: 20px;
            }

            .update-info-btn button{
                font-weight: bold;
                border: none;
                height: 40px;
                padding: 5px 20px;
                margin: 0 20px;
                border-radius: 5px;
            }

            .update-info-btn .update-btn {
                background-color: #000;
                color: #fff;
            }

            .update-info-btn .update-btn:hover {
                background-color: #a0816c;
            }

            .update-info-btn .cancel-btn {
                background-color: rgb(162, 162, 162);
                color: #000;
            }

            .update-info-btn .cancel-btn:hover {
                background-color: rgb(210, 209, 209);
            }

            .option li a{
                list-style-type: circle;
                padding-left: 1rem;
                text-decoration: none;
                color: #444;
            }
            .option{
                list-style-type: circle;
            }
            .info{
                padding-left: 0;
                list-style: none;
                background-color: #fbfbfb;
            }

            .info li {
                margin-left: 10px;
            }
        </style>
    </head>

    <body>
        <div class="content">
            <h2 id="highlight">Your Account</h2>
        </div>
        <div class="row">
            <div class="col-md-4">
                <h6 id="highlight"><b>ACCOUNT</b></h6>
                <ul class="option">
                    <li><a href="">Account information</a></li>
                    <li><a href="">Change password</a></li>
                    <li><a href="">Sign out</a></li>
                </ul>
            </div>
            <div class="col-md-8">


                <h5 class="info-content"><b>ACCOUNT INFORMATION</b></h5>
                <div class="user-info">
                    <div class="flex user-name">
                        <h6 class="highlight">${fullName}</h6>
                        <div class="dropdown">
                            <div class="edit-info-btn">
                                <button><i class="fa-regular fa-pen-to-square" id="btn-edit"></i></button>
                            </div>
                        </div>
                    </div>
                    <div class="dropdown-container">
                        <div class="input-group"> 
                            <span class="input-icon">
                                <i class="fa-regular fa-user"></i>
                            </span>
                            <input class="text-field" type="text" value="${fullName}">
                        </div>
                        <div class="input-group"> 
                            <span class="input-icon">
                                <i class="fa-solid fa-house"></i>
                            </span>
                            <input class="text-field" type="text" value="${address}">
                        </div>
                        <div class="input-group"> 
                            <span class="input-icon">
                                <i class="fa-regular fa-envelope"></i>
                            </span>
                            <input class="text-field" type="text" value="${email}">
                        </div>
                        <div class="input-group"> 
                            <span class="input-icon">
                                <i class="fa-solid fa-phone"></i>
                            </span>
                            <input class="text-field" type="text" value="${phoneNumber}">
                        </div>

                        <div class="update-info-btn">
                            <button class="update-btn">Update</button>
                            <button class="cancel-btn">Cancel</button>
                        </div>

                    </div>
                    <ul class="info">
                        <li><span class="highlight">Email:</span>${email}</li>
                        <li><span class="highlight">Country:</span> Vietnam</li>
                        <li><span class="highlight">Address:</span> ${address}</li>
                        <li><span class="highlight">Phone Number:</span> ${phoneNumber}</li>

                    </ul>
                </div>



            </div>
        </div>

        <script src="./js/profile.js"></script>
    </body>

</html>
