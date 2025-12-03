package Servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/Front-end-section/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("=== LogoutServlet doGet() ===");

        HttpSession session = request.getSession(false);
        if (session != null) {
            String username = (String) session.getAttribute("username");
            System.out.println("用户 " + username + " 正在注销");
            session.invalidate();
        }

        // 重定向到登录页面
        response.sendRedirect("../login.jsp");
    }
}