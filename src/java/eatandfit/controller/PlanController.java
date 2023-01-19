/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package eatandfit.controller;

import eatandfit.dao.*;
import eatandfit.model.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class PlanController extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "";
        String requestURI = request.getRequestURI();
        
        if(requestURI.endsWith("/dish")){
            String id = request.getParameter("id");
            
            DishDAO dishDao = new DishDAO();
            Dish dish = dishDao.getDishByID(Integer.parseInt(id));
            NutritionDetail nutritionDetail = dish.getNutritionDetail();
            RecipeDetail recipeDetail = dish.getRecipeDetail();
            StepsDetail stepsDetail = dish.getStepsDetail();
            
            request.setAttribute("dish", dish);
            request.setAttribute("recipeDetail", recipeDetail);
            request.setAttribute("stepsDetail", stepsDetail);
            request.setAttribute("nutrionDetail", nutritionDetail);
            url = "/dish.jsp";
        }
        
        if(requestURI.endsWith("/exercise")){
            String id = request.getParameter("id");
            
            GymDAO gymDAO = new GymDAO();
            Exercise exercise = gymDAO.getExercisebyId(id);
            List<String> overview = exercise.getOverviewParagraph();
            List<String> introductions = exercise.getIntroductionsDetail();
            
            request.setAttribute("exercise", exercise);
            request.setAttribute("overview", overview);
            request.setAttribute("introductions", introductions);
            url = "/exercise.jsp";
        }
        
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int sex = Integer.parseInt(request.getParameter("sex"));
        int body = Integer.parseInt(request.getParameter("body"));
        int stage = Integer.parseInt(request.getParameter("stage"));
        
        // Get standard calories each day for the user based on input information
        StandardCaloriesDAO standardCaloriesDAO = new StandardCaloriesDAO();
        StandardCalories sc = standardCaloriesDAO.getStandardCalories(stage, body, sex);
        
        // Get low carb diet based on standard calories above
        DietDAO dietDAO = new DietDAO();
        Diet lowCarbDiet = dietDAO.getLowCarbDiet(sc.getLowCarb());
        
            // Get detail of the low carb diet above: nutritions; breakfast, lunch and dinner
        NutritionDetail lowCarbNutritionDetail = lowCarbDiet.getNutritionDetail();
        DietDetail lowCarbBreakfastDetail = lowCarbDiet.getBreakfastDetail();
        DietDetail lowCarbLunchDetail = lowCarbDiet.getLunchDetail();
        DietDetail lowCarbDinnerDetail = lowCarbDiet.getDinnerDetail();
        
        request.setAttribute("lowCarbNutritionDetail", lowCarbNutritionDetail);
        request.setAttribute("lowCarbBreakfastDetail", lowCarbBreakfastDetail);
        request.setAttribute("lowCarbLunchDetail", lowCarbLunchDetail);
        request.setAttribute("lowCarbDinnerDetail", lowCarbDinnerDetail);
        
            // Get dishes of each meal above
        DishDAO dishDAO = new DishDAO();
        Dish lowCarbBreakfast1 = dishDAO.getDishByID(Integer.parseInt(lowCarbBreakfastDetail.getid1()));
        Dish lowCarbBreakfast2 = dishDAO.getDishByID(Integer.parseInt(lowCarbBreakfastDetail.getid2()));
        Dish lowCarbLunch1 = dishDAO.getDishByID(Integer.parseInt(lowCarbLunchDetail.getid1()));
        Dish lowCarbLunch2 = dishDAO.getDishByID(Integer.parseInt(lowCarbLunchDetail.getid2()));
        Dish lowCarbDinner1 = dishDAO.getDishByID(Integer.parseInt(lowCarbDinnerDetail.getid1()));
        Dish lowCarbDinner2 = dishDAO.getDishByID(Integer.parseInt(lowCarbDinnerDetail.getid2()));
        
        request.setAttribute("lowCarbBreakfast1", lowCarbBreakfast1);
        request.setAttribute("lowCarbBreakfast2", lowCarbBreakfast2);
        request.setAttribute("lowCarbLunch1", lowCarbLunch1);
        request.setAttribute("lowCarbLunch2", lowCarbLunch2);
        request.setAttribute("lowCarbDinner1", lowCarbDinner1);
        request.setAttribute("lowCarbDinner2", lowCarbDinner2);
        
        // Get moderate carb diet based on standard calories above
        Diet moderateCarbDiet = dietDAO.getModerateCarbDiet(sc.getModerateCarb());
        
            // Get detail of the moderate carb diet above: nutritions; breakfast, lunch and dinner
        NutritionDetail moderateCarbNutritionDetail = moderateCarbDiet.getNutritionDetail();
        DietDetail moderateCarbBreakfastDetail = moderateCarbDiet.getBreakfastDetail();
        DietDetail moderateCarbLunchDetail = moderateCarbDiet.getLunchDetail();
        DietDetail moderateCarbDinnerDetail = moderateCarbDiet.getDinnerDetail();
        
        request.setAttribute("moderateCarbNutritionDetail", moderateCarbNutritionDetail);
        request.setAttribute("moderateCarbBreakfastDetail", moderateCarbBreakfastDetail);
        request.setAttribute("moderateCarbLunchDetail", moderateCarbLunchDetail);
        request.setAttribute("moderateCarbDinnerDetail", moderateCarbDinnerDetail);
        
            // Get dishes of each meal above
        Dish moderateCarbBreakfast1 = dishDAO.getDishByID(Integer.parseInt(moderateCarbBreakfastDetail.getid1()));
        Dish moderateCarbBreakfast2 = dishDAO.getDishByID(Integer.parseInt(moderateCarbBreakfastDetail.getid2()));
        Dish moderateCarbLunch1 = dishDAO.getDishByID(Integer.parseInt(moderateCarbLunchDetail.getid1()));
        Dish moderateCarbLunch2 = dishDAO.getDishByID(Integer.parseInt(moderateCarbLunchDetail.getid2()));
        Dish moderateCarbDinner1 = dishDAO.getDishByID(Integer.parseInt(moderateCarbDinnerDetail.getid1()));
        Dish moderateCarbDinner2 = dishDAO.getDishByID(Integer.parseInt(moderateCarbDinnerDetail.getid2()));
        
        request.setAttribute("moderateCarbBreakfast1", moderateCarbBreakfast1);
        request.setAttribute("moderateCarbBreakfast2", moderateCarbBreakfast2);
        request.setAttribute("moderateCarbLunch1", moderateCarbLunch1);
        request.setAttribute("moderateCarbLunch2", moderateCarbLunch2);
        request.setAttribute("moderateCarbDinner1", moderateCarbDinner1);
        request.setAttribute("moderateCarbDinner2", moderateCarbDinner2);
        
        // Get high carb diet based on standard calories above
        Diet highCarbDiet = dietDAO.getHighCarbDiet(sc.getHighCarb());
        
            // Get detail of the high carb diet above: nutritions; breakfast, lunch and dinner
        NutritionDetail highCarbNutritionDetail = highCarbDiet.getNutritionDetail();
        DietDetail highCarbBreakfastDetail = highCarbDiet.getBreakfastDetail();
        DietDetail highCarbLunchDetail = highCarbDiet.getLunchDetail();
        DietDetail highCarbDinnerDetail = highCarbDiet.getDinnerDetail();
        
        request.setAttribute("highCarbNutritionDetail", highCarbNutritionDetail);
        request.setAttribute("highCarbBreakfastDetail", highCarbBreakfastDetail);
        request.setAttribute("highCarbLunchDetail", highCarbLunchDetail);
        request.setAttribute("highCarbDinnerDetail", highCarbDinnerDetail);
        
            // Get dishes of each meal above
        Dish highCarbBreakfast1 = dishDAO.getDishByID(Integer.parseInt(highCarbBreakfastDetail.getid1()));
        Dish highCarbBreakfast2 = dishDAO.getDishByID(Integer.parseInt(highCarbBreakfastDetail.getid2()));
        Dish highCarbLunch1 = dishDAO.getDishByID(Integer.parseInt(highCarbLunchDetail.getid1()));
        Dish highCarbLunch2 = dishDAO.getDishByID(Integer.parseInt(highCarbLunchDetail.getid2()));
        Dish highCarbDinner1 = dishDAO.getDishByID(Integer.parseInt(highCarbDinnerDetail.getid1()));
        Dish highCarbDinner2 = dishDAO.getDishByID(Integer.parseInt(highCarbDinnerDetail.getid2()));
        
        request.setAttribute("highCarbBreakfast1", highCarbBreakfast1);
        request.setAttribute("highCarbBreakfast2", highCarbBreakfast2);
        request.setAttribute("highCarbLunch1", highCarbLunch1);
        request.setAttribute("highCarbLunch2", highCarbLunch2);
        request.setAttribute("highCarbDinner1", highCarbDinner1);
        request.setAttribute("highCarbDinner2", highCarbDinner2);
        
        // Get cardio workout plan for the user based on input information
        CardioDAO cardioDAO = new CardioDAO();
        Cardio cardio = cardioDAO.getCardio(stage, body, sex);
        request.setAttribute("cardio", cardio);
        
        // Get gym workout plan including lower and upper workout
        GymDAO gymDAO = new GymDAO();
            // lower
        ArrayList<Gym> lowerGyms = gymDAO.getLowerGyms();
        ArrayList<Exercise> lowerExercises = new ArrayList<>();
        for(Gym lg: lowerGyms){
            lowerExercises.add(gymDAO.getExercisebyId(lg.getExercise()));
        }
        request.setAttribute("lowerGyms", lowerGyms);
        request.setAttribute("lowerExercises", lowerExercises);
            // upper
        ArrayList<Gym> upperGyms = gymDAO.getUpperGyms();
        ArrayList<Exercise> upperExercises = new ArrayList<>();
        for(Gym ug: upperGyms){
            upperExercises.add(gymDAO.getExercisebyId(ug.getExercise()));
        }
        request.setAttribute("upperGyms", upperGyms);
        request.setAttribute("upperExercises", upperExercises);
        
        getServletContext().getRequestDispatcher("/plan.jsp").forward(request, response);
    }
}