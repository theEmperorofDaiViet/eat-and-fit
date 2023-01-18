<%-- 
    Document   : heightAndWeight
    Created on : Jan 16, 2023, 5:51:04 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/eat-and-fit/styles/main.css"/>
        <link rel="icon" type="image/x-icon" href="/eat-and-fit/images/logo.png">      
        <title>Eat & Fit</title>
    </head>
    <body>
        <div class="root">
            <div class="container">
                <div class="title">Eat & Fit - Hướng dẫn giảm cân</div>
                <form action="stage.jsp" method="post">
                    <input type="text" id="id" name="sex" value="${sex}" style="display: none">

                    <label>Chiều cao:</label>
                    <input type="text" id="id" name="height" value="${height}"  placeholder="Chiều cao" required><br>
                    <p style="color: red">${heightMessage}</p>
                    
                    <label>Cân nặng:</label>
                    <input type="text" id="id" name="weight" placeholder="Cân nặng" required><br>
                    <p style="color: red">${weightMessage}</p>
                    <input type="submit" id="id" value="Tiếp tục">
                </form>
            </div>
        </div>
    </body>
</html>
