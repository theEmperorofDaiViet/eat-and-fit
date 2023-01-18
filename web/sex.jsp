<%-- 
    Document   : sex
    Created on : Jan 16, 2023, 5:45:43 PM
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
                <form action="height-weight.jsp" method="post">
                    <div class="main">
                        <div class="sex-tittle" >Giới tính của bạn:</div>
                        <input type="radio" id="id" name="sex" value="0" checked>
                        <label>Nam</label><br>
                        <input type="radio" id="id" name="sex" value="1">
                        <label>Nữ</label><br>
                        <input type="submit" class="sbsex">
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
