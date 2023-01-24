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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://cdn.anychart.com/releases/8.0.1/js/anychart-core.min.js"></script>
        <script src="https://cdn.anychart.com/releases/8.0.1/js/anychart-pie.min.js"></script>    
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
                    <div style="text-align:center; font-weight:500; font-size: 35px; padding-top: 2rem; padding-bottom: 2rem;">${dish.name}</div>
                    <div class="row">
                        <div class="col-sm-5 col-md-6">
                          <img src="../images/dishes/${dish.id}.jpg" style="width:100%; height:100%" alt="alt"/>
                        </div>
                        <div class="col-sm-5 offset-sm-2 col-md-6 offset-md-0">
                            <div id="dishChart" style="width: 100%; height: 300px"></div>
                            <script>
                                var dishData = [
                                                    {x: "Protein", value: ${nutrionDetail.protein * 4}},
                                                    {x: "Fat", value: ${nutrionDetail.fat * 9}},
                                                    {x: "Carbs", value: ${nutrionDetail.carbs * 4}, exploded: true}                                  
                                                  ];
                                var dishChart = anychart.pie();
                                dishChart.title("Percent Calories From:");
                                dishChart.data(dishData);
                                dishChart.explode("9%");

                                var dishPalette = anychart.palettes.distinctColors();
                                dishPalette.items(['#D35454', '#38BC56' ,'#F7D300']);
                                dishChart.palette(dishPalette);

                                dishChart.startAngle(0);
                                dishChart.stroke("#000000", 3);

                                dishChart.top('0%');

//                                    dishChart.labels().position("outside");
//                                    dishChart.connectorStroke({color: "#595959", thickness: 2, dash:"2 2"});   

                                dishChart.container('dishChart');
                                dishChart.draw();                                                                       
                            </script>
                        </div>
                    
                    </div>
                    <div class="row">
                        <div class="col-sm-5 col-md-6">
                        <table style="width:100%">
                            <tr>
                                <th style="font-size:20px;">Nguyên liệu (cho 1 suất):</th>
                            </tr>
                            <tr>
                                <td>
                                    <%
                                        RecipeDetail recipeDetail = (RecipeDetail) request.getAttribute("recipeDetail");

                                        for(String k: recipeDetail.getIngredients().keySet()) {
                                               %> 
                                               <b><%=  k  %>:</b>

                                               <text style="float:right"><%=  recipeDetail.getIngredients().get(k)  %></text><br/>
                                               <%
                                        }
                                    %>
                                </td>
                            </tr>
                        </table>                            
                        </div>
                        <div class="col-sm-5 offset-sm-2 col-md-6 offset-md-0">
                            <table style="width:100%;">
                                <tr>
                                    <th style="font-size:20px;">Thành phần dinh dưỡng</th>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Calories:</b>
                                        <text style="float:right">${nutrionDetail.calories} cal</text><br/>
                                        <b>Carbs:</b>
                                        <text style="float:right">${nutrionDetail.carbs} g</text><br/>
                                        <b>Fat:</b>
                                        <text style="float:right">${nutrionDetail.fat} g</text><br/>
                                        <b>Protein:</b>
                                        <text style="float:right">${nutrionDetail.protein} g</text><br/>
                                    </td>
                                </tr>
                            </table>                            
                        </div>
                    </div>
                    <div>
                        <div style="text-align: center; font-size: 28px"><b>Các bước thực hiện:</b></div>
                        <div style="margin-block-start: 1em; padding-left: 60px; padding-right: 60px">
                            <%
                                StepsDetail stepsDetail = (StepsDetail) request.getAttribute("stepsDetail");

                                for(String k: stepsDetail.getSteps().keySet()) {
                                       %> 
                                       <p><b><%=  k  %></b>

                                       <%=  stepsDetail.getSteps().get(k)  %><p>
                                       <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>