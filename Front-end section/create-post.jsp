<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-theme="light" lang="zh-CN">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>发布帖子 - TechHub科技论坛</title>
    <!-- 字体设置 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
    <!-- FontAwesome CSS -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
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
      
      /* 主要内容区域 */
      .main-container {
        max-width: 1200px;
        margin: 30px auto;
        padding: 20px;
      }
      
      .breadcrumb {
        margin-bottom: 20px;
        color: var(--text-light);
        font-size: 14px;
      }
      
      .breadcrumb a {
        color: var(--primary-color);
        text-decoration: none;
      }
      
      .breadcrumb a:hover {
        text-decoration: underline;
      }
      
      /* 发帖表单 */
      .post-form-container {
        background: var(--card-background);
        border-radius: 12px;
        padding: 25px;
        box-shadow: var(--shadow);
        transition: all 0.3s ease;
      }
      
      .form-header {
        margin-bottom: 30px;
        padding-bottom: 20px;
        border-bottom: 3px solid var(--primary-color);
      }
      
      .form-title {
        font-size: 1.5rem;
        color: var(--text-color);
        margin-bottom: 10px;
        font-weight: 700;
      }
      
      .form-subtitle {
        color: var(--text-light);
        font-size: 14px;
      }
      
      .form-group {
        margin-bottom: 25px;
      }
      
      .form-label {
        display: block;
        margin-bottom: 8px;
        font-weight: 500;
        color: var(--text-color);
      }
      
      .required {
        color: #dc3545;
      }
      
      .form-input,
      .form-select,
      .form-textarea {
        width: 100%;
        padding: 12px 16px;
        border: 2px solid var(--border-color);
        border-radius: 8px;
        font-size: 14px;
        font-family: inherit;
        background-color: var(--background-color);
        color: var(--text-color);
        transition: all 0.3s ease;
      }
      
      .form-input:focus,
      .form-select:focus,
      .form-textarea:focus {
        outline: none;
        border-color: var(--primary-color);
        box-shadow: 0 0 0 3px rgba(0, 120, 212, 0.1);
      }
      
      .form-textarea {
        min-height: 200px;
        resize: vertical;
        line-height: 1.6;
      }
      
      .form-row {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 20px;
      }
      
      /* 标签输入 */
      .tags-input-container {
        position: relative;
      }
      
      .tags-display {
        display: flex;
        flex-wrap: wrap;
        gap: 8px;
        margin-top: 10px;
      }
      
      .tag {
        background: var(--hover-background);
        color: var(--primary-color);
        padding: 4px 12px;
        border-radius: 16px;
        font-size: 12px;
        display: flex;
        align-items: center;
        gap: 5px;
        border: 1px solid var(--border-color);
      }
      
      .tag-remove {
        cursor: pointer;
        font-weight: bold;
        color: var(--text-light);
      }
      
      .tag-remove:hover {
        color: #dc3545;
      }
      
      /* 编辑器工具栏 */
      .editor-toolbar {
        display: flex;
        gap: 10px;
        padding: 10px;
        background: var(--hover-background);
        border: 2px solid var(--border-color);
        border-bottom: none;
        border-radius: 8px 8px 0 0;
        flex-wrap: wrap;
      }
      
      .toolbar-btn {
        background: var(--card-background);
        border: 1px solid var(--border-color);
        padding: 6px 10px;
        border-radius: 4px;
        cursor: pointer;
        font-size: 14px;
        color: var(--text-color);
        transition: all 0.2s ease;
      }
      
      .toolbar-btn:hover {
        background: var(--hover-background);
      }
      
      .toolbar-btn.active {
        background: var(--primary-color);
        color: white;
        border-color: var(--primary-color);
      }
      
      .toolbar-separator {
        width: 1px;
        background: var(--border-color);
        margin: 0 5px;
      }
      
      /* 表单选项 */
      .form-options {
        display: flex;
        gap: 20px;
        flex-wrap: wrap;
      }
      
      .checkbox-group {
        display: flex;
        align-items: center;
        gap: 8px;
      }
      
      .checkbox-group input[type="checkbox"] {
        width: 16px;
        height: 16px;
      }
      
      /* 按钮组 */
      .form-actions {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 30px;
        padding-top: 20px;
        border-top: 2px solid var(--border-color);
      }
      
      .action-buttons {
        display: flex;
        gap: 15px;
      }
      
      .btn {
        padding: 12px 24px;
        border: none;
        border-radius: 8px;
        font-size: 14px;
        font-weight: 500;
        cursor: pointer;
        transition: all 0.3s ease;
      }
      
      .btn-primary {
        background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
        color: white;
      }
      
      .btn-primary:hover {
        transform: translateY(-1px);
        box-shadow: 0 4px 12px rgba(0,120,212,0.3);
      }
      
      .btn-secondary {
        background: transparent;
        color: var(--text-color);
        border: 1px solid var(--border-color);
      }
      
      .btn-secondary:hover {
        background: var(--hover-background);
      }
      
      .btn-outline {
        background: transparent;
        color: var(--primary-color);
        border: 2px solid var(--primary-color);
      }
      
      .btn-outline:hover {
        background: var(--primary-color);
        color: white;
      }
      
      /* 字符统计 */
      .char-count {
        color: var(--text-light);
        font-size: 12px;
        text-align: right;
        margin-top: 5px;
      }
      
      .char-count.warning {
        color: #ff9800;
      }
      
      .char-count.error {
        color: #dc3545;
      }
      
      /* 预览区域 */
      .preview-container {
        margin-top: 20px;
        padding: 20px;
        background: var(--card-background);
        border-radius: 8px;
        border: 2px solid var(--border-color);
        display: none;
        box-shadow: var(--shadow);
      }
      
      .preview-container.active {
        display: block;
      }
      
      .preview-title {
        font-size: 1.2rem;
        color: var(--text-color);
        margin-bottom: 15px;
        font-weight: 700;
      }
      
      .preview-content {
        line-height: 1.6;
        color: var(--text-color);
      }
      
      /* 响应式设计 */
      @media (max-width: 768px) {
        .form-row {
          grid-template-columns: 1fr;
        }
        
        .header-content {
          flex-direction: column;
          gap: 15px;
          padding: 15px 20px;
        }
        
        .user-menu {
          width: 100%;
          justify-content: space-between;
        }
        
        .form-actions {
          flex-direction: column;
          gap: 15px;
        }
        
        .action-buttons {
          width: 100%;
          justify-content: center;
        }
        
        .btn {
          flex: 1;
        }
      }
      
      /* 动画效果 */
      @keyframes fadeIn {
        from {
          opacity: 0;
          transform: translateY(20px);
        }
        to {
          opacity: 1;
          transform: translateY(0);
        }
      }
      
      .post-form-container {
        animation: fadeIn 0.5s ease;
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
      @media (max-width: 768px) {
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
    <header>
      <div class="header-content">
        <a href="index.html" class="logo">💻 Technology Information Forum Hub</a>
        <div class="user-menu">
          <button class="create-post-btn" onclick="window.location.href='create-post.html'">
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

    <div class="main-container">
      <!-- 面包屑导航 -->
      <div class="breadcrumb">
        <a href="index.html">首页</a> > 
        <span>发布帖子</span>
      </div>

      <!-- 发帖表单 -->
      <div class="post-form-container">
        <div class="form-header">
          <h1 class="form-title">📝 发布新帖子</h1>
          <p class="form-subtitle">分享您的技术见解，与社区成员交流讨论</p>
        </div>

        <form id="postForm">
          <!-- 标题输入 -->
          <div class="form-group">
            <label class="form-label">
              帖子标题 <span class="required">*</span>
            </label>
            <input 
              type="text" 
              id="postTitle" 
              class="form-input" 
              placeholder="请输入一个吸引人的标题..."
              maxlength="100"
              required
            >
            <div class="char-count" id="titleCount">0 / 100</div>
          </div>

          <!-- 板块选择 -->
          <div class="form-row">
            <div class="form-group">
              <label class="form-label">
                选择板块 <span class="required">*</span>
              </label>
              <select id="postCategory" class="form-select" required>
                <option value="">请选择板块</option>
                <option value="人工智能">🤖 人工智能</option>
                <option value="编程开发">💻 编程开发</option>
                <option value="硬件技术">⚡ 硬件技术</option>
                <option value="区块链">🔗 区块链</option>
                <option value="科技前沿">🚀 科技前沿</option>
                <option value="技术问答">❓ 技术问答</option>
              </select>
            </div>

            <div class="form-group">
              <label class="form-label">帖子类型</label>
              <select id="postType" class="form-select">
                <option value="讨论">💬 讨论</option>
                <option value="分享">📤 分享</option>
                <option value="求助">❓ 求助</option>
                <option value="教程">📚 教程</option>
                <option value="新闻">📰 新闻</option>
              </select>
            </div>
          </div>

          <!-- 内容编辑器 -->
          <div class="form-group">
            <label class="form-label">
              帖子内容 <span class="required">*</span>
            </label>
            
            <!-- 编辑器工具栏 -->
            <div class="editor-toolbar">
              <button type="button" class="toolbar-btn" onclick="formatText('bold')">
                <strong>B</strong>
              </button>
              <button type="button" class="toolbar-btn" onclick="formatText('italic')">
                <em>I</em>
              </button>
              <button type="button" class="toolbar-btn" onclick="formatText('underline')">
                <u>U</u>
              </button>
              <div class="toolbar-separator"></div>
              <button type="button" class="toolbar-btn" onclick="insertLink()">
                🔗 链接
              </button>
              <button type="button" class="toolbar-btn" onclick="insertCode()">
                &lt;/&gt; 代码
              </button>
              <button type="button" class="toolbar-btn" onclick="insertQuote()">
                💬 引用
              </button>
              <div class="toolbar-separator"></div>
              <button type="button" class="toolbar-btn" onclick="insertList('ul')">
                • 列表
              </button>
              <button type="button" class="toolbar-btn" onclick="insertList('ol')">
                1. 有序列表
              </button>
            </div>
            
            <textarea 
              id="postContent" 
              class="form-textarea" 
              placeholder="详细描述您的想法，支持Markdown格式..."
              maxlength="5000"
              required
            ></textarea>
            <div class="char-count" id="contentCount">0 / 5000</div>
          </div>

          <!-- 标签输入 -->
          <div class="form-group">
            <label class="form-label">标签</label>
            <div class="tags-input-container">
              <input 
                type="text" 
                id="tagInput" 
                class="form-input" 
                placeholder="输入标签后按回车添加..."
              >
              <div class="tags-display" id="tagsDisplay"></div>
            </div>
          </div>

          <!-- 附加选项 -->
          <div class="form-group">
            <label class="form-label">发布选项</label>
            <div class="form-options">
              <div class="checkbox-group">
                <input type="checkbox" id="allowComments" checked>
                <label for="allowComments">允许评论</label>
              </div>
              <div class="checkbox-group">
                <input type="checkbox" id="isPublic" checked>
                <label for="isPublic">公开可见</label>
              </div>
              <div class="checkbox-group">
                <input type="checkbox" id="sendNotification">
                <label for="sendNotification">接收回复通知</label>
              </div>
            </div>
          </div>

          <!-- 预览区域 -->
          <div class="preview-container" id="previewContainer">
            <div class="preview-title">📋 帖子预览</div>
            <div class="preview-content" id="previewContent"></div>
          </div>

          <!-- 操作按钮 -->
          <div class="form-actions">
            <div class="action-buttons">
              <button type="button" class="btn btn-outline" onclick="previewPost()">
                👁️ 预览
              </button>
              <button type="button" class="btn btn-secondary" onclick="saveDraft()">
                💾 保存草稿
              </button>
              <button type="submit" class="btn btn-primary">
                🚀 发布帖子
              </button>
            </div>
            <button type="button" class="btn btn-outline" onclick="cancelPost()">
              ❌ 取消
            </button>
          </div>
        </form>
      </div>
    </div>

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
            window.location.href = 'login.html';
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
      });

      // 获取登录用户信息
      const username = localStorage.getItem('username') || 'user';
      
      // 标签管理
      const tags = [];
      const tagInput = document.getElementById('tagInput');
      const tagsDisplay = document.getElementById('tagsDisplay');
      
      tagInput.addEventListener('keypress', function(e) {
        if (e.key === 'Enter') {
          e.preventDefault();
          addTag(this.value.trim());
        }
      });
      
      function addTag(tagText) {
        if (tagText && !tags.includes(tagText) && tags.length < 5) {
          tags.push(tagText);
          renderTags();
          tagInput.value = '';
        }
      }
      
      function removeTag(index) {
        tags.splice(index, 1);
        renderTags();
      }
      
      function renderTags() {
        tagsDisplay.innerHTML = tags.map((tag, index) => `
          <span class="tag">
            ${tag}
            <span class="tag-remove" onclick="removeTag(${index})">×</span>
          </span>
        `).join('');
      }
      
      // 字符统计
      const titleInput = document.getElementById('postTitle');
      const contentTextarea = document.getElementById('postContent');
      const titleCount = document.getElementById('titleCount');
      const contentCount = document.getElementById('contentCount');
      
      titleInput.addEventListener('input', function() {
        updateCharCount(this, titleCount, 100);
      });
      
      contentTextarea.addEventListener('input', function() {
        updateCharCount(this, contentCount, 5000);
      });
      
      function updateCharCount(element, countElement, maxLength) {
        const length = element.value.length;
        countElement.textContent = `${length} / ${maxLength}`;
        
        countElement.className = 'char-count';
        if (length > maxLength * 0.9) {
          countElement.className = 'char-count warning';
        }
        if (length >= maxLength) {
          countElement.className = 'char-count error';
        }
      }
      
      // 编辑器功能
      function formatText(command) {
        const textarea = document.getElementById('postContent');
        const start = textarea.selectionStart;
        const end = textarea.selectionEnd;
        const selectedText = textarea.value.substring(start, end);
        
        let formattedText = '';
        switch(command) {
          case 'bold':
            formattedText = `**${selectedText}**`;
            break;
          case 'italic':
            formattedText = `*${selectedText}*`;
            break;
          case 'underline':
            formattedText = `__${selectedText}__`;
            break;
        }
        
        textarea.value = textarea.value.substring(0, start) + formattedText + textarea.value.substring(end);
        textarea.focus();
        textarea.setSelectionRange(start + formattedText.length, start + formattedText.length);
      }
      
      function insertLink() {
        const url = prompt('请输入链接地址:');
        if (url) {
          const textarea = document.getElementById('postContent');
          const start = textarea.selectionStart;
          const linkText = `[链接文本](${url})`;
          textarea.value = textarea.value.substring(0, start) + linkText + textarea.value.substring(start);
          textarea.focus();
        }
      }
      
      function insertCode() {
        const textarea = document.getElementById('postContent');
        const start = textarea.selectionStart;
        const code = '```\n代码内容\n```';
        textarea.value = textarea.value.substring(0, start) + code + textarea.value.substring(start);
        textarea.focus();
      }
      
      function insertQuote() {
        const textarea = document.getElementById('postContent');
        const start = textarea.selectionStart;
        const quote = '> 引用内容';
        textarea.value = textarea.value.substring(0, start) + quote + textarea.value.substring(start);
        textarea.focus();
      }
      
      function insertList(type) {
        const textarea = document.getElementById('postContent');
        const start = textarea.selectionStart;
        const list = type === 'ul' ? '- 列表项' : '1. 列表项';
        textarea.value = textarea.value.substring(0, start) + list + textarea.value.substring(start);
        textarea.focus();
      }
      
      // 预览功能
      function previewPost() {
        const title = document.getElementById('postTitle').value;
        const content = document.getElementById('postContent').value;
        const category = document.getElementById('postCategory').value;
        const type = document.getElementById('postType').value;
        
        if (!title || !content) {
          alert('请先填写标题和内容！');
          return;
        }
        
        const previewContainer = document.getElementById('previewContainer');
        const previewContent = document.getElementById('previewContent');
        
        previewContent.innerHTML = `
          <div style="margin-bottom: 15px;">
            <strong>板块:</strong> ${category} | 
            <strong>类型:</strong> ${type}
          </div>
          <h3 style="color: #333; margin-bottom: 15px;">${title}</h3>
          <div style="white-space: pre-wrap; line-height: 1.6;">${content}</div>
          ${tags.length > 0 ? `
            <div style="margin-top: 15px;">
              <strong>标签:</strong> ${tags.join(', ')}
            </div>
          ` : ''}
        `;
        
        previewContainer.classList.add('active');
        previewContainer.scrollIntoView({ behavior: 'smooth' });
      }
      
      // 保存草稿
      function saveDraft() {
        const draftData = {
          title: document.getElementById('postTitle').value,
          category: document.getElementById('postCategory').value,
          type: document.getElementById('postType').value,
          content: document.getElementById('postContent').value,
          tags: tags,
          timestamp: new Date().toISOString()
        };
        
        localStorage.setItem('postDraft', JSON.stringify(draftData));
        alert('草稿已保存！');
      }
      
      // 加载草稿
      function loadDraft() {
        const draft = localStorage.getItem('postDraft');
        if (draft) {
          const draftData = JSON.parse(draft);
          document.getElementById('postTitle').value = draftData.title || '';
          document.getElementById('postCategory').value = draftData.category || '';
          document.getElementById('postType').value = draftData.type || '';
          document.getElementById('postContent').value = draftData.content || '';
          
          if (draftData.tags && draftData.tags.length > 0) {
            tags.push(...draftData.tags);
            renderTags();
          }
          
          // 更新字符统计
          updateCharCount(document.getElementById('postTitle'), titleCount, 100);
          updateCharCount(document.getElementById('postContent'), contentCount, 5000);
        }
      }
      
      // 发布帖子
      document.getElementById('postForm').addEventListener('submit', function(e) {
        e.preventDefault();
        
        const title = document.getElementById('postTitle').value.trim();
        const category = document.getElementById('postCategory').value;
        const content = document.getElementById('postContent').value.trim();
        const type = document.getElementById('postType').value;
        
        if (!title || !category || !content) {
          alert('请填写所有必填字段！');
          return;
        }
        
        // 构建帖子数据
        const postData = {
          id: Date.now(),
          title: title,
          category: category,
          type: type,
          content: content,
          tags: tags,
          author: username,
          authorAvatar: username.charAt(0).toUpperCase(),
          timestamp: new Date().toISOString(),
          views: 0,
          replies: 0,
          likes: 0,
          allowComments: document.getElementById('allowComments').checked,
          isPublic: document.getElementById('isPublic').checked,
          sendNotification: document.getElementById('sendNotification').checked
        };
        
        // 保存帖子到localStorage（模拟）
        let posts = JSON.parse(localStorage.getItem('forumPosts') || '[]');
        posts.unshift(postData);
        localStorage.setItem('forumPosts', JSON.stringify(posts));
        
        // 清除草稿
        localStorage.removeItem('postDraft');
        
        // 显示成功消息
        alert(`技术分享成功！\n标题: ${title}\n板块: ${category}\n\n正在返回主页...`);
        
        // 跳转回首页
        window.location.href = 'index.html';
      });
      
      // 取消发帖
      function cancelPost() {
        if (confirm('确定要取消发帖吗？未保存的内容将丢失。')) {
          window.location.href = 'index.html';
        }
      }
      
      // 退出登录
      function logout() {
        // 清除所有存储的登录信息
        sessionStorage.removeItem('username');
        sessionStorage.removeItem('isLoggedIn');
        localStorage.removeItem('username');
        localStorage.removeItem('isLoggedIn');
        localStorage.removeItem('theme');

        // 跳转到登出页面或直接跳转登录页
        window.location.href = 'login.html';
      }
      
      // 页面加载时初始化
      document.addEventListener('DOMContentLoaded', function() {
        if (!checkLoginStatus()) {
          return;
        }
        
        // 加载草稿
        loadDraft();
        
        // 更新页面标题
        const username = document.getElementById('username').textContent;
        document.title = `TechHub Technology Forum - Create Post`;
      });
      
      // 快捷键支持
      document.addEventListener('keydown', function(e) {
        // Ctrl+S 保存草稿
        if (e.ctrlKey && e.key === 's') {
          e.preventDefault();
          saveDraft();
        }
        // Ctrl+Enter 发布帖子
        if (e.ctrlKey && e.key === 'Enter') {
          e.preventDefault();
          document.getElementById('postForm').dispatchEvent(new Event('submit'));
        }
      });
    </script>

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
            <li><a href="index.html">Home</a></li>
            <li><a href="login.html">Login</a></li>
            <li><a href="create-post.html">Create Post</a></li>
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
  </body>
</html>