<%-- 
    Document   : plan
    Created on : Jan 19, 2023, 1:49:02 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="eatandfit.model.Exercise"%>
<%@page import="eatandfit.model.Gym"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <div class="containers">
                <div class="title-plan" style="position: relative;">
                    <div style="display: inline">
                        <img src="/eat-and-fit/images/logo.png" style="width:128px"></div>
                    <div style="display: inline; padding-left: 2rem">                        
                        <h1 style="font-family: sans-serif; font-size: 50px; font-weight: bold; margin-block-start: 0.5em; margin-block-end: 0em;">Eat & Fit</h1>
                        <i style="font-family: sans-serif; font-size: 22px; margin-block-start: 0em; margin-block-end: 0em;">Hướng dẫn giảm cân</i>
                    </div>
                </div>

                <div style="padding-left: 100px; padding-right: 100px">
                    <h2 style="margin-block-start: 1em;">I. Chế độ ăn:</h2>
                    <p style="padding-left: 25.5px; padding-right: 25.5px; font-size: 22px"><b>Cacbohydrate</b> hay <b><i>carbs</i></b> (bao gồm <i>đường, tinh bột, chất xơ</i>) là nguồn năng lượng chính của cơ thể người.
                        Để giảm cân lành mạnh, bạn nên kết hợp duy trì chế độ ăn giảm carb mỗi ngày.</p>

                    <p style="padding-left: 25.5px; padding-right: 25.5px; font-size: 22px">Chế độ ăn mỗi tuần sẽ bao gồm 3 thực đơn cho các ngày khác nhau trong tuần:</p>
                    <ul style="padding-left: 78px;">
                        <li style="font-size: 20px; list-style-type: disc; padding-bottom: 10px;"><b>Ít Carb</b> (chiếm dưới <b>26%</b> tổng lượng calo nạp vào cơ thể): <b>3</b> ngày/tuần</li>
                        <li style="font-size: 20px; list-style-type: disc; padding-bottom: 10px;"><b>Vừa phải</b> (chiếm từ <b>26%</b> đến <b>45%</b> tổng lượng calo nạp vào cơ thể): <b>3</b> ngày/tuần</li>
                        <li style="font-size: 20px; list-style-type: disc; padding-bottom: 10px;"><b>Nhiều Carb</b> (chiếm trên <b>45%</b> tổng lượng calo nạp vào cơ thể): <b>1</b> ngày/tuần</li>
                    </ul>
                </div>
                <div class="row">
                    <div class="col-sm-4 mb-3 mb-sm-0">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title" style="text-align:center; font-weight: bold; font-size: 24px; padding-bottom: 0.5rem;">Ít Carb</h5>
                                <table style="width:100%">
                                    <tr>
                                        <th style="font-size:20px;">Nutrition</th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b>Calories:</b>
                                            <text style="float:right">${String.format("%.0f", lowCarbNutritionDetail.calories)} cal</text><br/>
                                            <b>Carbs:</b>
                                            <text style="float:right">${lowCarbNutritionDetail.carbs} g</text><br/>
                                            <b>Fat:</b>
                                            <text style="float:right">${lowCarbNutritionDetail.fat} g</text><br/>
                                            <b>Protein:</b>
                                            <text style="float:right">${lowCarbNutritionDetail.protein} g</text><br/>
                                        </td>
                                    </tr>
                                 </table>
                                <div id="lowCarbChart" style="width: 100%; height: 260px"></div>
                                <script>
                                    var lowCarbData = [
                                                        {x: "Protein", value: ${lowCarbNutritionDetail.protein * 4}},
                                                        {x: "Fat", value: ${lowCarbNutritionDetail.fat * 9}},
                                                        {x: "Carbs", value: ${lowCarbNutritionDetail.carbs * 4}, exploded: true}                                  
                                                      ];
                                    var lowCarbChart = anychart.pie();
                                    lowCarbChart.title("Percent Calories From:");
                                    lowCarbChart.data(lowCarbData);
                                    lowCarbChart.explode("9%");
                                    
                                    var lowCarbPalette = anychart.palettes.distinctColors();
                                    lowCarbPalette.items(['#D35454', '#38BC56' ,'#F7D300']);
                                    lowCarbChart.palette(lowCarbPalette);
                                    
                                    lowCarbChart.startAngle(0);
                                    lowCarbChart.stroke("#000000", 3);
                                    
                                    lowCarbChart.top('0%');
                                    
