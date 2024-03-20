/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class User {
    private int userID;
    private int roleID;
    private String mail;
    private String password; // Lưu ý: Trong thực tế, mật khẩu không nên được lưu trữ trực tiếp trong đối tượng như vậy
    private String address;
    private String phone;
    private String fullname;
    private boolean gender;
    private java.util.Date dob; // Sử dụng java.util.Date cho kiểu ngày tháng
    private String avatar;
    private boolean userStatus;
    private java.util.Date joinDate; // Sử dụng java.util.Date cho kiểu ngày tháng

    // Constructor không tham số
    public User() {
    }

    // Constructor với tất cả các thuộc tính
    public User(int userID, int roleID, String mail, String password, String address, String phone, String fullname, boolean gender, java.util.Date dob, String avatar, boolean userStatus, java.util.Date joinDate) {
        this.userID = userID;
        this.roleID = roleID;
        this.mail = mail;
        this.password = password;
        this.address = address;
        this.phone = phone;
        this.fullname = fullname;
        this.gender = gender;
        this.dob = dob;
        this.avatar = avatar;
        this.userStatus = userStatus;
        this.joinDate = joinDate;
    }
       // User user = new User(UserID, roleid,email,password,address,phone,username,gender);

    public User(int userID,int roleID ,String mail, String password, String address, String phone, String fullname, boolean gender) {
        this.userID = userID;
        this.roleID=roleID;
        this.mail = mail;
        this.password = password;
        this.address = address;
        this.phone = phone;
        this.fullname = fullname;
        this.gender = gender;
    }
    
    //User user = new User(fullname, mail, address, phone);

    public User(String mail, String address, String phone, String fullname) {
        this.mail = mail;
        this.address = address;
        this.phone = phone;
        this.fullname = fullname;
    }
    
    
    // Getter và Setter cho mỗi thuộc tính
    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public java.util.Date getDob() {
        return dob;
    }

    public void setDob(java.util.Date dob) {
        this.dob = dob;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public boolean isUserStatus() {
        return userStatus;
    }

    public void setUserStatus(boolean userStatus) {
        this.userStatus = userStatus;
    }

    public java.util.Date getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(java.util.Date joinDate) {
        this.joinDate = joinDate;
    }

    // Bạn có thể thêm các phương thức khác như toString() cho việc in đối tượng, hoặc các phương thức xử lý đặc biệt khác
}

