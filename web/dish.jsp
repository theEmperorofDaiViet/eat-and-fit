<%-- 
    Document   : dish
    Created on : Jan 19, 2023, 3:30:29 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="eatandfit.model.StepsDetail"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="eatandfit.model.RecipeDetail"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/eat-and-fit/styles/main.css"/>
        <link rel="icon" type="image/x-icon" href="/eat-and-fit/images/logo.png">      
        <title>Eat & Fit</title>
    </head>
    <body>
        <div class="root" style="height: 150vh">
            <div class="container" >
                <div class="dish-detail"style="top: 0">
                    <div class="dish-detail-title">
                        <div class="dish-detail-image">
                            <img src="../images/dishes/${dish.id}.jpg" width="70" height="70" alt="alt"/>
                        </div>
                        <div class="dish-detail-name">
                            <h3>${dish.name}</h3>
                        </div>
                    </div>
                    <div class="NutritionDetail-total">
                        <div class="dish-detail-recipe">
                            <div style="font-size: 20px">Nguyên liệu (1 suất):</div>
                            <div>
<%

                                RecipeDetail recipeDetail = (RecipeDetail) request.getAttribute("recipeDetail");

                                for(String k: recipeDetail.getIngredients().keySet()) {
                                       %> 
                                       <p><b><%=  k  %>:</b><!-- comment -->



                                       <%=  recipeDetail.getIngredients().get(k)  %><p>
                                       <%
                                }


                            %>
                            </div>

                        </div>
                        <div class="NutritionDetail">
                            <p style="height: 30px">Thành phần dinh dưỡng:</p>

                            <ul style="height: 120px">
                                <li><b>Calories:</b> ${nutrionDetail.calories} calo</li>
                                <li><b>Carbs:</b> ${nutrionDetail.carbs}g &nbsp;  (${nutrionDetail.getCarbsPer()} %)</li>
                                <li><b>Fat:</b> ${nutrionDetail.fat}g   &nbsp;(${nutrionDetail.getFatPer()} %)</li>
                                <li><b>Protein:</b> ${nutrionDetail.protein}g &nbsp;  (${nutrionDetail.getProteinPer()}%)</li>
                            </ul>

                        </div>
                    </div>
                    <div class="dish-detail-step">
                        <div style="font-size: 20px">Các bước nấu:</div>
                        <ul>
<%

                                StepsDetail stepsDetail = (StepsDetail) request.getAttribute("stepsDetail");

                                for(String k: stepsDetail.getSteps().keySet()) {
                                       %> 
                                       <p><b><%=  k  %></b><!-- comment -->



                                       <%=  stepsDetail.getSteps().get(k)  %><p>
                                       <%
                                }


                            %>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>