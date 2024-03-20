<%-- 
    Document   : login
    Created on : Jan 14, 2024, 7:34:13 PM
    Author     : Khải
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
        <script src="https://kit.fontawesome.com/9a14d14ca3.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Login Form</title>
        <style>
            body
            {
                margin: 0 auto;
                height: 100vh;
                background-image: url("images/anh-login.jpg");
                background-size: cover;
                font-family: sans-serif;
            }
            .loginBox
            {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%,-50%);
                width: 350px;
                height: 560px;
                padding: 40px;
                border-radius: 10px;
                box-sizing: border-box;
                background: #020417d4;
                background-position: center;
            }
            .user
            {
                width: 100px;
                height: 100px;
                border-radius: 50%;
                overflow: hidden;
                position: absolute;
                top: calc(-100px/2);
                left: calc(70% - 35%);
            }
            h2
            {
                font-weight: bold;
                margin: 0;
                padding: 15px 40px;
                color: white;
                text-align: center;
            }
            .loginBox p
            {
                font-size: 18px;
                margin: 0;
                padding: 0;
                font-weight: bold;
                color: #fff;
            }
            .loginBox input
            {
                width: 100%;
                margin-bottom: 20px;
            }
            .loginBox input[type="text"],
            .loginBox input[type="password"]
            {
                border: none;
                border-bottom: 1px solid #fff;
                background: transparent;
                outline: none;
                height: 40px;
                color: #fff;
                font-size: 16px;
            }
            ::placeholder
            {
                color: rgba(255,255,255,.5);
            }
            .loginBox input[type="submit"]
            {
                border:none;
                outline: none;
                height: 40px;
                color: #fff;
                font-size: 14px;
                background: linear-gradient(to right, rgba(106, 17, 203, 1), rgba(37, 117, 252, 1));
cursor: pointer;
                border-radius: 20px;
                margin-top: 20px;
            }
            .loginBox input[type="submit"]:hover
            {
                background: linear-gradient(45deg,#0ABFBC, #FC354C);
            }
            .loginBox .a
            {
                color: #fff;
                font-size: 14px;
                font-weight: bold;
                text-decoration: none;
            }
            .loginBox h5
            {
                margin: 0;
                padding: 15px 0 0 0;
                text-align: center;
                color: #fff;
            }
            .loginBox h4
            {
                font-size: 17px;
                margin: 0;
                padding: 30px;
                text-align: center;
                color: #fff;
            }
            .loginBox h4 a
            {
                text-decoration: none;
                font-weight: bold;
                color: white;
            }
            ul
            {
                margin: 0;
                padding: 0;
                display: flex;
            }
            ul li
            {
                list-style: none;
                float: left;
                top: 10px;
                left: 65px;
                margin: 10px;
                width: 50px;
                height: 50px;
                line-height: 50px;
                text-align: center;
                background: #fff;
                font-size: 40px;
                border-radius: 20%;
                position: relative;
                transition: .5s ease-in-out;
                z-index: 1;
            }
            ul li a
            {
                font-size: 35px;
            }
            ul li .facebook
            {
                color: #3b5999;
            }

            ul li .google
            {
                color: #dd4b39;
            }

            ul li a:before
            {
                content: '';
                width: 100%;
                height: 100%;
                position: absolute;
                top: 0;
                left: 0;
                border-radius: 20%;
                transform: scale(0);
                transition: .5s ease-in-out;
                z-index: -1;
            }
            ul li a:before
            {
                background:linear-gradient(45deg,#FC354C, #0ABFBC);
            }
            ul li a:hover:before
            {
                transform: scale(.9);
            }
            ul li a:hover
            {
                color: #fff;
            }
            .txt2:hover
            {
                color: red;
            }

            .a:hover
            {
                color: black;
            }

            @media screen and (max-width: 988px)
            {
                .loginBox
                {
                    width: 350px;
                    height: 560px;
                }
            }
@media screen and (max-width: 640px)
            {
                .loginBox
                {
                    width: 350px;
                    height: 560px;
                    right: 10px;
                }
            }
            @media screen and (max-width: 320px)
            {
                .loginBox
                {
                    right: 10px;
                    width: 320px;
                    height: 560px;
                }
            }

            .passwordDesign {
                position: relative;
            }

            .fa-eye {
                color: white;
                position: absolute;
                right: -25px;
                top: 50%;
                cursor: pointer;
            }

            #togglePassword:hover {
                color: red;
            }
        </style>
    </head>
    <body>
        <div class="loginBox">  
            <div class="form-header">
                <a href="home"><i class="fa-solid fa-house"></i></a>
            </div>
            <h2>Login</h2>
            <p style="color: green;">${requestScope.ms1}</p>
            <p style="color: green;">${requestScope.ms2}</p>
            <h3 style="color: red; padding-bottom: 5px; font-size: 20px">${requestScope.ms}</h3>
            <p style="color: red; padding-bottom: 5px">${requestScope.error}</p>
            <form action="login" method="post">
                <p>Email</p>
                <input type="text" name="email" placeholder="Email" required value="${cookie.cuser.value}">
                <div class="passwordDesign">
                    <p>Password</p>
                    <input type="password" name="password" autocomplete="current-password" placeholder="Password" required id="id_password">
                    <i class="fa fa-eye" id="togglePassword"></i>
                </div>
                <input type="submit" value="LOGIN">
                <h4><a class="txt2" href="forgotpassword">Forgot Password?</a></h4>
                <h5>Create account? <a class="txt2" href="register">Register</a></h5>
            </form>
        </div>
    </body>
    <script type="text/javascript">
        const togglePassword = document.querySelector('#togglePassword');
        const password = document.querySelector('#id_password');

        togglePassword.addEventListener('click', function (e) {
            // toggle the type attribute
            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
            password.setAttribute('type', type);
            // toggle the eye slash icon
            this.classList.toggle('fa-eye-slash');
        });
    </script>
</html>