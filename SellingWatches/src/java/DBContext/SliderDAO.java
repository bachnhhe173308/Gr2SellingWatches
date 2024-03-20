/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBContext;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.Slider;

/**
 *
 * @author THINKPAD
 */
public class SliderDAO extends DBContext2 {

    public ArrayList<Slider> getAllSlider() {
        ArrayList<Slider> list = new ArrayList<>();
        try {
            String sql = "SELECT SliderID, UserID, SliderTitle, SliderImage, backlink,SliderStatus\n"
                    + "FROM slider;";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Slider slider = new Slider();
                slider.setSliderID(rs.getInt("SliderID"));
                slider.setUserID(rs.getInt("UserID"));
                slider.setSliderTitle(rs.getString("SliderTitle"));
                slider.setSliderImage(rs.getString("SliderImage"));
                slider.setBacklink(rs.getString("backlink"));
                slider.setSliderStatus(rs.getBoolean("SliderStatus"));
                list.add(slider);
            }
            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Slider> getSliderActived() {
        ArrayList<Slider> list = new ArrayList<>();
        try {
            String sql = "SELECT SliderID, UserID, SliderTitle, SliderImage, backlink,SliderStatus\n"
                    + "FROM slider\n"
                    + "WHERE SliderStatus = 1";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Slider slider = new Slider();
                slider.setSliderID(rs.getInt("SliderID"));
                slider.setUserID(rs.getInt("UserID"));
                slider.setSliderTitle(rs.getString("SliderTitle"));
                slider.setSliderImage(rs.getString("SliderImage"));
                slider.setBacklink(rs.getString("backlink"));
                slider.setSliderStatus(rs.getBoolean("SliderStatus"));
                list.add(slider);
            }
            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Slider> getSliderByStatus(String status) {
        ArrayList<Slider> list = new ArrayList<>();
        try {
            String sql = "SELECT SliderID, UserID, SliderTitle, SliderImage, backlink,SliderStatus\n"
                    + "FROM slider\n"
                    + "WHERE SliderStatus LIKE ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + status + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Slider slider = new Slider();
                slider.setSliderID(rs.getInt("SliderID"));
                slider.setUserID(rs.getInt("UserID"));
                slider.setSliderTitle(rs.getString("SliderTitle"));
                slider.setSliderImage(rs.getString("SliderImage"));
                slider.setBacklink(rs.getString("backlink"));
                slider.setSliderStatus(rs.getBoolean("SliderStatus"));
                list.add(slider);
            }
            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Slider getSliderBySliderID(String SliderID) {
        try {
            String sql = "SELECT SliderID, UserID, SliderTitle, SliderImage, backlink,SliderStatus\n"
                    + "FROM slider\n"
                    + "WHERE SliderID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, SliderID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Slider slider = new Slider();
                slider.setSliderID(rs.getInt("SliderID"));
                slider.setUserID(rs.getInt("UserID"));
                slider.setSliderTitle(rs.getString("SliderTitle"));
                slider.setSliderImage(rs.getString("SliderImage"));
                slider.setBacklink(rs.getString("backlink"));
                slider.setSliderStatus(rs.getBoolean("SliderStatus"));
                return slider;
            }
            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateSlider(int sliderID, String sliderTitle, String sliderImage, String backLink, String sliderStatus) {
        try {
            String sql = "UPDATE slider\n"
                    + "SET SliderTitle =  ?, SliderImage = ?, backlink = ?, SliderStatus = ? \n"
                    + "WHERE SliderID=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, sliderTitle);
            stm.setString(2, sliderImage);
            stm.setString(3, backLink);
            stm.setBoolean(4, Boolean.parseBoolean(sliderStatus));
            stm.setInt(5, sliderID);
            stm.executeUpdate();
        } catch (SQLException ex) {
            
        }
    }

    public ArrayList<Slider> searchSlider(String sliderTitle, String backLink, String status) {
        ArrayList<Slider> list = new ArrayList<>();
        try {
            String sql = "SELECT SliderID, UserID, SliderTitle, SliderImage, backlink,SliderStatus\n"
                    + "FROM slider\n"
                    + "WHERE SliderTitle LIKE ? AND backlink LIKE ? AND SliderStatus LIKE ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + sliderTitle + "%");
            stm.setString(2, "%" + backLink + "%");
            stm.setString(3, "%" + status + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Slider slider = new Slider();
                slider.setSliderID(rs.getInt("SliderID"));
                slider.setUserID(rs.getInt("UserID"));
                slider.setSliderTitle(rs.getString("SliderTitle"));
                slider.setSliderImage(rs.getString("SliderImage"));
                slider.setBacklink(rs.getString("backlink"));
                slider.setSliderStatus(rs.getBoolean("SliderStatus"));
                list.add(slider);
            }
            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
