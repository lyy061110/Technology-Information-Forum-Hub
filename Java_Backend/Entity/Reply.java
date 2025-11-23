// Reply.java
package Entity;

import java.time.LocalDateTime;

public class Reply {
    private int id;
    private int postId;           // 所属帖子ID
    private int authorId;         // 作者ID
    private String content;       // 回复内容
    private LocalDateTime createdAt; // 创建时间
    private String authorName;    // 作者用户名（用于显示）
    private String authorAvatar;  // 作者头像
    private int likeCount;        // 点赞数
    private int floorNumber;      // 楼层数

    // 默认构造器
    public Reply() {}

    // 创建回复用构造器
    public Reply(int postId, int authorId, String content) {
        this.postId = postId;
        this.authorId = authorId;
        this.content = content;
        this.createdAt = LocalDateTime.now();
        this.likeCount = 0;
    }

    // 完整构造器
    public Reply(int id, int postId, int authorId, String content,
                 LocalDateTime createdAt, String authorName) {
        this.id = id;
        this.postId = postId;
        this.authorId = authorId;
        this.content = content;
        this.createdAt = createdAt;
        this.authorName = authorName;
    }

    // Getter 和 Setter 方法
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getAuthorId() {
        return authorId;
    }

    public void setAuthorId(int authorId) {
        this.authorId = authorId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public String getAuthorAvatar() {
        return authorAvatar;
    }

    public void setAuthorAvatar(String authorAvatar) {
        this.authorAvatar = authorAvatar;
    }

    public int getLikeCount() {
        return likeCount;
    }

    public void setLikeCount(int likeCount) {
        this.likeCount = likeCount;
    }

    public int getFloorNumber() {
        return floorNumber;
    }

    public void setFloorNumber(int floorNumber) {
        this.floorNumber = floorNumber;
    }

    @Override
    public String toString() {
        return "Reply{" +
                "id=" + id +
                ", postId=" + postId +
                ", authorId=" + authorId +
                ", authorName='" + authorName + '\'' +
                ", content='" + (content != null ? content.substring(0, Math.min(50, content.length())) : "") + "..." + '\'' +
                ", createdAt=" + createdAt +
                '}';
    }

    /**
     * 获取格式化后的创建时间
     */
    public String getFormattedCreatedAt() {
        if (createdAt == null) return "";

        LocalDateTime now = LocalDateTime.now();
        java.time.Duration duration = java.time.Duration.between(createdAt, now);

        if (duration.toMinutes() < 1) {
            return "刚刚";
        } else if (duration.toHours() < 1) {
            return duration.toMinutes() + "分钟前";
        } else if (duration.toHours() < 24) {
            return duration.toHours() + "小时前";
        } else {
            return createdAt.format(java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
        }
    }
}