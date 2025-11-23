// RegisterServlet.java
package Servlet;

import DAO.UserDAO;
import DAO.DBUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/Technology-Information-Forum-Hub/web_frontend/register")
public class RegisterServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 直接重定向到登录页面
        response.sendRedirect("login.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        System.out.println("=== 注册请求开始 ===");
        System.out.println("用户名: " + username);

        Connection conn = null;
        try {
            conn = DBUtil.getConnection();
            UserDAO userDAO = new UserDAO(conn);

            // 检查用户是否已存在
            if (userDAO.findByUsername(username) != null) {
                request.setAttribute("error", "用户名已存在");
                System.out.println("用户名已存在");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            // 创建新用户
            boolean created = userDAO.createUser(username, password);
            System.out.println("用户创建结果: " + created);

            if (created) {
                // 注册成功，自动登录
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("isLoggedIn", true);

                System.out.println("注册成功，Session设置完成");
                System.out.println("Session ID: " + session.getId());
                System.out.println("username: " + session.getAttribute("username"));
                System.out.println("isLoggedIn: " + session.getAttribute("isLoggedIn"));

                // 重定向到首页
                response.sendRedirect("index.jsp");
            } else {
                request.setAttribute("error", "注册失败，请重试");
                System.out.println("注册失败");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.err.println("注册过程发生错误: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("error", "系统错误，请稍后重试");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } finally {
            DBUtil.close(conn);
        }

        System.out.println("=== 注册请求结束 ===");
    }
}