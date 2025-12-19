<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-theme="light">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Technology Information Forum Hub</title>
    <!-- 字体设置 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
    <!-- FontAwesome CSS -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <!-- 主题样式 -->
    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }
      
      :root {
        --primary-color: #0078d4;
        --secondary-color: #00a8ff;
        --background-color: #ffffff;
        --text-color: #333333;
        --text-light: #666666;
        --border-color: #e0e0e0;
        --card-background: #ffffff;
        --hover-background: #f8f9fa;
        --shadow: 0 2px 10px rgba(0,0,0,0.05);
      }
      
      [data-theme="dark"] {
        --primary-color: #00a8ff;
        --secondary-color: #0078d4;
        --background-color: #1a1a1a;
        --text-color: #ffffff;
        --text-light: #b0b0b0;
        --border-color: #333333;
        --card-background: #2d2d2d;
        --hover-background: #3a3a3a;
        --shadow: 0 2px 10px rgba(0,0,0,0.2);
      }
      
      body {
        font-family: 'Open Sans', 'Microsoft YaHei', sans-serif;
        background-color: var(--background-color);
        color: var(--text-color);
        min-height: 100vh;
        transition: all 0.3s ease;
      }
      
      /* 头部导航 */
      header {
        background: var(--card-background);
        border-bottom: 2px solid var(--border-color);
        box-shadow: var(--shadow);
        position: sticky;
        top: 0;
        z-index: 100;
        transition: all 0.3s ease;
      }
      
      .header-content {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0.75rem 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
      }
      
      .logo {
        font-size: 1.5rem;
        font-weight: 700;
        text-decoration: none;
        color: var(--text-color);
      }
      
      .user-menu {
        display: flex;
        align-items: center;
        gap: 15px;
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
        background: var(--primary-color);
        color: white;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: 600;
        transition: all 0.3s ease;
      }
      
      .avatar:hover {
        transform: scale(1.1);
        box-shadow: 0 2px 8px rgba(0,120,212,0.3);
      }
      
      .logout-btn {
        background: transparent;
        color: var(--text-color);
        border: 1px solid var(--border-color);
        padding: 8px 20px;
        border-radius: 20px;
        cursor: pointer;
        font-size: 14px;
        transition: all 0.3s ease;
      }
      
      .logout-btn:hover {
        background: var(--hover-background);
        transform: translateY(-1px);
      }
      
      .create-post-btn {
        background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
        color: white;
        border: none;
        padding: 8px 16px;
        border-radius: 20px;
        cursor: pointer;
        font-size: 14px;
        transition: all 0.3s ease;
        font-weight: 600;
      }
      
      .create-post-btn:hover {
        transform: translateY(-1px);
        box-shadow: 0 4px 12px rgba(0,120,212,0.3);
      }
      
      /* 主题切换按钮 */
      .theme-toggle {
        background: transparent;
        color: var(--text-color);
        border: 1px solid var(--border-color);
        padding: 8px;
        border-radius: 50%;
        cursor: pointer;
        font-size: 16px;
        transition: all 0.3s ease;
        width: 35px;
        height: 35px;
        display: flex;
        align-items: center;
        justify-content: center;
      }
      
      .theme-toggle:hover {
        background: var(--hover-background);
        transform: rotate(180deg);
      }
      
      /* 英雄区域 */
      .hero-section {
        position: relative;
        height: 400px;
        overflow: hidden;
        margin-bottom: 30px;
      }
      
      .hero-image {
        width: 100%;
        height: 100%;
        object-fit: cover;
        filter: brightness(0.7);
      }
      
      .hero-content {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        text-align: center;
        color: white;
        z-index: 2;
      }
      
      .hero-title {
        font-size: 2.5rem;
        font-weight: 700;
        margin-bottom: 15px;
        text-shadow: 0 2px 10px rgba(0,0,0,0.5);
      }
      
      .hero-subtitle {
        font-size: 1.2rem;
        font-weight: 300;
        text-shadow: 0 2px 10px rgba(0,0,0,0.5);
      }
      
      /* 主要内容区域 */
      .main-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 20px;
        display: grid;
        grid-template-columns: 1fr 300px;
        gap: 20px;
        margin-bottom: 40px;
      }
      
      /* 论坛板块 */
      .forum-section {
        background: var(--card-background);
        border-radius: 12px;
        padding: 25px;
        box-shadow: var(--shadow);
        transition: all 0.3s ease;
      }
      
      .section-title {
        font-size: 1.5rem;
        color: var(--text-color);
        margin-bottom: 25px;
        padding-bottom: 12px;
        border-bottom: 3px solid var(--primary-color);
        font-weight: 700;
      }
      
      .forum-categories {
        display: grid;
        gap: 18px;
      }
      
      .category {
        display: flex;
        align-items: center;
        padding: 20px;
        background: var(--card-background);
        border: 1px solid var(--border-color);
        border-radius: 12px;
        transition: all 0.3s ease;
        cursor: pointer;
        text-decoration: none;
        color: inherit;
        box-shadow: var(--shadow);
      }
      
      .category:hover {
        background: var(--hover-background);
        transform: translateX(8px);
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
      }
      
      .category-icon {
        font-size: 2.2rem;
        margin-right: 20px;
        width: 60px;
        text-align: center;
      }
      
      .category-info {
        flex: 1;
      }
      
      .category-name {
        font-weight: 700;
        color: var(--text-color);
        margin-bottom: 8px;
        font-size: 1.1rem;
      }
      
      .category-desc {
        font-size: 0.9rem;
        color: var(--text-light);
        line-height: 1.5;
      }
      
      .category-stats {
        text-align: right;
        font-size: 0.85rem;
        color: var(--text-light);
      }
      
      /* 热门帖子 */
      .hot-posts {
        background: var(--card-background);
        border-radius: 12px;
        padding: 25px;
        box-shadow: var(--shadow);
        transition: all 0.3s ease;
      }
      
      .post-list {
        list-style: none;
      }
      
      .post-item {
        padding: 15px 0;
        border-bottom: 1px solid var(--border-color);
        transition: all 0.3s ease;
        cursor: pointer;
      }
      
      .post-item:last-child {
        border-bottom: none;
      }
      
      .post-item:hover {
        background: var(--hover-background);
        margin: 0 -15px;
        padding: 15px 15px;
        border-radius: 8px;
      }
      
      .post-title {
        color: var(--text-color);
        font-size: 0.95rem;
        margin-bottom: 8px;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
        font-weight: 600;
      }
      
      .post-meta {
        font-size: 0.8rem;
        color: var(--text-light);
        display: flex;
        justify-content: space-between;
        align-items: center;
      }
      
      .post-author {
        color: var(--primary-color);
        font-weight: 600;
      }
      
      /* 快速发帖 */
      .quick-post {
        background: var(--card-background);
        border-radius: 12px;
        padding: 25px;
        box-shadow: var(--shadow);
        margin-top: 25px;
        transition: all 0.3s ease;
        text-align: center;
      }
      
      .quick-post h2 {
        margin-bottom: 25px;
      }
      
      .quick-post p {
        color: var(--text-light);
        margin-bottom: 25px;
        font-size: 16px;
        line-height: 1.6;
      }
      
      .post-btn {
        background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
        color: white;
        border: none;
        padding: 12px 30px;
        border-radius: 25px;
        cursor: pointer;
        font-size: 16px;
        transition: all 0.3s ease;
        font-weight: 600;
        text-decoration: none;
        display: inline-block;
      }
      
      .post-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 16px rgba(0,120,212,0.3);
      }
      
      /* 侧边栏统计 */
      .stats-section {
        background: var(--card-background);
        border-radius: 12px;
        padding: 25px;
        box-shadow: var(--shadow);
        margin-top: 25px;
        transition: all 0.3s ease;
      }
      
      .stat-item {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 12px 0;
        border-bottom: 1px solid var(--border-color);
      }
      
      .stat-item:last-child {
        border-bottom: none;
      }
      
      .stat-label {
        color: var(--text-light);
        font-size: 0.9rem;
      }
      
      .stat-value {
        color: var(--primary-color);
        font-weight: 700;
        font-size: 1.1rem;
      }
      
      /* 页脚 */
      footer {
        background: var(--card-background);
        border-top: 1px solid var(--border-color);
        padding: 40px 0;
        margin-top: 40px;
        transition: all 0.3s ease;
      }
      
      .footer-content {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 20px;
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 30px;
      }
      
      .footer-section h3 {
        color: var(--text-color);
        margin-bottom: 20px;
        font-weight: 700;
        font-size: 1.2rem;
      }
      
      .footer-section p {
        color: var(--text-light);
        line-height: 1.6;
        margin-bottom: 20px;
      }
      
      .footer-links {
        list-style: none;
      }
      
      .footer-links li {
        margin-bottom: 12px;
      }
      
      .footer-links a {
        color: var(--text-light);
        text-decoration: none;
        transition: all 0.3s ease;
      }
      
      .footer-links a:hover {
        color: var(--primary-color);
        padding-left: 8px;
      }
      
      .social-icons {
        display: flex;
        gap: 15px;
      }
      
      .social-icon {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background: var(--hover-background);
        display: flex;
        align-items: center;
        justify-content: center;
        color: var(--text-color);
        text-decoration: none;
        transition: all 0.3s ease;
      }
      
      .social-icon:hover {
        background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
        color: white;
        transform: translateY(-2px);
      }
      
      .copyright {
        max-width: 1200px;
        margin: 30px auto 0;
        padding: 20px 0;
        text-align: center;
        color: var(--text-light);
        border-top: 1px solid var(--border-color);
        font-size: 0.9rem;
      }
      
      /* 响应式设计 */
      @media (max-width: 992px) {
        .main-container {
          grid-template-columns: 1fr;
        }
        
        .hero-title {
          font-size: 2rem;
        }
        
        .hero-subtitle {
          font-size: 1rem;
        }
      }
      
      @media (max-width: 768px) {
        .header-content {
          flex-direction: column;
          gap: 15px;
          padding: 15px 20px;
        }
        
        .user-menu {
          width: 100%;
          justify-content: space-between;
        }
        
        .hero-section {
          height: 300px;
        }
        
        .hero-title {
          font-size: 1.5rem;
        }
        
        .hero-subtitle {
          font-size: 0.9rem;
        }
        
        .forum-section,
        .hot-posts,
        .quick-post,
        .stats-section {
          padding: 20px;
        }
        
        .category {
          flex-direction: column;
          text-align: center;
          gap: 15px;
        }
        
        .category-icon {
          margin-right: 0;
        }
        
        .category-stats {
          text-align: center;
        }
        
        .footer-content {
          grid-template-columns: 1fr;
          text-align: center;
        }
        
        .social-icons {
          justify-content: center;
        }
      }
    </style>
  </head>
  <body>
    <!-- 头部导航 -->
    <header>
      <div class="header-content">
        <a href="#" class="logo">💻 Technology Information Forum Hub</a>
        <div class="user-menu">
          <button class="create-post-btn" onclick="window.location.href='create-post.jsp'">
            <i class="fas fa-pen"></i> Post
          </button>
          <div class="user-info">
            <div class="avatar" id="userAvatar">U</div>
            <span id="username">user</span>
          </div>
          <button class="theme-toggle" id="themeToggle" title="Toggle Theme">
            <i class="fas fa-moon"></i>
          </button>
          <button class="logout-btn" onclick="logout()">
            <i class="fas fa-sign-out-alt"></i> Logout
          </button>
        </div>
      </div>
    </header>

    <!-- 英雄区域 -->
    <section class="hero-section">
      <img src="img/news/bg.jpg" alt="Technology Forum Background" class="hero-image">
      <div class="hero-content">
        <h1 class="hero-title">Welcome to Technology Information Forum Hub</h1>
        <p class="hero-subtitle">Explore the latest trends, share knowledge, and connect with tech enthusiasts worldwide</p>
      </div>
    </section>

    <!-- 主要内容区域 -->
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
          <p>
            Want to share your technical insights and ideas? Join our community of tech enthusiasts and experts.
          </p>
          <a href="create-post.jsp" class="post-btn">
            <i class="fas fa-edit"></i> Create New Post
          </a>
          <p style="margin-top: 15px; font-size: 14px;">
            Supports rich text editing, tag management and real-time preview
          </p>
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
                <span><i class="fas fa-comment"></i> 256</span>
              </div>
            </li>
            <li class="post-item" onclick="viewPost(2)">
              <div class="post-title">【Dev】React 19 New Features Deep Dive & Practical Experience</div>
              <div class="post-meta">
                <span class="post-author">Frontend Engineer</span>
                <span><i class="fas fa-comment"></i> 178</span>
              </div>
            </li>
            <li class="post-item" onclick="viewPost(3)">
              <div class="post-title">【Quantum】Quantum Computer Commercial Application Prospects</div>
              <div class="post-meta">
                <span class="post-author">Quantum Physicist</span>
                <span><i class="fas fa-comment"></i> 142</span>
              </div>
            </li>
            <li class="post-item" onclick="viewPost(4)">
              <div class="post-title">【Help】Python Async Programming Performance Optimization</div>
              <div class="post-meta">
                <span class="post-author">Python Developer</span>
                <span><i class="fas fa-comment"></i> 89</span>
              </div>
            </li>
            <li class="post-item" onclick="viewPost(5)">
              <div class="post-title">【Blockchain】Web3.0 Decentralized Social Network Architecture</div>
              <div class="post-meta">
                <span class="post-author">Blockchain Architect</span>
                <span><i class="fas fa-comment"></i> 312</span>
              </div>
            </li>
          </ul>
        </section>

        <!-- Forum Statistics -->
        <section class="stats-section">
          <h3 class="section-title">📊 Forum Statistics</h3>
          <div class="stat-item">
            <span class="stat-label">Total Posts</span>
            <span class="stat-value">7,567</span>
          </div>
          <div class="stat-item">
            <span class="stat-label">Total Replies</span>
            <span class="stat-value">19.3k</span>
          </div>
          <div class="stat-item">
            <span class="stat-label">Registered Users</span>
            <span class="stat-value">15,892</span>
          </div>
          <div class="stat-item">
            <span class="stat-label">Online Users</span>
            <span class="stat-value" style="color: #28a745;">892</span>
          </div>
        </section>
      </aside>
    </div>

    <!-- 页脚 -->
    <footer>
      <div class="footer-content">
        <div class="footer-section">
          <h3>About Tech Forum</h3>
          <p>Technology Information Forum Hub is a platform for tech enthusiasts to share knowledge, discuss trends, and connect with like-minded individuals.</p>
          <div class="social-icons">
            <a href="#" class="social-icon" title="Facebook"><i class="fab fa-facebook-f"></i></a>
            <a href="#" class="social-icon" title="Twitter"><i class="fab fa-twitter"></i></a>
            <a href="#" class="social-icon" title="Instagram"><i class="fab fa-instagram"></i></a>
            <a href="#" class="social-icon" title="GitHub"><i class="fab fa-github"></i></a>
            <a href="#" class="social-icon" title="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
          </div>
        </div>
        <div class="footer-section">
          <h3>Quick Links</h3>
          <ul class="footer-links">
            <li><a href="#">Home</a></li>
            <li><a href="login.jsp">Login</a></li>
            <li><a href="create-post.jsp">Create Post</a></li>
            <li><a href="#">Forum Rules</a></li>
            <li><a href="#">Privacy Policy</a></li>
          </ul>
        </div>
        <div class="footer-section">
          <h3>Contact Us</h3>
          <p>Have questions or suggestions? Feel free to reach out to us.</p>
          <p><i class="fas fa-envelope"></i> info@techforum.com</p>
          <p><i class="fas fa-phone"></i> +1 (555) 123-4567</p>
        </div>
      </div>
      <div class="copyright">
        <p>&copy; 2025 Technology Information Forum Hub. All rights reserved.</p>
      </div>
    </footer>

    <script>
      // 主题切换功能
      const themeToggle = document.getElementById('themeToggle');
      const htmlElement = document.documentElement;
      const themeIcon = themeToggle.querySelector('i');

      // 从本地存储获取主题设置
      const savedTheme = localStorage.getItem('theme');
      if (savedTheme) {
        htmlElement.setAttribute('data-theme', savedTheme);
        updateThemeIcon(savedTheme);
      }

      // 更新主题图标
      function updateThemeIcon(theme) {
        if (theme === 'dark') {
          themeIcon.classList.remove('fa-moon');
          themeIcon.classList.add('fa-sun');
        } else {
          themeIcon.classList.remove('fa-sun');
          themeIcon.classList.add('fa-moon');
        }
      }

      // 切换主题函数
      function toggleTheme() {
        const currentTheme = htmlElement.getAttribute('data-theme');
        const newTheme = currentTheme === 'light' ? 'dark' : 'light';
        htmlElement.setAttribute('data-theme', newTheme);
        localStorage.setItem('theme', newTheme);
        updateThemeIcon(newTheme);
      }

      // 为按钮添加点击事件
      themeToggle.addEventListener('click', toggleTheme);

      // 修改登录状态检查
      function checkLoginStatus() {
        // 检查服务器Session
        const serverLoggedIn = <%= session.getAttribute("isLoggedIn") != null %>;
        const serverUsername = '<%= session.getAttribute("username") != null ? session.getAttribute("username") : "" %>';

        console.log('服务器Session检查:', {
          isLoggedIn: serverLoggedIn,
          username: serverUsername,
          sessionId: '<%= session.getId() %>'
        });

        if (serverLoggedIn && serverUsername) {
          // 服务器Session有效，更新前端显示
          document.getElementById('username').textContent = serverUsername;
          document.getElementById('userAvatar').textContent = serverUsername.charAt(0).toUpperCase();

          // 同时更新localStorage以便下次快速检查
          localStorage.setItem('username', serverUsername);
          localStorage.setItem('isLoggedIn', 'true');

          console.log('使用服务器Session登录');
          return true;
        } else {
          // 检查前端存储
          const localLoggedIn = localStorage.getItem('isLoggedIn');
          const localUsername = localStorage.getItem('username');

          console.log('localStorage检查:', {
            isLoggedIn: localLoggedIn,
            username: localUsername
          });

          if (localLoggedIn === 'true' && localUsername) {
            // 前端存储有效，更新显示
            document.getElementById('username').textContent = localUsername;
            document.getElementById('userAvatar').textContent = localUsername.charAt(0).toUpperCase();
            console.log('使用localStorage登录');
            return true;
          } else {
            // 完全未登录
            console.log('用户未登录，跳转到登录页面');
            window.location.href = 'login.jsp';
            return false;
          }
        }
      }

      // 页面加载时检查
      document.addEventListener('DOMContentLoaded', function() {
        console.log('页面加载完成，开始检查登录状态...');
        if (!checkLoginStatus()) {
          return;
        }

        // 更新页面标题
        const username = document.getElementById('username').textContent;
        document.title = `TechHub Technology Forum - Welcome ${username}`;
      });

      function logout() {
        // 清除所有存储的登录信息
        sessionStorage.removeItem('username');
        sessionStorage.removeItem('isLoggedIn');
        localStorage.removeItem('username');
        localStorage.removeItem('isLoggedIn');
        localStorage.removeItem('theme');

        // 跳转到登出页面或直接跳转登录页
        window.location.href = 'login.jsp';
      }

      function enterCategory(categoryName) {
        if (categoryName === 'AI') {
          window.location.href = 'ai-category.jsp';
        } else {
          alert(`Entering technology forum: ${categoryName}`);
          console.log(`Entering technology forum: ${categoryName}`);
        }
      }

      function viewPost(postId) {
        if (postId === 1) {
          window.location.href = 'post-detail.jsp';
        } else {
          alert(`Viewing post: #${postId}...`);
          console.log(`Viewing post: #${postId}`);
        }
      }
    </script>
  </body>
</html>