//                                    lowCarbChart.labels().position("outside");
//                                    lowCarbChart.connectorStroke({color: "#595959", thickness: 2, dash:"2 2"});   
                                    
                                    lowCarbChart.container('lowCarbChart');
                                    lowCarbChart.draw();                                                                       
                                </script>
                                <div class="total-meal">
                                </div>
                                <div class="Breakfast">
                                    <h4 class="Breakfast-title">Bữa sáng</h4>
                                    <div class="total-calo">${lowCarbBreakfastDetail.calories} calories</div>
                                    <div class="meal">
                                        <div class="dish-img"><img src="images/dishes/${lowCarbBreakfastDetail.id1}.jpg" style="height: 50px;width: 50px" alt="alt"/></div>
                                        <div class="dish-name"><a href="plan/dish?id=${lowCarbBreakfastDetail.id1}">${lowCarbBreakfast1.name}</a>   </div>
                                        <div class="dish-amount">${lowCarbBreakfastDetail.amount1} suất</div>
                                    </div>
                                    <div class="meal">
                                        <div class="dish-img"><img src="images/dishes/${lowCarbBreakfastDetail.id2}.jpg" style="height: 50px;width: 50px" alt="alt"/></div>
                                        <div class="dish-name"><a href="plan/dish?id=${lowCarbBreakfastDetail.id2}">${lowCarbBreakfast2.name}</a></div>
                                        <div class="dish-amount">${lowCarbBreakfastDetail.amount2} suất</div>
                                    </div>
                                </div>
                                <div class="Lunch">
                                    <h4 class="Lunch-title">Bữa trưa</h4>
                                    <div class="total-calo">${lowCarbLunchDetail.calories} calories</div>
                                    <div class="meal">
                                        <div class="dish-img"><img src="images/dishes/${lowCarbLunchDetail.id1}.jpg" style="height: 50px;width: 50px" alt="alt"/></div>
                                        <div class="dish-name"><a href="plan/dish?id=${lowCarbLunchDetail.id1}"> ${lowCarbLunch1.name}</a></div>
                                        <div class="dish-amount">${lowCarbLunchDetail.amount1} suất</div>
                                    </div>
                                    <div class="meal">
                                        <div class="dish-img"><img src="images/dishes/${lowCarbLunchDetail.id2}.jpg" style="height: 50px;width: 50px" alt="alt"/></div>
                                        <div class="dish-name"><a href="plan/dish?id=${lowCarbLunchDetail.id2}"> ${lowCarbLunch2.name}</a></div>
                                        <div class="dish-amount">${lowCarbLunchDetail.amount2} suất</div>
                                    </div>
                                </div>
                                <div class="Dinner">
                                    <h4 class="Dinner-title">Bữa tối</h4>
                                    <div class="total-calo">${lowCarbDinnerDetail.calories} calories</div>
                                    <div class="meal">
                                        <div class="dish-img"><img src="images/dishes/${lowCarbDinnerDetail.id1}.jpg" style="height: 50px;width: 50px" alt="alt"/></div>
                                        <div class="dish-name" >  <a href="plan/dish?id=${lowCarbDinnerDetail.id1}">${lowCarbDinner1.name}</a></div>
                                        <div class="dish-amount">${lowCarbDinnerDetail.amount1} suất</div>
                                    </div>
                                    <div class="meal">
                                        <div class="dish-img"><img src="images/dishes/${lowCarbDinnerDetail.id2}.jpg" style="height: 50px;width: 50px" alt="alt"/></div>
                                        <div class="dish-name"><a href="plan/dish?id=${lowCarbDinnerDetail.id2}"> ${lowCarbDinner2.name}</a></div>
                                        <div class="dish-amount">${lowCarbDinnerDetail.amount2} suất</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title" style="text-align:center; font-weight: bold; font-size: 24px; padding-bottom: 0.5rem;">Vừa phải</h5>
                                <table style="width:100%">
                                    <tr>
                                        <th style="font-size:20px;">Nutrition</th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b>Calories:</b>
                                            <text style="float:right">${String.format("%.0f", moderateCarbNutritionDetail.calories)} cal</text><br/>
                                            <b>Carbs:</b>
                                            <text style="float:right">${moderateCarbNutritionDetail.carbs} g</text><br/>
                                            <b>Fat:</b>
                                            <text style="float:right">${moderateCarbNutritionDetail.fat} g</text><br/>
                                            <b>Protein:</b>
                                            <text style="float:right">${moderateCarbNutritionDetail.protein} g</text><br/>
                                        </td>
                                    </tr>
                                 </table>                                
                                <div id="moderateCarbChart" style="width: 100%; height: 260px"></div>
                                <script>
                                    var moderateCarbData = [
                                                        {x: "Protein", value: ${moderateCarbNutritionDetail.protein * 4}},
                                                        {x: "Fat", value: ${moderateCarbNutritionDetail.fat * 9}},
                                                        {x: "Carbs", value: ${moderateCarbNutritionDetail.carbs * 4}, exploded: true}                                  
                                                      ];                                                                              
                                    var moderateCarbChart = anychart.pie();
                                    moderateCarbChart.title("Percent Calories From:");
                                    moderateCarbChart.data(moderateCarbData);
                                    moderateCarbChart.explode("9%");
                                    var moderateCarbPalette = anychart.palettes.distinctColors();
                                    moderateCarbPalette.items(['#D35454', '#38BC56' ,'#F7D300']);
                                    moderateCarbChart.palette(moderateCarbPalette);
                                    
                                    moderateCarbChart.startAngle(0);
                                    moderateCarbChart.stroke("#000000", 3);
                                    
                                    moderateCarbChart.top('0%');
                                    
