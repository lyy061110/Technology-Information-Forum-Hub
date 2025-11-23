// PostDAO.java
package DAO;

import Entity.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDAO {
    private Connection connection;

    public PostDAO(Connection connection) {
        this.connection = connection;
    }

    public boolean createPost(Post post) {
        String sql = "INSERT INTO posts (title, content, author_id, category_id) VALUES (?, ?, ?, ?)";
        PreparedStatement stmt = null;

        try {
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, post.getTitle());
            stmt.setString(2, post.getContent());
            stmt.setInt(3, post.getAuthorId());
            stmt.setInt(4, post.getCategoryId());

            int result = stmt.executeUpdate();
            System.out.println("发帖成功: " + post.getTitle());
            return result > 0;

        } catch (SQLException e) {
            System.err.println("发帖失败: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (stmt != null) stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // 可以添加其他方法，如获取帖子列表等
    public ResultSet getPostsByCategory(int categoryId) {
        // 实现获取指定版块帖子的逻辑
        return null;
    }

    // 在 PostDAO.java 中添加
    public List<Post> getHotPosts(int limit) {
        List<Post> posts = new ArrayList<>();
        String sql = "SELECT p.*, u.username as author_name " +
                "FROM posts p " +
                "LEFT JOIN users u ON p.author_id = u.id " +
                "ORDER BY p.reply_count DESC, p.view_count DESC " +
                "LIMIT ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, limit);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Post post = new Post();
                post.setId(rs.getInt("id"));
                post.setTitle(rs.getString("title"));
                post.setContent(rs.getString("content"));
                post.setAuthorId(rs.getInt("author_id"));
                post.setCategoryId(rs.getInt("category_id"));
                post.setViewCount(rs.getInt("view_count"));
                post.setReplyCount(rs.getInt("reply_count"));
                post.setHot(rs.getBoolean("is_hot"));
                post.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                post.setAuthorName(rs.getString("author_name"));
                posts.add(post);
            }
        } catch (SQLException e) {
            System.err.println("获取热门帖子失败: " + e.getMessage());
            e.printStackTrace();
        }
        return posts;
    }
}