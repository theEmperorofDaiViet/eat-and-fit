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
                <div class="title">
                    <div style="display: inline">
                        <img src="/eat-and-fit/images/logo.png" style="width:128px"></div>
                    <div style="display: inline; padding-left: 2rem">                        
                        <h1 style="font-family: sans-serif; font-size:50px; margin-block-start: 0.33em; margin-block-end: 0em;">Eat & Fit</h1>
                        <i style="font-family: sans-serif; font-size: 22px; margin-block-start: 0em; margin-block-end: 0em;">Hướng dẫn giảm cân</i>
                    </div>
                </div>
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
