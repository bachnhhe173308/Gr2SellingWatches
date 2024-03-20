/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author THINKPAD
 */
public class Slider {
    private int SliderID;
    private int UserID;
    private String SliderTitle;
    private String SliderImage;
    private String backlink;
    private boolean SliderStatus;

    public Slider() {
    }

    public Slider(int SliderID, int UserID, String SliderTitle, String SliderImage, String backlink, boolean SliderStatus) {
        this.SliderID = SliderID;
        this.UserID = UserID;
        this.SliderTitle = SliderTitle;
        this.SliderImage = SliderImage;
        this.backlink = backlink;
        this.SliderStatus = SliderStatus;
    }

    public int getSliderID() {
        return SliderID;
    }

    public void setSliderID(int SliderID) {
        this.SliderID = SliderID;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public String getSliderTitle() {
        return SliderTitle;
    }

    public void setSliderTitle(String SliderTitle) {
        this.SliderTitle = SliderTitle;
    }

    public String getSliderImage() {
        return SliderImage;
    }

    public void setSliderImage(String SliderImage) {
        this.SliderImage = SliderImage;
    }

    public String getBacklink() {
        return backlink;
    }

    public void setBacklink(String backlink) {
        this.backlink = backlink;
    }

    public boolean isSliderStatus() {
        return SliderStatus;
    }

    public void setSliderStatus(boolean SliderStatus) {
        this.SliderStatus = SliderStatus;
    }
    
    
}
