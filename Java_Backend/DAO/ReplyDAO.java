// ReplyDAO.java
package DAO;

import Entity.Reply;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReplyDAO {
    private Connection connection;

    public ReplyDAO(Connection connection) {
        this.connection = connection;
    }

    // 创建回复
    public boolean createReply(Reply reply) {
        String sql = "INSERT INTO replies (post_id, author_id, content, floor_number) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, reply.getPostId());
            stmt.setInt(2, reply.getAuthorId());
            stmt.setString(3, reply.getContent());

            // 计算楼层数
            int floorNumber = getNextFloorNumber(reply.getPostId());
            stmt.setInt(4, floorNumber);

            boolean result = stmt.executeUpdate() > 0;
            if (result) {
                System.out.println("回复创建成功，楼层: " + floorNumber);
            }
            return result; // 明确的return

        } catch (SQLException e) {
            System.err.println("创建回复失败: " + e.getMessage());
            e.printStackTrace();
        }
        return false; // 明确的return
    }

    // 根据帖子ID获取回复列表
    public List<Reply> getRepliesByPostId(int postId) {
        List<Reply> replies = new ArrayList<>();
        String sql = "SELECT r.*, u.username as author_name, u.avatar as author_avatar " +
                "FROM replies r " +
                "LEFT JOIN users u ON r.author_id = u.id " +
                "WHERE r.post_id = ? " +
                "ORDER BY r.created_at ASC";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, postId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Reply reply = mapResultSetToReply(rs);
                replies.add(reply);
            }
            System.out.println("成功获取 " + replies.size() + " 条回复");

        } catch (SQLException e) {
            System.err.println("获取回复列表失败: " + e.getMessage());
            e.printStackTrace();
        }
        return replies; // 明确的return
    }

    // 根据回复ID获取单个回复
    public Reply getReplyById(int replyId) {
        String sql = "SELECT r.*, u.username as author_name, u.avatar as author_avatar " +
                "FROM replies r " +
                "LEFT JOIN users u ON r.author_id = u.id " +
                "WHERE r.id = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, replyId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return mapResultSetToReply(rs); // 明确的return
            }

        } catch (SQLException e) {
            System.err.println("根据ID获取回复失败: " + e.getMessage());
            e.printStackTrace();
        }
        return null; // 明确的return
    }

    // 删除回复
    public boolean deleteReply(int replyId) {
        String sql = "DELETE FROM replies WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, replyId);
            boolean result = stmt.executeUpdate() > 0;
            if (result) {
                System.out.println("回复删除成功，ID: " + replyId);
            }
            return result; // 明确的return

        } catch (SQLException e) {
            System.err.println("删除回复失败: " + e.getMessage());
            e.printStackTrace();
        }
        return false; // 明确的return
    }

    // 更新回复内容
    public boolean updateReply(int replyId, String newContent) {
        String sql = "UPDATE replies SET content = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, newContent);
            stmt.setInt(2, replyId);
            return stmt.executeUpdate() > 0; // 明确的return

        } catch (SQLException e) {
            System.err.println("更新回复失败: " + e.getMessage());
            e.printStackTrace();
        }
        return false; // 明确的return
    }

    // 获取回复总数
    public int getTotalReplyCount() {
        String sql = "SELECT COUNT(*) as total FROM replies";
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            if (rs.next()) {
                return rs.getInt("total"); // 明确的return
            }
        } catch (SQLException e) {
            System.err.println("获取回复总数失败: " + e.getMessage());
            e.printStackTrace();
        }
        return 0; // 明确的return
    }

    // 获取用户的所有回复
    public List<Reply> getRepliesByUserId(int userId) {
        List<Reply> replies = new ArrayList<>();
        String sql = "SELECT r.*, u.username as author_name, u.avatar as author_avatar " +
                "FROM replies r " +
                "LEFT JOIN users u ON r.author_id = u.id " +
                "WHERE r.author_id = ? " +
                "ORDER BY r.created_at DESC";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                replies.add(mapResultSetToReply(rs));
            }

        } catch (SQLException e) {
            System.err.println("获取用户回复失败: " + e.getMessage());
            e.printStackTrace();
        }
        return replies; // 明确的return
    }

    // 获取下一个楼层数
    private int getNextFloorNumber(int postId) {
        String sql = "SELECT COALESCE(MAX(floor_number), 0) + 1 as next_floor FROM replies WHERE post_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, postId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt("next_floor"); // 明确的return
            }
        } catch (SQLException e) {
            System.err.println("获取楼层数失败: " + e.getMessage());
            e.printStackTrace();
        }
        return 1; // 明确的return
    }

    // 将ResultSet映射为Reply对象
    private Reply mapResultSetToReply(ResultSet rs) throws SQLException {
        Reply reply = new Reply();
        reply.setId(rs.getInt("id"));
        reply.setPostId(rs.getInt("post_id"));
        reply.setAuthorId(rs.getInt("author_id"));
        reply.setContent(rs.getString("content"));
        reply.setLikeCount(rs.getInt("like_count"));
        reply.setFloorNumber(rs.getInt("floor_number"));
        reply.setAuthorName(rs.getString("author_name"));
        reply.setAuthorAvatar(rs.getString("author_avatar"));
        if (rs.getTimestamp("created_at") != null) {
            reply.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
        }
        return reply; // 明确的return
    }
}