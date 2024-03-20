<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Forgot Password</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <script src="https://kit.fontawesome.com/9a14d14ca3.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body {
            margin: 0 auto;
            height: 100vh;
            background-image: url("images/anh-login.jpg");
            background-size: cover;
            font-family: sans-serif;
        }

        .loginBox {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            width: 350px;
            height: 600px; /* Adjusted height to fit the new button */
            padding: 40px;
            border-radius: 10px;
            box-sizing: border-box;
            background: #020417d4;
            background-position: center;
        }

        h2 {
            font-weight: bold;
            margin: 0;
            padding: 15px 40px;
            color: white;
            text-align: center;
        }

        .loginBox p {
            font-size: 18px;
            margin: 0;
            padding: 0;
            font-weight: bold;
            color: #fff;
        }

        .loginBox input {
            width: 100%;
            margin-bottom: 20px;
        }

        .loginBox input[type="email"],
        .loginBox input[type="password"] {
            border: none;
            border-bottom: 1px solid #fff;
            background: transparent;
            outline: none;
            height: 40px;
            color: #fff;
            font-size: 16px;
        }

        ::placeholder {
            color: rgba(255,255,255,.5);
        }

        .loginBox input[type="submit"] {
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

        .loginBox input[type="submit"]:hover {
            background: linear-gradient(45deg,#0ABFBC, #FC354C);
        }

        .loginBox .a {
            color: #fff;
            font-size: 14px;
            font-weight: bold;
            text-decoration: none;
        }

        .loginBox h5 {
            margin: 0;
            padding: 15px 0 0 0;
            text-align: center;
            color: #fff;
        }

        .loginBox h4 {
            font-size: 17px;
            margin: 0;
            padding: 30px;
            text-align: center;
            color: #fff;
        }

        .loginBox h4 a {
            text-decoration: none;
            font-weight: bold;
            color: white;
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

        #togglePassword:hover,
        #toggleConfirmPassword:hover {
            color: red;
        }

        .backToLogin {
            display: block;
            width: 100%;
            height: 40px;
            color: #fff;
            font-size: 14px;
            background: linear-gradient(to right, rgba(106, 17, 203, 1), rgba(37, 117, 252, 1));
            cursor: pointer;
            border-radius: 20px;
            margin-top: 20px;
            text-align: center;
            line-height: 40px;
            text-decoration: none; /* Remove underline */
        }

        .backToLogin:hover {
            background: linear-gradient(45deg,#0ABFBC, #FC354C);
        }
    </style>
</head>
<body>
    <div class="loginBox">  
        <h2>Forgot Password</h2>
        
        <c:if test="${not empty requestScope.message}">
            <p style="color: green;">${requestScope.message}</p>
        </c:if>
        <c:if test="${not empty requestScope.error}">
            <p style="color: red;">${requestScope.error}</p>
        </c:if>
        
        <form action="forgotpassword" method="post">
            <p>Email:</p>
            <input type="email" name="email" required><br>
            
            <div class="passwordDesign">
                <p>New Password:</p>
                <input type="password" name="newPassword" required id="newPassword">
                <i class="fa fa-eye" id="togglePassword"></i>
            </div>
            
            <div class="passwordDesign">
                <p>Confirm Password:</p>
                <input type="password" name="confirmPassword" required id="confirmPassword">
                <i class="fa fa-eye" id="toggleConfirmPassword"></i>
            </div>
            
            <input type="submit" value="Reset Password">
            <a href="login" class="backToLogin">Back to Login</a>
        </form>
    </div>

    <script type="text/javascript">
        const togglePassword = document.querySelector('#togglePassword');
        const newPassword = document.querySelector('#newPassword');
        const toggleConfirmPassword = document.querySelector('#toggleConfirmPassword');
        const confirmPassword = document.querySelector('#confirmPassword');

        togglePassword.addEventListener('click', function (e) {
            const type = newPassword.getAttribute('type') === 'password' ? 'text' : 'password';
            newPassword.setAttribute('type', type);
            this.classList.toggle('fa-eye-slash');
        });

        toggleConfirmPassword.addEventListener('click', function (e) {
            const type = confirmPassword.getAttribute('type') === 'password' ? 'text' : 'password';
            confirmPassword.setAttribute('type', type);
            this.classList.toggle('fa-eye-slash');
        });
    </script>
</body>
</html>
