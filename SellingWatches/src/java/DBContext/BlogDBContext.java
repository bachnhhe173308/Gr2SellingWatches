/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.Blog;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;

/**
 *
 * @author pc
 */
public class BlogDBContext extends DBContext2 {

    public List<Blog> getAllBlogList() {
        List<Blog> blogs = new ArrayList<>();
        try {
            String sql = "SELECT b.*, u.Fullname AS author\n"
                    + "                    FROM Blog AS b\n"
                    + "                    INNER JOIN User AS u ON b.UserID = u.UserID\n"
                    + "                    WHERE BlogStatus = 1\n"
                    + "                    ORDER BY b.BlogDate DESC;";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog();
                b.setId(rs.getInt("BlogID"));
                b.setImageUrl(rs.getString("Image"));
                b.setTitle(rs.getString("Title"));
                b.setShortDescription(rs.getString("ShortDescription"));
                blogs.add(b);
            }

        } catch (SQLException ex) {
            Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, ex);

        }
        return blogs;

    }

    public List<Blog> getAllPostList() {
        List<Blog> blogs = new ArrayList<>();
        try {
            String sql = "SELECT b.*, u.Fullname AS author\n"
                    + "FROM Blog AS b\n"
                    + "INNER JOIN User AS u ON b.UserID = u.UserID\n"
                    + "ORDER BY b.BlogDate DESC;";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog();
                b.setId(rs.getInt("BlogID"));
                b.setImageUrl(rs.getString("Image"));
                b.setTitle(rs.getString("Title"));
                b.setShortDescription(rs.getString("ShortDescription"));
                b.setStatus(rs.getInt("BlogStatus"));
                blogs.add(b);
            }

        } catch (SQLException ex) {
            Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, ex);

        }
        return blogs;

    }

    public List<Blog> getTop5() {
        List<Blog> blogs = new ArrayList<>();
        try {
            String sql = "SELECT b.*, u.Fullname AS author\n"
                    + "FROM Blog AS b\n"
                    + "INNER JOIN User AS u ON b.UserID = u.UserID\n"
+ "WHERE BlogStatus = 1\n"
                    + "ORDER BY b.Views DESC\n"
                    + "LIMIT 5;";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog();
                b.setId(rs.getInt("BlogID"));
                b.setTitle(rs.getString("Title"));
                blogs.add(b);
            }

        } catch (SQLException ex) {
            Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, ex);

        }
        return blogs;
    }

    public Blog getAllBlogDetail(int id) {
        Blog b = new Blog();
        try {
            String sql = "SELECT b.*, u.Fullname AS author\n"
                    + "FROM Blog AS b\n"
                    + "INNER JOIN User AS u ON b.UserID = u.UserID\n"
                    + "WHERE BlogID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                b.setId(rs.getInt("BlogID"));
                b.setImageUrl(rs.getString("Image"));
                b.setTitle(rs.getString("Title"));
                b.setContent(rs.getString("Content"));
                b.setTimePost(rs.getString("BlogDate"));
                b.setAuthor(rs.getString("author"));
                b.setShortDescription(rs.getString("ShortDescription"));

            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return b;
    }

    public List<Blog> getBlogListSearch(String searchTerm, int index, int size) {
        List<Blog> blogs = new ArrayList<>();
        try {
            String sql = "SELECT * FROM (\n"
                    + "    SELECT *, ROW_NUMBER() OVER (ORDER BY BlogDate desc) AS r FROM Blog WHERE Title LIKE ? AND BlogStatus = 1\n"
                    + ") AS t\n"
                    + "WHERE r BETWEEN ?*3-2 AND ?*3;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + searchTerm + "%");
            stm.setInt(2, index);
            stm.setInt(3, index);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog();
                b.setId(rs.getInt("BlogID"));
                b.setTitle(rs.getString("Title"));
                b.setImageUrl(rs.getString("Image"));
                b.setShortDescription(rs.getString("ShortDescription"));
                blogs.add(b);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return blogs;

    }

    public List<Blog> getPostListSearch(String searchTerm, int index, int size) {
        List<Blog> blogs = new ArrayList<>();
        try {
            String sql = "SELECT * FROM (\n"
+ "    SELECT *, ROW_NUMBER() OVER (ORDER BY BlogDate desc) AS r FROM Blog WHERE Title LIKE ?\n"
                    + ") AS t\n"
                    + "WHERE r BETWEEN ?*3-2 AND ?*3;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + searchTerm + "%");
            stm.setInt(2, index);
            stm.setInt(3, index);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog();
                b.setId(rs.getInt("BlogID"));
                b.setTitle(rs.getString("Title"));
                b.setImageUrl(rs.getString("Image"));
                b.setShortDescription(rs.getString("ShortDescription"));
                blogs.add(b);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return blogs;

    }

    public int countPage(String search) {
        try {
            String sql = "SELECT COUNT(*) FROM Blog WHERE Title LIKE ? AND BlogStatus = 1;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + search + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return -1;
    }

    public int countPage1(String search) {
        try {
            String sql = "SELECT COUNT(*) FROM Blog WHERE Title LIKE ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + search + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return -1;
    }

    public void createPost(Blog b, int id, String imagePart) throws IOException {
        try {
            String sql_insert = "INSERT INTO Blog (UserID, Title, Content, BlogDate, Image, BlogStatus, ShortDescription)\n"
                    + "VALUES (?, ?, ?, NOW(), ?, 1, ?);";
            PreparedStatement stm = connection.prepareStatement(sql_insert);
            stm.setInt(1, id);
            stm.setString(2, b.getTitle());
            stm.setString(3, b.getContent());
            stm.setString(4, imagePart);
            stm.setString(5, b.getShortDescription());
            stm.executeUpdate();
            stm.close();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editPost(Blog b, int blogId, String imagePart) {
        try {
            String sql_insert = "UPDATE Blog\n"
                    + "SET Title = ?,\n"
                    + "    Content = ?,\n"
                    + "    ShortDescription = ?,\n"
                    + "    Image = ?\n"
                    + "WHERE BlogID = ?";
PreparedStatement stm = connection.prepareStatement(sql_insert);
            stm.setString(1, b.getTitle());
            stm.setString(2, b.getContent());
            stm.setString(3, b.getShortDescription());
            stm.setString(4, imagePart);
            stm.setInt(5, blogId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deletePost(int blogId) {
        try {
            String sql_insert = "DELETE FROM Blog WHERE BlogID = ?;";
            PreparedStatement stm = connection.prepareStatement(sql_insert);
            stm.setInt(1, blogId);
            stm.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void changePostStatus(int statusId, int blogId) {
        try {
            String sql_insert = "update blog \n"
                    + "set BlogStatus = ? \n"
                    + "where BlogID = ?";
            PreparedStatement stm = connection.prepareStatement(sql_insert);
            stm.setInt(1, statusId);
            stm.setInt(2, blogId);
            stm.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public int coutBlogFound(String searchTerm) {
        try {
            String sql_insert = "SELECT COUNT(*) AS total FROM blog WHERE title LIKE ? AND BlogStatus = 1";
            PreparedStatement stm = connection.prepareStatement(sql_insert);
            stm.setString(1, "%" + searchTerm + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt("total");
            }
        } catch (Exception e) {
            Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, e);
        }

        return -1;
    }

    public int coutPostFound(String searchTerm) {
        try {
            String sql_insert = "SELECT COUNT(*) AS total FROM blog WHERE title LIKE ?";
            PreparedStatement stm = connection.prepareStatement(sql_insert);
            stm.setString(1, "%" + searchTerm + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt("total");
            }
        } catch (Exception e) {
            Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, e);
        }

        return -1;
    }

}