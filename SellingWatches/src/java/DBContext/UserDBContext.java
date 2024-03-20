/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBContext;

import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class UserDBContext extends DBContext2 {

    public User getUserById(int userId) {
        try {
            String sql = "SELECT * FROM User WHERE UserID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, userId);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUserID(rs.getInt("UserID"));
                user.setRoleID(rs.getInt("RoleID"));
                user.setMail(rs.getString("Mail"));
                user.setPassword(rs.getString("Password")); // Lưu ý: Cân nhắc về bảo mật khi sử dụng mật khẩu
                user.setAddress(rs.getString("Address"));
                user.setPhone(rs.getString("Phone"));
                user.setFullname(rs.getString("Fullname"));
                user.setGender(rs.getBoolean("Gender"));
                user.setDob(rs.getDate("DOB"));
                user.setAvatar(rs.getString("Avatar"));
                user.setUserStatus(rs.getBoolean("UserStatus"));
                user.setJoinDate(rs.getDate("join_date"));
                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        try {
            String sql = "SELECT * FROM User";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserID(rs.getInt("UserID"));
                user.setRoleID(rs.getInt("RoleID"));
                user.setMail(rs.getString("Mail"));
                user.setPassword(rs.getString("Password")); // Lưu ý: Cân nhắc về bảo mật khi sử dụng mật khẩu
                user.setAddress(rs.getString("Address"));
                user.setPhone(rs.getString("Phone"));
                user.setFullname(rs.getString("Fullname"));
                user.setGender(rs.getBoolean("Gender"));
                user.setDob(rs.getDate("DOB"));
                user.setAvatar(rs.getString("Avatar"));
                user.setUserStatus(rs.getBoolean("UserStatus"));
                user.setJoinDate(rs.getDate("join_date"));
                users.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;
    }

    public User getUserByEmailAndPassword(String email, String password) {
        try {
            // Sửa câu truy vấn SQL
            String sql = "SELECT * FROM User WHERE Mail = ? AND password = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, email); // Tham số thứ nhất là email
            statement.setString(2, password); // Tham số thứ hai là password
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUserID(rs.getInt("UserID"));
                user.setRoleID(rs.getInt("RoleID"));
                user.setMail(rs.getString("Mail"));
                // Bỏ set password để đảm bảo bảo mật
                user.setAddress(rs.getString("Address"));
                user.setPhone(rs.getString("Phone"));
                user.setFullname(rs.getString("Fullname"));
                user.setGender(rs.getBoolean("Gender"));
                user.setDob(rs.getDate("DOB"));
                user.setAvatar(rs.getString("Avatar"));
                user.setUserStatus(rs.getBoolean("UserStatus"));
                user.setJoinDate(rs.getDate("join_date"));
                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
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
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false; // Cập nhật không thành công
    }

    public boolean updateUserRole(int userID, int roleID) {
        try {
            String sql = "UPDATE User SET RoleID = ? WHERE UserID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, roleID);
            statement.setInt(2, userID);

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean updateUserStatus(int userID, int status) {
        try {
            String sql = "UPDATE User SET UserStatus = ? WHERE UserID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, status);
            statement.setInt(2, userID);

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean updateUserGender(int userID, int gender) {
        try {
            String sql = "UPDATE User SET Gender = ? WHERE UserID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, gender);
            statement.setInt(2, userID);

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public List<User> getUsersByRole(int roleID) {
        List<User> users = new ArrayList<>();
        try {
            String sql = "SELECT * FROM User WHERE RoleID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, roleID);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                User user = new User();
                // Set user properties from ResultSet here
                user.setUserID(rs.getInt("UserID"));
                user.setRoleID(rs.getInt("RoleID"));
                user.setMail(rs.getString("Mail"));
                user.setAddress(rs.getString("Address"));
                user.setPhone(rs.getString("Phone"));
                user.setFullname(rs.getString("Fullname"));
                user.setGender(rs.getBoolean("Gender"));
                user.setDob(rs.getDate("DOB"));
                user.setAvatar(rs.getString("Avatar"));
                user.setUserStatus(rs.getBoolean("UserStatus"));
                user.setJoinDate(rs.getDate("join_date"));
                users.add(user);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(); // Handle exceptions appropriately
        }
        return users;
    }

    public List<User> getUsersByGender(int gender) {
        List<User> users = new ArrayList<>();
        try {
            String sql = "SELECT * FROM User WHERE Gender = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, gender);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                User user = new User();
                // Set user properties from ResultSet here
                user.setUserID(rs.getInt("UserID"));
                user.setRoleID(rs.getInt("RoleID"));
                user.setMail(rs.getString("Mail"));
                user.setAddress(rs.getString("Address"));
                user.setPhone(rs.getString("Phone"));
                user.setFullname(rs.getString("Fullname"));
                user.setGender(rs.getBoolean("Gender"));
                user.setDob(rs.getDate("DOB"));
                user.setAvatar(rs.getString("Avatar"));
                user.setUserStatus(rs.getBoolean("UserStatus"));
                user.setJoinDate(rs.getDate("join_date"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public List<User> getUsersByStatus(int status) {
        List<User> users = new ArrayList<>();
        try {
            String sql = "SELECT * FROM User WHERE UserStatus = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, status);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                User user = new User();
                // Set user properties from ResultSet here
                user.setUserID(rs.getInt("UserID"));
                user.setRoleID(rs.getInt("RoleID"));
                user.setMail(rs.getString("Mail"));
                user.setAddress(rs.getString("Address"));
                user.setPhone(rs.getString("Phone"));
                user.setFullname(rs.getString("Fullname"));
                user.setGender(rs.getBoolean("Gender"));
                user.setDob(rs.getDate("DOB"));
                user.setAvatar(rs.getString("Avatar"));
                user.setUserStatus(rs.getBoolean("UserStatus"));
                user.setJoinDate(rs.getDate("join_date"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public List<User> searchUsers(String searchQuery) {
        List<User> users = new ArrayList<>();
        try {
            String sql = "SELECT * FROM User WHERE Fullname LIKE ? OR Mail LIKE ? OR Phone LIKE ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            String searchPattern = "%" + searchQuery + "%";
            statement.setString(1, searchPattern);
            statement.setString(2, searchPattern);
            statement.setString(3, searchPattern);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                // Instantiate User object and set its fields from the result set
                // Add the User object to the 'users' list
                User user = new User();
                // Set user properties from ResultSet here
                user.setUserID(rs.getInt("UserID"));
                user.setRoleID(rs.getInt("RoleID"));
                user.setMail(rs.getString("Mail"));
                user.setAddress(rs.getString("Address"));
                user.setPhone(rs.getString("Phone"));
                user.setFullname(rs.getString("Fullname"));
                user.setGender(rs.getBoolean("Gender"));
                user.setDob(rs.getDate("DOB"));
                user.setAvatar(rs.getString("Avatar"));
                user.setUserStatus(rs.getBoolean("UserStatus"));
                user.setJoinDate(rs.getDate("join_date"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public boolean updateUserInfo(int userID, String fullname, String phone, String address, int gender) {
        try {
            String sql = "UPDATE User SET Fullname = ?, Phone = ?, Address = ?,Gender = ? WHERE UserID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, fullname);
            statement.setString(2, phone);
            statement.setString(3, address);
            statement.setInt(4, gender);
            statement.setInt(5, userID);

            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateUserAvatar(int userID, String avatar) {
        try {
            String sql = "UPDATE User SET Avatar = ? WHERE UserID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, avatar);

            statement.setInt(2, userID);

            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public User getAccountByEmailPass(String mail, String pass) {
        try {
            String sql = "SELECT UserID, RoleID, Mail, Password, Address, Phone, Fullname, Gender, DOB, Avatar, UserStatus, join_date\n"
                    + "FROM user\n"
                    + "WHERE Mail = ? AND Password = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, mail);
            stm.setString(2, pass);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUserID(rs.getInt("UserID"));
                user.setRoleID(rs.getInt("RoleID"));
                user.setMail(rs.getString("Mail"));
                user.setPassword(rs.getString("Password"));
                user.setAddress(rs.getString("Address"));
                user.setPhone(rs.getString("Phone"));
                user.setFullname(rs.getString("Fullname"));
                user.setGender(rs.getBoolean("Gender"));
                user.setDob(rs.getDate("DOB"));
                user.setAvatar(rs.getString("Avatar"));
                user.setUserStatus(rs.getBoolean("UserStatus"));
                user.setJoinDate(rs.getTimestamp("join_date"));
                return user;
            }
        } catch (SQLException ex) {

        }
        return null;
    }

    public void updatePass(String mail, String newpass) {
        try {
            String sql = "UPDATE User SET Password = ? WHERE Mail = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, newpass);
            statement.setString(2, mail);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public User getAccountByEmail(String mail) {
        try {
            String sql = "SELECT UserID, RoleID, Mail, Password, Address, Phone, Fullname, Gender, DOB, Avatar, UserStatus, join_date\n"
                    + "FROM user\n"
                    + "WHERE Mail = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, mail);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUserID(rs.getInt("UserID"));
                user.setRoleID(rs.getInt("RoleID"));
                user.setMail(rs.getString("Mail"));
                user.setPassword(rs.getString("Password"));
                user.setAddress(rs.getString("Address"));
                user.setPhone(rs.getString("Phone"));
                user.setFullname(rs.getString("Fullname"));
                user.setGender(rs.getBoolean("Gender"));
                user.setDob(rs.getDate("DOB"));
                user.setAvatar(rs.getString("Avatar"));
                user.setUserStatus(rs.getBoolean("UserStatus"));
                user.setJoinDate(rs.getTimestamp("join_date"));
                return user;
            }
        } catch (SQLException ex) {

        }
        return null;
    }

    public void UpdateUser(int accountID, String fullname, String address, String phone) {
        try {
            String sql = "UPDATE user\n"
                    + "SET Fullname = ?, Address = ?, Phone = ?, Gender = ?\n"
                    + "WHERE UserID = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, fullname);
            stm.setString(2, address);
            stm.setString(3, phone);
            stm.setInt(4, accountID);
            stm.executeUpdate();
            stm.close();
            connection.close();
        } catch (SQLException ex) {

        }
    }

    public void UpdateImagePro5(int accountID, String avatar) {
        try {
            String sql = "UPDATE user\n"
                    + "SET Avatar = ?"
                    + "WHERE UserID = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, avatar);
            stm.setInt(2, accountID);
            stm.executeUpdate();
            stm.close();
            connection.close();
        } catch (SQLException ex) {

        }
    }

    public ArrayList<User> getUserByRoleID(int RoleID) {
        ArrayList<User> list = new ArrayList<>();
        try {
            String sql = "SELECT UserID, RoleID, Mail, PassWord, Address, Phone, Fullname, Gender, DOB, Avatar, UserStatus, join_date\n"
                    + "FROM user\n"
                    + "WHERE RoleID = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, RoleID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserID(rs.getInt("UserID"));
                user.setRoleID(rs.getInt("RoleID"));
                user.setMail(rs.getString("Mail"));
                user.setPassword(rs.getString("PassWord"));
                user.setAddress(rs.getString("Address"));
                user.setPhone(rs.getString("Phone"));
                user.setFullname(rs.getString("Fullname"));
                user.setGender(rs.getBoolean("Gender"));
                user.setDob(rs.getDate("DOB"));
                user.setAvatar(rs.getString("Avatar"));
                user.setUserStatus(rs.getBoolean("UserStatus"));
                user.setJoinDate(rs.getTimestamp("join_date"));
                list.add(user);
            }
            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<User> getListByPage(ArrayList<User> list, int start, int end) {
        ArrayList<User> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public ArrayList<User> searchCustomer(String Fullname, String Mail, String Phone, String StatusSearch) {
        ArrayList<User> list = new ArrayList<>();
        try {
            String sql = "SELECT UserID, RoleID, Mail, Password, Address, Phone, Fullname, Gender, DOB, Avatar, UserStatus, join_date\n"
                    + "FROM user\n"
                    + "WHERE RoleID = 1 AND Fullname LIKE ? AND Mail LIKE ? AND PHONE LIKE ? AND UserStatus LIKE ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + Fullname + "%");
            stm.setString(2, "%" + Mail + "%");
            stm.setString(3, "%" + Phone + "%");
            stm.setString(4, "%" + StatusSearch + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserID(rs.getInt("UserID"));
                user.setRoleID(rs.getInt("RoleID"));
                user.setMail(rs.getString("Mail"));
                user.setPassword(rs.getString("PassWord"));
                user.setAddress(rs.getString("Address"));
                user.setPhone(rs.getString("Phone"));
                user.setFullname(rs.getString("Fullname"));
                user.setGender(rs.getBoolean("Gender"));
                user.setDob(rs.getDate("DOB"));
                user.setAvatar(rs.getString("Avatar"));
                user.setUserStatus(rs.getBoolean("UserStatus"));
                user.setJoinDate(rs.getTimestamp("join_date"));
                list.add(user);
            }
            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void updateByUserID(int UserID, String Fullname, String Gender, String Phone, String userStatus) {
        try {
            String sql = "UPDATE user\n"
                    + "SET Fullname = ?, Gender = ?, Phone = ?, UserStatus = ?\n"
                    + "WHERE UserID = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, Fullname);
            stm.setBoolean(2, Boolean.parseBoolean(Gender));
            stm.setString(3, Phone);
            stm.setBoolean(4, Boolean.parseBoolean(userStatus));
            stm.setInt(5, UserID);
            stm.executeUpdate();
        } catch (SQLException ex) {

        }
    }

    public User getUserByUserID(int UserID) {
        try {
            String sql = "SELECT UserID, RoleID, Mail, Password, Address, Phone, Fullname, Gender, DOB, Avatar, UserStatus, join_date\n"
                    + "FROM user\n"
                    + "WHERE UserID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, UserID);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUserID(rs.getInt("UserID"));
                user.setRoleID(rs.getInt("RoleID"));
                user.setMail(rs.getString("Mail"));
                user.setPassword(rs.getString("Password"));
                user.setAddress(rs.getString("Address"));
                user.setPhone(rs.getString("Phone"));
                user.setFullname(rs.getString("Fullname"));
                user.setGender(rs.getBoolean("Gender"));
                user.setDob(rs.getDate("DOB"));
                user.setAvatar(rs.getString("Avatar"));
                user.setUserStatus(rs.getBoolean("UserStatus"));
                user.setJoinDate(rs.getTimestamp("join_date"));
                return user;
            }
        } catch (SQLException ex) {
        }
        return null;
    }

    public void register(User c) {
        // String sql2 = "INSERT INTO `swp3`.`order_detail` (OrderID, ProductID, Quantity, Price) VALUES (?, ?, ?, ?);";
        //  String sql = "INSERT INTO [User] ([UserID], [UserName], [Gender], [Phone], [AccountID], [Address], [Avatar]) VALUES (?, ?, ?, ?, ?, ?, 'avatar1.jpg')";
        String sql = "INSERT INTO `swp3`.`user` (UserID, RoleID, Mail, Password, Address, Phone, Fullname, Gender, DOB, Avatar, UserStatus, join_date) \n"
                + "VALUES (?, '1', ?, ?, ?, ?, ?, ?, '1990-01-01', 'avatar1.jpg', '1', '2024-02-23 20:03:48.013');";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, c.getUserID());
            ps.setString(2, c.getMail());
            ps.setString(3, c.getPassword());
            ps.setString(4, c.getAddress());
            ps.setString(5, c.getPhone());
            ps.setString(6, c.getFullname());
            ps.setBoolean(7, c.isGender());

            ps.executeUpdate();
        } catch (SQLException e) {

            e.printStackTrace(); // In lỗi để kiểm tra nguyên nhân
        }
    }

    public int getMaxUserID() {
        int maxUserID = 0;
        try {
            String sql = "SELECT MAX(UserID) FROM User";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery(sql);

            if (resultSet.next()) {
                maxUserID = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ nếu cần
        }
        return maxUserID;
    }

    public boolean existedEmail(String email) {
        String sql = "SELECT * FROM User  WHERE Mail = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
//            status = "Error at existedEmail " + e.getMessage();
        }
        return false;
    }

    public boolean existedPhoneNum(String phoneNum) {
        String sql = "Select * from User where Phone = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phoneNum);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
        }
        return false;
    }

}
