<%-- 
    Document   : stage
    Created on : Jan 18, 2023, 12:05:27 AM
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
                <%
                    int body = (Integer)request.getAttribute("body");
                    if (body == 0) {
                %>
                <p style="font-size: 25px">Bạn quá gầy, không nên giảm cân!</p>
                <%} else if(body == 1){%>
                <p style="font-size: 25px">Hiện tại thể trạng của bạn rất tốt, hãy duy trì thể trạng này nhé!!</p>
                <%}else{%>
                <form action="../plan" method="post">
                    <div class="main">
                        <input type="text" id="id" name="body" value="${body}" style="display: none">
                        <input type="text" id="id" name="sex" value="${sex}" style="display: none">
                        <div class="sex-tittle" >Chọn giai đoạn phù hợp với bạn</div>
                        <input type="radio" id="id" name="stage" value="0" checked>
                        <label>Beginner</label><br>
                        <input type="radio" id="id" name="stage" value="1">
                        <label>Intermediate</label><br>
                        <input type="submit" class="sbsex">
                    </div>
                </form>
                <%}%>
            </div>
        </div>
    </body>
</html>
