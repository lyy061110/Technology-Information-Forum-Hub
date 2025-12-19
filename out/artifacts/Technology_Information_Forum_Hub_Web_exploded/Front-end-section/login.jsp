<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0 ,maximum-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="./style/commen.css" />
    <link
            rel="stylesheet/less"
            type="text/css"
            href="./style/m.login.less"
            media="screen and (max-width:375px)"
    />
    <link
            rel="stylesheet/less"
            type="text/css"
            href="./style/login.less"
            media="screen and (min-width:375px)"
    />
    <script src="./js/less.min.js"></script>
    <link rel="stylesheet" href="./front/iconfont.css" />
    <link rel="shortcut icon" href="./img/icon/favicon.ico" />
    <title>Arknight</title>
    <style>
        .error-message {
            background: #ffe6e6;
            color: #d63031;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
            text-align: center;
            border: 1px solid #ff7675;
            font-size: 14px;
        }

        .success-message {
            background: #e6f7e6;
            color: #27ae60;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
            text-align: center;
            border: 1px solid #2ecc71;
            font-size: 14px;
        }
    </style>
</head>

<body>
<main>
    <div class="word">
        <img src="./img/login/login1.png" alt="" />
        <h4>阿米娅正在看着你注册</h4>
    </div>
    <div class="form">
        <%-- 错误消息显示 --%>
        <% if (request.getAttribute("error") != null) { %>
        <div class="error-message">
            <%= request.getAttribute("error") %>
        </div>
        <% } %>
        <% if (request.getAttribute("success") != null) { %>
        <div class="success-message">
            <%= request.getAttribute("success") %>
        </div>
        <% } %>

        <%-- 登录表单 --%>
        <form action="login" method="post" class="login">
            <h1>login</h1>
            <input type="text" name="username" placeholder="帐号"
                   value="<%= request.getAttribute("username") != null ? request.getAttribute("username") : "" %>" />
            <input type="password" name="password" placeholder="密码" />
            <button type="submit">Login</button>
            <div class="control">
                <p>尚未注册？<a href="#" id="showRegister">Register</a></p>
                <a href="index.jsp">回到主页</a>
            </div>
        </form>

        <%-- 注册表单 --%>
        <form action="register" method="post" class="register disappear">
            <h1>Register</h1>
            <input type="text" name="username" placeholder="帐号" />
            <input type="password" name="password" placeholder="密码" />
            <button type="submit">Register</button>
            <div class="control">
                <p>注册过了？<a href="#" id="showLogin">Login</a></p>
                <a href="index.jsp">回到主页</a>
            </div>
        </form>
    </div>
    <div class="word">
        <img src="./img/login/login2.png" alt="" />
        <h4>阿米娅正在看着你登录</h4>
    </div>
</main>

<script src="./js/login.js"></script>
<script>
    // 修改login.js中的表单切换逻辑
    document.addEventListener('DOMContentLoaded', function() {
        // 通过更具体的选择器获取元素
        var registerLink = document.querySelector('#showRegister');
        var loginLink = document.querySelector('#showLogin');
        var formContainer = document.querySelector(".form");
        var forms = document.querySelectorAll(".form form");

        console.log('找到的表单数量:', forms.length);
        console.log('注册链接:', registerLink);
        console.log('登录链接:', loginLink);

        // 注册链接点击
        if (registerLink && forms.length >= 2) {
            registerLink.addEventListener("click", function (e) {
                forms[0].classList.add("disappear");
                forms[1].classList.remove("disappear");
                if (formContainer) {
                    formContainer.style.transform = "rotateY(180deg)";
                }
                e.preventDefault();
            });
        }

        // 登录链接点击
        if (loginLink && forms.length >= 2) {
            loginLink.addEventListener("click", function (e) {
                forms[1].classList.add("disappear");
                forms[0].classList.remove("disappear");
                if (formContainer) {
                    formContainer.style.transform = "none";
                }
                e.preventDefault();
            });
        }

        // 表单验证
        var loginForm = document.querySelector('form.login');
        var registerForm = document.querySelector('form.register');

        if (loginForm) {
            loginForm.onsubmit = function() {
                var username = this.querySelector('input[name="username"]').value.trim();
                var password = this.querySelector('input[name="password"]').value.trim();

                if (!username || !password) {
                    alert('用户名和密码不能为空');
                    return false;
                }
                return true;
            };
        }

        if (registerForm) {
            registerForm.onsubmit = function() {
                var username = this.querySelector('input[name="username"]').value.trim();
                var password = this.querySelector('input[name="password"]').value.trim();

                if (username.length < 3) {
                    alert('用户名至少3个字符');
                    return false;
                }
                if (password.length < 6) {
                    alert('密码至少6个字符');
                    return false;
                }
                return true;
            };
        }
    });
</script>
</body>
</html>