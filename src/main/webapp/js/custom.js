/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

$(document).ready(function () {
    $('.btn-register').click(function (e) {
        e.preventDefault();
//        var id = $(this).attr("id-role")
//        var row = $(this).closest('tenClass'); di ra the to tien cua no
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;
        var email = document.getElementById("email").value;
        var address = document.getElementById("address").value;
        var phoneNumber = document.getElementById("phoneNumber").value;
        var fullName = document.getElementById("fullName").value;
        $.ajax({
            method: "POST",
            url: "http://localhost:8080/Project_SWP_Group2/login/signup",
            data: {
                username: username,
                password: password,
                email: email,
                address: address,
                phoneNumber: phoneNumber,
                fullName: fullName
            }

        })
                .done(function (data) {
                    var data1 = JSON.parse(data);
                    if (data1.isSuccess) {
                        alert('Create account successfully');

                    } else {
                        alert('Your username is existed');
                    }
                });
    })


    $('.btn-send').click(function (e) {

        e.preventDefault();
        var emailInput = document.getElementById("email");
        var email = emailInput.value;
        var emailForm = document.getElementById("emailForm");
        var codeForm = document.getElementById("codeForm");

        $.ajax({
            method: "POST",
            url: "http://localhost:8080/Project_SWP_Group2/login/forgot",
            data: {
                email: email
            }
        })
                .done(function (data) {
                    var data1 = JSON.parse(data);
//                    console.log(data1);
                    if (data1.isSuccess) {
                        document.cookie = "code=" + data1.data;
                        document.cookie = "email=" + email;
                        $("#message").html("Please enter the code sent to your email to continue");
                        document.getElementById("message").style.color = "#009900";

                        emailForm.style.visibility = "hidden"
                        codeForm.style.visibility = "visible";
                        codeForm.style.position = "absolute";
//                     
                    } else {
                        alert("Your email is not exist");

                    }
                });
    })

    $('.btn-submit').click(function (e) {
        var updateForm = document.getElementById("updateForm");
        var codeForm = document.getElementById("codeForm");
        e.preventDefault();
        var code = getCookie("code");
        var codeInput = document.getElementById("code").value;
//        console.log(code);
        if (code === codeInput) {
            codeForm.style.visibility = "hidden"
            updateForm.style.visibility = "visible";
            updateForm.style.position = "absolute";
        } else {
            $("#message").html("Incorrect code!");
            document.getElementById("message").style.color = "red";
        }

    })
    $('.btn-changePass').click(function (e) {
        var pass1 = document.getElementById("password1").value;
        var pass2 = document.getElementById("password2").value;
        var email = getCookie("email");
        e.preventDefault();
        if (pass1 === pass2) {
            $.ajax({
                method: "POST",
                url: "http://localhost:8080/Project_SWP_Group2/login/update",
                data: {
                    email: email,
                    password: pass1
                }
            })
                    .done(function (data) {
                        var data1 = JSON.parse(data);
                        console.log(data1);
                        if (data1.isSuccess) {

                            $("#messageUpdate").html("Change password successfully"); 
                            document.getElementById("messageUpdate").style.color = "#009900";
//                     
                        } else {

                        }
                    });
        } else {
            $("#messageUpdate").html("Password is not match!");
            document.getElementById("messageUpdate").style.color = "red";
//            alert('alo')
        }
//         

    })


})

function getCookie(name) {
    var cookieName = name + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var cookieArray = decodedCookie.split(';');

    for (var i = 0; i < cookieArray.length; i++) {
        var cookie = cookieArray[i].trim();
        if (cookie.indexOf(cookieName) === 0) {
            return cookie.substring(cookieName.length, cookie.length);
        }
    }
    return "";
}