<<<<<<< HEAD:Front-end section/js/login.js
var bin = document.querySelectorAll('.control a')
var formContainer = document.querySelector('.form')
var form = document.querySelectorAll('.form form')
=======
//login.js
document.addEventListener('DOMContentLoaded', function() {
    // 通过更具体的选择器获取元素
    var registerLink = document.querySelector('.control a:first-child');
    var loginLink = document.querySelector('.register .control a:first-child');
    var formContainer = document.querySelector(".form");
    var forms = document.querySelectorAll(".form form");
>>>>>>> 0ec48f55fe586d2e6c36268ca2d9cf11436845aa:web/Front-end-section/js/login.js

// 注册
bin[0].addEventListener('click', function (e) {
    form[0].classList.add('disappear')
    form[1].classList.remove('disappear')
    formContainer.style.transform = 'rotateY(180deg)'
})

<<<<<<< HEAD:Front-end section/js/login.js
// 登录
bin[2].addEventListener('click', function (e) {
    form[1].classList.add('disappear')
    form[0].classList.remove('disappear')
    formContainer.style.transform = 'none'
})
=======
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
>>>>>>> 0ec48f55fe586d2e6c36268ca2d9cf11436845aa:web/Front-end-section/js/login.js
