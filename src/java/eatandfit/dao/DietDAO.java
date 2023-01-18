/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package eatandfit.dao;

import eatandfit.model.Diet;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Admin
 */
public class DietDAO extends DAO{
    
    public DietDAO(){
        super();
    }
    
    public Diet getLowCarbDiet(int calories) {
        String sql = "SELECT * FROM LowCarb WHERE Calories = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, calories);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Diet diet = new Diet(rs.getDouble("Calories"),
                        rs.getString("Nutrition"),
                        rs.getString("Breakfast"),
                        rs.getString("Lunch"),
                        rs.getString("Dinner")
                );
                return diet;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Diet getModerateCarbDiet(int calories) {
        String sql = "SELECT * FROM ModerateCarb WHERE Calories = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, calories);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Diet diet = new Diet(rs.getDouble("Calories"),
                        rs.getString("Nutrition"),
                        rs.getString("Breakfast"),
                        rs.getString("Lunch"),
                        rs.getString("Dinner")
                );
                return diet;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Diet getHighCarbDiet(int calories) {
        String sql = "SELECT * FROM HighCarb WHERE Calories = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, calories);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Diet diet = new Diet(rs.getDouble("Calories"),
                        rs.getString("Nutrition"),
                        rs.getString("Breakfast"),
                        rs.getString("Lunch"),
                        rs.getString("Dinner")
                );
                return diet;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }    
}