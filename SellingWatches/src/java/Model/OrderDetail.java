/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class OrderDetail {
    private int OrderID;
    private int ProductID;
    private int Quantity;
    private double Price;
    private String ProductNameorder;
    private User user;
    public OrderDetail(int OrderID, int ProductID, int Quantity, double Price) {
        this.OrderID = OrderID;
        this.ProductID = ProductID;
        this.Quantity = Quantity;
        this.Price = Price;
    }
    
   public OrderDetail(int OrderID, String ProductNameorder,int Quantity, double Price){
       this.OrderID = OrderID;
       this.ProductNameorder = ProductNameorder;
       this.Quantity = Quantity;
       this.Price = Price;
   }
   public OrderDetail(int OrderID, String ProductNameorder,int Quantity, double Price, int ProductID){
       this.OrderID = OrderID;
       this.ProductNameorder = ProductNameorder;
       this.Quantity = Quantity;
       this.Price = Price;
       this.ProductID = ProductID;
   }
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getProductNameorder() {
        return ProductNameorder;
    }

    public void setProductNameorder(String ProductNameorder) {
        this.ProductNameorder = ProductNameorder;
    }
    
    
    public OrderDetail() {
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double Price) {
        this.Price = Price;
    }
    
}