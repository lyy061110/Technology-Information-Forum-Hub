//login.js
document.addEventListener('DOMContentLoaded', function() {
    // 通过更具体的选择器获取元素
    var registerLink = document.querySelector('.control a:first-child');
    var loginLink = document.querySelector('.register .control a:first-child');
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
});