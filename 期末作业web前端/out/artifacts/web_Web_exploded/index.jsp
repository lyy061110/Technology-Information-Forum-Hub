<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Technology Information Forum Hub</title>
    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }
      
      body {
        font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Microsoft YaHei', sans-serif;
        background-image: url('./img/news/bg.jpg');
        background-repeat: repeat-x;
        background-attachment: fixed;
        background-position: center top;
        background-size: cover;
        min-height: 100vh;
      }
      
      /* 头部导航 */
      header {
        background: linear-gradient(135deg, #00a8ff 0%, #0078d4 100%);
        color: white;
        padding: 1rem 0;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        position: sticky;
        top: 0;
        z-index: 100;
      }
      
      .header-content {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
      }
      
      .logo {
        font-size: 1.8rem;
        font-weight: bold;
        text-decoration: none;
        color: white;
      }
      
      .user-menu {
        display: flex;
        align-items: center;
        gap: 20px;
      }
      
      .user-info {
        display: flex;
        align-items: center;
        gap: 10px;
      }
      
      .avatar {
        width: 35px;
        height: 35px;
        border-radius: 50%;
        background: rgba(255,255,255,0.3);
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: bold;
      }
      
      .logout-btn {
        background: rgba(255,255,255,0.2);
        color: white;
        border: 1px solid rgba(255,255,255,0.3);
        padding: 8px 20px;
        border-radius: 20px;
        cursor: pointer;
        font-size: 14px;
        transition: all 0.3s ease;
      }
      
      .logout-btn:hover {
        background: rgba(255,255,255,0.3);
        transform: translateY(-1px);
      }
      
      .create-post-btn {
        background: #0078d4;
        color: white;
        border: none;
        padding: 8px 16px;
        border-radius: 6px;
        cursor: pointer;
        font-size: 14px;
        transition: all 0.3s ease;
        margin-right: 15px;
      }
      
      .create-post-btn:hover {
        background: #005a9e;
        transform: translateY(-1px);
      }
      
      /* 主要内容区域 */
      .main-container {
        max-width: 1200px;
        margin: 20px auto;
        padding: 0 20px;
        display: grid;
        grid-template-columns: 1fr 300px;
        gap: 20px;
      }
      
      /* 论坛板块 */
      .forum-section {
        background: transparent;
        border-radius: 10px;
        padding: 20px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
      }
      
      .section-title {
        font-size: 1.4rem;
        color: #333;
        margin-bottom: 20px;
        padding-bottom: 10px;
        border-bottom: 2px solid #0078d4;
      }
      
      .forum-categories {
        display: grid;
        gap: 15px;
      }
      
      .category {
        display: flex;
        align-items: center;
        padding: 15px;
        background: #f8f9fa;
        border-radius: 8px;
        transition: all 0.3s ease;
        cursor: pointer;
        text-decoration: none;
        color: inherit;
      }
      
      .category:hover {
        background: #e9ecef;
        transform: translateX(5px);
      }
      
      .category-icon {
        font-size: 2rem;
        margin-right: 15px;
        width: 50px;
        text-align: center;
      }
      
      .category-info {
        flex: 1;
      }
      
      .category-name {
        font-weight: bold;
        color: #333;
        margin-bottom: 5px;
      }
      
      .category-desc {
        font-size: 0.9rem;
        color: #666;
      }
      
      .category-stats {
        text-align: right;
        font-size: 0.85rem;
        color: #999;
      }
      
      /* 热门帖子 */
      .hot-posts {
        background: transparent;
        border-radius: 10px;
        padding: 20px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
      }
      
      .post-list {
        list-style: none;
      }
      
      .post-item {
        padding: 12px 0;
        border-bottom: 1px solid #eee;
        transition: all 0.3s ease;
        cursor: pointer;
      }
      
      .post-item:last-child {
        border-bottom: none;
      }
      
      .post-item:hover {
        background: #f8f9fa;
        margin: 0 -10px;
        padding: 12px 10px;
      }
      
      .post-title {
        color: #333;
        font-size: 0.95rem;
        margin-bottom: 5px;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
      }
      
      .post-meta {
        font-size: 0.8rem;
        color: #999;
        display: flex;
        justify-content: space-between;
      }
      
      .post-author {
        color: #0078d4;
      }
      
      /* 快速发帖 */
      .quick-post {
        background: transparent;
        border-radius: 10px;
        padding: 20px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        margin-top: 20px;
      }
      
      .post-textarea {
        width: 100%;
        min-height: 100px;
        padding: 12px;
        border: 1px solid #ddd;
        border-radius: 8px;
        resize: vertical;
        font-family: inherit;
        font-size: 14px;
        margin-bottom: 10px;
      }
      
      .post-actions {
        display: flex;
        justify-content: space-between;
        align-items: center;
      }
      
      .post-options {
        display: flex;
        gap: 10px;
      }
      
      .post-btn {
        background: #0078d4;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 6px;
        cursor: pointer;
        font-size: 14px;
        transition: all 0.3s ease;
      }
      
      .post-btn:hover {
        background: #005a9e;
        transform: translateY(-1px);
      }
      
      /* 响应式设计 */
      @media (max-width: 768px) {
        .main-container {
          grid-template-columns: 1fr;
        }
        
        .header-content {
          flex-direction: column;
          gap: 15px;
        }
        
        .category-stats {
          display: none;
        }
      }
    </style>
  </head>
  <body>
    <header>
      <div class="header-content">
        <a href="#" class="logo">💻 Technology Information Forum Hub</a>
        <div class="user-menu">
          <button class="create-post-btn" onclick="window.location.href='create-post.html'">
            ✍️ Post
          </button>
          <div class="user-info">
            <div class="avatar" id="userAvatar">U</div>
            <span id="username">user</span>
          </div>
          <button class="logout-btn" onclick="logout()">Logout</button>
        </div>
      </div>
    </header>

    <div class="main-container">
      <div class="content-area">
        <!-- 论坛板块 -->
        <section class="forum-section">
          <h2 class="section-title">🔬 Technology Forums</h2>
          <div class="forum-categories">
            <a href="#" class="category" onclick="enterCategory('AI')">
              <div class="category-icon">🤖</div>
              <div class="category-info">
                <div class="category-name">AI</div>
                <div class="category-desc">Machine Learning, Deep Learning, AI Applications, Algorithm Discussion</div>
              </div>
              <div class="category-stats">
                <div>2.1k Posts</div>
                <div>5.8k Replies</div>
              </div>
            </a>
            
            <a href="#" class="category" onclick="enterCategory('Programming')">
              <div class="category-icon">💻</div>
              <div class="category-info">
                <div class="category-name">Programming</div>
                <div class="category-desc">Web Development, Mobile Development, Software Engineering, Programming Languages</div>
              </div>
              <div class="category-stats">
                <div>1.8k Posts</div>
                <div>4.2k Replies</div>
              </div>
            </a>
            
            <a href="#" class="category" onclick="enterCategory('Hardware')">
              <div class="category-icon">⚡</div>
              <div class="category-info">
                <div class="category-name">Hardware</div>
                <div class="category-desc">Chip Design, Hardware Architecture, IoT, Embedded Systems</div>
              </div>
              <div class="category-stats">
                <div>956 Posts</div>
                <div>2.3k Replies</div>
              </div>
            </a>
            
            <a href="#" class="category" onclick="enterCategory('Blockchain')">
              <div class="category-icon">🔗</div>
              <div class="category-info">
                <div class="category-name">Blockchain</div>
                <div class="category-desc">Cryptocurrency, Smart Contracts, DeFi, Web3 Technology</div>
              </div>
              <div class="category-stats">
                <div>678 Posts</div>
                <div>1.9k Replies</div>
              </div>
            </a>
            
            <a href="#" class="category" onclick="enterCategory('Tech Frontier')">
              <div class="category-icon">🚀</div>
              <div class="category-info">
                <div class="category-name">Tech Frontier</div>
                <div class="category-desc">Quantum Computing, Biotechnology, New Energy, Space Exploration</div>
              </div>
              <div class="category-stats">
                <div>523 Posts</div>
                <div>1.4k Replies</div>
              </div>
            </a>
            
            <a href="#" class="category" onclick="enterCategory('Q&A')">
              <div class="category-icon">❓</div>
              <div class="category-info">
                <div class="category-name">Q&A</div>
                <div class="category-desc">Programming Questions, Technical Problems, Learning Guidance, Experience Sharing</div>
              </div>
              <div class="category-stats">
                <div>1.5k Posts</div>
                <div>3.7k Replies</div>
              </div>
            </a>
          </div>
        </section>

        <!-- Quick Post -->
        <section class="quick-post">
          <h2 class="section-title">✍️ Quick Post</h2>
          <div style="text-align: center; padding: 40px 20px;">
            <p style="color: #666; margin-bottom: 20px; font-size: 16px;">
              Want to share your technical insights and ideas?
            </p>
            <button class="post-btn" onclick="window.location.href='create-post.html'" style="font-size: 16px; padding: 12px 30px;">
              📝 Create New Post
            </button>
            <p style="color: #999; margin-top: 15px; font-size: 14px;">
              Supports rich text editing, tag management and real-time preview
            </p>
          </div>
        </section>
      </div>

      <!-- 侧边栏 -->
      <aside>
        <!-- Hot Posts -->
        <section class="hot-posts">
          <h3 class="section-title">🔥 Hot Posts</h3>
          <ul class="post-list" id="hotPostsList">
            <li class="post-item" onclick="viewPost(1)">
              <div class="post-title">【AI】GPT-5 Coming Soon? Latest Technical Breakthrough Analysis</div>
              <div class="post-meta">
                <span class="post-author">AI Researcher</span>
                <span>Replies: 256</span>
              </div>
            </li>
            <li class="post-item" onclick="viewPost(2)">
              <div class="post-title">【Dev】React 19 New Features Deep Dive & Practical Experience</div>
              <div class="post-meta">
                <span class="post-author">Frontend Engineer</span>
                <span>Replies: 178</span>
              </div>
            </li>
            <li class="post-item" onclick="viewPost(3)">
              <div class="post-title">【Quantum】Quantum Computer Commercial Application Prospects</div>
              <div class="post-meta">
                <span class="post-author">Quantum Physicist</span>
                <span>Replies: 142</span>
              </div>
            </li>
            <li class="post-item" onclick="viewPost(4)">
              <div class="post-title">【Help】Python Async Programming Performance Optimization</div>
              <div class="post-meta">
                <span class="post-author">Python Developer</span>
                <span>Replies: 89</span>
              </div>
            </li>
            <li class="post-item" onclick="viewPost(5)">
              <div class="post-title">【Blockchain】Web3.0 Decentralized Social Network Architecture</div>
              <div class="post-meta">
                <span class="post-author">Blockchain Architect</span>
                <span>Replies: 312</span>
              </div>
            </li>
          </ul>
        </section>

        <!-- Forum Statistics -->
        <section class="hot-posts" style="margin-top: 20px;">
          <h3 class="section-title">📊 Forum Statistics</h3>
          <div style="padding: 10px 0;">
            <div style="display: flex; justify-content: space-between; margin-bottom: 10px;">
              <span>Total Posts:</span>
              <strong>7,567</strong>
            </div>
            <div style="display: flex; justify-content: space-between; margin-bottom: 10px;">
              <span>Total Replies:</span>
              <strong>19.3k</strong>
            </div>
            <div style="display: flex; justify-content: space-between; margin-bottom: 10px;">
              <span>Registered Users:</span>
              <strong>15,892</strong>
            </div>
            <div style="display: flex; justify-content: space-between;">
              <span>Online Users:</span>
              <strong style="color: #28a745;">892</strong>
            </div>
          </div>
        </section>
      </aside>
    </div>

    <script>
      // Get logged-in username
      const username = localStorage.getItem('username') || 'User';
      document.getElementById('username').textContent = username;
      document.getElementById('userAvatar').textContent = username.charAt(0).toUpperCase();
      
      // Mock forum data
      const forumData = {
        categories: {
          'AI': { posts: 2100, replies: 5800 },
          'Programming': { posts: 1800, replies: 4200 },
          'Hardware': { posts: 956, replies: 2300 },
          'Blockchain': { posts: 678, replies: 1900 },
          'Tech Frontier': { posts: 523, replies: 1400 },
          'Q&A': { posts: 1500, replies: 3700 }
        },
        posts: [
          { id: 1, title: '【AI】GPT-5 Coming Soon? Latest Technical Breakthrough Analysis', author: 'AI Researcher', replies: 256 },
          { id: 2, title: '【Dev】React 19 New Features Deep Dive & Practical Experience', author: 'Frontend Engineer', replies: 178 },
          { id: 3, title: '【Quantum】Quantum Computer Commercial Application Prospects', author: 'Quantum Physicist', replies: 142 },
          { id: 4, title: '【Help】Python Async Programming Performance Optimization', author: 'Python Developer', replies: 89 },
          { id: 5, title: '【Blockchain】Web3.0 Decentralized Social Network Architecture', author: 'Blockchain Architect', replies: 312 }
        ]
      };
      
      // Update page title
      document.title = `TechHub Technology Forum - Welcome ${username}`;
      
      function logout() {
        // Clear login status
        localStorage.removeItem('username');
        localStorage.removeItem('isLoggedIn');
        
        // Redirect to login page
        window.location.href = 'login.html';
      }
      
      // Check login status
      if (!localStorage.getItem('isLoggedIn')) {
        // If not logged in, redirect to login page
        window.location.href = 'login.html';
      }
      
      // Enter category
      function enterCategory(categoryName) {
        if (categoryName === 'AI') {
          // Redirect to AI category page
          window.location.href = 'ai-category.html';
        } else {
          alert(`Entering technology forum: ${categoryName}`);
          // Can redirect to specific category page here
          console.log(`Entering technology forum: ${categoryName}`);
        }
      }
      
      // View post
      function viewPost(postId) {
        if (postId === 1) {
          // Redirect to GPT-5 post detail page
          window.location.href = 'post-detail.html';
        } else {
          alert(`Viewing post: #${postId}...`);
          // Can redirect to specific post page here
          console.log(`Viewing post: #${postId}`);
        }
      }
      
      // Publish post
      function publishPost() {
        const content = document.getElementById('postContent').value.trim();
        const category = document.getElementById('postCategory').value;
        
        if (!content) {
          alert('Please enter post content!');
          return;
        }
        
        // Simulate publishing post
        alert(`Post published to ${category} forum!\nContent: ${content.substring(0, 50)}${content.length > 50 ? '...' : ''}`);
        
        // Clear input field
        document.getElementById('postContent').value = '';
        
        // Can add actual post publishing logic here
        console.log(`Publishing post to ${category}: ${content}`);
      }
      
      // Add Enter key post publishing feature
      document.getElementById('postContent').addEventListener('keydown', function(e) {
        if (e.ctrlKey && e.key === 'Enter') {
          publishPost();
        }
      });
    </script>
  </body>
</html>