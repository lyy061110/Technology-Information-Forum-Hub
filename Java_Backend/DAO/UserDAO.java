// UserDAO.java
package DAO;

import Entity.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    private Connection connection;

    public UserDAO(Connection connection) {
        this.connection = connection;
    }

    public User findByUsername(String username) {
        String sql = "SELECT * FROM users WHERE username = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapResultSetToUser(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // 明确的return
    }

    public boolean createUser(String username, String password) {
        String sql = "INSERT INTO users (username, password) VALUES (?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, username);
            stmt.setString(2, password);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean validateUser(String username, String password) {
        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            return rs.next(); // 明确的return
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // 明确的return
    }

    // 在 UserDAO.java 中添加这个方法
    public int getUserIdByUsername(String username) {
        String sql = "SELECT id FROM users WHERE username = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt("id");
            }
        } catch (SQLException e) {
            System.err.println("获取用户ID失败: " + e.getMessage());
            e.printStackTrace();
        }
        return -1;
    }

    // 新增方法：根据ID获取用户
    public User getUserById(int userId) {
        String sql = "SELECT * FROM users WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapResultSetToUser(rs); // 明确的return
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // 明确的return
    }

    // 新增方法：更新用户统计信息
    public boolean updateUserStats(int userId) {
        String updatePostCountSql = "UPDATE users SET post_count = " +
                "(SELECT COUNT(*) FROM posts WHERE author_id = ?) WHERE id = ?";

        String updateReplyCountSql = "UPDATE users SET reply_count = " +
                "(SELECT COUNT(*) FROM replies WHERE author_id = ?) WHERE id = ?";

        try (PreparedStatement postStmt = connection.prepareStatement(updatePostCountSql);
             PreparedStatement replyStmt = connection.prepareStatement(updateReplyCountSql)) {

            // 更新帖子数
            postStmt.setInt(1, userId);
            postStmt.setInt(2, userId);
            postStmt.executeUpdate();

            // 更新回复数
            replyStmt.setInt(1, userId);
            replyStmt.setInt(2, userId);
            replyStmt.executeUpdate();

            return true; // 明确的return

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // 明确的return
    }

    // 新增方法：获取所有用户
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM users ORDER BY created_at DESC";
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                users.add(mapResultSetToUser(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users; // 明确的return
    }

    // 新增方法：更新用户最后登录时间
    public boolean updateLastLogin(int userId) {
        String sql = "UPDATE users SET last_login = CURRENT_TIMESTAMP WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            return stmt.executeUpdate() > 0; // 明确的return
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // 明确的return
    }

    private User mapResultSetToUser(ResultSet rs) throws SQLException {
        User user = new User();
        user.setId(rs.getInt("id"));
        user.setUsername(rs.getString("username"));
        user.setPassword(rs.getString("password"));
        return user;
    }
}