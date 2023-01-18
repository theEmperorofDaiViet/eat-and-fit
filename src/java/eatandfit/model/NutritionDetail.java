/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package eatandfit.model;

/**
 *
 * @author Admin
 */
public class NutritionDetail {

    private double calories;
    private double carbs;
    private double fat;
    private double protein;

    public NutritionDetail() {

    }

    public NutritionDetail(double calories, double carbs, double fat, double protein) {
        this.calories = calories;
        this.carbs = carbs;
        this.fat = fat;
        this.protein = protein;
    }

    public double getCalories() {
        return calories;
    }

    public void setCalories(double calories) {
        this.calories = calories;
    }

    public double getCarbs() {
        return carbs;
    }

    public void setCarbs(double carbs) {
        this.carbs = carbs;
    }

    public double getFat() {
        return fat;
    }

    public void setFat(double fat) {
        this.fat = fat;
    }

    public double getProtein() {
        return protein;
    }

    public void setProtein(double protein) {
        this.protein = protein;
    }

    public String getCarbsPer() {
        double n = this.carbs * 4 / (this.carbs * 4 + this.fat * 9 + this.protein * 4)*100;
        return String.format("%,.2f", n);
    }

    public String getFatPer() {
        double n = this.fat * 9 / (this.carbs * 4 + this.fat * 9 + this.protein * 4)*100;
        return String.format("%,.2f", n);
    }

    public String getProteinPer() {
        double n = this.protein * 4 / (this.carbs * 4 + this.fat * 9 + this.protein * 4)*100;
        return String.format("%,.2f", n);
    }
}