//                                    moderateCarbChart.labels().position("outside");
//                                    moderateCarbChart.connectorStroke({color: "#595959", thickness: 2, dash:"2 2"});                                                                     
                                        
                                    moderateCarbChart.container('moderateCarbChart');
                                    moderateCarbChart.draw();
                                </script>                                
                                <div class="total-meal">
                                </div>
                                <div class="Breakfast">
                                    <h4 class="Breakfast-title">Bữa sáng</h4>
                                    <div class="total-calo">${moderateCarbBreakfastDetail.calories} calories</div>
                                    <div class="meal">
                                        <div class="dish-img"><img src="images/dishes/${moderateCarbBreakfastDetail.id1}.jpg" style="height: 50px;width: 50px" alt="alt"/></div>
                                        <div class="dish-name"><a href="plan/dish?id=${moderateCarbBreakfastDetail.id1}"> ${moderateCarbBreakfast1.name}</a></div>
                                        <div class="dish-amount">${moderateCarbBreakfastDetail.amount1} suất</div>
                                    </div>
                                    <div class="meal">
                                        <div class="dish-img"><img src="images/dishes/${moderateCarbBreakfastDetail.id2}.jpg" style="height: 50px;width: 50px" alt="alt"/></div>
                                        <div class="dish-name"> <a href="plan/dish?id=${moderateCarbBreakfastDetail.id2}"> ${moderateCarbBreakfast2.name}</a></div>
                                        <div class="dish-amount">${moderateCarbBreakfastDetail.amount2} suất</div>
                                    </div>
                                </div>
                                <div class="Lunch">
                                    <h4 class="Lunch-title">Bữa trưa</h4>
                                    <div class="total-calo">${moderateCarbLunchDetail.calories} calories</div>
                                    <div class="meal">
                                        <div class="dish-img"><img src="images/dishes/${moderateCarbLunchDetail.id1}.jpg" style="height: 50px;width: 50px" alt="alt"/></div>
                                        <div class="dish-name"> <a href="plan/dish?id=${moderateCarbLunchDetail.id1}"> ${moderateCarbLunch1.name}</a></div>
                                        <div class="dish-amount">${moderateCarbLunchDetail.amount1} suất</div>
                                    </div>
                                    <div class="meal">
                                        <div class="dish-img"><img src="images/dishes/${moderateCarbLunchDetail.id2}.jpg" style="height: 50px;width: 50px" alt="alt"/></div>
                                        <div class="dish-name"><a href="plan/dish?id=${moderateCarbLunchDetail.id2}"> ${moderateCarbLunch2.name}</a></div>
                                        <div class="dish-amount">${moderateCarbLunchDetail.amount2} suất</div>
                                    </div>
                                </div>
                                <div class="Dinner">
                                    <h4 class="Dinner-title">Bữa tối</h4>
                                    <div class="total-calo">${moderateCarbDinnerDetail.calories} calories</div>
                                    <div class="meal">
                                        <div class="dish-img"><img src="images/dishes/${moderateCarbDinnerDetail.id1}.jpg" style="height: 50px;width: 50px" alt="alt"/></div>
                                        <div class="dish-name">    <a href="plan/dish?id=${moderateCarbDinnerDetail.id1}"> ${moderateCarbDinner1.name}</a></div>
                                        <div class="dish-amount">${moderateCarbDinnerDetail.amount1} suất</div>
                                    </div>
                                    <div class="meal">
                                        <div class="dish-img"><img src="images/dishes/${moderateCarbDinnerDetail.id2}.jpg" style="height: 50px;width: 50px" alt="alt"/></div>
                                        <div class="dish-name"> <a href="plan/dish?id=${moderateCarbDinnerDetail.id2}"> ${moderateCarbDinner2.name}</a></div>
                                        <div class="dish-amount">${moderateCarbDinnerDetail.amount2} suất</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title" style="text-align:center; font-weight: bold; font-size: 24px; padding-bottom: 0.5rem;">Nhiều Carb</h5>
                                <table style="width:100%">
                                    <tr>
                                        <th style="font-size:20px;">Nutrition</th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <b>Calories:</b>
                                            <text style="float:right">${String.format("%.0f", highCarbNutritionDetail.calories)} cal</text><br/>
                                            <b>Carbs:</b>
                                            <text style="float:right">${highCarbNutritionDetail.carbs} g</text><br/>
                                            <b>Fat:</b>
                                            <text style="float:right">${highCarbNutritionDetail.fat} g</text><br/>
                                            <b>Protein:</b>
                                            <text style="float:right">${highCarbNutritionDetail.protein} g</text><br/>
                                        </td>
                                    </tr>
                                 </table>
                                <div id="highCarbChart" style="width: 100%; height: 260px"></div>
                                <script>
                                    var highCarbData = [
                                                        {x: "Protein", value: ${highCarbNutritionDetail.protein * 4}},
                                                        {x: "Fat", value: ${highCarbNutritionDetail.fat * 9}},
                                                        {x: "Carbs", value: ${highCarbNutritionDetail.carbs * 4}, exploded: true}                                  
                                                      ];                                                                              
                                    var highCarbChart = anychart.pie();
                                    highCarbChart.title("Percent Calories From:");
                                    highCarbChart.data(highCarbData);
                                    highCarbChart.explode("9%");
                                    var highCarbPalette = anychart.palettes.distinctColors();
                                    highCarbPalette.items(['#D35454', '#38BC56' ,'#F7D300']);
                                    highCarbChart.palette(highCarbPalette);
                                    
                                    highCarbChart.startAngle(0);
                                    highCarbChart.stroke("#000000", 3);
                                    
                                    highCarbChart.top('0%');
                                    
