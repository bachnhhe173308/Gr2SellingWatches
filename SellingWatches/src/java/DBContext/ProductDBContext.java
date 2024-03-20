/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBContext;

import Model.Brand;
import Model.Cart;
import Model.Item;
import Model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ProductDBContext extends DBContext2 {

    public int getTotalProduct() {
        try {
            String sql = "select count(*) from Product";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public List<Product> pagingProductByDate() {
        List<Product> list = new ArrayList<>();
        try {
            String sql = """
                         SELECT ProductID, ProductName, Description, GenderP, DateP, 
                                BrandID, Price, Discount, Image, StatusP, Quantity, Sold 
                         FROM product
                         ORDER BY DateP DESC
                         LIMIT 16 OFFSET 0""";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setGenderP(rs.getBoolean("GenderP"));
                p.setDateP(rs.getString("DateP"));
                Brand b = new Brand();
                b.setBrandID(rs.getInt("BrandID"));
                p.setBrand(b);
                p.setPrice(rs.getDouble("Price"));
                p.setDiscount(rs.getDouble("Discount"));
                p.setImage(rs.getString("Image"));
                p.setStatusP(rs.getBoolean("StatusP"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setSold(rs.getInt("Sold"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> pagingProductByDiscount() {
        List<Product> list = new ArrayList<>();
        try {
            String sql = """
                         SELECT ProductID, ProductName, Description, GenderP, DateP, 
                                BrandID, Price, Discount, Image, StatusP, Quantity, Sold 
                         FROM product
                         ORDER BY Discount DESC
                         LIMIT 8 OFFSET 0""";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setGenderP(rs.getBoolean("GenderP"));
                p.setDateP(rs.getString("DateP"));
                Brand b = new Brand();
                b.setBrandID(rs.getInt("BrandID"));
                p.setBrand(b);
                p.setPrice(rs.getDouble("Price"));
                p.setDiscount(rs.getDouble("Discount"));
                p.setImage(rs.getString("Image"));
                p.setStatusP(rs.getBoolean("StatusP"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setSold(rs.getInt("Sold"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Product getProductByID(int pid) {
        try {
            String sql = """
                         SELECT * FROM product p join brand b 
                         on p.BrandID = b.BrandID
                         where ProductID = ?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setGenderP(rs.getBoolean("GenderP"));
                p.setDateP(rs.getString("DateP"));
                Brand b = new Brand();
                b.setBrandID(rs.getInt("BrandID"));
                b.setBrandName(rs.getString("BrandName"));
                p.setBrand(b);
                p.setPrice(rs.getDouble("Price"));
                p.setDiscount(rs.getDouble("Discount"));
                p.setImage(rs.getString("Image"));
                p.setStatusP(rs.getBoolean("StatusP"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setSold(rs.getInt("Sold"));
                return p;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public List<Product> getProductByGender(int gender, int index) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = """
                         SELECT * FROM product
                         where GenderP = ?
                         LIMIT 9 OFFSET ?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, gender);
            stm.setInt(2, (index - 1) * 9);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setGenderP(rs.getBoolean("GenderP"));
                p.setDateP(rs.getString("DateP"));
                Brand b = new Brand();
                b.setBrandID(rs.getInt("BrandID"));
                p.setBrand(b);
                p.setPrice(rs.getDouble("Price"));
                p.setDiscount(rs.getDouble("Discount"));
                p.setImage(rs.getString("Image"));
                p.setStatusP(rs.getBoolean("StatusP"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setSold(rs.getInt("Sold"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int getTotalProductWithGender(int gender) {
        try {
            String sql = """
                         SELECT count(*) FROM product
                         where GenderP = ?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, gender);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public List<Product> getProductByBrand(int brand, int index) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = """
                         SELECT * FROM product
                         where BrandID = ?
                         LIMIT 9 OFFSET ?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, brand);
            stm.setInt(2, (index - 1) * 9);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setGenderP(rs.getBoolean("GenderP"));
                p.setDateP(rs.getString("DateP"));
                Brand b = new Brand();
                b.setBrandID(rs.getInt("BrandID"));
                p.setBrand(b);
                p.setPrice(rs.getDouble("Price"));
                p.setDiscount(rs.getDouble("Discount"));
                p.setImage(rs.getString("Image"));
                p.setStatusP(rs.getBoolean("StatusP"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setSold(rs.getInt("Sold"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getSimilarProduct(int brand) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = """
                         SELECT * FROM product
                         where BrandID = ?
                         LIMIT 4 OFFSET 0""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, brand);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setGenderP(rs.getBoolean("GenderP"));
                p.setDateP(rs.getString("DateP"));
                Brand b = new Brand();
                b.setBrandID(rs.getInt("BrandID"));
                p.setBrand(b);
                p.setPrice(rs.getDouble("Price"));
                p.setDiscount(rs.getDouble("Discount"));
                p.setImage(rs.getString("Image"));
                p.setStatusP(rs.getBoolean("StatusP"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setSold(rs.getInt("Sold"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int getTotalProductWithBrand(int brand) {
        try {
            String sql = """
                         SELECT count(*) FROM product
                         where BrandID = ?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, brand);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public List<Brand> getAllBrand() {
        List<Brand> brand = new ArrayList<>();
        try {
            String sql = "select * from brand";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Brand b = new Brand();
                b.setBrandID(rs.getInt("BrandID"));
                b.setBrandName(rs.getString("BrandName"));
                b.setBrandStatus(rs.getBoolean("BrandStatus"));
                b.setBrandImg(rs.getString("BrandImg"));
                brand.add(b);
            }
        } catch (SQLException e) {
        }
        return brand;
    }

    public List<Product> pagingProduct(int index) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = """
                         SELECT ProductID, ProductName, Description, GenderP, DateP, 
                            BrandID, Price, Discount, Image, StatusP, Quantity, Sold 
                            FROM product
                            ORDER BY DateP DESC
                            LIMIT 9 OFFSET ?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, (index - 1) * 9);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setGenderP(rs.getBoolean("GenderP"));
                p.setDateP(rs.getString("DateP"));
                Brand b = new Brand();
                b.setBrandID(rs.getInt("BrandID"));
                p.setBrand(b);
                p.setPrice(rs.getDouble("Price"));
                p.setDiscount(rs.getDouble("Discount"));
                p.setImage(rs.getString("Image"));
                p.setStatusP(rs.getBoolean("StatusP"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setSold(rs.getInt("Sold"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getProductByName(String name, int index) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM product "
                    + "where ProductName like '%" + name + "%' LIMIT 9 OFFSET ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, (index - 1) * 9);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setGenderP(rs.getBoolean("GenderP"));
                p.setDateP(rs.getString("DateP"));
                Brand b = new Brand();
                b.setBrandID(rs.getInt("BrandID"));
                p.setBrand(b);
                p.setPrice(rs.getDouble("Price"));
                p.setDiscount(rs.getDouble("Discount"));
                p.setImage(rs.getString("Image"));
                p.setStatusP(rs.getBoolean("StatusP"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setSold(rs.getInt("Sold"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int getTotalProductWithName(String name) {
        try {
            String sql = "SELECT count(*) FROM product "
                    + "where ProductName like '%" + name + "%'";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public List<Product> getProductIdOrderByDate() {
        List<Product> products = new ArrayList<>();
        try {
            String sql = """
                         SELECT ProductID
                         FROM product
                         ORDER BY DateP DESC
                         LIMIT 10 OFFSET 0""";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                products.add(p);
            }
        } catch (SQLException e) {
        }
        return products;
    }

    public List<Product> getThreeLastestProducts() {
        List<Product> products = new ArrayList<>();
        try {
            String sql = """
                         SELECT * FROM product
                         order by DateP desc
                         limit 3 offset 0""";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setGenderP(rs.getBoolean("GenderP"));
                p.setDateP(rs.getString("DateP"));
                Brand b = new Brand();
                b.setBrandID(rs.getInt("BrandID"));
                p.setBrand(b);
                p.setPrice(rs.getDouble("Price"));
                p.setDiscount(rs.getDouble("Discount"));
                p.setImage(rs.getString("Image"));
                p.setStatusP(rs.getBoolean("StatusP"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setSold(rs.getInt("Sold"));
                products.add(p);
            }
        } catch (SQLException e) {
        }
        return products;
    }

    public Cart getUserCart(int userID) {
        Cart cart = new Cart();
        String sql = "SELECT ProductID, Quantity FROM cart WHERE UserID = ?";
        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, userID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int productId = rs.getInt("ProductID");
                int quantity = rs.getInt("Quantity");
                Product product = getProductByID(productId); // Assuming this method returns a Product object
                if (product != null) {
                    double price = product.getPrice();
                    cart.addItem(new Item(product, quantity, price)); // Assuming Cart has this method
                }
            }
        } catch (Exception e) {
            // Handle exceptions

        }
        return cart;
    }

    public void deleteCart(int userID) {
        String sql = "DELETE FROM cart WHERE UserID = ?";
        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, userID);
            stm.executeUpdate();
        } catch (SQLException e) {
            // Proper error handling

        }
    }

    public void insertCart(int userID, List<Item> items) {
        String sql = "INSERT INTO cart (UserID, ProductID, Quantity) VALUES (?, ?, ?)";
        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            for (Item item : items) {
                stm.setInt(1, userID);
                stm.setInt(2, item.getProduct().getProductID());
                stm.setInt(3, item.getQuantity());
                stm.addBatch(); // Prepare this insert for batch execution
            }
            stm.executeBatch(); // Execute all inserts in a batch
        } catch (SQLException e) {
            // Proper error handling

        }
    }

    public boolean updateFullNameMailAddressPhoneByID(int userID, String fullName, String mail, String address, String phone) {
        try {
            // Câu lệnh SQL để cập nhật thông tin người dùng
            String sql = "UPDATE User SET Fullname = ?, Mail = ?, Address = ?, Phone = ? WHERE UserID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            // Thiết lập các giá trị cho các tham số trong câu lệnh SQL
            statement.setString(1, fullName);
            statement.setString(2, mail);
            statement.setString(3, address);
            statement.setString(4, phone);
            statement.setInt(5, userID);

            // Thực thi câu lệnh SQL
            int rowsUpdated = statement.executeUpdate();
            // Kiểm tra số dòng được cập nhật
            if (rowsUpdated > 0) {
                return true; // Cập nhật thành công
            }
        } catch (SQLException e) {
        }
        return false; // Cập nhật không thành công
    }

    public List<Product> getAllProduct(int index) {
        List<Product> products = new ArrayList<>();
        try {
            String sql = """
                         SELECT ProductID, ProductName, `Description`, GenderP, 
                         DateP, p.BrandID, BrandName, Price, Discount, Image, StatusP, Quantity, Sold
                         FROM product p join brand b on p.BrandID = b.BrandID 
                         limit 8 offset ?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, (index-1)*8);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt(1));
                p.setProductName(rs.getString(2));
                p.setDescription(rs.getString(3));
                p.setGenderP(rs.getBoolean(4));
                p.setDateP(rs.getString(5));
                Brand b = new Brand();
                b.setBrandID(rs.getInt(6));
                b.setBrandName(rs.getString(7));
                p.setBrand(b);
                p.setPrice(rs.getDouble(8));
                p.setDiscount(rs.getDouble(9));
                p.setImage(rs.getString(10));
                p.setStatusP(rs.getBoolean(11));
                p.setQuantity(rs.getInt(12));
                p.setSold(rs.getInt(13));
                products.add(p);
            }
        } catch (SQLException e) {
        }
        return products;
    }
    
    public List<Product> searchProduct(String name, String gender, String brand, String status, int number){
        List<Product> products = new ArrayList<>();
        try {
            String sql = """
                         SELECT ProductID, ProductName, `Description`, GenderP, DateP, 
                         p.BrandID, BrandName, Price, Discount, Image, StatusP, Quantity, Sold
                         FROM product p join brand b on p.BrandID = b.BrandID
                         where ProductName like ? and GenderP like ? and p.BrandID like ? and StatusP like ?
                         limit 8 offset ?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%"+name+"%");
            stm.setString(2, gender);
            stm.setString(3, brand);
            stm.setString(4, status);
            stm.setInt(5, (number - 1) * 8);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Product p = new Product();
                p.setProductID(rs.getInt(1));
                p.setProductName(rs.getString(2));
                p.setDescription(rs.getString(3));
                p.setGenderP(rs.getBoolean(4));
                p.setDateP(rs.getString(5));
                Brand b = new Brand();
                b.setBrandID(rs.getInt(6));
                b.setBrandName(rs.getString(7));
                p.setBrand(b);
                p.setPrice(rs.getDouble(8));
                p.setDiscount(rs.getDouble(9));
                p.setImage(rs.getString(10));
                p.setStatusP(rs.getBoolean(11));
                p.setQuantity(rs.getInt(12));
                p.setSold(rs.getInt(13));
                products.add(p);
            }
        } catch (SQLException e) {
        }
        return products;
    }
    
    public int getNumberProductWithSearch(String name, String gender, String brand, String status) {
        try {
            String sql = """
                         SELECT count(*)
                         FROM product p join brand b on p.BrandID = b.BrandID
                         where ProductName like ? and GenderP like ? and p.BrandID like ? and StatusP like ?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%"+name+"%");
            stm.setString(2, gender);
            stm.setString(3, brand);
            stm.setString(4, status);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public static void main(String[] args) {
        ProductDBContext db = new ProductDBContext();
        List<Product> p = db.getAllProduct(1);
        for (Product pr : p) {
            System.out.println(pr.getProductName());
            System.out.println(pr.getProductName());
            System.out.println(pr.getDescription());
            System.out.println(pr.isGenderP());
            System.out.println(pr.getDateP());
            System.out.println(pr.getBrand().getBrandID());
            System.out.println(pr.getBrand().getBrandName());
            System.out.println(pr.getPrice());
            System.out.println(pr.getDiscount());
            System.out.println(pr.getImage());
            System.out.println(pr.isStatusP());
            System.out.println(pr.getQuantity());
            System.out.println(pr.getSold());

        }
    }

}
