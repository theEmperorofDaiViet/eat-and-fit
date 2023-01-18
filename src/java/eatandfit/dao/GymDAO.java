/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package eatandfit.dao;

import eatandfit.model.Exercise;
import eatandfit.model.Gym;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class GymDAO extends DAO{
    
    public GymDAO(){
        super();
    }
    
    public ArrayList<Gym> getLowerGyms() {
        ArrayList<Gym> gyms = new ArrayList<>();
        String sql = "SELECT * FROM Gym WHERE Day = 'lower';";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Gym gym = new Gym(rs.getString("day"),
                        rs.getString("exercise"),
                        rs.getString("sets"),
                        rs.getString("reps"));
                
                gyms.add(gym);
            }          
        } catch (Exception e) {
            e.printStackTrace();
        }
        return gyms;
    }

    public ArrayList<Gym> getUpperGyms() {
        ArrayList<Gym> gyms = new ArrayList<>();
        String sql = "SELECT * FROM Gym WHERE Day = 'upper';";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Gym gym = new Gym(rs.getString("day"),
                        rs.getString("exercise"),
                        rs.getString("sets"),
                        rs.getString("reps"));
                gyms.add(gym);
            }
            return gyms;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Exercise getExercisebyId(String id) {
        String sql = "SELECT * FROM Exercise WHERE id = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Exercise exercise = new Exercise(rs.getString("id"),
                        rs.getString("name"),
                        rs.getString("link"),
                        rs.getString("overview"),
                        rs.getString("Introductions")
                );
                return exercise;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}