/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package eatandfit.dao;

import eatandfit.model.StandardCalories;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Admin
 */
public class StandardCaloriesDAO extends DAO{

    public StandardCaloriesDAO() {
        super();
    }

    public StandardCalories getStandardCalories(int stage, int body, int sex) {

        String sql = "SELECT * FROM StandardCalories WHERE Stage = ? and Body = ? and Sex = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, stage);
            ps.setInt(2, body);
            ps.setInt(3, sex);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                StandardCalories sc = new StandardCalories(rs.getInt("Stage"),
                        rs.getInt("Body"),
                        rs.getInt("Sex"),
                        rs.getInt("LowCarb"),
                        rs.getInt("ModerateCarb"),
                        rs.getInt("HighCarb")
                );
                return sc;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }    
}