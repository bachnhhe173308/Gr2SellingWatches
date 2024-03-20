/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class Order {
    private int OrderID;
    private int UserID;
    private String Oder_date;
    private double Total;

    public Order(int OrderID, int UserID, String Oder_date, double Total) {
        this.OrderID = OrderID;
        this.UserID = UserID;
        this.Oder_date = Oder_date;
        this.Total = Total;
    }

    public Order() {
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public String getOder_date() {
        return Oder_date;
    }

    public void setOder_date(String Oder_date) {
        this.Oder_date = Oder_date;
    }

    public double getTotal() {
        return Total;
    }

    public void setTotal(double Total) {
        this.Total = Total;
    }
    
            
}
