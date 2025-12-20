<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-theme="light" lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GPT-5 Coming Soon? Latest Technical Breakthrough Analysis - Technology Information Forum Hub</title>
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

        .nav-links {
            display: none;
        }

        .nav-link {
            color: var(--text-color);
            text-decoration: none;
            transition: opacity 0.3s ease;
        }

        .nav-link:hover {
            opacity: 0.8;
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

        /* 帖子容器 */
        .post-container {
            background: #ffffff;
            background-color: rgba(255, 255, 255, 1);
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            margin-bottom: 20px;
        }

        .post-header {
            border-bottom: 2px solid #f0f0f0;
            padding-bottom: 20px;
            margin-bottom: 25px;
        }

        .post-title {
            font-size: 2rem;
            color: #333;
            margin-bottom: 15px;
            line-height: 1.3;
        }

        .post-meta {
            display: flex;
            align-items: center;
            gap: 15px;
            color: #666;
            font-size: 14px;
        }

        .post-author-info {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .author-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
        }

        .post-tags {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            margin-top: 15px;
        }

        .post-tags .tag {
            background: var(--hover-background);
            color: var(--primary-color);
            padding: 4px 12px;
            border-radius: 16px;
            font-size: 12px;
            border: 1px solid var(--border-color);
        }

        .post-content {
            line-height: 1.7;
            color: var(--text-color);
            margin-bottom: 30px;
        }

        .post-content h2 {
            color: var(--text-color);
            margin: 25px 0 15px;
            font-size: 1.5rem;
            font-weight: 700;
        }

        .post-content h3 {
            color: var(--text-color);
            margin: 20px 0 12px;
            font-size: 1.2rem;
            font-weight: 600;
        }

        .post-content p {
            margin-bottom: 15px;
        }

        .post-content ul,
        .post-content ol {
            margin: 15px 0 15px 25px;
        }

        .post-content li {
            margin-bottom: 8px;
        }

        .post-content blockquote {
            background: var(--hover-background);
            border-left: 4px solid var(--primary-color);
            padding: 15px 20px;
            margin: 15px 0;
            border-radius: 0 8px 8px 0;
        }

        .post-footer {
            border-top: 2px solid var(--border-color);
            padding-top: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
        }

        .post-stats {
            display: flex;
            gap: 20px;
            color: var(--text-light);
            font-size: 14px;
        }

        .post-actions {
            display: flex;
            gap: 10px;
        }

        .action-btn {
            background: transparent;
            color: var(--text-color);
            border: 1px solid var(--border-color);
            padding: 8px 16px;
            border-radius: 20px;
            cursor: pointer;
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 5px;
            transition: all 0.3s ease;
        }

        .action-btn:hover {
            background: var(--hover-background);
            transform: translateY(-1px);
        }

        .action-btn.liked {
            background: var(--primary-color);
            color: white;
            border-color: var(--primary-color);
        }

        /* 评论区 */
        .comments-section {
            background: var(--card-background);
            border-radius: 12px;
            padding: 25px;
            box-shadow: var(--shadow);
            margin-top: 30px;
        }

        .comments-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .comments-title {
            font-size: 1.5rem;
            color: var(--text-color);
            margin-bottom: 25px;
            padding-bottom: 12px;
            border-bottom: 3px solid var(--primary-color);
            font-weight: 700;
        }

        .comments-count {
            color: var(--text-light);
            font-size: 14px;
        }

        .comment-form {
            margin-bottom: 30px;
        }

        .comment-textarea {
            width: 100%;
            padding: 15px;
            border: 2px solid var(--border-color);
            border-radius: 8px;
            font-size: 14px;
            font-family: inherit;
            resize: vertical;
            min-height: 100px;
            background-color: var(--background-color);
            color: var(--text-color);
            transition: all 0.3s ease;
        }

        .comment-textarea:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(0, 120, 212, 0.1);
        }

        .comment-submit {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 20px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 600;
            margin-top: 15px;
            transition: all 0.3s ease;
        }

        .comment-submit:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(0,120,212,0.3);
        }

        .comments-list {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .comment {
            background: var(--background-color);
            border: 1px solid var(--border-color);
            border-radius: 12px;
            padding: 20px;
            transition: all 0.3s ease;
        }

        .comment:hover {
            box-shadow: var(--shadow);
            transform: translateY(-2px);
        }

        .comment-header {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 12px;
        }

        .comment-avatar {
            width: 35px;
            height: 35px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            font-size: 14px;
        }

        .comment-meta {
            flex: 1;
        }

        .comment-author {
            font-weight: 600;
            color: var(--text-color);
            font-size: 14px;
        }

        .comment-time {
            color: var(--text-light);
            font-size: 12px;
            margin-top: 2px;
        }

        .comment-content {
            color: var(--text-color);
            line-height: 1.6;
            margin-bottom: 12px;
        }

        .comment-actions {
            display: flex;
            gap: 20px;
        }

        .comment-action {
            color: var(--text-light);
            text-decoration: none;
            font-size: 13px;
            transition: all 0.3s ease;
        }

        .comment-action:hover {
            color: var(--primary-color);
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
            .header-content {
                flex-direction: column;
                gap: 15px;
                padding: 15px 20px;
            }

            .user-menu {
                width: 100%;
                justify-content: space-between;
            }

            .main-container {
                padding: 10px;
            }

            .post-container,
            .comments-section {
                padding: 20px;
            }

            .post-footer {
                flex-direction: column;
                align-items: flex-start;
            }

            .post-actions {
                width: 100%;
                justify-content: space-around;
            }

            .comments-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 10px;
            }

            .footer-content {
                grid-template-columns: 1fr;
                text-align: center;
            }

            .social-icons {
                justify-content: center;
            }
        }

        /* 页脚 */
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
    </style>
