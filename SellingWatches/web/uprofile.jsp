<%-- 
    Document   : uprofile
    Created on : Feb 19, 2024, 12:11:02 PM
    Author     : THINKPAD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title>

        <style>            
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }

            .wrapper {
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
                border: 1px solid #ddd;
                border-radius: 5px;
            }

            h1 {
                text-align: center;
                margin-bottom: 20px;
            }

            /* Alert styling (optional) */
            .alert-success {
                background-color: #dff0d8;
                border-color: #d6e9c6;
                color: #3c763d;
                padding: 10px;
                margin-bottom: 10px;
                border-radius: 4px;
            }

            /* Flex container styling */
            .flex-container {
                display: flex;
                align-items: center;
            }

            /* Avatar styling */
            .avatar-container {
                margin-right: 20px;
            }

            .avatar {
                width: 60px; /* Adjust size as needed */
                height: 60px;
                border-radius: 50%; /* Biến ảnh thành hình tròn */
                object-fit: cover; /* Giữ nguyên tỷ lệ ảnh */
            }

            /* Profile section styling */
            .profile-container {
                margin-bottom: 20px;
            }

            .profile-info {
                width: 100%;
            }

            label {
                font-weight: bold;
                margin-bottom: 5px;
            }

            input[type="text"], input[type="number"] {
                width: 100%;
                padding: 5px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            input[type="radio"] {
                margin-right: 5px;
            }

            input[type="submit"] {
                margin-top: 10px;
                padding: 5px 10px;
                font-size: 16px;
                border: 1px solid #ddd;
                border-radius: 4px;
                cursor: pointer;
            }

            /* Footer styling (optional) */
            footer {
                text-align: center;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <div class="wrapper">
            <h1>User Profile</h1>

            <% if (request.getAttribute("success") != null) { %>
            <div class="alert alert-success">
                <strong>Success:</strong> <%= request.getAttribute("success") %>
            </div>
            <% } %>

            <div class="flex-container">
                <div class="avatar-container">
                    <img src="${sessionScope.user.getAvatar()}" alt="User Avatar" class="avatar">
                </div>
                <form method="POST" action="uimagepro5" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="avatar">Select image to upload:</label>
                        <input type="file" name="image-upload" id="image-upload" class="form-control-file" required="">
                    </div>
                    <input type="submit" value="Upload Image" name="submit">
                </form>
            </div>

            <form method="POST" action="uprofile">
                <div class="profile-container">
                    <div class="profile-info">
                        <label for="mail">Mail</label>
                        <br>
                        <input type="text" name="mail" value="${sessionScope.user.getMail()}" readonly>
                        <br>

                        <label for="uname">User name*</label>
                        <br>
                        <input id="uname" type="text" name="uname" value="${sessionScope.user.getFullname()}"
                               placeholder="Họ và tên" autofocus required>
                        <br><br>

                        <label for="address">Address*</label>
                        <br>
                        <input id="address" type="text" name="address" value="${sessionScope.user.getAddress()}"
                               placeholder="Địa chỉ" required>
                        <br><br>

                        <label for="mobile">Mobile*</label>
                        <br>
                        <input id="mobile" type="number" name="mobile" value="${sessionScope.user.getPhone()}"
                               placeholder="Số điện thoại" required>
                        <br><br>

                        <label>Gender:</label>
                        <input type="radio" name="gender" value="true" ${sessionScope.user.isGender() ? 'checked' : ''}> Male
                        <input type="radio" name="gender" value="false" ${!sessionScope.user.isGender() ? 'checked' : ''}> Female
                        <br>
                        <input type="submit" value="Submit">
                    </div>
                </div>
            </form>
        </div>
        <footer></footer>
    </body>
</html>