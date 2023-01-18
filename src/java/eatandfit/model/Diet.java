/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package eatandfit.model;

/**
 *
 * @author Admin
 */
public class Diet {
	
    private double calories;
    private String nutrition;
    private String breakfast;
    private String lunch;
    private String dinner;

    public Diet() {		

    }

    public Diet(double calories, String nutrition, String breakfast, String lunch, String dinner) {
            this.calories = calories;
            this.nutrition = nutrition;
            this.breakfast = breakfast;
            this.lunch = lunch;
            this.dinner = dinner;
    }

    public double getCalories() {
            return calories;
    }
    public void setCalories(double calories) {
            this.calories = calories;
    }
    public String getNutrition() {
            return nutrition;
    }
    public void setNutrition(String nutrition) {
            this.nutrition = nutrition;
    }
    public String getBreakfast() {
            return breakfast;
    }
    public void setBreakfast(String breakfast) {
            this.breakfast = breakfast;
    }
    public String getLunch() {
            return lunch;
    }
    public void setLunch(String lunch) {
            this.lunch = lunch;
    }
    public String getDinner() {
            return dinner;
    }
    public void setDinner(String dinner) {
            this.dinner = dinner;
    }

    public NutritionDetail getNutritionDetail() {
            String[] tmp = this.nutrition.split(";");
            return new NutritionDetail(Double.parseDouble(tmp[0]),
                                        Double.parseDouble(tmp[1]), 
                                        Double.parseDouble(tmp[2]), 
                                        Double.parseDouble(tmp[3]));
    }

    public DietDetail getBreakfastDetail() {
            String[] tmp = this.breakfast.split(":");
            double calories = Double.parseDouble(tmp[0]);
            String[] temp = tmp[1].split(";");
            String id1 = temp[0].split("x")[0];
            double amount1 = Double.parseDouble(temp[0].split("x")[1]);
            String id2 = temp[1].split("x")[0];
            double amount2 = Double.parseDouble(temp[1].split("x")[1]);	
            return new DietDetail(calories, id1, amount1, id2, amount2);
    }

    public DietDetail getLunchDetail() {
            String[] tmp = this.lunch.split(":");
            double calories = Double.parseDouble(tmp[0]);
            String[] temp = tmp[1].split(";");
            String id1 = temp[0].split("x")[0];
            double amount1 = Double.parseDouble(temp[0].split("x")[1]);
            String id2 = temp[1].split("x")[0];
            double amount2 = Double.parseDouble(temp[1].split("x")[1]);	
            return new DietDetail(calories, id1, amount1, id2, amount2);
    }

    public DietDetail getDinnerDetail() {
            String[] tmp = this.dinner.split(":");
            double calories = Double.parseDouble(tmp[0]);
            String[] temp = tmp[1].split(";");
            String id1 = temp[0].split("x")[0];
            double amount1 = Double.parseDouble(temp[0].split("x")[1]);
            String id2 = temp[1].split("x")[0];
            double amount2 = Double.parseDouble(temp[1].split("x")[1]);	
            return new DietDetail(calories, id1, amount1, id2, amount2);
    }
}