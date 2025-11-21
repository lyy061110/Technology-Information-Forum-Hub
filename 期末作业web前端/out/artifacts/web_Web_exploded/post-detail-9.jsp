<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The Bias Problem in AI Systems - TechHub Technology Forum</title>
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
        
        .post-container {
            background: white;
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
            gap: 20px;
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
            background: linear-gradient(135deg, #dc3545 0%, #c82333 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
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
            padding: 4px 12px;
            border-radius: 16px;
            font-size: 12px;
            font-weight: 500;
        }
        
        .post-content {
            line-height: 1.8;
            color: #333;
        }
        
        .post-content h2 {
            color: #333;
            margin: 30px 0 15px 0;
            font-size: 1.5rem;
            border-bottom: 2px solid #0078d4;
            padding-bottom: 8px;
        }
        
        .post-content h3 {
            color: #333;
            margin: 25px 0 12px 0;
            font-size: 1.2rem;
        }
        
        .post-content p {
            margin-bottom: 16px;
        }
        
        .post-content ul, .post-content ol {
            margin: 16px 0;
            padding-left: 30px;
        }
        
        .post-content li {
            margin-bottom: 8px;
        }
        
        .post-content code {
            background: #f5f5f5;
            padding: 2px 6px;
            border-radius: 4px;
            font-family: 'Courier New', monospace;
            color: #d63384;
        }
        
        .post-content pre {
            background: #f8f9fa;
            border: 1px solid #e9ecef;
            border-radius: 8px;
            padding: 16px;
            overflow-x: auto;
            margin: 20px 0;
        }
        
        .post-content blockquote {
            border-left: 4px solid #0078d4;
            padding-left: 20px;
            margin: 20px 0;
            color: #666;
            font-style: italic;
        }
        
        .post-footer {
            border-top: 2px solid #f0f0f0;
            padding-top: 20px;
            margin-top: 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .post-stats {
            display: flex;
            gap: 20px;
            color: #666;
            font-size: 14px;
        }
        
        .post-actions {
            display: flex;
            gap: 10px;
        }
        
        .action-btn {
            background: #f8f9fa;
            border: 1px solid #dee2e6;
            padding: 8px 16px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 6px;
        }
        
        .action-btn:hover {
            background: #e9ecef;
            transform: translateY(-1px);
        }
        
        .action-btn.liked {
            background: #0078d4;
            color: white;
            border-color: #0078d4;
        }
        
        .comments-section {
            background: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
        }
        
        .comments-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 2px solid #f0f0f0;
        }
        
        .comments-title {
            font-size: 1.5rem;
            color: #333;
        }
        
        .comments-count {
            color: #666;
            font-size: 14px;
        }
        
        .comment-form {
            margin-bottom: 30px;
        }
        
        .comment-textarea {
            width: 100%;
            min-height: 100px;
            padding: 12px;
            border: 1px solid #dee2e6;
            border-radius: 8px;
            font-family: inherit;
            font-size: 14px;
            resize: vertical;
            margin-bottom: 12px;
        }
        
        .comment-textarea:focus {
            outline: none;
            border-color: #0078d4;
            box-shadow: 0 0 0 3px rgba(0,120,212,0.1);
        }
        
        .comment-submit {
            background: #0078d4;
            color: white;
            border: none;
            padding: 10px 24px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .comment-submit:hover {
            background: #005a9e;
            transform: translateY(-1px);
        }
        
        .comments-list {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        
        .comment {
            border-bottom: 1px solid #f0f0f0;
            padding-bottom: 20px;
        }
        
        .comment:last-child {
            border-bottom: none;
        }
        
        .comment-header {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 12px;
        }
        
        .comment-avatar {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background: #6c757d;
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
            color: #333;
            font-size: 14px;
        }
        
        .comment-time {
            color: #666;
            font-size: 12px;
        }
        
        .comment-content {
            color: #333;
            line-height: 1.6;
            margin-bottom: 12px;
        }
        
        .comment-actions {
            display: flex;
            gap: 16px;
        }
        
        .comment-action {
            color: #666;
            text-decoration: none;
            font-size: 12px;
            transition: color 0.3s ease;
        }
        
        .comment-action:hover {
            color: #0078d4;
        }
        
        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                gap: 15px;
            }
            
            .nav-links {
                flex-wrap: wrap;
                justify-content: center;
            }
            
            .post-meta {
                flex-direction: column;
                align-items: flex-start;
                gap: 10px;
            }
            
            .post-footer {
                flex-direction: column;
                gap: 15px;
                align-items: flex-start;
            }
            
            .comments-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 8px;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="header-content">
            <div style="display: flex; align-items: center;">
                <button class="back-btn" onclick="goBack()">← Back</button>
                <a href="index.html" class="logo">TechHub</a>
            </div>
            
            <nav class="nav-links">
                <a href="index.html" class="nav-link">Home</a>
                <a href="ai-category.html" class="nav-link">AI</a>
                <a href="#" class="nav-link">Web</a>
                <a href="#" class="nav-link">Mobile</a>
                <a href="#" class="nav-link">Data Science</a>
                <a href="create-post.html" class="nav-link">Create Post</a>
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

    <main class="main-container">
        <div class="breadcrumb">
            <a href="index.html">Home</a> / <a href="ai-category.html">AI</a> / The Bias Problem in AI Systems: Detection and Mitigation
        </div>
        
        <article class="post-container">
            <header class="post-header">
                <h1 class="post-title">The Bias Problem in AI Systems: Detection and Mitigation</h1>
                
                <div class="post-meta">
                    <div class="post-author-info">
                        <div class="author-avatar">AE</div>
                        <div>
                            <div style="font-weight: 600;">Ethics Researcher</div>
                            <div style="color: #999; font-size: 12px;">AI Ethics Specialist</div>
                        </div>
                    </div>
                    <span>📅 2024年1月10日</span>
                    <span>⏱️ 12分钟阅读</span>
                </div>
                
                <div class="post-tags">
                    <span class="tag">AI Ethics</span>
                    <span class="tag">Bias</span>
                    <span class="tag">Fairness</span>
                    <span class="tag">Responsible AI</span>
                    <span class="tag">Algorithmic Justice</span>
                </div>
            </header>
            
            <div class="post-content">
                <h2>Introduction: The Hidden Challenge in AI</h2>
                <p>As artificial intelligence systems become increasingly integrated into our daily lives, the issue of bias has emerged as one of the most critical challenges facing the field. Bias in AI systems can lead to discriminatory outcomes, perpetuate existing social inequalities, and undermine trust in technology. This comprehensive guide explores the detection and mitigation of bias in AI systems, providing practical strategies for building more equitable and fair artificial intelligence.</p>
                
                <h2>Understanding AI Bias: Types and Sources</h2>
                
                <h3>Types of Bias in AI Systems</h3>
                <p>Bias in AI can manifest in various forms, each with distinct characteristics and impacts:</p>
                
                <ul>
                    <li><strong>Selection Bias:</strong> Occurs when training data is not representative of the target population</li>
                    <li><strong>Measurement Bias:</strong> Arises from systematic errors in data collection or measurement processes</li>
                    <li><strong>Algorithmic Bias:</strong> Results from the design and implementation of algorithms themselves</li>
                    <li><strong>Confirmation Bias:</strong> When AI systems reinforce existing beliefs or stereotypes</li>
                    <li><strong>Temporal Bias:</strong> Bias introduced by changes in data patterns over time</li>
                </ul>
                
                <h3>Common Sources of Bias</h3>
                <p>Understanding where bias originates is crucial for effective mitigation:</p>
                
                <ul>
                    <li><strong>Historical Data:</strong> Training data reflects historical inequalities and prejudices</li>
                    <li><strong>Sampling Methods:</strong> Non-random or incomplete sampling of target populations</li>
                    <li><strong>Feature Selection:</strong> Choosing features that correlate with protected attributes</li>
                    <li><strong>Label Quality:</strong> Human annotators' biases in labeling training data</li>
                    <li><strong>Model Architecture:</strong> Certain model structures may amplify existing biases</li>
                </ul>
                
                <h2>Detection Methods: Identifying Bias in AI Systems</h2>
                
                <h3>Quantitative Detection Techniques</h3>
                <p>Statistical methods provide objective measures of bias in AI systems:</p>
                
                <ul>
                    <li><strong>Disparate Impact Analysis:</strong> Measures adverse impact on protected groups using the 80% rule</li>
                    <li><strong>Statistical Parity Difference:</strong> Compares prediction rates across different demographic groups</li>
                    <li><strong>Equal Opportunity Difference:</strong> Evaluates true positive rate equality across groups</li>
                    <li><strong>Average Odds Difference:</strong> Combines false positive and true positive rate differences</li>
                    <li><strong>Counterfactual Fairness:</strong> Tests if predictions remain consistent under counterfactual scenarios</li>
                </ul>
                
                <h3>Qualitative Assessment Approaches</h3>
                <p>Beyond metrics, qualitative methods provide deeper insights:</p>
                
                <ul>
                    <li><strong>Stakeholder Interviews:</strong> Gathering perspectives from affected communities</li>
                    <li><strong>Case Study Analysis:</strong> Examining specific instances of biased outcomes</li>
                    <li><strong>Expert Review:</strong> Domain experts evaluating system behavior</li>
                    <li><strong>User Feedback:</strong> Collecting experiences from diverse user groups</li>
                    <li><strong>Ethical Impact Assessment:</strong> Systematic evaluation of ethical implications</li>
                </ul>
                
                <h2>Real-World Examples of AI Bias</h2>
                
                <h3>Facial Recognition Systems</h3>
                <p>Multiple studies have demonstrated significant accuracy disparities in facial recognition systems:</p>
                
                <ul>
                    <li>Higher error rates for women and people of color</li>
                    <li>Particularly poor performance for darker-skinned females</li>
                    <li>Misidentification leading to wrongful arrests and accusations</li>
                </ul>
                
                <h3>Hiring and Recruitment Systems</h3>
                <p>AI-powered hiring tools have shown various forms of bias:</p>
                
                <ul>
                    <li>Preference for male candidates in technical roles</li>
                    <li>Penalizing resumes with gaps in employment history</li>
                    <li>Favoring candidates from certain educational backgrounds</li>
                </ul>
                
                <h3>Criminal Justice and Risk Assessment</h3>
                <p>Predictive policing and risk assessment tools have demonstrated concerning biases:</p>
                
                <ul>
                    <li>Higher risk scores for minority defendants</li>
                    <li>Reinforcement of existing policing patterns</li>
                    <li>Limited transparency in decision-making processes</li>
                </ul>
                
                <h2>Mitigation Strategies: Building Fairer AI Systems</h2>
                
                <h3>Pre-Processing Techniques</h3>
                <p>Addressing bias before model training:</p>
                
                <ul>
                    <li><strong>Data Augmentation:</strong> Increasing representation of underrepresented groups</li>
                    <li><strong>Resampling Methods:</strong> Oversampling minority classes or undersampling majority classes</li>
                    <li><strong>Feature Engineering:</strong> Removing or transforming biased features</li>
                    <li><strong>Re-weighing:</strong> Assigning different weights to samples based on group membership</li>
                    <li><strong>Synthetic Data Generation:</strong> Creating balanced datasets using generative models</li>
                </ul>
                
                <h3>In-Processing Approaches</h3>
                <p>Modifying the learning process itself:</p>
                
                <ul>
                    <li><strong>Fairness Constraints:</strong> Incorporating fairness metrics into optimization objectives</li>
                    <li><strong>Adversarial Debiasing:</strong> Training models to remove sensitive information from representations</li>
                    <li><strong>Regularization Techniques:</strong> Adding penalties for biased predictions</li>
                    <li><strong>Multi-objective Optimization:</strong> Balancing accuracy and fairness objectives</li>
                    <li><strong>Ensemble Methods:</strong> Combining multiple models with different bias characteristics</li>
                </ul>
                
                <h3>Post-Processing Solutions</h3>
                <p>Adjusting model outputs after training:</p>
                
                <ul>
                    <li><strong>Threshold Adjustment:</strong> Setting different decision thresholds for different groups</li>
                    <li><strong>Calibration Methods:</strong> Adjusting predicted probabilities to achieve fairness</li>
                    <li><strong>Reject Option Classification:</strong> Deferring uncertain cases to human review</li>
                    <li><strong>Output Transformation:</strong> Modifying final predictions to satisfy fairness constraints</li>
                </ul>
                
                <h2>Implementation Framework: A Practical Guide</h2>
                
                <h3>Step 1: Bias Assessment Planning</h3>
                <p>Establish a comprehensive bias detection framework:</p>
                
                <ul>
                    <li>Identify relevant protected attributes and demographic groups</li>
                    <li>Define fairness metrics appropriate for your use case</li>
                    <li>Establish baseline measurements and targets</li>
                    <li>Create documentation and reporting procedures</li>
                </ul>
                
                <h3>Step 2: Data Analysis and Preparation</h3>
                <p>Thoroughly examine and prepare training data:</p>
                
                <ul>
                    <li>Conduct exploratory data analysis for bias indicators</li>
                    <li>Assess data quality and representation across groups</li>
                    <li>Implement appropriate data balancing techniques</li>
                    <li>Document data limitations and mitigation steps</li>
                </ul>
                
                <h3>Step 3: Model Development and Testing</h3>
                <p>Build and evaluate models with fairness considerations:</p>
                
                <ul>
                    <li>Implement fairness-aware training techniques</li>
                    <li>Conduct comprehensive bias testing across metrics</li>
                    <li>Perform cross-validation with demographic stratification</li>
                    <li>Compare multiple models and mitigation approaches</li>
                </ul>
                
                <h3>Step 4: Deployment and Monitoring</h3>
                <p>Ensure ongoing fairness in production:</p>
                
                <ul>
                    <li>Implement real-time bias monitoring systems</li>
                    <li>Establish feedback mechanisms for affected users</li>
                    <li>Regularly retrain models with updated data</li>
                    <li>Maintain transparency about system limitations</li>
                </ul>
                
                <h2>Organizational Considerations</h2>
                
                <h3>Diverse Development Teams</h3>
                <p>Building diverse AI development teams is crucial for bias mitigation:</p>
                
                <ul>
                    <li>Include representatives from affected communities</li>
                    <li>Promote diversity in technical and non-technical roles</li>
                    <li>Provide bias awareness and ethics training</li>
                    <li>Create inclusive development environments</li>
                </ul>
                
                <h3>Governance and Accountability</h3>
                <p>Establish clear frameworks for responsible AI development:</p>
                
                <ul>
                    <li>Develop AI ethics guidelines and principles</li>
                    <li>Create oversight committees with diverse stakeholders</li>
                    <li>Implement audit trails and documentation requirements</li>
                    <li>Establish clear accountability structures</li>
                </ul>
                
                <h3>Transparency and Explainability</h3>
                <p>Maintain openness about AI systems and their limitations:</p>
                
                <ul>
                    <li>Provide clear explanations of system capabilities and limitations</li>
                    <li>Share information about training data and methods</li>
                    <li>Enable external audits and reviews</li>
                    <li>Communicate uncertainty and confidence levels</li>
                </ul>
                
                <h2>Future Directions and Emerging Challenges</h2>
                
                <h3>Emerging Bias Types</h3>
                <p>As AI technology evolves, new forms of bias emerge:</p>
                
                <ul>
                    <li><strong>Intersectional Bias:</strong> Complex discrimination across multiple identity dimensions</li>
                    <li><strong>Temporal Drift Bias:</strong> Bias introduced by changing social norms and values</li>
                    <li><strong>Cross-Cultural Bias:</strong> Systems performing differently across cultural contexts</li>
                    <li><strong>Feedback Loop Bias:</strong> Systems reinforcing their own biased predictions</li>
                </ul>
                
                <h3>Advanced Mitigation Techniques</h3>
                <p>Research continues to develop more sophisticated approaches:</p>
                
                <ul>
                    <li><strong>Causal Fairness:</strong> Addressing root causes rather than symptoms of bias</li>
                    <li><strong>Federated Learning:</strong> Reducing bias through distributed training</li>
                    <li><strong>Explainable AI:</strong> Better understanding of bias sources through interpretability</li>
                    <li><strong>Human-in-the-Loop Systems:</strong> Combining automated and human judgment</li>
                </ul>
                
                <h2>Conclusion: Towards Fairer AI</h2>
                <p>Addressing bias in AI systems is not a technical problem alone but a complex challenge requiring technical, social, and ethical considerations. By implementing comprehensive detection and mitigation strategies, we can build AI systems that are not only more accurate but also more equitable and just.</p>
                
                <p>The journey toward fair AI requires ongoing commitment, continuous learning, and collaboration across disciplines. As we develop increasingly powerful AI systems, our responsibility to ensure they serve all members of society fairly becomes ever more critical.</p>
                
                <blockquote>
                    Building fair AI systems is not just about removing bias—it's about actively designing systems that promote equity, justice, and human dignity for all.
                </blockquote>
                
                <h2>Call to Action</h2>
                <p>As AI practitioners, researchers, and users, we all have a role to play in addressing bias:</p>
                
                <ul>
                    <li>Educate yourself and others about AI bias and its impacts</li>
                    <li>Advocate for diverse and inclusive AI development practices</li>
                    <li>Support research into bias detection and mitigation techniques</li>
                    <li>Demand transparency and accountability from AI system providers</li>
                    <li>Participate in discussions about AI ethics and governance</li>
                </ul>
                
                <p>Together, we can work toward AI systems that truly serve the needs of all humanity, regardless of race, gender, age, or any other characteristic.</p>
            </div>
            
            <footer class="post-footer">
                <div class="post-stats">
                    <span>👁️ 3,234 views</span>
                    <span>💬 45 replies</span>
                    <span>🔥 156 likes</span>
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
                <div class="comments-count">45 comments</div>
            </header>
            
            <!-- 评论表单 -->
            <div class="comment-form">
                <textarea class="comment-textarea" placeholder="分享你对AI伦理问题的看法..." id="commentInput"></textarea>
                <button class="comment-submit" onclick="submitComment()">发表评论</button>
            </div>
            
            <!-- 评论列表 -->
            <div class="comments-list">
                <div class="comment">
                    <div class="comment-header">
                        <div class="comment-avatar">SJ</div>
                        <div class="comment-meta">
                            <div class="comment-author">Sarah Johnson</div>
                            <div class="comment-time">2小时前</div>
                        </div>
                    </div>
                    <div class="comment-content">
                        这篇文章非常全面地分析了AI偏见问题。作为数据科学家，我深刻体会到在实际项目中处理偏见的挑战。特别是关于组织层面的考虑，很多人往往只关注技术层面而忽视了团队多样性的重要性。
                    </div>
                    <div class="comment-actions">
                        <a href="#" class="comment-action">👍 点赞 (28)</a>
                        <a href="#" class="comment-action">💬 回复</a>
                        <a href="#" class="comment-action">🔗 分享</a>
                    </div>
                </div>
                
                <div class="comment">
                    <div class="comment-header">
                        <div class="comment-avatar">MC</div>
                        <div class="comment-meta">
                            <div class="comment-author">Michael Chen</div>
                            <div class="comment-time">5小时前</div>
                        </div>
                    </div>
                    <div class="comment-content">
                        作者能详细介绍一下因果公平性（Causal Fairness）吗？我在最近的研究中遇到了这个概念，但对其具体实现方法还不是很清楚。感觉这可能是解决偏见问题的一个重要方向。
                    </div>
                    <div class="comment-actions">
                        <a href="#" class="comment-action">👍 点赞 (15)</a>
                        <a href="#" class="comment-action">💬 回复</a>
                        <a href="#" class="comment-action">🔗 分享</a>
                    </div>
                </div>
                
                <div class="comment">
                    <div class="comment-header">
                        <div class="comment-avatar">EP</div>
                        <div class="comment-meta">
                            <div class="comment-author">Emily Park</div>
                            <div class="comment-time">8小时前</div>
                        </div>
                    </div>
                    <div class="comment-content">
                        我们公司在招聘系统中确实发现了性别偏见，正在尝试使用文章中提到的预处理技术。但是发现平衡数据集的同时，模型的准确率有所下降。如何在公平性和性能之间找到最佳平衡点？
                    </div>
                    <div class="comment-actions">
                        <a href="#" class="comment-action">👍 点赞 (22)</a>
                        <a href="#" class="comment-action">💬 回复</a>
                        <a href="#" class="comment-action">🔗 分享</a>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <script>
        // 获取登录用户名
        const username = localStorage.getItem('username') || 'User';
        document.getElementById('username').textContent = username;
        document.getElementById('userAvatar').textContent = username.charAt(0).toUpperCase();
        
        // 检查登录状态
        if (!localStorage.getItem('isLoggedIn')) {
            window.location.href = 'login.html';
        }
        
        // 返回函数
        function goBack() {
            window.history.back();
        }
        
        // 登出函数
        function logout() {
            localStorage.removeItem('username');
            localStorage.removeItem('isLoggedIn');
            window.location.href = 'login.html';
        }
        
        // 切换点赞状态
        function toggleLike(button) {
            button.classList.toggle('liked');
            const likeText = button.querySelector('span:last-child');
            if (button.classList.contains('liked')) {
                likeText.textContent = '已点赞';
                button.querySelector('span:first-child').textContent = '👍';
            } else {
                likeText.textContent = 'Like';
                button.querySelector('span:first-child').textContent = '👍';
            }
        }
        
        // 分享帖子
        function sharePost() {
            if (navigator.share) {
                navigator.share({
                    title: 'The Bias Problem in AI Systems: Detection and Mitigation',
                    text: '查看这篇关于AI偏见问题的深度分析！',
                    url: window.location.href
                });
            } else {
                // 备用方案：复制到剪贴板
                navigator.clipboard.writeText(window.location.href);
                alert('帖子链接已复制到剪贴板！');
            }
        }
        
        // 收藏帖子
        function bookmarkPost() {
            alert('帖子收藏成功！');
        }
        
        // 提交评论
        function submitComment() {
            const commentInput = document.getElementById('commentInput');
            const commentText = commentInput.value.trim();
            
            if (!commentText) {
                alert('请输入评论内容！');
                return;
            }
            
            // 创建新评论元素
            const commentsList = document.querySelector('.comments-list');
            const newComment = document.createElement('div');
            newComment.className = 'comment';
            newComment.innerHTML = `
                <div class="comment-header">
                    <div class="comment-avatar">${username.charAt(0).toUpperCase()}</div>
                    <div class="comment-meta">
                        <div class="comment-author">${username}</div>
                        <div class="comment-time">刚刚</div>
                    </div>
                </div>
                <div class="comment-content">${commentText}</div>
                <div class="comment-actions">
                    <a href="#" class="comment-action">👍 点赞 (0)</a>
                    <a href="#" class="comment-action">💬 回复</a>
                    <a href="#" class="comment-action">🔗 分享</a>
                </div>
            `;
            
            // 插入到评论列表开头
            commentsList.insertBefore(newComment, commentsList.firstChild);
            
            // 清空输入框
            commentInput.value = '';
            
            // 更新评论数量
            const commentsCount = document.querySelector('.comments-count');
            const currentCount = parseInt(commentsCount.textContent);
            commentsCount.textContent = `${currentCount + 1} comments`;
        }
        
        // 添加Ctrl+Enter快捷键提交评论
        document.getElementById('commentInput').addEventListener('keydown', function(e) {
            if (e.ctrlKey && e.key === 'Enter') {
                submitComment();
            }
        });
    </script>
</body>
</html>