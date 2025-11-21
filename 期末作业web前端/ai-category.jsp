<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI Forum - TechHub Technology Forum</title>
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
            background-attachment: fixed;
            background-position: center top;
            background-size: cover;
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
            max-width: 1200px;
            margin: 30px auto;
            padding: 0 20px;
            display: grid;
            grid-template-columns: 1fr 300px;
            gap: 20px;
        }
        
        .content-area {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        
        /* 板块头部 */
        .category-header {
            background: transparent;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            text-align: center;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        
        .category-icon {
            font-size: 4rem;
            margin-bottom: 15px;
        }
        
        .category-title {
            font-size: 2.5rem;
            margin-bottom: 10px;
            font-weight: bold;
        }
        
        .category-description {
            font-size: 1.1rem;
            opacity: 0.9;
            margin-bottom: 20px;
        }
        
        .category-stats {
            display: flex;
            justify-content: center;
            gap: 30px;
            font-size: 0.9rem;
        }
        
        .stat-item {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        
        .stat-number {
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 5px;
        }
        
        /* 筛选和排序 */
        .filter-bar {
            background: transparent;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
        }
        
        .filter-group {
            display: flex;
            gap: 10px;
            align-items: center;
        }
        
        .filter-label {
            font-weight: 500;
            color: #333;
        }
        
        .filter-select {
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            background: white;
            font-size: 14px;
        }
        
        .create-post-btn {
            background: #0078d4;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }
        
        .create-post-btn:hover {
            background: #0056b3;
            transform: translateY(-1px);
        }
        
        /* 帖子列表 */
        .posts-container {
            background: transparent;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
        }
        
        .post-item {
            background: white;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 15px;
            transition: all 0.3s ease;
            cursor: pointer;
            border-left: 4px solid #0078d4;
        }
        
        .post-item:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(0,0,0,0.1);
        }
        
        .post-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 12px;
        }
        
        .post-title {
            font-size: 1.2rem;
            color: #333;
            font-weight: 600;
            margin-bottom: 8px;
            line-height: 1.4;
        }
        
        .post-tags {
            display: flex;
            gap: 6px;
            flex-wrap: wrap;
        }
        
        .tag {
            background: #e3f2fd;
            color: #1976d2;
            padding: 3px 8px;
            border-radius: 12px;
            font-size: 11px;
            font-weight: 500;
        }
        
        .post-meta {
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: #666;
            font-size: 0.9rem;
        }
        
        .post-author {
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .author-avatar {
            width: 24px;
            height: 24px;
            border-radius: 50%;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 10px;
            font-weight: bold;
        }
        
        .post-stats {
            display: flex;
            gap: 15px;
        }
        
        .post-stat {
            display: flex;
            align-items: center;
            gap: 4px;
        }
        
        .post-content {
            color: #666;
            line-height: 1.6;
            margin: 12px 0;
            font-size: 0.95rem;
        }
        
        /* 侧边栏 */
        .sidebar {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        
        .sidebar-section {
            background: transparent;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
        }
        
        .sidebar-title {
            font-size: 1.2rem;
            color: #333;
            margin-bottom: 15px;
            font-weight: 600;
        }
        
        .trending-item {
            padding: 10px 0;
            border-bottom: 1px solid #f0f0f0;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .trending-item:last-child {
            border-bottom: none;
        }
        
        .trending-item:hover {
            background: #f8f9fa;
            margin: 0 -10px;
            padding: 10px;
        }
        
        .trending-title {
            font-size: 0.9rem;
            color: #333;
            margin-bottom: 4px;
            line-height: 1.3;
        }
        
        .trending-meta {
            font-size: 0.8rem;
            color: #999;
        }
        
        .subcategory-list {
            list-style: none;
        }
        
        .subcategory-item {
            padding: 12px 0;
            border-bottom: 1px solid #f0f0f0;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .subcategory-item:last-child {
            border-bottom: none;
        }
        
        .subcategory-item:hover {
            background: #f8f9fa;
            margin: 0 -10px;
            padding: 12px 10px;
        }
        
        .subcategory-name {
            font-size: 0.95rem;
            color: #333;
        }
        
        .subcategory-count {
            font-size: 0.8rem;
            color: #999;
            background: #f0f0f0;
            padding: 2px 8px;
            border-radius: 12px;
        }
        
        /* 分页 */
        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            margin-top: 30px;
        }
        
        .page-btn {
            padding: 8px 12px;
            border: 1px solid #ddd;
            background: white;
            color: #333;
            text-decoration: none;
            border-radius: 6px;
            transition: all 0.3s ease;
        }
        
        .page-btn:hover {
            background: #0078d4;
            color: white;
            border-color: #0078d4;
        }
        
        .page-btn.active {
            background: #0078d4;
            color: white;
            border-color: #0078d4;
        }
        
        /* 响应式设计 */
        @media (max-width: 768px) {
            .main-container {
                grid-template-columns: 1fr;
            }
            
            .category-title {
                font-size: 2rem;
            }
            
            .filter-bar {
                flex-direction: column;
                align-items: stretch;
            }
            
            .post-header {
                flex-direction: column;
                gap: 10px;
            }
        }
    </style>
</head>
<body>
    <!-- 头部导航 -->
    <header>
        <div class="header-content">
            <div style="display: flex; align-items: center;">
                <button class="back-btn" onclick="window.location.href='index.html'">← Back</button>
                <a href="index.html" class="logo">TechHub</a>
            </div>
            
            <nav class="nav-links">
                <a href="index.html" class="nav-link">Home</a>
                <a href="#" class="nav-link">Categories</a>
                <a href="create-post.html" class="nav-link">✍️ Post</a>
            </nav>
            
            <div class="user-menu">
                <div class="user-info">
                    <div class="avatar" id="userAvatar">U</div>
                    <span id="username">User</span>
                </div>
                <button class="logout-btn" onclick="logout()">Logout</button>
            </div>
        </div>
    </header>

    <!-- 主要内容 -->
    <main class="main-container">
        <div class="content-area">
            <!-- 板块头部 -->
            <section class="category-header">
                <div class="category-icon">🤖</div>
                <h1 class="category-title">AI Forum</h1>
                <p class="category-description">Machine Learning, Deep Learning, AI Applications, Algorithm Discussion</p>
                <div class="category-stats">
                    <div class="stat-item">
                        <div class="stat-number">2,100</div>
                        <div>Posts</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">5,800</div>
                        <div>Replies</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">1,234</div>
                        <div>Members</div>
                    </div>
                </div>
            </section>

            <!-- 筛选和排序 -->
            <section class="filter-bar">
                <div class="filter-group">
                    <label class="filter-label">Sort by:</label>
                    <select class="filter-select" onchange="sortPosts(this.value)">
                        <option value="latest">Latest</option>
                        <option value="popular">Most Popular</option>
                        <option value="replies">Most Replies</option>
                        <option value="views">Most Views</option>
                    </select>
                </div>
                
                <div class="filter-group">
                    <label class="filter-label">Filter:</label>
                    <select class="filter-select" onchange="filterPosts(this.value)">
                        <option value="all">All Topics</option>
                        <option value="machine-learning">Machine Learning</option>
                        <option value="deep-learning">Deep Learning</option>
                        <option value="nlp">Natural Language Processing</option>
                        <option value="computer-vision">Computer Vision</option>
                        <option value="ethics">AI Ethics</option>
                    </select>
                </div>
                
                <a href="create-post.html?category=AI" class="create-post-btn">
                    <span>✍️</span>
                    <span>Create Post</span>
                </a>
            </section>

            <!-- 帖子列表 -->
            <section class="posts-container">
                <div class="post-item" onclick="viewPost(1)">
                    <div class="post-header">
                        <div>
                            <h3 class="post-title">【AI】GPT-5 Coming Soon? Latest Technical Breakthrough Analysis</h3>
                            <div class="post-tags">
                                <span class="tag">GPT-5</span>
                                <span class="tag">Language Models</span>
                                <span class="tag">Analysis</span>
                            </div>
                        </div>
                    </div>
                    <p class="post-content">
                        The artificial intelligence community has been buzzing with speculation about GPT-5. Let's analyze the technical breakthroughs and expectations surrounding this potentially revolutionary AI system...
                    </p>
                    <div class="post-meta">
                        <div class="post-author">
                            <div class="author-avatar">AI</div>
                            <span>AI Researcher</span>
                        </div>
                        <div class="post-stats">
                            <span class="post-stat">👁️ 15.2k</span>
                            <span class="post-stat">💬 256</span>
                            <span class="post-stat">🔥 892</span>
                            <span class="post-stat">📅 2 days ago</span>
                        </div>
                    </div>
                </div>

                <div class="post-item" onclick="viewPost(6)">
                    <div class="post-header">
                        <div>
                            <h3 class="post-title">【Deep Learning】Transformer Architecture Evolution: From BERT to GPT-4</h3>
                            <div class="post-tags">
                                <span class="tag">Transformers</span>
                                <span class="tag">BERT</span>
                                <span class="tag">GPT-4</span>
                            </div>
                        </div>
                    </div>
                    <p class="post-content">
                        A comprehensive analysis of how transformer architectures have evolved over the years, from the original BERT to the latest GPT-4 models. We'll explore the key innovations and improvements...
                    </p>
                    <div class="post-meta">
                        <div class="post-author">
                            <div class="author-avatar">DL</div>
                            <span>Deep Learning Expert</span>
                        </div>
                        <div class="post-stats">
                            <span class="post-stat">👁️ 8.7k</span>
                            <span class="post-stat">💬 142</span>
                            <span class="post-stat">🔥 456</span>
                            <span class="post-stat">📅 3 days ago</span>
                        </div>
                    </div>
                </div>

                <div class="post-item" onclick="viewPost(7)">
                    <div class="post-header">
                        <div>
                            <h3 class="post-title">【Computer Vision】YOLOv8 vs Faster R-CNN: Performance Comparison</h3>
                            <div class="post-tags">
                                <span class="tag">Computer Vision</span>
                                <span class="tag">YOLO</span>
                                <span class="tag">Object Detection</span>
                            </div>
                        </div>
                    </div>
                    <p class="post-content">
                        In-depth comparison between YOLOv8 and Faster R-CNN for object detection tasks. We analyze speed, accuracy, and real-world performance across different datasets and use cases...
                    </p>
                    <div class="post-meta">
                        <div class="post-author">
                            <div class="author-avatar">CV</div>
                            <span>Vision Researcher</span>
                        </div>
                        <div class="post-stats">
                            <span class="post-stat">👁️ 6.3k</span>
                            <span class="post-stat">💬 89</span>
                            <span class="post-stat">🔥 234</span>
                            <span class="post-stat">📅 5 days ago</span>
                        </div>
                    </div>
                </div>

                <div class="post-item" onclick="viewPost(8)">
                    <div class="post-header">
                        <div>
                            <h3 class="post-title">【NLP】Fine-tuning LLMs for Domain-Specific Tasks: Best Practices</h3>
                            <div class="post-tags">
                                <span class="tag">NLP</span>
                                <span class="tag">Fine-tuning</span>
                                <span class="tag">LLMs</span>
                            </div>
                        </div>
                    </div>
                    <p class="post-content">
                        A practical guide to fine-tuning large language models for specific domains. Covering data preparation, hyperparameter tuning, and evaluation metrics for optimal performance...
                    </p>
                    <div class="post-meta">
                        <div class="post-author">
                            <div class="author-avatar">NL</div>
                            <span>NLP Engineer</span>
                        </div>
                        <div class="post-stats">
                            <span class="post-stat">👁️ 4.8k</span>
                            <span class="post-stat">💬 67</span>
                            <span class="post-stat">🔥 189</span>
                            <span class="post-stat">📅 1 week ago</span>
                        </div>
                    </div>
                </div>

                <div class="post-item" onclick="viewPost(9)">
                    <div class="post-header">
                        <div>
                            <h3 class="post-title">【AI Ethics】The Bias Problem in AI Systems: Detection and Mitigation</h3>
                            <div class="post-tags">
                                <span class="tag">AI Ethics</span>
                                <span class="tag">Bias</span>
                                <span class="tag">Fairness</span>
                            </div>
                        </div>
                    </div>
                    <p class="post-content">
                        Exploring the critical issue of bias in artificial intelligence systems. We discuss detection methods, mitigation strategies, and the importance of diverse training data...
                    </p>
                    <div class="post-meta">
                        <div class="post-author">
                            <div class="author-avatar">AE</div>
                            <span>Ethics Researcher</span>
                        </div>
                        <div class="post-stats">
                            <span class="post-stat">👁️ 3.2k</span>
                            <span class="post-stat">💬 45</span>
                            <span class="post-stat">🔥 156</span>
                            <span class="post-stat">📅 1 week ago</span>
                        </div>
                    </div>
                </div>

                <!-- 分页 -->
                <div class="pagination">
                    <a href="#" class="page-btn">←</a>
                    <a href="#" class="page-btn active">1</a>
                    <a href="#" class="page-btn">2</a>
                    <a href="#" class="page-btn">3</a>
                    <a href="#" class="page-btn">4</a>
                    <a href="#" class="page-btn">5</a>
                    <a href="#" class="page-btn">→</a>
                </div>
            </section>
        </div>

        <!-- 侧边栏 -->
        <aside class="sidebar">
            <!-- 子分类 -->
            <section class="sidebar-section">
                <h3 class="sidebar-title">📂 Subcategories</h3>
                <ul class="subcategory-list">
                    <li class="subcategory-item" onclick="filterBySubcategory('machine-learning')">
                        <span class="subcategory-name">Machine Learning</span>
                        <span class="subcategory-count">856</span>
                    </li>
                    <li class="subcategory-item" onclick="filterBySubcategory('deep-learning')">
                        <span class="subcategory-name">Deep Learning</span>
                        <span class="subcategory-count">623</span>
                    </li>
                    <li class="subcategory-item" onclick="filterBySubcategory('nlp')">
                        <span class="subcategory-name">Natural Language Processing</span>
                        <span class="subcategory-count">412</span>
                    </li>
                    <li class="subcategory-item" onclick="filterBySubcategory('computer-vision')">
                        <span class="subcategory-name">Computer Vision</span>
                        <span class="subcategory-count">389</span>
                    </li>
                    <li class="subcategory-item" onclick="filterBySubcategory('robotics')">
                        <span class="subcategory-name">Robotics & Automation</span>
                        <span class="subcategory-count">267</span>
                    </li>
                    <li class="subcategory-item" onclick="filterBySubcategory('ethics')">
                        <span class="subcategory-name">AI Ethics & Safety</span>
                        <span class="subcategory-count">198</span>
                    </li>
                </ul>
            </section>

            <!-- 热门话题 -->
            <section class="sidebar-section">
                <h3 class="sidebar-title">🔥 Trending Topics</h3>
                <div class="trending-item" onclick="viewTrending('gpt5')">
                    <div class="trending-title">GPT-5 Release Timeline</div>
                    <div class="trending-meta">1.2k discussions</div>
                </div>
                <div class="trending-item" onclick="viewTrending('multimodal')">
                    <div class="trending-title">Multimodal AI Models</div>
                    <div class="trending-meta">892 discussions</div>
                </div>
                <div class="trending-item" onclick="viewTrending('agi')">
                    <div class="trending-title">AGI Development Progress</div>
                    <div class="trending-meta">756 discussions</div>
                </div>
                <div class="trending-item" onclick="viewTrending('ai-safety')">
                    <div class="trending-title">AI Safety Concerns</div>
                    <div class="trending-meta">634 discussions</div>
                </div>
                <div class="trending-item" onclick="viewTrending('quantum-ai')">
                    <div class="trending-title">Quantum Computing & AI</div>
                    <div class="trending-meta">523 discussions</div>
                </div>
            </section>

            <!-- 活跃成员 -->
            <section class="sidebar-section">
                <h3 class="sidebar-title">👥 Top Contributors</h3>
                <div class="trending-item">
                    <div class="trending-title">AI Researcher</div>
                    <div class="trending-meta">342 posts • 5.2k reputation</div>
                </div>
                <div class="trending-item">
                    <div class="trending-title">Deep Learning Expert</div>
                    <div class="trending-meta">289 posts • 4.8k reputation</div>
                </div>
                <div class="trending-item">
                    <div class="trending-title">ML Engineer</div>
                    <div class="trending-meta">256 posts • 3.9k reputation</div>
                </div>
                <div class="trending-item">
                    <div class="trending-title">Data Scientist</div>
                    <div class="trending-meta">198 posts • 3.2k reputation</div>
                </div>
            </section>
        </aside>
    </main>

    <script>
        // Get logged-in username
        const username = localStorage.getItem('username') || 'User';
        document.getElementById('username').textContent = username;
        document.getElementById('userAvatar').textContent = username.charAt(0).toUpperCase();
        
        // Check login status
        if (!localStorage.getItem('isLoggedIn')) {
            window.location.href = 'login.html';
        }
        
        // Logout function
        function logout() {
            localStorage.removeItem('username');
            localStorage.removeItem('isLoggedIn');
            window.location.href = 'login.html';
        }
        
        // View post
        function viewPost(postId) {
            // Each post redirects to its corresponding detail page
            window.location.href = `post-detail-${postId}.html`;
        }
        
        // Sort posts
        function sortPosts(sortBy) {
            console.log('Sorting posts by:', sortBy);
            // Implement sorting logic here
            alert(`Posts sorted by: ${sortBy}`);
        }
        
        // Filter posts
        function filterPosts(filter) {
            console.log('Filtering posts by:', filter);
            // Implement filtering logic here
            alert(`Posts filtered by: ${filter}`);
        }
        
        // Filter by subcategory
        function filterBySubcategory(subcategory) {
            console.log('Filtering by subcategory:', subcategory);
            alert(`Showing posts from: ${subcategory.replace('-', ' ').replace(/\b\w/g, l => l.toUpperCase())}`);
        }
        
        // View trending topic
        function viewTrending(topic) {
            console.log('Viewing trending topic:', topic);
            alert(`Opening trending topic: ${topic.replace('-', ' ').replace(/\b\w/g, l => l.toUpperCase())}`);
        }
    </script>
</body>
</html>