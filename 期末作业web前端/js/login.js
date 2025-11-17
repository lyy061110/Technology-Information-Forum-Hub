var bin = document.querySelectorAll(".control a");
var formContainer = document.querySelector(".form");
var form = document.querySelectorAll(".form form");

// 注册
bin[0].addEventListener("click", function (e) {
  form[0].classList.add("disappear");
  form[1].classList.remove("disappear");
  formContainer.style.transform = "rotateY(180deg)";
});

// 登录
bin[2].addEventListener("click", function (e) {
  form[1].classList.add("disappear");
  form[0].classList.remove("disappear");
  formContainer.style.transform = "none";
});

// 登录表单提交处理
document.querySelector('.login').addEventListener('submit', function(e) {
  e.preventDefault();
  
  // 获取输入的账号和密码
  const username = this.querySelector('input[type="text"]').value;
  const password = this.querySelector('input[type="password"]').value;
  
  // 简单的验证（实际项目中应该发送到服务器验证）
  if (username && password) {
    // 保存登录状态到localStorage
    localStorage.setItem('username', username);
    localStorage.setItem('isLoggedIn', 'true');
    
    // 跳转到主页
    window.location.href = 'index.html';
  } else {
    alert('请输入账号和密码！');
  }
});

// 注册表单提交处理
document.querySelector('.register').addEventListener('submit', function(e) {
  e.preventDefault();
  
  // 获取输入的账号和密码
  const username = this.querySelector('input[type="text"]').value;
  const password = this.querySelector('input[type="password"]').value;
  
  // 简单的验证
  if (username && password) {
    // 保存注册信息（实际项目中应该发送到服务器）
    localStorage.setItem('username', username);
    localStorage.setItem('isLoggedIn', 'true');
    
    alert('注册成功！正在跳转到主页...');
    
    // 跳转到主页
    window.location.href = 'index.html';
  } else {
    alert('请输入账号和密码！');
  }
});
