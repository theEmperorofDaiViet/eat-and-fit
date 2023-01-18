/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package eatandfit.model;

import java.util.LinkedHashMap;

/**
 *
 * @author Admin
 */
public class StepsDetail {

    private LinkedHashMap<String, String> steps;

    public StepsDetail() {

    }

    public StepsDetail(LinkedHashMap<String, String> steps) {
            super();
            this.steps = steps;
    }

    public LinkedHashMap<String, String> getSteps() {
            return steps;
    }

    public void setSteps(LinkedHashMap<String, String> steps) {
            this.steps = steps;
    }
}