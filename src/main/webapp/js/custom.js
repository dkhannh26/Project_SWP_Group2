/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

$(document).ready(function () {
    $('.btn-resgister').click(function (e) {
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
                phoneNumber: phoneNumber
            }

        })
                .done(function (data) {
                    var data1 = JSON.parse(data);
                    if (data1.isSuccess) {
                        alert('successfully');

                    } else {
                        alert('username da ton tai');
                    }
                });
    })

    
//    $('.btn-send').click(function (e) {
////        e.preventDefault();
//        var email = document.getElementById("email").value;
//        $.ajax({
//            method: "POST",
//            url: "http://localhost:8080/Project_SWP_Group2/login/forgot",
//            data: {
//                email: email
//            }
//        })
//                .done(function (data) {
//                    var data1 = JSON.parse(data);
//                   
//                    if (data1.isSuccess) {
//                          $("#message").html("Please enter the code sent to your email to continue");
//                    } else {
//                          $("#message").html("Your email is not exist");
//
//                    }
//                });
//    })
})

