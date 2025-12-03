package DAO;

import java.sql.*;

public class DBUtil {
    private static String url;
    private static String username;
    private static String password;

    static {
        // 修复URL，添加必要的参数
        url = "jdbc:mysql://localhost:3306/arknights_db?" +
                "useUnicode=true&" +              // 使用Unicode字符集
                "characterEncoding=UTF-8&" +      // 字符编码为UTF-8
                "serverTimezone=Asia/Shanghai&" + // 设置时区为中国时区
                "useSSL=false&" +                 // 禁用SSL（开发和测试环境）
                "allowPublicKeyRetrieval=true";   // 允许公钥检索（MySQL 8.x需要）
        username = "root";
        password = "Chen_060521";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("✅ 数据库驱动加载成功");
        } catch (ClassNotFoundException e) {
            System.err.println("❌ 数据库驱动加载失败: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        System.out.println("🔗 尝试连接数据库: " + url);
        try {
            Connection conn = DriverManager.getConnection(url, username, password);
            System.out.println("✅ 数据库连接成功");
            return conn;
        } catch (SQLException e) {
            System.err.println("❌ 数据库连接失败: " + e.getMessage());
            System.err.println("错误代码: " + e.getErrorCode());
            System.err.println("SQL状态: " + e.getSQLState());
            throw e;
        }
    }

    public static void close(Connection conn, Statement stmt, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
                System.out.println("📄 ResultSet已关闭");
            }
            if (stmt != null) {
                stmt.close();
                System.out.println("📝 Statement已关闭");
            }
            if (conn != null) {
                conn.close();
                System.out.println("🔌 Connection已关闭");
            }
        } catch (SQLException e) {
            System.err.println("关闭数据库连接失败: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // 重载方法，方便使用
    public static void close(Connection conn, Statement stmt) {
        close(conn, stmt, null);
    }

    public static void close(Connection conn) {
        close(conn, null, null);
    }
}