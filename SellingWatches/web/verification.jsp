<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Email Verification</title>
    <style>
        body {
            font-family: sans-serif;
            background-image: url("images/anh-verification.jpg");
            background-size: cover;
            margin: 0;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
        }

        .verificationBox {
            width: 400px;
            padding: 20px;
            background: #020417d4;
            border-radius: 10px;
            box-sizing: border-box;
        }

        h2 {
            margin-top: 0;
        }

        p {
            margin: 10px 0;
        }

        a {
            color: #fff;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="verificationBox">
        <h2>Email Verification</h2>
        <p>A verification link has been sent to your email address. Please check your email and click on the link to reset your password.</p>
        <p>If you don't receive the email within a few minutes, please check your spam folder.</p>
        <p>Go back to <a href="login">Login</a></p>
    </div>
</body>
</html>
