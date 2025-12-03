package Servlet;

import DAO.UserDAO;
import DAO.DBUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/Front-end-section/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("=== RegisterServlet doGet() ===");
        // 重定向到登录页面
        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("=== RegisterServlet doPost() 开始 ===");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        System.out.println("收到注册请求 - 用户名: " + username);

        // 验证输入
        if (username == null || username.trim().isEmpty()) {
            request.setAttribute("error", "用户名不能为空");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        if (password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "密码不能为空");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        if (username.length() < 3) {
            request.setAttribute("error", "用户名至少需要3个字符");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        if (password.length() < 6) {
            request.setAttribute("error", "密码至少需要6个字符");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        Connection conn = null;
        try {
            conn = DBUtil.getConnection();
            UserDAO userDAO = new UserDAO(conn);

            // 检查用户是否已存在
            if (userDAO.findByUsername(username) != null) {
                request.setAttribute("error", "用户名已存在");
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

                System.out.println("注册成功，用户: " + username);
                System.out.println("自动登录完成，重定向到首页");

                // 重定向到首页
                response.sendRedirect("index.jsp");
            } else {
                request.setAttribute("error", "注册失败，请重试");
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
    }
}