</head>
<body>
<!-- 头部导航 -->
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

<!-- 主要内容区域 -->
<div class="main-container">
    <!-- 面包屑导航 -->
    <div class="breadcrumb">
        <a href="index.html">首页</a> ›
        <a href="index.html">热门帖子</a> ›
        GPT-5 Coming Soon? Latest Technical Breakthrough Analysis
    </div>

    <!-- 帖子内容 -->
    <article class="post-container">
        <header class="post-header">
            <h1 class="post-title">【AI】GPT-5 Coming Soon? Latest Technical Breakthrough Analysis</h1>

            <div class="post-meta">
                <div class="post-author-info">
                    <div class="author-avatar">AI</div>
                    <div>
                        <div style="font-weight: 500;">AI Researcher</div>
                        <div style="font-size: 12px;">Senior AI Engineer at OpenAI</div>
                    </div>
                </div>

                <div>•</div>
                <div>March 15, 2024</div>
                <div>•</div>
                <div>5 min read</div>
            </div>

            <div class="post-tags">
                <span class="tag">AI</span>
                <span class="tag">GPT-5</span>
                <span class="tag">Machine Learning</span>
                <span class="tag">Deep Learning</span>
            </div>
        </header>

        <div class="post-content">
            <h2>Introduction</h2>
            <p>The artificial intelligence community has been buzzing with speculation about GPT-5, the next iteration of OpenAI's groundbreaking language model. As we approach what many believe to be the release window, it's time to analyze the technical breakthroughs and expectations surrounding this potentially revolutionary AI system.</p>

            <h2>Technical Architecture Improvements</h2>
            <h3>Enhanced Neural Network Design</h3>
            <p>Recent leaks and research papers suggest that GPT-5 will feature a significantly improved neural architecture. The model is expected to incorporate:</p>
            <ul>
                <li><strong>Mixture of Experts (MoE) Architecture:</strong> A more sophisticated implementation allowing for specialized sub-networks</li>
                <li><strong>Improved Attention Mechanisms:</strong> Enhanced self-attention with better computational efficiency</li>
                <li><strong>Multi-modal Integration:</strong> Seamless processing of text, images, audio, and potentially video</li>
                <li><strong>Dynamic Parameter Allocation:</strong> Adaptive resource usage based on task complexity</li>
            </ul>

            <h3>Training Data and Scale</h3>
            <p>Industry insiders indicate that GPT-5 will be trained on an unprecedented dataset:</p>
            <blockquote>
                "The training dataset for GPT-5 is estimated to be 10-20 times larger than GPT-4's, with enhanced filtering for quality and diversity."
            </blockquote>

            <p>Key improvements in training methodology include:</p>
            <ol>
                <li><strong>Curriculum Learning:</strong> Progressive training from simple to complex concepts</li>
                <li><strong>Reinforcement Learning from Human Feedback (RLHF) 2.0:</strong> More sophisticated reward modeling</li>
                <li><strong>Cross-lingual Transfer Learning:</strong> Better knowledge transfer between languages</li>
                <li><strong>Real-time Knowledge Integration:</strong> Ability to incorporate new information without full retraining</li>
            </ol>

            <h2>Expected Capabilities</h2>
            <h3>Reasoning and Problem-Solving</h3>
            <p>GPT-5 is expected to demonstrate significantly improved reasoning capabilities:</p>
            <ul>
                <li>Multi-step logical reasoning with reduced error rates</li>
                <li>Better mathematical problem-solving abilities</li>
                <li>Enhanced causal reasoning and understanding</li>
                <li>Improved performance on complex planning tasks</li>
            </ul>

            <h3>Creativity and Innovation</h3>
            <p>The creative potential of GPT-5 appears to be substantially enhanced:</p>
            <ul>
                <li>More coherent and novel creative writing</li>
                <li>Improved code generation with better architecture design</li>
                <li>Enhanced ability to generate and evaluate hypotheses</li>
                <li>Better understanding of abstract concepts and metaphors</li>
            </ul>

            <h2>Technical Specifications (Rumored)</h2>
            <p>While official specifications remain confidential, industry speculation suggests:</p>
            <ul>
                <li><strong>Parameter Count:</strong> 10-50 trillion parameters (vs. GPT-4's ~1-2 trillion)</li>
                <li><strong>Context Window:</strong> Up to 1 million tokens</li>
                <li><strong>Training Cost:</strong> Estimated $2-3 billion</li>
                <li><strong>Inference Speed:</strong> 2-3x faster than GPT-4 for equivalent tasks</li>
            </ul>

            <h2>Challenges and Concerns</h2>
            <h3>Computational Requirements</h3>
            <p>The massive scale of GPT-5 presents significant challenges:</p>
            <ul>
                <li>Enormous energy consumption and environmental impact</li>
                <li>High infrastructure costs for deployment</li>
                <li>Need for specialized hardware optimization</li>
            </ul>

            <h3>Ethical Considerations</h3>
            <p>With increased capabilities come greater responsibilities:</p>
            <ul>
                <li>Enhanced potential for misuse and manipulation</li>
                <li>Need for stronger safety measures and alignment</li>
                <li>Concerns about job displacement and economic impact</li>
                <li>Questions about AI consciousness and rights</li>
            </ul>

            <h2>Timeline and Release Expectations</h2>
            <p>Based on industry patterns and insider information:</p>
            <ul>
                <li><strong>Alpha Testing:</strong> Expected to begin Q2 2024</li>
                <li><strong>Beta Release:</strong> Possible Q3-Q4 2024</li>
                <li><strong>Public Launch:</strong> Most likely early 2025</li>
                <li><strong>API Availability:</strong> Should follow shortly after public launch</li>
            </ul>

            <h2>Conclusion</h2>
            <p>GPT-5 represents a significant leap forward in artificial intelligence capabilities. While the exact specifications remain under wraps, the technical improvements and enhanced abilities suggest a transformative impact on how we interact with AI systems. However, the increased power also brings greater responsibility for ensuring safe and beneficial deployment.</p>

            <p>The AI community eagerly awaits official announcements from OpenAI, but one thing is certain: GPT-5 will push the boundaries of what's possible with language models and bring us closer to more general artificial intelligence.</p>
        </div>

        <footer class="post-footer">
            <div class="post-stats">
                <span>👁️ 15,234 views</span>
                <span>💬 256 replies</span>
                <span>🔥 892 likes</span>
            </div>

            <div class="post-actions">
                <button class="action-btn" onclick="toggleLike(this)">
                    <span>👍</span>
                    <span>Like</span>
                </button>
                <button class="action-btn" onclick="sharePost()">
                    <span>🔗</span>
                    <span>Share</span>
                </button>
                <button class="action-btn" onclick="bookmarkPost()">
                    <span>🔖</span>
                    <span>Bookmark</span>
                </button>
            </div>
        </footer>
    </article>

    <!-- 评论区 -->
    <section class="comments-section">
        <header class="comments-header">
            <h2 class="comments-title">Comments</h2>
            <div class="comments-count">256 comments</div>
        </header>

        <!-- 评论表单 -->
        <div class="comment-form">
            <textarea class="comment-textarea" placeholder="Share your thoughts on this post..." id="commentInput"></textarea>
            <button class="comment-submit" onclick="submitComment()">Post Comment</button>
        </div>

        <!-- 评论列表 -->
        <div class="comments-list">
            <div class="comment">
                <div class="comment-header">
                    <div class="comment-avatar">JD</div>
                    <div class="comment-meta">
                        <div class="comment-author">John Doe</div>
                        <div class="comment-time">2 hours ago</div>
                    </div>
                </div>
                <div class="comment-content">
                    This is an incredibly comprehensive analysis! The section on Mixture of Experts architecture is particularly insightful. I've been following the developments in this area, and your explanation really clarifies the potential impact of GPT-5.
                </div>
                <div class="comment-actions">
                    <a href="#" class="comment-action">👍 Like (42)</a>
                    <a href="#" class="comment-action">💬 Reply</a>
                    <a href="#" class="comment-action">🔗 Share</a>
                </div>
            </div>

            <div class="comment">
                <div class="comment-header">
                    <div class="comment-avatar">SM</div>
                    <div class="comment-meta">
                        <div class="comment-author">Sarah Miller</div>
                        <div class="comment-time">5 hours ago</div>
                    </div>
                </div>
                <div class="comment-content">
                    Great analysis! I'm particularly concerned about the ethical implications you mentioned. The power of these models is growing exponentially, and we need to ensure proper safeguards are in place.
                </div>
                <div class="comment-actions">
                    <a href="#" class="comment-action">👍 Like (28)</a>
                    <a href="#" class="comment-action">💬 Reply</a>
                    <a href="#" class="comment-action">🔗 Share</a>
                </div>
            </div>

            <div class="comment">
                <div class="comment-header">
                    <div class="comment-avatar">TC</div>
                    <div class="comment-meta">
                        <div class="comment-author">Tech Chen</div>
                        <div class="comment-time">8 hours ago</div>
                    </div>
                </div>
                <div class="comment-content">
                    The timeline seems optimistic but plausible. I'm curious about the actual parameter count - 50 trillion seems incredibly ambitious even for OpenAI. Do you have any sources for these numbers?
                </div>
                <div class="comment-actions">
                    <a href="#" class="comment-action">👍 Like (15)</a>
                    <a href="#" class="comment-action">💬 Reply</a>
                    <a href="#" class="comment-action">🔗 Share</a>
                </div>
            </div>
        </div>
    </section>
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

    // 页面加载时检查登录状态
    document.addEventListener('DOMContentLoaded', function() {
        if (!checkLoginStatus()) {
            return;
        }

        // 获取登录用户名
        const username = localStorage.getItem('username') || 'user';
    });

    // Toggle like
    function toggleLike(button) {
        button.classList.toggle('liked');
        const likeText = button.querySelector('span:last-child');
        if (button.classList.contains('liked')) {
            likeText.textContent = 'Liked';
            button.querySelector('span:first-child').textContent = '👍';
        } else {
            likeText.textContent = 'Like';
            button.querySelector('span:first-child').textContent = '👍';
        }
    }

    // Share post
    function sharePost() {
        if (navigator.share) {
            navigator.share({
                title: 'GPT-5 Coming Soon? Latest Technical Breakthrough Analysis',
                text: 'Check out this detailed analysis of GPT-5 technical specifications and capabilities!',
                url: window.location.href
            });
        } else {
            // Fallback: copy to clipboard
            navigator.clipboard.writeText(window.location.href);
            alert('Post link copied to clipboard!');
        }
    }

    // Bookmark post
    function bookmarkPost() {
        alert('Post bookmarked successfully!');
    }

    // Submit comment
    function submitComment() {
        const commentInput = document.getElementById('commentInput');
        const commentText = commentInput.value.trim();

        if (!commentText) {
            alert('Please enter a comment!');
            return;
        }

        // Create new comment element
        const commentsList = document.querySelector('.comments-list');
        const newComment = document.createElement('div');
        newComment.className = 'comment';
        newComment.innerHTML = `
                <div class="comment-header">
                    <div class="comment-avatar">${username.charAt(0).toUpperCase()}</div>
                    <div class="comment-meta">
                        <div class="comment-author">${username}</div>
                        <div class="comment-time">Just now</div>
                    </div>
                </div>
                <div class="comment-content">${commentText}</div>
                <div class="comment-actions">
                    <a href="#" class="comment-action">👍 Like (0)</a>
                    <a href="#" class="comment-action">💬 Reply</a>
                    <a href="#" class="comment-action">🔗 Share</a>
                </div>
            `;

        // Insert at the beginning of comments list
        commentsList.insertBefore(newComment, commentsList.firstChild);

        // Clear input
        commentInput.value = '';

        // Update comment count
        const commentsCount = document.querySelector('.comments-count');
        const currentCount = parseInt(commentsCount.textContent);
        commentsCount.textContent = `${currentCount + 1} comments`;
    }

    // Add Ctrl+Enter shortcut for commenting
    document.getElementById('commentInput').addEventListener('keydown', function(e) {
        if (e.ctrlKey && e.key === 'Enter') {
            submitComment();
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