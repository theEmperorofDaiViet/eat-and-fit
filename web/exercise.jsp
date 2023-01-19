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
        <link rel="stylesheet" href="/eat-and-fit/styles/main.css"/>
        <link rel="icon" type="image/x-icon" href="/eat-and-fit/images/logo.png">      
        <title>Eat & Fit</title>
    </head>
    <body>
        <div class="dish-detail-name">
            <h2>${exercise.name}</h3>
        <div>
        <iframe width="420" height="345" src="${exercise.link}"></iframe>
        <h3>Overview:</h3>
        <c:forEach items="${overview}" var="o">
            <p>${o}</p>
        </c:forEach>

        <h3>Introductions:</h3>
        <ol type="1">
        <c:forEach items="${introductions}" var="i">
            <li style="list-style-type: decimal;">${i}</li>
        </c:forEach>
        </ol>
    </body>
</html>