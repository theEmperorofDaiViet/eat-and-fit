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
public class RecipeDetail {
	
    private LinkedHashMap<String, String> ingredients;

    public RecipeDetail() {

    }

    public RecipeDetail(LinkedHashMap<String, String> ingredients) {
            this.ingredients = ingredients;
    }

    public LinkedHashMap<String, String> getIngredients() {
            return ingredients;
    }

    public void setIngredients(LinkedHashMap<String, String> ingredients) {
            this.ingredients = ingredients;
    }
}