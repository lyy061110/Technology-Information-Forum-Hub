// DBUtil.javaString url = "jdbc:mysql://localhost:3306/arknights_db";
//        String username = "root";
//        String password = "Chen_060521";
// DBUtil.java
package DAO;

import java.sql.*;

public class DBUtil {
    private static String url;
    private static String username;
    private static String password;

    static {
        // 直接赋值给类变量，不要重新声明
        url = "jdbc:mysql://localhost:3306/arknights_db?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai";
        username = "root";
        password = "Chen_060521";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("数据库驱动加载成功");
        } catch (ClassNotFoundException e) {
            System.err.println("数据库驱动加载失败: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        System.out.println("尝试连接数据库: " + url);
        return DriverManager.getConnection(url, username, password);
    }

    public static void close(Connection conn, Statement stmt, ResultSet rs) {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            System.err.println("数据库连接关闭失败: " + e.getMessage());
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