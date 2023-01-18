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
public class Dish {
	
    private String id;
    private String name;
    private String image;
    private String nutrition;
    private String recipe;
    private String steps;

    public Dish() {

    }

    public Dish(String id, String name, String image, String nutrition, String recipe, String steps) {
            this.id = id;
            this.name = name;
            this.image = image;
            this.nutrition = nutrition;
            this.recipe = recipe;
            this.steps = steps;
    }

    public String getId() {
            return id;
    }

    public void setId(String id) {
            this.id = id;
    }

    public String getName() {
            return name;
    }

    public void setName(String name) {
            this.name = name;
    }

    public String getImage() {
            return image;
    }

    public void setImage(String image) {
            this.image = image;
    }

    public String getNutrition() {
            return nutrition;
    }

    public void setNutrition(String nutrition) {
            this.nutrition = nutrition;
    }

    public String getRecipe() {
            return recipe;
    }

    public void setRecipe(String recipe) {
            this.recipe = recipe;
    }

    public String getSteps() {
            return steps;
    }

    public void setSteps(String steps) {
            this.steps = steps;
    }

    public NutritionDetail getNutritionDetail() {
            String[] tmp = this.nutrition.split(";");
            return new NutritionDetail(Double.parseDouble(tmp[0]),
                                                            Double.parseDouble(tmp[1]), 
                                                            Double.parseDouble(tmp[2]), 
                                                            Double.parseDouble(tmp[3]));
    }

    public RecipeDetail getRecipeDetail() {
            String[] tmp = this.recipe.split(";");
            LinkedHashMap<String, String> ingredients = new LinkedHashMap<String, String>();
            for(String s: tmp) {
                    String[] temp = s.split(":");
                    ingredients.put(temp[0], temp[1].trim());
            }
            return new RecipeDetail(ingredients);
    }

    public StepsDetail getStepsDetail() {
            String[] tmp = this.steps.split(";");
            LinkedHashMap<String, String> steps = new LinkedHashMap<String, String>();
            for(int i = 0; i < tmp.length; i++) {
                    steps.put("Step " + (i+1) + ":", tmp[i]);
            }
            return new StepsDetail(steps);
    }
}