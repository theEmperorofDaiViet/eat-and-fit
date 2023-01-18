/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package eatandfit.algorithm;

import java.util.ArrayList;
import java.util.LinkedHashMap;

/**
 *
 * @author Admin
 */
public class FuzzyLogic {
    
    private static final int[][] fuzzyRulesTable = {{1, 0, 0},
                                                    {2, 1, 1},
                                                    {4, 3, 2}};
    
    private double[][] membershipValuesTable = {{0, 0, 0},
                                                {0, 0, 0},
                                                {0, 0, 0}};
    
    private double[] fuzzifiedDecision = {0, 0, 0, 0, 0};
      
    // Fuzzy Sets and Membership Values    
    LinkedHashMap<Integer, Double> fuzzySetsAndMembershipValuesOfHeight = new LinkedHashMap<>();
    
    LinkedHashMap<Integer, Double> fuzzySetsAndMembershipValuesOfWeight = new LinkedHashMap<>();

    private int finalDecisionOnBody;
    
    public FuzzyLogic(){
        
    }
    
    public void doFuzzificationOfHeight(double height, int sex){        
        if(sex == 0){
            if(height < 160){
                fuzzySetsAndMembershipValuesOfHeight.put(0, 1.0);
            }
            else if(height >= 160 && height < 167.5){
                double p1 = (2 * height - 320) / 15;
                double p0 = 1 - p1;
                fuzzySetsAndMembershipValuesOfHeight.put(0, p0);
                fuzzySetsAndMembershipValuesOfHeight.put(1, p1);
            }
            else if(height >= 167.5 && height < 175){
                double p2 = (2 * height - 335) / 15;
                double p1 = 1 - p2;
                fuzzySetsAndMembershipValuesOfHeight.put(1, p1);
                fuzzySetsAndMembershipValuesOfHeight.put(2, p2);
            }
            else{
                fuzzySetsAndMembershipValuesOfHeight.put(2, 1.0);
            }
        }
        else{
            if(height < 150){
                fuzzySetsAndMembershipValuesOfHeight.put(0, 1.0);
            }
            else if(height >= 150 && height < 157.5){
                double p1 = (2 * height - 300) / 15;
                double p0 = 1 - p1;
                fuzzySetsAndMembershipValuesOfHeight.put(0, p0);
                fuzzySetsAndMembershipValuesOfHeight.put(1, p1);
            }
            else if(height >= 157.5 && height < 165){
                double p2 = (2 * height - 315) / 15;
                double p1 = 1 - p2;
                fuzzySetsAndMembershipValuesOfHeight.put(1, p1);
                fuzzySetsAndMembershipValuesOfHeight.put(2, p2);
            }
            else{
                fuzzySetsAndMembershipValuesOfHeight.put(2, 1.0);
            }
        }
        System.out.println("Sex: " + sex);
        System.out.println("Height: " + height);
        System.out.println("Fuzzy Sets and their Membership Values of Height:");
        for(int h: this.fuzzySetsAndMembershipValuesOfHeight.keySet()){
            System.out.println("Fuzzy Set: " + h + " - Membership Value: " + this.fuzzySetsAndMembershipValuesOfHeight.get(h));
        }
    }
    
