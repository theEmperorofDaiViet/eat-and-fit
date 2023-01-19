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
        <link rel="stylesheet" href="/eat-and-fit/styles/main.css"/>
        <link rel="icon" type="image/x-icon" href="/eat-and-fit/images/logo.png">      
        <title>Eat & Fit</title>
    </head>
    <body>
        <div class="roots" style="overflow: auto">
            <div class="containers">
                <div class="title-gui" style="display: flex;
                     justify-content: center;
                     position: relative;
                     width: 100%;
                     top: 30px;
                     font-size: 60px;
                     ">Eat & Fit - Hướng dẫn giảm cân</div>
                <h2>I. Chế độ ăn:</h2>
                <div style="padding-left: 20px">
                    <p style="font-size: 20px">Cacbohydrate (đường, tinh bột, chất xơ) là nguồn năng lượng chính cho cơ thể.
                        Để giảm cân lành mạnh, bạn cần kết hợp duy trì chế độ ăn giảm carb mỗi ngày</p>

                    <p style="font-size: 20px">Chế độ ăn mỗi tuần sẽ bao gồm 3 thực đơn cho các ngày khác nhau trong tuần:</p>
                    <p style="font-size: 20px"> - Thực đơn nhiều Carbohydrate (dưới 26% tổng calo): 1 ngày/tuần</p>
                    <p style="font-size: 20px"> - Thực đơn vừa phải Carbohydrate (từ 26% đến 45% tổng calo): 3 ngày/tuần</p>

                    <p style="font-size: 20px"> - Thực đơn ít Carbohydrate (trên 45% tổng calo): 3 ngày/tuần</p>
                </div>
                <div class="row">
                    <div class="col-sm-4 mb-3 mb-sm-0">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Ít Carb</h5>
                                <ul style="height: 50px;font-size: 10px">
                                    <li style="display: inline-block;font-size:15px">Calories: ${lowCarbNutritionDetail.calories} calories &nbsp;</li>
                                    <li style="display: inline-block;font-size:15px">Carbs: ${lowCarbNutritionDetail.carbs}g &nbsp;  (${lowCarbNutritionDetail.getCarbsPer()} %)</li>
                                    <li style="display: inline-block;font-size:15px">Fat: ${lowCarbNutritionDetail.fat}g   &nbsp;(${lowCarbNutritionDetail.getFatPer()} %) &nbsp;</li>
                                    <li style="display: inline-block;font-size:15px">Protein: ${lowCarbNutritionDetail.protein}g &nbsp;  (${lowCarbNutritionDetail.getProteinPer()}%)</li>
                                </ul>
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
                                <h5 class="card-title">Vừa phải</h5>
                                <ul style="height: 50px">
                                    <li style="display: inline-block;font-size:15px">Calories: ${moderateCarbNutritionDetail.calories} calories &nbsp;</li>
                                    <li style="display: inline-block;font-size:15px">Carbs: ${moderateCarbNutritionDetail.carbs}g &nbsp;  (${moderateCarbNutritionDetail.getCarbsPer()} %)</li>
                                    <li style="display: inline-block;font-size:15px">Fat: ${moderateCarbNutritionDetail.fat}g   &nbsp;(${moderateCarbNutritionDetail.getFatPer()} %) &nbsp;</li>
                                    <li style="display: inline-block;font-size:15px">Protein: ${moderateCarbNutritionDetail.protein}g &nbsp;  (${moderateCarbNutritionDetail.getProteinPer()}%)</li>
                                </ul>
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
                                <h5 class="card-title">Nhiều Carb</h5>
                                <ul style="height: 50px">
                                    <li style="display: inline-block;font-size:15px">Calories: ${highCarbNutritionDetail.calories} calories &nbsp;</li>
                                    <li style="display: inline-block;font-size:15px">Carbs: ${highCarbNutritionDetail.carbs}g &nbsp;  (${highCarbNutritionDetail.getCarbsPer()} %)</li>
                                    <li style="display: inline-block;font-size:15px">Fat: ${highCarbNutritionDetail.fat}g   &nbsp;(${highCarbNutritionDetail.getFatPer()} %) &nbsp;</li>
                                    <li style="display: inline-block;font-size:15px">Protein: ${highCarbNutritionDetail.protein}g &nbsp;  (${highCarbNutritionDetail.getProteinPer()}%)</li>
                                </ul>
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
                <div style="padding-left: 20px">
                    <p style="font-size: 20px">Bạn có thể sắp xếp thứ tự những ngày ăn này tuỳ ý. Nên
                        dành ngày ăn nhiều Carbohydrate cho những dịp đặc biệt như
                        những bữa tiệc với bạn bè, người thân để có thể ăn uống thoải
                        mái hơn.</p>
                </div>                    
                <h2>II. Chế độ Tập luyện:</h2>
                <div style="padding-left: 20px">
                    <h3>1. Cardio:</h3>
                    <p style="font-size: 20px">Bạn nên chọn những bài tập Cardio khiến tim đập nhanh hơn, có thể là tập trên máy
                        chạy bộ, máy tập hình elip, đạp xe, bơi lội, Squat Jump, Mountain
                        Climbers, Burpee, …</p>

                    <p style="font-size: 20px">Cường độ tập luyện theo tình trạng của bạn là:</p>

                    <p style="font-size: 20px"> Mỗi tuần tập ${cardio.sessions} sessions, mỗi session dài lần lượt ${cardio.time}.</p>
                </div>
                <div style="padding-left: 20px">
                    <h3>2. Gym:</h3>
                    <p style="font-size: 20px">Trong tuần, bạn nên tập xen kẽ các bài tập cho thân trên (upper) và thân dưới (lower). Ví dụ như:</p>
                    <p style="font-size: 20px">- Thứ hai: Upper</p>
                    <p style="font-size: 20px">- Thứ ba: Lower</p>
                    <p style="font-size: 20px">- Thứ tư: nghỉ</p>
                    <p style="font-size: 20px">- Thứ năm: Upper</p>
                    <p style="font-size: 20px">- Thứ sáu: Lower</p>
                    <p style="font-size: 20px">- Thứ bảy: nghỉ</p>
                    <p style="font-size: 20px">- Chủ nhật: nghỉ</p>

                    <p style="font-size: 20px">Một số bài tập thân dưới và thân trên được đề xuất:</p>
                </div>
                <div class="cardio"></div><!-- comment -->
                <div class="row" style="padding-left: 150px ">
                    <div class="col-sm-6 mb-3 mb-sm-0">
                        <h5>Thân dưới</h5>
                        <table>
                            <tr>
                                <th>Bài tập</th>
                                <th>Sets</th>
                                <th>Reps</th>
                            </tr>
                            <c:forEach items="${lowerGyms}" var="gym">
                                <tr>
                                    <th class="width60"><div class="dish-name"><a href="plan/exercise?id=${lowerExercises.get(Integer.parseInt(gym.exercise)-1).id}">${lowerExercises.get(Integer.parseInt(gym.exercise)-1).name}</a></div></th>
                                    <th class="width60">${gym.sets}</th>
                                    <th class="width60">${gym.reps}</th>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                    <div class="col-sm-6"><h5>Thân trên</h5>
                        <table>
                            <tr>
                                <th>Bài tập</th>
                                <th>Sets</th>
                                <th>Reps</th>
                            </tr>
                            <c:forEach items="${upperGyms}" var="gym">
                                <tr>
                                    <th class="width60"><div class="dish-name"><a href="plan/exercise?id=${upperExercises.get(Integer.parseInt(gym.exercise)-7).id}">${upperExercises.get(Integer.parseInt(gym.exercise)-7).name}</a></div></th>
                                    <th class="width60">${gym.sets}</th>
                                    <th class="width60">${gym.reps}</th>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>

                </div>
            </div>
        </div>

    </body>
</html>