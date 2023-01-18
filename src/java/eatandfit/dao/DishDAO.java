/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package eatandfit.dao;

import eatandfit.model.Dish;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Admin
 */
public class DishDAO extends DAO{
    
    public DishDAO(){
        super();
    }
    
    public Dish getDishByID(int id) {
        String sql = "SELECT * FROM Dish WHERE id = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Dish dish = new Dish(rs.getString("id"),
                        rs.getString("name"),
                        rs.getString("image"),
                        rs.getString("nutrition"),
                        rs.getString("recipe"),
                        rs.getString("steps")
                );
                return dish;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}