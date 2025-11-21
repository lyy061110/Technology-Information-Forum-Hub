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
          <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 15px;">
            <h3 class="section-title" style="margin: 0;">🔥 Hot Posts</h3>
            <div style="display: flex; align-items: center; gap: 10px;">
              <span id="syncStatus" style="font-size: 12px; color: #666;">● 已同步</span>
              <button onclick="refreshData()" style="background: none; border: 1px solid #ddd; padding: 5px 10px; border-radius: 4px; cursor: pointer; font-size: 12px; color: #666;" onmouseover="this.style.background='#f8f9fa'" onmouseout="this.style.background='none'">
                🔄 Refresh
              </button>
            </div>
          </div>
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

    <!-- API Mock for Testing -->
    <script>
      // API Mock for Testing Server Synchronization
      // 这个脚本用于模拟服务器API响应，在实际部署时应该移除或修改
      (function() {
          const USE_MOCK_API = true; // 在生产环境中设置为false
          
          if (!USE_MOCK_API) return;
          
          const mockData = {
              hotPosts: {
                  success: true,
                  data: [
                      { id: 1, title: '【AI】GPT-5 Coming Soon? Latest Technical Breakthrough Analysis', author: 'AI Researcher', replies: 256, views: 3421, likes: 189 },
                      { id: 2, title: '【Dev】React 19 New Features Deep Dive & Practical Experience', author: 'Frontend Engineer', replies: 178, views: 2156, likes: 142 },
                      { id: 3, title: '【Quantum】Quantum Computer Commercial Application Prospects', author: 'Quantum Physicist', replies: 142, views: 1876, likes: 98 },
                      { id: 4, title: '【Help】Python Async Programming Performance Optimization', author: 'Python Developer', replies: 89, views: 1234, likes: 67 },
                      { id: 5, title: '【Blockchain】Web3.0 Decentralized Social Network Architecture', author: 'Blockchain Architect', replies: 312, views: 4567, likes: 234 },
                      { id: 6, title: '【AI】Machine Learning Model Deployment Best Practices', author: 'ML Engineer', replies: 145, views: 2890, likes: 156 },
                      { id: 7, title: '【Dev】Microservices Architecture Design Patterns', author: 'System Architect', replies: 203, views: 3678, likes: 189 }
                  ]
              },
              categories: {
                  success: true,
                  data: {
                      'AI': { posts: 2150, replies: 5950 },
                      'Programming': { posts: 1850, replies: 4350 },
                      'Hardware': { posts: 978, replies: 2380 },
                      'Blockchain': { posts: 712, replies: 1980 },
                      'Tech Frontier': { posts: 545, replies: 1480 },
                      'Q&A': { posts: 1580, replies: 3920 }
                  }
              },
              stats: {
                  success: true,
                  data: {
                      totalPosts: 7815,
                      totalReplies: 20060,
                      totalUsers: 16234,
                      onlineUsers: 945,
                      todayPosts: 127,
                      todayReplies: 389
                  }
              }
          };
          
          function simulateNetworkDelay(min = 500, max = 1500) {
              return new Promise(resolve => {
                  const delay = Math.random() * (max - min) + min;
                  setTimeout(resolve, delay);
              });
          }
          
          const originalFetch = window.fetch;
          window.fetch = async function(url, options = {}) {
              console.log('Mock API Request:', url);
              
              if (url.includes('/api/posts/hot')) {
                  await simulateNetworkDelay();
                  return new Response(JSON.stringify(mockData.hotPosts), {
                      status: 200,
                      headers: { 'Content-Type': 'application/json' }
                  });
              }
              
              if (url.includes('/api/categories')) {
                  await simulateNetworkDelay();
                  return new Response(JSON.stringify(mockData.categories), {
                      status: 200,
                      headers: { 'Content-Type': 'application/json' }
                  });
              }
              
              if (url.includes('/api/stats')) {
                  await simulateNetworkDelay();
                  return new Response(JSON.stringify(mockData.stats), {
                      status: 200,
                      headers: { 'Content-Type': 'application/json' }
                  });
              }
              
              return originalFetch.call(this, url, options);
          };
          
          setInterval(() => {
              const randomPost = mockData.hotPosts.data[Math.floor(Math.random() * mockData.hotPosts.data.length)];
              randomPost.replies += Math.floor(Math.random() * 5) + 1;
              randomPost.views += Math.floor(Math.random() * 20) + 5;
              randomPost.likes += Math.floor(Math.random() * 3);
              
              mockData.stats.data.onlineUsers = Math.max(800, mockData.stats.data.onlineUsers + Math.floor(Math.random() * 20) - 10);
              mockData.stats.data.todayReplies += Math.floor(Math.random() * 3);
          }, 10000);
          
          console.log('API Mock initialized - Server synchronization is now using mock data');
      })();
    </script>

    <script>
      // Get logged-in username
      const username = localStorage.getItem('username') || 'User';
      document.getElementById('username').textContent = username;
      document.getElementById('userAvatar').textContent = username.charAt(0).toUpperCase();
      
      // 服务器配置
      const SERVER_CONFIG = {
        baseUrl: 'https://api.techhub.com',
        endpoints: {
          hotPosts: '/posts/hot',
          categories: '/categories',
          stats: '/stats'
        }
      };

      // Mock forum data
      let forumData = {
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
        ],
        stats: {
          totalPosts: 7567,
          totalReplies: 19300,
          totalUsers: 15892,
          onlineUsers: 892
        }
      };

      // 从服务器获取数据
      async function fetchFromServer() {
        try {
          updateSyncStatus('syncing');
          
          // 并行获取所有数据
          const [hotPostsResponse, categoriesResponse, statsResponse] = await Promise.all([
            fetch(SERVER_CONFIG.baseUrl + SERVER_CONFIG.endpoints.hotPosts),
            fetch(SERVER_CONFIG.baseUrl + SERVER_CONFIG.endpoints.categories),
            fetch(SERVER_CONFIG.baseUrl + SERVER_CONFIG.endpoints.stats)
          ]);

          // 检查响应状态
          if (!hotPostsResponse.ok || !categoriesResponse.ok || !statsResponse.ok) {
            throw new Error('服务器响应错误');
          }

          // 解析数据
          const hotPosts = await hotPostsResponse.json();
          const categories = await categoriesResponse.json();
          const stats = await statsResponse.json();

          // 更新数据
          forumData.posts = hotPosts.data || hotPosts || [];
          forumData.categories = categories.data || categories || {};
          forumData.stats = stats.data || stats || {};

          // 保存到缓存
          saveToCache();

          // 更新UI
          updateUI();

          console.log('服务器数据同步成功');
        } catch (error) {
          console.error('从服务器获取数据失败:', error);
          updateSyncStatus('error', error.message);
          
          // 如果服务器不可用，使用模拟数据
          if (error.message.includes('fetch') || error.message.includes('Failed to fetch')) {
            console.log('使用离线模式');
            updateSyncStatus('offline');
            const cachedData = loadFromCache();
            if (cachedData) {
              forumData = cachedData;
              updateUI();
            } else {
              useMockData();
            }
          }
        }
      }

      // 更新同步状态
      function updateSyncStatus(status, message = '') {
        const statusElement = document.getElementById('syncStatus');
        if (statusElement) {
          statusElement.className = `sync-status ${status}`;
          switch(status) {
            case 'syncing':
              statusElement.textContent = '🔄 同步中...';
              break;
            case 'success':
              statusElement.textContent = '✅ 同步成功';
              setTimeout(() => statusElement.textContent = '', 3000);
              break;
            case 'error':
              statusElement.textContent = `❌ 同步失败: ${message}`;
              break;
            case 'offline':
              statusElement.textContent = '📴 离线模式';
              break;
          }
        }
      }

      // 保存到缓存
      function saveToCache() {
        try {
          localStorage.setItem('forumData', JSON.stringify(forumData));
          localStorage.setItem('lastSyncTime', new Date().toISOString());
        } catch (error) {
          console.error('保存缓存失败:', error);
        }
      }

      // 从缓存加载
      function loadFromCache() {
        try {
          const cached = localStorage.getItem('forumData');
          return cached ? JSON.parse(cached) : null;
        } catch (error) {
          console.error('加载缓存失败:', error);
          return null;
        }
      }

      // 使用模拟数据
      function useMockData() {
        console.log('使用模拟数据');
        updateUI();
      }

      // 更新UI
      function updateUI() {
        // 更新热门帖子列表
        const hotPostsList = document.getElementById('hotPostsList');
        if (hotPostsList && forumData.posts) {
          hotPostsList.innerHTML = forumData.posts.map(post => `
            <li class="post-item" onclick="viewPost(${post.id})">
              <div class="post-title">${post.title}</div>
              <div class="post-meta">
                <span class="post-author">${post.author}</span>
                <span>Replies: ${post.replies}</span>
              </div>
            </li>
          `).join('');
        }
      }

      // 初始化时尝试从服务器获取数据
      fetchFromServer();
      
      // Server configuration
      const SERVER_CONFIG = {
        // 在开发环境中使用相对路径，生产环境中使用完整URL
        baseUrl: window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1' 
          ? '' 
          : 'https://api.techhub-forum.com', // 替换为实际的服务器地址
        endpoints: {
          hotPosts: '/api/posts/hot',
          categories: '/api/categories',
          stats: '/api/stats'
        },
        refreshInterval: 30000 // 30秒自动刷新
      };

      // Local storage keys
      const STORAGE_KEYS = {
        hotPosts: 'hotPosts',
        categories: 'categories',
        stats: 'forumStats',
        lastUpdate: 'lastUpdate'
      };

      // Forum data cache
      let forumData = {
        categories: {},
        posts: [],
        stats: {}
      };

      // Initialize data from localStorage or server
      async function initializeData() {
        try {
          // 尝试从localStorage加载缓存数据
          const cachedData = loadFromCache();
          if (cachedData && isCacheValid()) {
            forumData = cachedData;
            updateUI();
          }
          
          // 从服务器获取最新数据
          await fetchFromServer();
        } catch (error) {
          console.error('初始化数据失败:', error);
          // 如果服务器请求失败，使用缓存数据
          const cachedData = loadFromCache();
          if (cachedData) {
            forumData = cachedData;
            updateUI();
          }
        }
      }

      // 从localStorage加载缓存数据
      function loadFromCache() {
        try {
          const cached = {
            categories: JSON.parse(localStorage.getItem(STORAGE_KEYS.categories) || '{}'),
            posts: JSON.parse(localStorage.getItem(STORAGE_KEYS.hotPosts) || '[]'),
            stats: JSON.parse(localStorage.getItem(STORAGE_KEYS.stats) || '{}')
          };
          return cached;
        } catch (error) {
          console.error('加载缓存数据失败:', error);
          return null;
        }
      }

      // 检查缓存是否有效（5分钟内）
      function isCacheValid() {
        const lastUpdate = localStorage.getItem(STORAGE_KEYS.lastUpdate);
        if (!lastUpdate) return false;
        
        const now = Date.now();
        const lastUpdateTime = parseInt(lastUpdate);
        const cacheAge = now - lastUpdateTime;
        
        return cacheAge < 5 * 60 * 1000; // 5分钟
      }

      // 保存数据到localStorage
      function saveToCache() {
        try {
          localStorage.setItem(STORAGE_KEYS.categories, JSON.stringify(forumData.categories));
          localStorage.setItem(STORAGE_KEYS.hotPosts, JSON.stringify(forumData.posts));
          localStorage.setItem(STORAGE_KEYS.stats, JSON.stringify(forumData.stats));
          localStorage.setItem(STORAGE_KEYS.lastUpdate, Date.now().toString());
        } catch (error) {
          console.error('保存缓存数据失败:', error);
        }
      }

      // 从服务器获取数据
      async function fetchFromServer() {
        try {
          // 并行获取所有数据
          const [hotPostsResponse, categoriesResponse, statsResponse] = await Promise.all([
            fetch(SERVER_CONFIG.baseUrl + SERVER_CONFIG.endpoints.hotPosts),
            fetch(SERVER_CONFIG.baseUrl + SERVER_CONFIG.endpoints.categories),
            fetch(SERVER_CONFIG.baseUrl + SERVER_CONFIG.endpoints.stats)
          ]);

          // 检查响应状态
          if (!hotPostsResponse.ok || !categoriesResponse.ok || !statsResponse.ok) {
            throw new Error('服务器响应错误');
          }

          // 解析数据
          const hotPosts = await hotPostsResponse.json();
          const categories = await categoriesResponse.json();
          const stats = await statsResponse.json();

          // 更新数据
          forumData.posts = hotPosts.data || hotPosts || [];
          forumData.categories = categories.data || categories || {};
          forumData.stats = stats.data || stats || {};

          // 保存到缓存
          saveToCache();

          // 更新UI
          updateUI();

          console.log('服务器数据同步成功');
        } catch (error) {
          console.error('从服务器获取数据失败:', error);
          
          // 如果服务器不可用，使用模拟数据
          if (error.message.includes('fetch')) {
            console.log('使用模拟数据');
            useMockData();
          }
        }
      }

      // 使用模拟数据（当服务器不可用时）
      function useMockData() {
        forumData = {
          categories: {
            'AI': { posts: 2100, replies: 5800 },
            'Programming': { posts: 1800, replies: 4200 },
            'Hardware': { posts: 956, replies: 2300 },
            'Blockchain': { posts: 678, replies: 1900 },
            'Tech Frontier': { posts: 523, replies: 1400 },
            'Q&A': { posts: 1500, replies: 3700 }
          },
          posts: [
            { id: 1, title: '【AI】GPT-5 Coming Soon? Latest Technical Breakthrough Analysis', author: 'AI Researcher', replies: 256, views: 3421, likes: 189 },
            { id: 2, title: '【Dev】React 19 New Features Deep Dive & Practical Experience', author: 'Frontend Engineer', replies: 178, views: 2156, likes: 142 },
            { id: 3, title: '【Quantum】Quantum Computer Commercial Application Prospects', author: 'Quantum Physicist', replies: 142, views: 1876, likes: 98 },
            { id: 4, title: '【Help】Python Async Programming Performance Optimization', author: 'Python Developer', replies: 89, views: 1234, likes: 67 },
            { id: 5, title: '【Blockchain】Web3.0 Decentralized Social Network Architecture', author: 'Blockchain Architect', replies: 312, views: 4567, likes: 234 }
          ],
          stats: {
            totalPosts: 7567,
            totalReplies: 19300,
            totalUsers: 15892,
            onlineUsers: 892
          }
        };
        
        saveToCache();
        updateUI();
      }

      // 更新UI显示
      function updateUI() {
        updateHotPosts();
        updateCategories();
        updateStats();
      }

      // 更新热门帖子列表
      function updateHotPosts() {
        const hotPostsList = document.getElementById('hotPostsList');
        if (!hotPostsList || !forumData.posts.length) return;

        hotPostsList.innerHTML = forumData.posts.map(post => `
          <li class="post-item" onclick="viewPost(${post.id})">
            <div class="post-title">${post.title}</div>
            <div class="post-meta">
              <span class="post-author">${post.author}</span>
              <span>Replies: ${post.replies}</span>
              ${post.views ? `<span>Views: ${post.views}</span>` : ''}
              ${post.likes ? `<span>Likes: ${post.likes}</span>` : ''}
            </div>
          </li>
        `).join('');
      }

      // 更新分类统计
      function updateCategories() {
        // 这里可以更新分类页面的统计数据
        Object.keys(forumData.categories).forEach(category => {
          const categoryElement = document.querySelector(`[onclick="enterCategory('${category}')"] .category-stats`);
          if (categoryElement && forumData.categories[category]) {
            categoryElement.innerHTML = `
              <div>${forumData.categories[category].posts} Posts</div>
              <div>${forumData.categories[category].replies} Replies</div>
            `;
          }
        });
      }

      // 更新论坛统计
      function updateStats() {
        if (!forumData.stats) return;

        const statsContainer = document.querySelector('.hot-posts h3.section-title');
        if (statsContainer && statsContainer.textContent === '📊 Forum Statistics') {
          const statsDiv = statsContainer.nextElementSibling;
          if (statsDiv) {
            statsDiv.innerHTML = `
              <div style="padding: 10px 0;">
                <div style="display: flex; justify-content: space-between; margin-bottom: 10px;">
                  <span>Total Posts:</span>
                  <strong>${forumData.stats.totalPosts || '7,567'}</strong>
                </div>
                <div style="display: flex; justify-content: space-between; margin-bottom: 10px;">
                  <span>Total Replies:</span>
                  <strong>${forumData.stats.totalReplies || '19.3k'}</strong>
                </div>
                <div style="display: flex; justify-content: space-between; margin-bottom: 10px;">
                  <span>Registered Users:</span>
                  <strong>${forumData.stats.totalUsers || '15,892'}</strong>
                </div>
                <div style="display: flex; justify-content: space-between;">
                  <span>Online Users:</span>
                  <strong style="color: #28a745;">${forumData.stats.onlineUsers || '892'}</strong>
                </div>
              </div>
            `;
          }
        }
      }

      // 手动刷新数据
      async function refreshData() {
        console.log('手动刷新数据...');
        await fetchFromServer();
      }

      // 设置自动刷新
      function setupAutoRefresh() {
        setInterval(async () => {
          console.log('自动刷新数据...');
          await fetchFromServer();
        }, SERVER_CONFIG.refreshInterval);
      }

      // 页面可见性变化时刷新数据
      function setupVisibilityRefresh() {
        document.addEventListener('visibilitychange', async () => {
          if (!document.hidden) {
            console.log('页面重新可见，刷新数据...');
            await fetchFromServer();
          }
        });
      }
      
      // Update page title
