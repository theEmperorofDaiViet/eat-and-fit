/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package eatandfit.model;

/**
 *
 * @author Admin
 */
public class Gym {
	
    private String day;
    private String exercise;
    private String sets;
    private String reps;

    public Gym() {

    }

    public Gym(String day, String exercise, String sets, String reps) {
            this.day = day;
            this.exercise = exercise;
            this.sets = sets;
            this.reps = reps;
    }

    public String getDay() {
            return day;
    }

    public void setDay(String day) {
            this.day = day;
    }

    public String getExercise() {
            return exercise;
    }

    public void setExercise(String exercise) {
            this.exercise = exercise;
    }

    public String getSets() {
            return sets;
    }

    public void setSets(String sets) {
            this.sets = sets;
    }

    public String getReps() {
            return reps;
    }

    public void setReps(String reps) {
            this.reps = reps;
    }
}