//                                    highCarbChart.labels().position("outside");
//                                    highCarbChart.connectorStroke({color: "#595959", thickness: 2, dash:"2 2"});                                                                     
                                        
                                    highCarbChart.container('highCarbChart');
                                    highCarbChart.draw();
                                </script>                                         
                                <div class="total-meal">
                                </div>
                                <div class="Breakfast">
                                    <h4 class="Breakfast-title">Bữa sáng</h4>
                                    <div class="total-calo">${highCarbBreakfastDetail.calories} calories</div>
                                    <div class="meal">
                                        <div class="dish-img"><img src="images/dishes/${highCarbBreakfastDetail.id1}.jpg" style="height: 50px;width: 50px" alt="alt"/></div>
                                        <div class="dish-name"><a href="plan/dish?id=${highCarbBreakfastDetail.id1}">${highCarbBreakfast1.name}</a></div>
                                        <div class="dish-amount">${highCarbBreakfastDetail.amount1} suất</div>
                                    </div>
                                    <div class="meal">
                                        <div class="dish-img"><img src="images/dishes/${highCarbBreakfastDetail.id2}.jpg" style="height: 50px;width: 50px" alt="alt"/></div>
                                        <div class="dish-name"><a href="plan/dish?id=${highCarbBreakfastDetail.id2}">${highCarbBreakfast2.name}</a></div>
                                        <div class="dish-amount">${highCarbBreakfastDetail.amount2} suất</div>
                                    </div>
                                </div>
                                <div class="Lunch">
                                    <h4 class="Lunch-title">Bữa trưa</h4>
                                    <div class="total-calo">${highCarbLunchDetail.calories} calories</div>
                                    <div class="meal">
                                        <div class="dish-img"><img src="images/dishes/${highCarbLunchDetail.id1}.jpg" style="height: 50px;width: 50px" alt="alt"/></div>
                                        <div class="dish-name"><a href="plan/dish?id=${highCarbLunchDetail.id1}">${highCarbLunch1.name}</a></div>
                                        <div class="dish-amount">${highCarbLunchDetail.amount1} suất</div>
                                    </div>
                                    <div class="meal">
                                        <div class="dish-img"><img src="images/dishes/${highCarbLunchDetail.id2}.jpg" style="height: 50px;width: 50px" alt="alt"/></div>
                                        <div class="dish-name"><a href="plan/dish?id=${highCarbLunchDetail.id2}">${highCarbLunch2.name}</a></div>
                                        <div class="dish-amount">${highCarbLunchDetail.amount2} suất</div>
                                    </div>
                                </div>
                                <div class="Dinner">
                                    <h4 class="Dinner-title">Bữa tối</h4>
                                    <div class="total-calo">${highCarbDinnerDetail.calories} calories</div>
                                    <div class="meal">
                                        <div class="dish-img"><img src="images/dishes/${highCarbDinnerDetail.id1}.jpg" style="height: 50px;width: 50px" alt="alt"/></div>
                                        <div class="dish-name"><a href="plan/dish?id=${highCarbDinnerDetail.id1}">${highCarbDinner1.name}</a></div>
                                        <div class="dish-amount">${highCarbDinnerDetail.amount1} suất</div>
                                    </div>
                                    <div class="meal">
                                        <div class="dish-img"><img src="images/dishes/${highCarbDinnerDetail.id2}.jpg" style="height: 50px;width: 50px" alt="alt"/></div>
                                        <div class="dish-name"><a href="plan/dish?id=${highCarbDinnerDetail.id2}">${highCarbDinner2.name}</a></div>
                                        <div class="dish-amount">${highCarbDinnerDetail.amount2} suất</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="padding-left: 100px; padding-right: 100px">
                    <p style="padding-left: 25.5px; padding-right: 25.5px; font-size: 22px">Bạn có thể sắp xếp thứ tự những ngày ăn này tuỳ ý. Nên
                        dành ngày ăn nhiều Carbohydrate cho những dịp đặc biệt như
                        những bữa tiệc với bạn bè, người thân để có thể ăn uống thoải
                        mái hơn.</p>
                </div>                    
                <h2 style="padding-left: 90px; padding-right: 90px;">II. Chế độ Tập luyện:</h2>
                <div style="padding-left: 90px; padding-right: 90px;">
                    <h3 style="padding-left: 35.5px; padding-right: 35.5px;">1. Cardio:</h3>
                    <p style="padding-left: 62px; padding-right: 62px; font-size: 20px">Bạn nên chọn những bài tập Cardio khiến tim đập nhanh hơn, có thể là tập trên máy
                        chạy bộ, máy tập hình elip, đạp xe, bơi lội, Squat Jump, Mountain
                        Climbers, Burpee, …</p>
                    <p style="padding-left: 62px; padding-right: 62px; font-size: 20px">Cường độ tập luyện theo tình trạng của bạn là: mỗi tuần tập ${cardio.sessions} sessions, mỗi session dài lần lượt ${cardio.time}.</p>
                </div>
                <div style="padding-left: 90px; padding-right: 90px;">
                    <h3 style="padding-left: 35.5px; padding-right: 35.5px;">2. Gym:</h3>
                    <p style="padding-left: 62px; padding-right: 62px; font-size: 20px">Trong tuần, bạn nên tập xen kẽ các bài tập cho thân trên (upper) và thân dưới (lower). Ví dụ như:</p>
                    <ul style="padding-left: 135px; padding-right: 135px;">
                        <li style="list-style-type: disc; padding-bottom: 10px; font-size: 20px"><b>Thứ hai:</b> Upper</li>
                        <li style="list-style-type: disc; padding-bottom: 10px; font-size: 20px"><b>Thứ ba:</b> Lower</li>
                        <li style="list-style-type: disc; padding-bottom: 10px; font-size: 20px"><b>Thứ tư:</b> <i>nghỉ</i></li>
                        <li style="list-style-type: disc; padding-bottom: 10px; font-size: 20px"><b>Thứ năm:</b> Upper</li>
                        <li style="list-style-type: disc; padding-bottom: 10px; font-size: 20px"><b>Thứ sáu:</b> Lower</li>
                        <li style="list-style-type: disc; padding-bottom: 10px; font-size: 20px"><b>Thứ bảy:</b> <i>nghỉ</i></li>
                        <li style="list-style-type: disc; padding-bottom: 10px; font-size: 20px"><b>Chủ nhật:</b> <i>nghỉ</i></li>
                    </ul>
                    <p style="padding-left: 62px; padding-right: 62px; font-size: 20px">Một số bài tập thân dưới và thân trên được đề xuất:</p>
                </div>                
                <div class="row" style="padding-left: 152px; ">
                    <div class="col-sm-6 mb-3 mb-sm-0">
                        <h4 style="text-align: center; padding-bottom: 10px">Bài tập cho thân dưới</h4>
                        <table style="width: 95%;">
                            <tr>
                                <th>&nbsp;Bài tập</th>
                                <th>Sets</th>
                                <th>Reps</th>
                            </tr>
                            <c:forEach items="${lowerGyms}" var="gym">
                                <tr>
                                    <td class="width60"><div class="dish-name"><a href="plan/exercise?id=${lowerExercises.get(Integer.parseInt(gym.exercise)-1).id}">${lowerExercises.get(Integer.parseInt(gym.exercise)-1).name}</a></div></td>
                                    <td class="width60">${gym.sets}</td>
                                    <td class="width60">${gym.reps}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                    <div class="col-sm-6">
                        <h4 style="text-align: center; padding-bottom: 10px">Bài tập cho thân trên</h4>
                        <table style="width: 95%;">
                            <tr>
                                <th>&nbsp;Bài tập</th>
                                <th>Sets</th>
                                <th>Reps</th>
                            </tr>
                            <c:forEach items="${upperGyms}" var="gym">
                                <tr>
                                    <td class="width60"><div class="dish-name"><a href="plan/exercise?id=${upperExercises.get(Integer.parseInt(gym.exercise)-7).id}">${upperExercises.get(Integer.parseInt(gym.exercise)-7).name}</a></div></td>
                                    <td class="width60">${gym.sets}</td>
                                    <td class="width60">${gym.reps}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>