    public void doFuzzificationOfWeight(double weight, int sex){
        if(sex == 0){
            if(weight < 50){
                fuzzySetsAndMembershipValuesOfWeight.put(0, 1.0);
            }
            else if(weight >= 50 && weight < 60){
                double p1 = (2 * weight - 100) / 20;
                double p0 = 1 - p1;
                fuzzySetsAndMembershipValuesOfWeight.put(0, p0);
                fuzzySetsAndMembershipValuesOfWeight.put(1, p1);
            }
            else if(weight >= 60 && weight < 70){
                double p2 = (2 * weight - 120) / 20;
                double p1 = 1 - p2;
                fuzzySetsAndMembershipValuesOfWeight.put(1, p1);
                fuzzySetsAndMembershipValuesOfWeight.put(2, p2);
            }
            else{
                fuzzySetsAndMembershipValuesOfWeight.put(2, 1.0);
            }
        }
        else{
            if(weight < 45){
                fuzzySetsAndMembershipValuesOfWeight.put(0, 1.0);
            }
            else if(weight >= 45 && weight < 50){
                double p1 = (2 * weight - 90) / 10;
                double p0 = 1 - p1;
                fuzzySetsAndMembershipValuesOfWeight.put(0, p0);
                fuzzySetsAndMembershipValuesOfWeight.put(1, p1);
            }
            else if(weight >= 50 && weight < 55){
                double p2 = (2 * weight - 100) / 10;
                double p1 = 1 - p2;
                fuzzySetsAndMembershipValuesOfWeight.put(1, p1);
                fuzzySetsAndMembershipValuesOfWeight.put(2, p2);
            }
            else{
                fuzzySetsAndMembershipValuesOfWeight.put(2, 1.0);
            }
        }
        System.out.println("Weight: " + weight);
        System.out.println("Fuzzy Sets and their Membership Values of Weight:");
        for(int w: this.fuzzySetsAndMembershipValuesOfWeight.keySet()){
            System.out.println("Fuzzy Set: " + w + " - Membership Value: " + this.fuzzySetsAndMembershipValuesOfWeight.get(w));
        }
    }
    
    public void doFuzzyInference(){
        // Detach fuzzy sets and membership values
        ArrayList<Integer>  fuzzySetsOfHeight = new ArrayList<>();
        ArrayList<Double> membershipValuesOfHeight = new ArrayList<>();
        
        for(int h: this.fuzzySetsAndMembershipValuesOfHeight.keySet()){         
            fuzzySetsOfHeight.add(h);
            membershipValuesOfHeight.add(this.fuzzySetsAndMembershipValuesOfHeight.get(h));
        }
        
        ArrayList<Integer>  fuzzySetsOfWeight = new ArrayList<>();
        ArrayList<Double> membershipValuesOfWeight = new ArrayList<>();
        
        for(int w: this.fuzzySetsAndMembershipValuesOfWeight.keySet()){
            fuzzySetsOfWeight.add(w);
            membershipValuesOfWeight.add(this.fuzzySetsAndMembershipValuesOfWeight.get(w));
        }
        
        // Compute membership values
        for(int i = 0; i < fuzzySetsOfWeight.size(); i++) {
                for(int j = 0; j < fuzzySetsOfHeight.size(); j++) {
                        this.membershipValuesTable[fuzzySetsOfWeight.get(i)][fuzzySetsOfHeight.get(j)] = Math.min(membershipValuesOfWeight.get(i), membershipValuesOfHeight.get(j));
                }
        }
        
        System.out.println("Fuzzy Rules Table:");    
        for(int i = 0; i < 3; i++){
            for(int j = 0; j < 3; j++){
                System.out.print(FuzzyLogic.fuzzyRulesTable[i][j] + " ");
            }
            System.out.println();
        }
        
        System.out.println("Membership Values Table:");    
        for(int i = 0; i < 3; i++){
            for(int j = 0; j < 3; j++){
                System.out.print(this.membershipValuesTable[i][j] + " ");
            }
            System.out.println();
        }
        
        // Get fuzzy output
        for(int i = 0; i < 3; i++) {
            for(int j = 0; j < 3; j++) {
                    this.fuzzifiedDecision[this.fuzzyRulesTable[i][j]] = Math.max(this.membershipValuesTable[i][j], this.fuzzifiedDecision[this.fuzzyRulesTable[i][j]]);
            }
        }
                
        System.out.println("Fuzzified Decision:");
        for(double fd: this.fuzzifiedDecision){
            System.out.print(fd + " ");
        }
        System.out.println();
    }
    
    public int doDefuzzificationOfBody(){
        double max = 0;
        this.finalDecisionOnBody = 0;

        for(int i = 0; i < this.fuzzifiedDecision.length; i++) {
            if(this.fuzzifiedDecision[i] > max){
                max = this.fuzzifiedDecision[i];
                this.finalDecisionOnBody = i;
            }           
        }
        System.out.println("Final Decision on Body: " + this.finalDecisionOnBody);
        return this.finalDecisionOnBody;
    }
}