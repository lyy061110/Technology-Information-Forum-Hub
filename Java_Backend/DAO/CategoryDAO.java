// CategoryDAO.java
package DAO;

import Entity.Category;  // 修改包名引用
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {
    private Connection connection;

    public CategoryDAO(Connection connection) {
        this.connection = connection;
    }

    public List<Category> getAllCategories() {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT * FROM categories ORDER BY id";

        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                categories.add(mapResultSetToCategory(rs));
            }
            System.out.println("成功获取 " + categories.size() + " 个分类");

        } catch (SQLException e) {
            System.err.println("获取分类列表失败: " + e.getMessage());
            e.printStackTrace();
        }
        return categories;
    }

    /**
     * 根据ID获取分类
     */
    public Category getCategoryById(int categoryId) {
        String sql = "SELECT * FROM categories WHERE id = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, categoryId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return mapResultSetToCategory(rs);
            }
        } catch (SQLException e) {
            System.err.println("根据ID获取分类失败: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 更新分类的帖子统计信息
     */
    public boolean updateCategoryStats(int categoryId) {
        String updatePostCountSql = "UPDATE categories SET post_count = " +
                "(SELECT COUNT(*) FROM posts WHERE category_id = ?) WHERE id = ?";

        String updateReplyCountSql = "UPDATE categories SET reply_count = " +
                "(SELECT COUNT(*) FROM replies r JOIN posts p ON r.post_id = p.id WHERE p.category_id = ?) WHERE id = ?";

        try (PreparedStatement postStmt = connection.prepareStatement(updatePostCountSql);
             PreparedStatement replyStmt = connection.prepareStatement(updateReplyCountSql)) {

            // 更新帖子数
            postStmt.setInt(1, categoryId);
            postStmt.setInt(2, categoryId);
            postStmt.executeUpdate();

            // 更新回复数
            replyStmt.setInt(1, categoryId);
            replyStmt.setInt(2, categoryId);
            replyStmt.executeUpdate();

            System.out.println("分类 " + categoryId + " 的统计信息已更新");
            return true;

        } catch (SQLException e) {
            System.err.println("更新分类统计信息失败: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 获取热门分类（按帖子数排序）
     */
    public List<Category> getHotCategories(int limit) {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT * FROM categories ORDER BY post_count DESC, reply_count DESC LIMIT ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, limit);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                categories.add(mapResultSetToCategory(rs));
            }
        } catch (SQLException e) {
            System.err.println("获取热门分类失败: " + e.getMessage());
            e.printStackTrace();
        }
        return categories;
    }

    /**
     * 将ResultSet映射为Category对象
     */
    private Category mapResultSetToCategory(ResultSet rs) throws SQLException {
        Category category = new Category();
        category.setId(rs.getInt("id"));
        category.setName(rs.getString("name"));
        category.setDescription(rs.getString("description"));
        category.setIcon(rs.getString("icon"));
        category.setPostCount(rs.getInt("post_count"));
        category.setReplyCount(rs.getInt("reply_count"));
        return category;
    }

    /**
     * 获取分类总数
     */
    public int getCategoryCount() {
        String sql = "SELECT COUNT(*) as count FROM categories";

        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            if (rs.next()) {
                return rs.getInt("count");
            }
        } catch (SQLException e) {
            System.err.println("获取分类总数失败: " + e.getMessage());
            e.printStackTrace();
        }
        return 0;
    }
}