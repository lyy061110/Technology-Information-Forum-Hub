package org;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

@WebServlet("/Front-end-section/test-mysql")
public class TestMySQLServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<html><head><title>MySQL测试</title></head><body>");
        out.println("<h1>MySQL连接测试</h1>");

        // 直接测试连接，不通过DBUtil
        String url = "jdbc:mysql://localhost:3306/arknights_db?" +
                "useUnicode=true&characterEncoding=UTF-8&" +
                "serverTimezone=Asia/Shanghai&useSSL=false&" +
                "allowPublicKeyRetrieval=true";
        String username = "root";
        String password = "Chen_060521";

        Connection conn = null;
        try {
            out.println("<h3>步骤1: 加载驱动</h3>");
            Class.forName("com.mysql.cj.jdbc.Driver");
            out.println("<p style='color:green'>✅ MySQL驱动加载成功</p>");

            out.println("<h3>步骤2: 建立连接</h3>");
            conn = DriverManager.getConnection(url, username, password);
            out.println("<p style='color:green'>✅ 数据库连接成功</p>");

            out.println("<h3>步骤3: 测试查询</h3>");
            Statement stmt = conn.createStatement();

            // 测试数据库
            ResultSet rs = stmt.executeQuery("SELECT DATABASE() as db");
            if (rs.next()) {
                out.println("<p>当前数据库: " + rs.getString("db") + "</p>");
            }

            // 测试users表
            rs = stmt.executeQuery("SHOW TABLES LIKE 'users'");
            if (rs.next()) {
                out.println("<p style='color:green'>✅ users表存在</p>");

                // 显示users表数据
                rs = stmt.executeQuery("SELECT * FROM users");
                out.println("<h4>users表数据:</h4>");
                out.println("<table border='1'>");
                out.println("<tr><th>ID</th><th>用户名</th><th>密码</th></tr>");
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getInt("id") + "</td>");
                    out.println("<td>" + rs.getString("username") + "</td>");
                    out.println("<td>" + rs.getString("password") + "</td>");
                    out.println("</tr>");
                }
                out.println("</table>");
            } else {
                out.println("<p style='color:red'>❌ users表不存在</p>");
            }

        } catch (ClassNotFoundException e) {
            out.println("<p style='color:red'>❌ 驱动加载失败: " + e.getMessage() + "</p>");
        } catch (SQLException e) {
            out.println("<p style='color:red'>❌ 数据库错误: " + e.getMessage() + "</p>");
            out.println("<p>SQL状态: " + e.getSQLState() + "</p>");
            out.println("<p>错误码: " + e.getErrorCode() + "</p>");
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    out.println("<p>关闭连接时出错: " + e.getMessage() + "</p>");
                }
            }
        }

        out.println("</body></html>");
    }
}