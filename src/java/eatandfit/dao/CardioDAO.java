/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package eatandfit.dao;

import eatandfit.model.Cardio;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Admin
 */
public class CardioDAO extends DAO{
    
    public CardioDAO(){
        super();
    }
    
    public Cardio getCardio(int stage, int body, int sex) {
        String sql = "SELECT * FROM Cardio WHERE Stage = ? and Body = ? and Sex = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, stage);
            ps.setInt(2, body);
            ps.setInt(3, sex);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Cardio ca = new Cardio(rs.getInt("stage"),
                        rs.getInt("body"),
                        rs.getInt("sex"),
                        rs.getInt("sessions"),
                        rs.getString("time"));
                return ca;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}