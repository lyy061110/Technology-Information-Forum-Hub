<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0 ,maximum-scale=1, user-scalable=no"
    />
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
    <link rel="stylesheet" href="./front/iconfont.css">
    <link rel="shortcut icon" href="./img/icon/favicon.ico" />
    <title>Arknight</title>
  </head>

  <body>
    <main>
      <div class="word">
        <img src="./img/login/login1.png" alt="" />
        <h4>阿米娅正在看着你注册</h4>
      </div>
      <div class="form">
        <%-- 修改1：添加action属性，指向LoginServlet --%>
        <!-- 使用完整路径 -->
        <form action="/teach01/Technology-Information-Forum-Hub/web_frontend/login" method="post" class="login">
          <h1>login</h1>
          <%-- 修改2：添加name属性，这样Servlet才能获取参数 --%>
          <input type="text" name="username" placeholder="帐号" />
          <input type="password" name="password" placeholder="密码" />
          <button type="submit">Login</button>
          <div class="control">
            <p>尚未注册？<a href="#">Register</a></p>
            <a href="index.jsp">回到主页</a>
          </div>
        </form>

        <%-- 修改3：注册表单也要添加action和name --%>
        <form action="/teach01/Technology-Information-Forum-Hub/web_frontend/register" method="post" class="register disappear">
          <h1>Register</h1>
          <input type="text" name="username" placeholder="帐号" />
          <input type="password" name="password" placeholder="密码" />
          <button type="submit">Register</button>
          <div class="control">
            <p>注册过了？<a href="#">Login</a></p>
            <a href="index.jsp">回到主页</a>
          </div>
        </form>
      </div>
      <div class="word">
        <img src="./img/login/login2.png" alt="" />
        <h4>阿米娅正在看着你登录</h4>
      </div>
    </main>

    <%-- 修改4：添加JavaScript文件 --%>
    <script src="./js/login.js"></script>
  </body>
</html>
