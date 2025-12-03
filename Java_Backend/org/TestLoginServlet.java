package org;

import DAO.UserDAO;
import DAO.DBUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

@WebServlet("/Front-end-section/test-login")
public class TestLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        out.println("<html><head><title>登录测试</title></head><body>");
        out.println("<h1>登录测试结果</h1>");
        out.println("<p>测试用户: " + username + "</p>");
        out.println("<p>测试密码: " + password + "</p>");

        Connection conn = null;
        try {
            conn = DBUtil.getConnection();
            UserDAO userDAO = new UserDAO(conn);

            out.println("<h2>1. 检查用户是否存在</h2>");
            boolean userExists = userDAO.findByUsername(username) != null;
            out.println("<p>用户存在: " + userExists + "</p>");

            out.println("<h2>2. 验证用户密码</h2>");
            boolean isValid = userDAO.validateUser(username, password);
            out.println("<p>密码验证: " + isValid + "</p>");

            if (isValid) {
                out.println("<p style='color:green'>✅ 登录测试成功！</p>");
                // 设置session
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("isLoggedIn", true);
                out.println("<p>Session设置完成</p>");
            } else {
                out.println("<p style='color:red'>❌ 登录测试失败</p>");
            }

        } catch (Exception e) {
            out.println("<h2 style='color:red'>❌ 测试过程出错</h2>");
            out.println("<pre>");
            e.printStackTrace(out);
            out.println("</pre>");
        } finally {
            DBUtil.close(conn);
        }

        out.println("<br><a href='testdb.jsp'>返回测试页面</a>");
        out.println("</body></html>");
    }
}