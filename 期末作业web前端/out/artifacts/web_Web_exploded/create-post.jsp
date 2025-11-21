<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>发布帖子 - TechHub科技论坛</title>
    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }
      
      body {
        font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Microsoft YaHei', sans-serif;
        background: linear-gradient(135deg, #f5f6fa 0%, #e9ecef 100%);
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
      
      .nav-links {
        display: flex;
        align-items: center;
        gap: 30px;
      }
      
      .nav-link {
        color: white;
        text-decoration: none;
        transition: opacity 0.3s ease;
      }
      
      .nav-link:hover {
        opacity: 0.8;
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
        
        .back-btn {
          background: #6c757d;
          color: white;
          border: none;
          padding: 8px 16px;
          border-radius: 6px;
          cursor: pointer;
          font-size: 14px;
          transition: all 0.3s ease;
          margin-right: 15px;
        }
        
        .back-btn:hover {
          background: #5a6268;
          transform: translateY(-1px);
        }
      
      /* 主要内容区域 */
      .main-container {
        max-width: 900px;
        margin: 30px auto;
        padding: 0 20px;
      }
      
      .breadcrumb {
        margin-bottom: 20px;
        color: #666;
        font-size: 14px;
      }
      
      .breadcrumb a {
        color: #0078d4;
        text-decoration: none;
      }
      
      .breadcrumb a:hover {
        text-decoration: underline;
      }
      
      /* 发帖表单 */
      .post-form-container {
        background: white;
        border-radius: 12px;
        padding: 30px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.08);
      }
      
      .form-header {
        margin-bottom: 30px;
        padding-bottom: 20px;
        border-bottom: 2px solid #f0f0f0;
      }
      
      .form-title {
        font-size: 1.8rem;
        color: #333;
        margin-bottom: 10px;
      }
      
      .form-subtitle {
        color: #666;
        font-size: 14px;
      }
      
      .form-group {
        margin-bottom: 25px;
      }
      
      .form-label {
        display: block;
        margin-bottom: 8px;
        font-weight: 500;
        color: #333;
      }
      
      .required {
        color: #dc3545;
      }
      
      .form-input,
      .form-select,
      .form-textarea {
        width: 100%;
        padding: 12px 16px;
        border: 2px solid #e0e0e0;
        border-radius: 8px;
        font-size: 14px;
        font-family: inherit;
        transition: all 0.3s ease;
      }
      
      .form-input:focus,
      .form-select:focus,
      .form-textarea:focus {
        outline: none;
        border-color: #0078d4;
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
        background: #e3f2fd;
        color: #1976d2;
        padding: 4px 12px;
        border-radius: 16px;
        font-size: 12px;
        display: flex;
        align-items: center;
        gap: 5px;
      }
      
      .tag-remove {
        cursor: pointer;
        font-weight: bold;
        color: #666;
      }
      
      .tag-remove:hover {
        color: #dc3545;
      }
      
      /* 编辑器工具栏 */
      .editor-toolbar {
        display: flex;
        gap: 10px;
        padding: 10px;
        background: #f8f9fa;
        border: 2px solid #e0e0e0;
        border-bottom: none;
        border-radius: 8px 8px 0 0;
        flex-wrap: wrap;
      }
      
      .toolbar-btn {
        background: white;
        border: 1px solid #ddd;
        padding: 6px 10px;
        border-radius: 4px;
        cursor: pointer;
        font-size: 14px;
        transition: all 0.2s ease;
      }
      
      .toolbar-btn:hover {
        background: #f0f0f0;
      }
      
      .toolbar-btn.active {
        background: #0078d4;
        color: white;
        border-color: #0078d4;
      }
      
      .toolbar-separator {
        width: 1px;
        background: #ddd;
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
        border-top: 2px solid #f0f0f0;
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
        background: #0078d4;
        color: white;
      }
      
      .btn-primary:hover {
        background: #005a9e;
        transform: translateY(-1px);
      }
      
      .btn-secondary {
        background: #6c757d;
        color: white;
      }
      
      .btn-secondary:hover {
        background: #545b62;
      }
      
      .btn-outline {
        background: white;
        color: #0078d4;
        border: 2px solid #0078d4;
      }
      
      .btn-outline:hover {
        background: #0078d4;
        color: white;
      }
      
      /* 字符统计 */
      .char-count {
        color: #666;
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
        background: #f8f9fa;
        border-radius: 8px;
        border: 2px solid #e0e0e0;
        display: none;
      }
      
      .preview-container.active {
        display: block;
      }
      
      .preview-title {
        font-size: 1.2rem;
        color: #333;
        margin-bottom: 15px;
        font-weight: bold;
      }
      
      .preview-content {
        line-height: 1.6;
        color: #555;
      }
      
      /* 响应式设计 */
      @media (max-width: 768px) {
        .form-row {
          grid-template-columns: 1fr;
        }
        
        .nav-links {
          display: none;
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
    </style>
  </head>
  <body>
    <header>
      <div class="header-content">
        <a href="index.html" class="logo">💻 TechHub科技论坛</a>
        <nav class="nav-links">
          <a href="index.html" class="nav-link">首页</a>
          <a href="#" class="nav-link">板块</a>
          <a href="#" class="nav-link">热门</a>
          <a href="create-post.html" class="nav-link">发帖</a>
        </nav>
        <div class="header-right">
          <button class="back-btn" onclick="window.location.href='index.html'">
            🏠 返回主页
          </button>
          <div class="user-info">
            <div class="avatar" id="userAvatar">U</div>
            <span id="username">用户</span>
          </div>
          <button class="logout-btn" onclick="logout()">退出登录</button>
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
      // 获取登录用户信息
      const username = localStorage.getItem('username') || '用户';
      document.getElementById('username').textContent = username;
      document.getElementById('userAvatar').textContent = username.charAt(0).toUpperCase();
      
      // 检查登录状态
      if (!localStorage.getItem('isLoggedIn')) {
        window.location.href = 'login.html';
      }
      
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
        if (confirm('确定要退出登录吗？')) {
          localStorage.removeItem('username');
          localStorage.removeItem('isLoggedIn');
          window.location.href = 'login.html';
        }
      }
      
      // 页面加载时加载草稿
      window.addEventListener('load', function() {
        loadDraft();
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
  </body>
</html>