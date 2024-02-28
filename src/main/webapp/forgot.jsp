<%-- 
    Document   : forgot
    Created on : Feb 28, 2024, 11:26:55 AM
    Author     : thinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="http://localhost:8080/Project_SWP_Group2/login/forgot" method="POST">
            <label>Email</label>
            <input type="text" id="email" name="email" onchange="checkInput() />
            <div id="hiddenInput" style="display:none;">
                <!-- Ô input sẽ hiện khi ô input trên có giá trị hợp lệ -->
                <input type="text" id="hiddenField">
            </div>

            <button>Send code</button>
        </form>
        ${message}

        <script src="js/jquery-3.7.0.min.js"></script>
        <script src="js/jquery.validate.min.js"></script>
        <script src="js/custom.js"></script>
        
        
        <script>
            function checkInput(){
                var message = document.getElementById("message").value;
                 var hiddenInput = document.getElementById("hiddenInput");
                 if(message == Please enter the code sent to your email to continue""){
                     hiddenInput.style.display = "block"
                 }
            }
        </script>
    </body>
</html>
