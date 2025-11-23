// LoginServlet.java
package Servlet;

import DAO.UserDAO;
import DAO.DBUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/Technology-Information-Forum-Hub/web_frontend/login")
public class LoginServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 直接转发，保持相对路径
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        System.out.println("收到登录请求 - 用户名: " + username);

        Connection conn = null;
        try {
            conn = DBUtil.getConnection();
            UserDAO userDAO = new UserDAO(conn);

            if (userDAO.validateUser(username, password)) {
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("isLoggedIn", true);

                System.out.println("登录成功，Session设置完成");

                // 重定向到首页
                response.sendRedirect("index.jsp");
            } else {
                request.setAttribute("error", "用户名或密码错误");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.err.println("登录过程发生错误: " + e.getMessage());
            request.setAttribute("error", "系统错误，请稍后重试");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } finally {
            DBUtil.close(conn);
        }
    }
}