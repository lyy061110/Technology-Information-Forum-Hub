// PostServlet.java
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

@WebServlet("/Technology-Information-Forum-Hub/web_frontend/createPost")
public class PostServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("isLoggedIn") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String categoryIdStr = request.getParameter("categoryId");
        String username = (String) session.getAttribute("username");

        // 验证参数
        if (title == null || title.trim().isEmpty() ||
                content == null || content.trim().isEmpty() ||
                categoryIdStr == null || categoryIdStr.trim().isEmpty()) {
            request.setAttribute("error", "标题、内容和版块不能为空");
            request.getRequestDispatcher("create-post.jsp").forward(request, response);
            return;
        }

        Connection conn = null;
        try {
            conn = DBUtil.getConnection();
            int categoryId = Integer.parseInt(categoryIdStr);

            // 根据用户名获取用户ID
            int authorId = getUserIdByUsername(conn, username);
            if (authorId == -1) {
                request.setAttribute("error", "用户信息不存在");
                request.getRequestDispatcher("create-post.jsp").forward(request, response);
                return;
            }

            Post post = new Post();
            post.setTitle(title.trim());
            post.setContent(content.trim());
            post.setAuthorId(authorId);
            post.setCategoryId(categoryId);

            PostDAO postDAO = new PostDAO(conn);
            if (postDAO.createPost(post)) {
                // 发帖成功
                session.setAttribute("success", "发帖成功！");
                response.sendRedirect("forum?category=" + categoryId);
            } else {
                request.setAttribute("error", "发帖失败，请重试");
                request.getRequestDispatcher("create-post.jsp").forward(request, response);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "版块选择无效");
            request.getRequestDispatcher("create-post.jsp").forward(request, response);
        } catch (Exception e) {
            System.err.println("发帖过程发生错误: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("error", "系统错误，请稍后重试");
            request.getRequestDispatcher("create-post.jsp").forward(request, response);
        } finally {
            DBUtil.close(conn);
        }
    }

    /**
     * 根据用户名获取用户ID
     */
    private int getUserIdByUsername(Connection conn, String username) {
        UserDAO userDAO = new UserDAO(conn);

        // 需要在UserDAO中添加getUserIdByUsername方法
        // 这里先调用一个假设的方法
        try {
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