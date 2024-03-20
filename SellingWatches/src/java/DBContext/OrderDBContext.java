/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBContext;

import Model.Cart;
import Model.Item;
import Model.Order;
import Model.OrderDetail;
import Model.User;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author Admin
 */
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;

public class OrderDBContext extends DBContext2 {
    public void addOrder(User u, Cart cart) {
        LocalDate date = java.time.LocalDate.now();
        
        try {
            // Cập nhật câu lệnh SQL để sử dụng các tham số đúng cách
            String sql = "INSERT INTO `order`(UserID, Order_date, Total) VALUES (?, ?, ?);";
            PreparedStatement st = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            st.setInt(1, u.getUserID());
            st.setDate(2, java.sql.Date.valueOf(date));
            st.setDouble(3, cart.getTotalMoney());
            st.executeUpdate();
            
            ResultSet rsKeys = st.getGeneratedKeys();
            if (rsKeys.next()) {
                int oid = rsKeys.getInt(1); // Lấy ID đơn hàng vừa được tạo
                
                for (Item i : cart.getItems()) {
                    // Sửa câu lệnh SQL để không sử dụng dấu nháy đơn cho các giá trị tham số
                    String sql2 = "INSERT INTO `swp3`.`order_detail` (OrderID, ProductID, Quantity, Price) VALUES (?, ?, ?, ?);";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, oid);
                    st2.setInt(2, i.getProduct().getProductID());
                    st2.setInt(3, i.getQuantity());
                    st2.setDouble(4, i.getPrice());
                    st2.executeUpdate();
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    // Hàm lấy tất cả các đơn hàng của một user
    public List<Order> getAllOrdersByUser(User user) {
        List<Order> orders = new ArrayList<>();
        try {
            String sql = "SELECT * FROM `order` WHERE UserID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, user.getUserID());
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int orderId = resultSet.getInt("OrderID");
                int userId = resultSet.getInt("UserID");
                String orderDate = resultSet.getString("Order_date");
                double total = resultSet.getDouble("Total");
                Order order = new Order(orderId, userId, orderDate, total);
                orders.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }
    
    // Hàm lấy tất cả chi tiết đơn hàng dựa trên OrderID
    public List<OrderDetail> getOrderDetailsByOrderId(int orderId) {
        List<OrderDetail> orderDetails = new ArrayList<>();
        try {
            String sql= "select od.OrderID, p.ProductName, od.Quantity, od.Price, p.ProductID FROM order_detail od JOIN product p on od.ProductID = p.ProductID WHERE OrderID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, orderId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String productname = resultSet.getString("ProductName");
                int quantity = resultSet.getInt("Quantity");
                double price = resultSet.getDouble("Price");
                int productid = resultSet.getInt("ProductID");
                //OrderDetail orderDetail = new OrderDetail(orderId, productname, quantity, price);
                OrderDetail orderDetail = new OrderDetail(orderId, productname, quantity, price,productid);
                orderDetails.add(orderDetail);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orderDetails;
    }
    
    // Hàm lấy tất cả chi tiết đơn hàng dựa trên OrderID và cũng trả về thông tin người dùng
    public List<OrderDetail> getOrderDetailsAndUserByOrderId(int orderId) {
        List<OrderDetail> orderDetails = new ArrayList<>();
        try {
            String sql = "SELECT od.ProductID, od.Quantity, od.Price, u.Fullname, u.Mail, u.Address, u.Phone \n" +
"                         FROM order_detail od  \n" +
"                         INNER JOIN order o ON o.OrderID = od.OrderID\n" +
"                         INNER JOIN user u ON o.UserID = u.UserID \n" +
"                         WHERE od.OrderID = ?	";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, orderId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int productId = resultSet.getInt("ProductID");
                int quantity = resultSet.getInt("Quantity");
                double price = resultSet.getDouble("Price");
                double total = resultSet.getDouble("Total");
                String fullname = resultSet.getString("Fullname");
                String mail = resultSet.getString("Mail");
                String address = resultSet.getString("Address");
                String phone = resultSet.getString("Phone");
                OrderDetail orderDetail = new OrderDetail(orderId, productId, quantity, price);
                User user = new User(fullname, mail, address, phone); // Tạo đối tượng User từ thông tin người dùng
                orderDetail.setUser(user); // Gán thông tin người dùng vào đối tượng OrderDetail
                orderDetails.add(orderDetail);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orderDetails;
    }
    public Order getOrderById(int orderId) {
    Order order = null;
    try {
        String sql = "SELECT * FROM `order` WHERE OrderID = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, orderId);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            int orderID = resultSet.getInt("OrderID");
            int userID = resultSet.getInt("UserID");
            String orderDate = resultSet.getString("Order_date");
            double total = resultSet.getDouble("Total");
            order = new Order(orderID, userID, orderDate, total);
        }
    } catch (SQLException ex) {
        Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
    }
    return order;
}
    public List<Order> getOrdersByDate(String orderDate) {
    List<Order> orders = new ArrayList<>();
    try {
        String sql = "SELECT * FROM `order` WHERE Order_date = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, orderDate);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            int orderID = resultSet.getInt("OrderID");
            int userID = resultSet.getInt("UserID");
          //  String orderDate = resultSet.getString("Order_date");

            double total = resultSet.getDouble("Total");
            Order order = new Order(orderID, userID, orderDate, total);
            orders.add(order);
        }
    } catch (SQLException ex) {
        Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
    }
    return orders;
}
    
    public List<Order> getOrdersByOrderDate(User user, String orderDate) {
    List<Order> orders = new ArrayList<>();
    try {
        // Tạo câu truy vấn để lấy danh sách đơn hàng theo ngày đặt hàng của người dùng
        String sql = "SELECT * FROM `order` WHERE UserID = ? AND Order_date = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, user.getUserID());
        statement.setString(2, orderDate);
        ResultSet resultSet = statement.executeQuery();
        
        // Lặp qua các kết quả và tạo đối tượng Order từ mỗi hàng
        while (resultSet.next()) {
            int orderID = resultSet.getInt("OrderID");
            String orderDate1 = resultSet.getString("Order_date");
            double total = resultSet.getDouble("Total");
            orders.add(new Order(orderID, user.getUserID(), orderDate1, total));
        }
    } catch (SQLException ex) {
        Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
    }
    return orders;
}
//    public static void main(String[] args) {
//        OrderDBContext o = new OrderDBContext();
//        List<Order> order = getAllOrdersByUser()
//    }
    
}

