<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transformer Architecture Evolution - TechHub Technology Forum</title>
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
        
        /* 主要内容 */
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
        
        /* 帖子内容 */
        .post-container {
            background: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
        }
        
        .post-header {
            border-bottom: 1px solid #e9ecef;
            padding-bottom: 20px;
            margin-bottom: 25px;
        }
        
        .post-title {
            font-size: 2rem;
            color: #333;
            margin-bottom: 15px;
            line-height: 1.3;
            font-weight: bold;
        }
        
        .post-meta {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
        }
        
        .post-author {
            display: flex;
            align-items: center;
            gap: 12px;
        }
        
        .author-avatar {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            font-size: 18px;
        }
        
        .author-info {
            display: flex;
            flex-direction: column;
        }
        
        .author-name {
            font-weight: 600;
            color: #333;
            font-size: 16px;
        }
        
        .post-date {
            color: #666;
            font-size: 14px;
        }
        
        .post-stats {
            display: flex;
            gap: 20px;
            align-items: center;
        }
        
        .post-stat {
            display: flex;
            align-items: center;
            gap: 5px;
            color: #666;
            font-size: 14px;
        }
        
        .post-tags {
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
            margin-top: 15px;
        }
        
        .tag {
            background: #e3f2fd;
            color: #1976d2;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
        }
        
        .post-content {
            line-height: 1.8;
            color: #333;
            font-size: 16px;
        }
        
        .post-content h2 {
            color: #0078d4;
            margin: 30px 0 15px 0;
            font-size: 1.5rem;
            border-bottom: 2px solid #e3f2fd;
            padding-bottom: 8px;
        }
        
        .post-content h3 {
            color: #333;
            margin: 25px 0 12px 0;
            font-size: 1.2rem;
        }
        
        .post-content p {
            margin-bottom: 15px;
        }
        
        .post-content ul, .post-content ol {
            margin: 15px 0 15px 25px;
        }
        
        .post-content li {
            margin-bottom: 8px;
        }
        
        .post-content code {
            background: #f8f9fa;
            padding: 2px 6px;
            border-radius: 4px;
            font-family: 'Consolas', 'Monaco', monospace;
            color: #e83e8c;
        }
        
        .post-content blockquote {
            border-left: 4px solid #0078d4;
            padding: 10px 20px;
            margin: 20px 0;
            background: #f8f9fa;
            color: #666;
            font-style: italic;
        }
        
        /* 交互按钮 */
        .post-actions {
            display: flex;
            gap: 15px;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #e9ecef;
        }
        
        .action-btn {
            background: transparent;
            border: 1px solid #ddd;
            padding: 10px 20px;
            border-radius: 25px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .action-btn:hover {
            background: #0078d4;
            color: white;
            border-color: #0078d4;
            transform: translateY(-2px);
        }
        
        .action-btn.liked {
            background: #0078d4;
            color: white;
            border-color: #0078d4;
        }
        
        /* 评论区 */
        .comments-section {
            background: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
        }
        
        .comments-header {
            font-size: 1.5rem;
            color: #333;
            margin-bottom: 25px;
            font-weight: 600;
        }
        
        .comment-form {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 25px;
        }
        
        .comment-textarea {
            width: 100%;
            min-height: 100px;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-family: inherit;
            font-size: 14px;
            resize: vertical;
            margin-bottom: 15px;
        }
        
        .comment-submit {
            background: #0078d4;
            color: white;
            border: none;
            padding: 10px 25px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.3s ease;
        }
        
        .comment-submit:hover {
            background: #0056b3;
            transform: translateY(-1px);
        }
        
        .comment {
            border-bottom: 1px solid #e9ecef;
            padding: 20px 0;
        }
        
        .comment:last-child {
            border-bottom: none;
        }
        
        .comment-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }
        
        .comment-author {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .comment-avatar {
            width: 35px;
            height: 35px;
            border-radius: 50%;
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            font-size: 14px;
        }
        
        .comment-meta {
            display: flex;
            flex-direction: column;
        }
        
        .comment-name {
            font-weight: 600;
            color: #333;
            font-size: 14px;
        }
        
        .comment-time {
            color: #999;
            font-size: 12px;
        }
        
        .comment-content {
            color: #333;
            line-height: 1.6;
            font-size: 14px;
            margin-left: 45px;
        }
        
        .comment-actions {
            display: flex;
            gap: 15px;
            margin-top: 10px;
            margin-left: 45px;
        }
        
        .comment-action {
            color: #666;
            font-size: 12px;
            cursor: pointer;
            transition: color 0.3s ease;
        }
        
        .comment-action:hover {
            color: #0078d4;
        }
        
        /* 侧边栏 */
        .sidebar {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        
        .sidebar-section {
            background: white;
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
        
        .related-post {
            padding: 12px 0;
            border-bottom: 1px solid #f0f0f0;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .related-post:last-child {
            border-bottom: none;
        }
        
        .related-post:hover {
            background: #f8f9fa;
            margin: 0 -10px;
            padding: 12px 10px;
        }
        
        .related-title {
            font-size: 14px;
            color: #333;
            margin-bottom: 5px;
            line-height: 1.4;
        }
        
        .related-meta {
            font-size: 12px;
            color: #999;
        }
        
        /* 响应式设计 */
        @media (max-width: 768px) {
            .main-container {
                grid-template-columns: 1fr;
            }
            
            .post-title {
                font-size: 1.5rem;
            }
            
            .post-meta {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .post-actions {
                flex-wrap: wrap;
            }
        }
    </style>
</head>
<body>
    <!-- 头部导航 -->
    <header>
        <div class="header-content">
            <div style="display: flex; align-items: center;">
                <button class="back-btn" onclick="window.location.href='ai-category.html'">← Back</button>
                <a href="index.html" class="logo">TechHub</a>
            </div>
            
            <nav class="nav-links">
                <a href="index.html" class="nav-link">Home</a>
                <a href="ai-category.html" class="nav-link">AI Forum</a>
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
            <!-- 帖子内容 -->
            <article class="post-container">
                <header class="post-header">
                    <h1 class="post-title">【Deep Learning】Transformer Architecture Evolution: From BERT to GPT-4</h1>
                    
                    <div class="post-meta">
                        <div class="post-author">
                            <div class="author-avatar">DL</div>
                            <div class="author-info">
                                <div class="author-name">Deep Learning Expert</div>
                                <div class="post-date">Posted 3 days ago</div>
                            </div>
                        </div>
                        
                        <div class="post-stats">
                            <span class="post-stat">👁️ 8.7k views</span>
                            <span class="post-stat">💬 142 replies</span>
                            <span class="post-stat">🔥 456 likes</span>
                        </div>
                    </div>
                    
                    <div class="post-tags">
                        <span class="tag">Transformers</span>
                        <span class="tag">BERT</span>
                        <span class="tag">GPT-4</span>
                        <span class="tag">Deep Learning</span>
                        <span class="tag">Architecture</span>
                    </div>
                </header>
                
                <div class="post-content">
                    <h2>Introduction</h2>
                    <p>
                        The Transformer architecture has revolutionized the field of natural language processing and artificial intelligence since its introduction in 2017. From the original "Attention Is All You Need" paper to the sophisticated models we see today, the evolution has been remarkable. This comprehensive analysis explores the key milestones and innovations that have shaped modern transformer architectures.
                    </p>
                    
                    <h2>The Birth of Transformers</h2>
                    <p>
                        Before Transformers, recurrent neural networks (RNNs) and Long Short-Term Memory (LSTM) networks dominated sequence processing tasks. However, these architectures suffered from sequential processing limitations and difficulty capturing long-range dependencies. The Transformer architecture, introduced by Vaswani et al. in 2017, addressed these limitations through its innovative self-attention mechanism.
                    </p>
                    
                    <h3>Key Innovations in Original Transformer</h3>
                    <ul>
                        <li><strong>Self-Attention Mechanism:</strong> Allows the model to weigh the importance of different words in the input sequence</li>
                        <li><strong>Multi-Head Attention:</strong> Enables the model to focus on different representation subspaces</li>
                        <li><strong>Positional Encoding:</strong> Provides information about word order in the sequence</li>
                        <li><strong>Parallel Processing:</strong> Unlike RNNs, Transformers can process all tokens simultaneously</li>
                    </ul>
                    
                    <h2>The BERT Revolution</h2>
                    <p>
                        BERT (Bidirectional Encoder Representations from Transformers), introduced by Google in 2018, marked a significant milestone in transformer evolution. Unlike previous models that processed text unidirectionally, BERT introduced bidirectional training, allowing the model to understand context from both directions.
                    </p>
                    
                    <h3>BERT's Key Contributions</h3>
                    <ul>
                        <li><strong>Masked Language Modeling:</strong> Randomly masks tokens and trains the model to predict them</li>
                        <li><strong>Next Sentence Prediction:</strong> Trains the model to understand sentence relationships</li>
                        <li><strong>Bidirectional Context:</strong> Processes text in both directions simultaneously</li>
                        <li><strong>Transfer Learning:</strong> Pre-trained on massive datasets, then fine-tuned for specific tasks</li>
                    </ul>
                    
                    <blockquote>
                        BERT's bidirectional approach was a game-changer, enabling the model to capture deeper contextual understanding and setting new benchmarks across numerous NLP tasks.
                    </blockquote>
                    
                    <h2>The GPT Evolution</h2>
                    <p>
                        While BERT focused on bidirectional understanding, the GPT (Generative Pre-trained Transformer) series, developed by OpenAI, concentrated on generative capabilities. The evolution from GPT to GPT-4 showcases remarkable progress in model scale, capabilities, and performance.
                    </p>
                    
                    <h3>GPT-1 (2018)</h3>
                    <p>
                        The first GPT model demonstrated the potential of unsupervised pre-training followed by supervised fine-tuning. With 117 million parameters, it showed promising results on various NLP tasks.
                    </p>
                    
                    <h3>GPT-2 (2019)</h3>
                    <p>
                        GPT-2 was a significant leap forward with 1.5 billion parameters. It demonstrated impressive text generation capabilities, leading OpenAI to initially withhold the full model due to concerns about misuse. Key improvements included:
                    </p>
                    <ul>
                        <li>Larger model capacity and training dataset</li>
                        <li>Improved zero-shot performance</li>
                        <li>Better text coherence and consistency</li>
                    </ul>
                    
                    <h3>GPT-3 (2020)</h3>
                    <p>
                        GPT-3 represented a massive scale-up with 175 billion parameters. It demonstrated remarkable few-shot and zero-shot learning capabilities, often matching or surpassing task-specific models without fine-tuning. Notable achievements:
                    </p>
                    <ul>
                        <li>Emergent abilities at scale</li>
                        <li>Improved reasoning and arithmetic capabilities</li>
                        <li>Better code generation and understanding</li>
                        <li>Enhanced multilingual performance</li>
                    </ul>
                    
                    <h3>GPT-4 (2023)</h3>
                    <p>
                        GPT-4 marked another significant advancement, though OpenAI hasn't disclosed exact parameter counts. Key improvements include:
                    </p>
                    <ul>
                        <li><strong>Multimodal Capabilities:</strong> Processes both text and images</li>
                        <li><strong>Improved Reasoning:</strong> Better logical thinking and problem-solving</li>
                        <li><strong>Enhanced Safety:</strong> Reduced harmful outputs and better alignment</li>
                        <li><strong>Broader Knowledge:</strong> More up-to-date and comprehensive understanding</li>
                    </ul>
                    
                    <h2>Architectural Innovations and Techniques</h2>
                    <p>
                        Throughout the evolution, several key architectural innovations have emerged:
                    </p>
                    
                    <h3>Scaling Laws</h3>
                    <p>
                        Research has shown that model performance follows predictable scaling laws with respect to model size, dataset size, and compute budget. This understanding has guided the development of larger, more capable models.
                    </p>
                    
                    <h3>Training Techniques</h3>
                    <ul>
                        <li><strong>Mixture of Experts (MoE):</strong> Efficiently scales model capacity by activating only relevant experts</li>
                        <li><strong>Instruction Tuning:</strong> Trains models to follow instructions and respond appropriately</li>
                        <li><strong>Reinforcement Learning from Human Feedback (RLHF):</strong> Aligns model behavior with human preferences</li>
                        <li><strong>Constitutional AI:</strong> Uses explicit principles to guide model behavior</li>
                    </ul>
                    
                    <h2>Future Directions</h2>
                    <p>
                        The evolution of transformer architectures continues at a rapid pace. Emerging trends include:
                    </p>
                    <ul>
                        <li><strong>Efficient Transformers:</strong> Reducing computational requirements while maintaining performance</li>
                        <li><strong>Specialized Architectures:</strong> Task-specific optimizations and domain adaptation</li>
                        <li><strong>Better Multimodal Integration:</strong> Seamlessly processing text, images, audio, and video</li>
                        <li><strong>Improved Reasoning:</strong> Enhanced logical thinking and planning capabilities</li>
                    </ul>
                    
                    <h2>Conclusion</h2>
                    <p>
                        The evolution from BERT to GPT-4 represents one of the most remarkable journeys in AI history. What started as a novel attention mechanism has transformed into a foundation for modern AI systems. As we look toward future developments, the transformer architecture continues to evolve, promising even more capable and efficient models that will shape the future of artificial intelligence.
                    </p>
                    
                    <p>
                        The journey from the original 2017 Transformer paper to today's massive language models demonstrates the power of incremental innovation combined with scaling. Each generation has built upon the strengths of its predecessors while addressing their limitations, creating a continuous improvement cycle that shows no signs of slowing down.
                    </p>
                </div>
                
                <div class="post-actions">
                    <button class="action-btn" onclick="toggleLike(this)">
                        <span>👍</span>
                        <span>Like</span>
                        <span class="like-count">456</span>
                    </button>
                    <button class="action-btn" onclick="sharePost()">
                        <span>🔗</span>
                        <span>Share</span>
                    </button>
                    <button class="action-btn" onclick="bookmarkPost()">
                        <span>🔖</span>
                        <span>Bookmark</span>
                    </button>
                    <button class="action-btn" onclick="reportPost()">
                        <span>🚩</span>
                        <span>Report</span>
                    </button>
                </div>
            </article>
            
            <!-- 评论区 -->
            <section class="comments-section">
                <h2 class="comments-header">💬 Comments (142)</h2>
                
                <div class="comment-form">
                    <textarea class="comment-textarea" placeholder="Share your thoughts on this post..."></textarea>
                    <button class="comment-submit" onclick="submitComment()">Post Comment</button>
                </div>
                
                <div class="comment">
                    <div class="comment-header">
                        <div class="comment-author">
                            <div class="comment-avatar">ML</div>
                            <div class="comment-meta">
                                <div class="comment-name">ML Researcher</div>
                                <div class="comment-time">2 hours ago</div>
                            </div>
                        </div>
                    </div>
                    <div class="comment-content">
                        Excellent comprehensive analysis! The progression from BERT to GPT-4 really shows how far we've come. I particularly appreciate the detailed breakdown of architectural innovations. The section on scaling laws is especially insightful - it's fascinating how predictable model performance has become at scale.
                    </div>
                    <div class="comment-actions">
                        <span class="comment-action" onclick="likeComment(this)">👍 23</span>
                        <span class="comment-action" onclick="replyComment()">Reply</span>
                        <span class="comment-action" onclick="reportComment()">Report</span>
                    </div>
                </div>
                
                <div class="comment">
                    <div class="comment-header">
                        <div class="comment-author">
                            <div class="comment-avatar">AI</div>
                            <div class="comment-meta">
                                <div class="comment-name">AI Engineer</div>
                                <div class="comment-time">5 hours ago</div>
                            </div>
                        </div>
                    </div>
                    <div class="comment-content">
                        Great overview! I'm curious about your thoughts on the efficiency aspect. While models have gotten incredibly capable, the computational requirements have skyrocketed. Do you think we'll see more focus on efficient architectures in the near future?
                    </div>
                    <div class="comment-actions">
                        <span class="comment-action" onclick="likeComment(this)">👍 15</span>
                        <span class="comment-action" onclick="replyComment()">Reply</span>
                        <span class="comment-action" onclick="reportComment()">Report</span>
                    </div>
                </div>
                
                <div class="comment">
                    <div class="comment-header">
                        <div class="comment-author">
                            <div class="comment-avatar">DS</div>
                            <div class="comment-meta">
                                <div class="comment-name">Data Scientist</div>
                                <div class="comment-time">1 day ago</div>
                            </div>
                        </div>
                    </div>
                    <div class="comment-content">
                        This is exactly what I was looking for! The comparison between different GPT versions is particularly helpful. I've been working with fine-tuning and the instruction tuning section gave me some great ideas for my current project.
                    </div>
                    <div class="comment-actions">
                        <span class="comment-action" onclick="likeComment(this)">👍 8</span>
                        <span class="comment-action" onclick="replyComment()">Reply</span>
                        <span class="comment-action" onclick="reportComment()">Report</span>
                    </div>
                </div>
            </section>
        </div>
        
        <!-- 侧边栏 -->
        <aside class="sidebar">
            <section class="sidebar-section">
                <h3 class="sidebar-title">📚 Related Posts</h3>
                <div class="related-post" onclick="window.location.href='post-detail.html'">
                    <div class="related-title">【AI】GPT-5 Coming Soon? Latest Technical Breakthrough Analysis</div>
                    <div class="related-meta">AI Researcher • 2 days ago</div>
                </div>
                <div class="related-post" onclick="window.location.href='post-detail-7.html'">
                    <div class="related-title">【Computer Vision】YOLOv8 vs Faster R-CNN: Performance Comparison</div>
                    <div class="related-meta">Vision Researcher • 5 days ago</div>
                </div>
                <div class="related-post" onclick="window.location.href='post-detail-8.html'">
                    <div class="related-title">【NLP】Fine-tuning LLMs for Domain-Specific Tasks: Best Practices</div>
                    <div class="related-meta">NLP Engineer • 1 week ago</div>
                </div>
            </section>
            
            <section class="sidebar-section">
                <h3 class="sidebar-title">🏷️ Popular Tags</h3>
                <div class="post-tags">
                    <span class="tag">Transformers</span>
                    <span class="tag">BERT</span>
                    <span class="tag">GPT-4</span>
                    <span class="tag">Deep Learning</span>
                    <span class="tag">NLP</span>
                    <span class="tag">Attention</span>
                    <span class="tag">Scaling Laws</span>
                </div>
            </section>
            
            <section class="sidebar-section">
                <h3 class="sidebar-title">👥 Author Info</h3>
                <div style="text-align: center; padding: 20px 0;">
                    <div style="width: 80px; height: 80px; border-radius: 50%; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); display: flex; align-items: center; justify-content: center; color: white; font-weight: bold; font-size: 32px; margin: 0 auto 15px;">DL</div>
                    <h4 style="color: #333; margin-bottom: 5px;">Deep Learning Expert</h4>
                    <p style="color: #666; font-size: 14px; margin-bottom: 10px;">289 posts • 4.8k reputation</p>
                    <p style="color: #999; font-size: 12px; line-height: 1.4;">Specializing in transformer architectures and large language models. Research focus on efficient training methods and model interpretability.</p>
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
        
        // Toggle like
        function toggleLike(btn) {
            btn.classList.toggle('liked');
            const likeCount = btn.querySelector('.like-count');
            const currentLikes = parseInt(likeCount.textContent);
            likeCount.textContent = btn.classList.contains('liked') ? currentLikes + 1 : currentLikes - 1;
        }
        
        // Share post
        function sharePost() {
            if (navigator.share) {
                navigator.share({
                    title: 'Transformer Architecture Evolution: From BERT to GPT-4',
                    text: 'Check out this comprehensive analysis of transformer architecture evolution',
                    url: window.location.href
                });
            } else {
                navigator.clipboard.writeText(window.location.href);
                alert('Post link copied to clipboard!');
            }
        }
        
        // Bookmark post
        function bookmarkPost() {
            alert('Post bookmarked successfully!');
        }
        
        // Report post
        function reportPost() {
            alert('Thank you for reporting. We will review this content.');
        }
        
        // Submit comment
        function submitComment() {
            const textarea = document.querySelector('.comment-textarea');
            if (textarea.value.trim()) {
                alert('Comment posted successfully!');
                textarea.value = '';
            } else {
                alert('Please enter a comment before posting.');
            }
        }
        
        // Like comment
        function likeComment(element) {
            const currentText = element.textContent;
            const currentCount = parseInt(currentText.match(/\d+/)[0]);
            const newCount = currentCount + 1;
            element.textContent = `👍 ${newCount}`;
        }
        
        // Reply to comment
        function replyComment() {
            const textarea = document.querySelector('.comment-textarea');
            textarea.focus();
            textarea.placeholder = 'Write a reply...';
        }
        
        // Report comment
        function reportComment() {
            alert('Comment reported. Thank you for helping keep our community safe.');
        }
    </script>
</body>
</html>