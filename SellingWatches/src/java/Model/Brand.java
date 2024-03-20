/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class Brand {
    private int BrandID;
    private String BrandName;
    private boolean BrandStatus;
    private String BrandImg;

    public Brand() {
    }

    public Brand(int BrandID, String BrandName, boolean BrandStatus, String BrandImg) {
        this.BrandID = BrandID;
        this.BrandName = BrandName;
        this.BrandStatus = BrandStatus;
        this.BrandImg = BrandImg;
    }

    public int getBrandID() {
        return BrandID;
    }

    public void setBrandID(int BrandID) {
        this.BrandID = BrandID;
    }

    public String getBrandName() {
        return BrandName;
    }

    public void setBrandName(String BrandName) {
        this.BrandName = BrandName;
    }

    public boolean isBrandStatus() {
        return BrandStatus;
    }

    public void setBrandStatus(boolean BrandStatus) {
        this.BrandStatus = BrandStatus;
    }

    public String getBrandImg() {
        return BrandImg;
    }

    public void setBrandImg(String BrandImg) {
        this.BrandImg = BrandImg;
    }
    
    
}
