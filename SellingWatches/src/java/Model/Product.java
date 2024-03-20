/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class Product {
    private int ProductID;
    private String ProductName;
    private String Description;
    private boolean GenderP;
    private String DateP;
    private double Price;
    private double Discount;
    private String Image;
    private boolean StatusP;
    private int Quantity;
    private int Sold;
    private Brand Brand;

    public Product() {
    }

    public Product(int ProductID, String ProductName, String Description, boolean GenderP, String DateP, double Price, double Discount, String Image, boolean StatusP, int Quantity, int Sold, Brand Brand) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.Description = Description;
        this.GenderP = GenderP;
        this.DateP = DateP;
        this.Price = Price;
        this.Discount = Discount;
        this.Image = Image;
        this.StatusP = StatusP;
        this.Quantity = Quantity;
        this.Sold = Sold;
        this.Brand = Brand;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public boolean isGenderP() {
        return GenderP;
    }

    public void setGenderP(boolean GenderP) {
        this.GenderP = GenderP;
    }

    public String getDateP() {
        return DateP;
    }

    public void setDateP(String DateP) {
        this.DateP = DateP;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double Price) {
        this.Price = Price;
    }

    public double getDiscount() {
        return Discount;
    }

    public void setDiscount(double Discount) {
        this.Discount = Discount;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }

    public boolean isStatusP() {
        return StatusP;
    }

    public void setStatusP(boolean StatusP) {
        this.StatusP = StatusP;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public int getSold() {
        return Sold;
    }

    public void setSold(int Sold) {
        this.Sold = Sold;
    }

    public Brand getBrand() {
        return Brand;
    }

    public void setBrand(Brand Brand) {
        this.Brand = Brand;
    }
    
    public double getPriceDiscount(){
        return getPrice()-(getPrice()*getDiscount()/100);
    }
    
}
