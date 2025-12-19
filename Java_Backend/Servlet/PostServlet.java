package Servlet;

import DAO.PostDAO;
import DAO.UserDAO;
import DAO.DBUtil;
import Entity.Post;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/Front-end-section/create-post")
public class PostServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("=== PostServlet doPost() 开始 ===");
        System.out.println("请求URL: " + request.getRequestURL());

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("isLoggedIn") == null) {
            System.out.println("用户未登录，重定向到登录页面");
            response.sendRedirect("login.jsp");
            return;
        }

        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String categoryIdStr = request.getParameter("categoryId");
        String username = (String) session.getAttribute("username");

        System.out.println("发帖参数:");
        System.out.println("标题: " + title);
        System.out.println("内容长度: " + (content != null ? content.length() : 0));
        System.out.println("版块ID: " + categoryIdStr);
        System.out.println("用户名: " + username);

        // 验证参数
        if (title == null || title.trim().isEmpty() ||
                content == null || content.trim().isEmpty() ||
                categoryIdStr == null || categoryIdStr.trim().isEmpty()) {
            System.out.println("验证失败：必填字段为空");
            request.setAttribute("error", "标题、内容和版块不能为空");
            // 修复：使用正确的转发路径
            request.getRequestDispatcher("/create-post.jsp").forward(request, response);
            return;
        }

        // 额外验证
        if (title.length() > 100) {
            request.setAttribute("error", "标题不能超过100个字符");
            request.getRequestDispatcher("/create-post.jsp").forward(request, response);
            return;
        }

        if (content.length() > 5000) {
            request.setAttribute("error", "内容不能超过5000个字符");
            request.getRequestDispatcher("/create-post.jsp").forward(request, response);
            return;
        }

        Connection conn = null;
        try {
            System.out.println("获取数据库连接...");
            conn = DBUtil.getConnection();
            int categoryId = Integer.parseInt(categoryIdStr);

            // 根据用户名获取用户ID
            System.out.println("获取用户ID...");
            int authorId = getUserIdByUsername(conn, username);
            if (authorId == -1) {
                System.out.println("用户不存在: " + username);
                request.setAttribute("error", "用户信息不存在");
                request.getRequestDispatcher("/create-post.jsp").forward(request, response);
                return;
            }
            System.out.println("用户ID: " + authorId);

            Post post = new Post();
            post.setTitle(title.trim());
            post.setContent(content.trim());
            post.setAuthorId(authorId);
            post.setCategoryId(categoryId);

            PostDAO postDAO = new PostDAO(conn);
            System.out.println("创建帖子...");
            if (postDAO.createPost(post)) {
                // 发帖成功
                System.out.println("发帖成功！");
                session.setAttribute("success", "发帖成功！");

                // 根据不同的categoryId重定向到不同的页面
                String redirectPage;
                switch(categoryId) {
                    case 1: // AI
                        redirectPage = "ai-category.jsp";
                        break;
                    case 2: // 编程
                        redirectPage = "index.jsp"; // 或其他编程板块页面
                        break;
                    default:
                        redirectPage = "index.jsp";
                }

                System.out.println("重定向到: " + redirectPage);
                response.sendRedirect(redirectPage);

            } else {
                System.out.println("发帖失败");
                request.setAttribute("error", "发帖失败，请重试");
                request.getRequestDispatcher("/create-post.jsp").forward(request, response);
            }

        } catch (NumberFormatException e) {
            System.err.println("版块选择无效: " + e.getMessage());
            request.setAttribute("error", "版块选择无效");
            request.getRequestDispatcher("/create-post.jsp").forward(request, response);
        } catch (Exception e) {
            System.err.println("发帖过程发生错误: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("error", "系统错误，请稍后重试");
            request.getRequestDispatcher("/create-post.jsp").forward(request, response);
        } finally {
            DBUtil.close(conn);
        }

        System.out.println("=== PostServlet doPost() 结束 ===");
    }

    /**
     * 根据用户名获取用户ID
     */
    private int getUserIdByUsername(Connection conn, String username) {
        try {
            // 使用UserDAO的方法
            UserDAO userDAO = new UserDAO(conn);

            // 假设UserDAO中有getUserIdByUsername方法
            // 如果没有，我们需要先创建它
            // 临时实现：直接查询数据库
            String sql = "SELECT id FROM users WHERE username = ?";
            var stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            var rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt("id");
            }
        } catch (Exception e) {
            System.err.println("获取用户ID失败: " + e.getMessage());
            e.printStackTrace();
        }
        return -1; // 返回-1表示未找到
    }
}