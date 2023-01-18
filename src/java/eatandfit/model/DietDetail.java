/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package eatandfit.model;

/**
 *
 * @author Admin
 */
public class DietDetail {
	
    private double calories;
    private String id1;
    private double amount1;
    private String id2;
    private double amount2;

    public DietDetail() {

    }

    public DietDetail(double calories, String id1, double amount1, String id2, double amount2) {
            this.calories = calories;
            this.id1 = id1;
            this.amount1 = amount1;
            this.id2 = id2;
            this.amount2 = amount2;
    }

    public double getCalories() {
            return calories;
    }

    public void setCalories(double calories) {
            this.calories = calories;
    }

    public String getid1() {
            return id1;
    }

    public void setid1(String id1) {
            this.id1 = id1;
    }

    public double getAmount1() {
            return amount1;
    }

    public void setAmount1(double amount1) {
            this.amount1 = amount1;
    }

    public String getid2() {
            return id2;
    }

    public void setid2(String id2) {
            this.id2 = id2;
    }

    public double getAmount2() {
            return amount2;
    }

    public void setAmount2(double amount2) {
            this.amount2 = amount2;
    }
}