<%-- 
    Document   : exercise
    Created on : Jan 19, 2023, 8:22:57 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link rel="stylesheet" href="/eat-and-fit/styles/main.css"/>
        <link rel="icon" type="image/x-icon" href="/eat-and-fit/images/logo.png">      
        <title>Eat & Fit</title>
    </head>
    <body>
        <div class="roots" style="overflow: auto">            
            <div class="containers" >
                <div class="title-plan" style="position: relative;">
                    <div style="display: inline">
                        <img src="/eat-and-fit/images/logo.png" style="width:128px"></div>
                    <div style="display: inline; padding-left: 2rem">                        
                        <h1 style="font-family: sans-serif; font-size: 50px; font-weight: bold; margin-block-start: 0.5em; margin-block-end: 0em;">Eat & Fit</h1>
                        <i style="font-family: sans-serif; font-size: 22px; margin-block-start: 0em; margin-block-end: 0em;">Hướng dẫn giảm cân</i>
                    </div>
                </div>
                <div class="card" style="padding-left: 10px; padding-right: 10px; margin-block-start: 2em; margin-block-end: 1em;  width: 1000px;">
                    <div style="text-align:center; font-weight:500; font-size: 35px; padding-top: 2rem; padding-bottom: 2rem;">${exercise.name}</div>
                    <iframe width="100%" height="500px" allow="fullscreen;" src="${exercise.link}"></iframe>                            
                    <h3 style="margin-block-start: 1em; padding-left: 26px; padding-right: 26px;">I. Overview:</h3>
                    <c:forEach items="${overview}" var="o">
                        <p style="padding-left: 50px; padding-right: 50px;">${o}</p>
                    </c:forEach>

                    <h3 style="padding-left: 21px; padding-right: 21px;">II. Instructions:</h3>                       
                    <ol type="1" style="padding-left: 70px; padding-right: 70px; font-size: 20px">
                        <c:forEach items="${introductions}" var="i">
                            <li style="list-style-type: decimal;">${i}</li>
                        </c:forEach>
                    </ol>
                </div>
            </div>
        </div>
    </body>
</html>