// 更新同步状态显示
      function updateSyncStatus(status, message = '') {
        const statusElement = document.getElementById('syncStatus');
        if (!statusElement) return;
        
        switch(status) {
          case 'syncing':
            statusElement.innerHTML = '● 同步中...';
            statusElement.style.color = '#ffc107';
            break;
          case 'success':
            statusElement.innerHTML = '● 已同步';
            statusElement.style.color = '#28a745';
            break;
          case 'error':
            statusElement.innerHTML = `● 同步失败 ${message}`;
            statusElement.style.color = '#dc3545';
            break;
          case 'offline':
            statusElement.innerHTML = '● 离线模式';
            statusElement.style.color = '#6c757d';
            break;
          default:
            statusElement.innerHTML = '● 未知状态';
            statusElement.style.color = '#666';
        }
      }

      // 更新页面标题
      document.title = `TechHub Technology Forum - Welcome ${username}`;
      
      // Initialize data synchronization
      document.addEventListener('DOMContentLoaded', async () => {
        await initializeData();
        setupAutoRefresh();
        setupVisibilityRefresh();
      });
      
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
      
      // 手动刷新数据
      async function refreshData() {
        console.log('手动刷新数据...');
        const refreshButton = event.target;
        refreshButton.disabled = true;
        refreshButton.textContent = '🔄 刷新中...';
        
        try {
          await fetchFromServer();
          refreshButton.textContent = '✓ 已刷新';
          setTimeout(() => {
            refreshButton.disabled = false;
            refreshButton.textContent = '🔄 Refresh';
          }, 2000);
        } catch (error) {
          refreshButton.textContent = '✗ 失败';
          setTimeout(() => {
            refreshButton.disabled = false;
            refreshButton.textContent = '🔄 Refresh';
          }, 2000);
        }
      }
    </script>
  </body>
</html>