<%-- 
    Document   : blog
    Created on : Feb 17, 2024, 9:32:16 PM
    Author     : pc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/style_1.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h1><i>Posts</i></h1>
            </div>
            <div class="menu">
                <a href="home"><b>Home</b></a>
                <a href="postdetail"><b>New Post</b></a>
            </div>
            <div class="main">
                <div class="left">
                    <div id="messageDiv" class="message">
                        ${message}
                    </div>
                    <c:forEach var="b" items="${posts}">
                        <table border="0">
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="title">
                                            <h2><a href="blogdetail?id=${b.id}">${b.title}</a></h2>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="image">
                                            <img src="images/${b.imageUrl}" class="logo"/>
                                        </div>
                                        <div class="description">
                                            ${b.shortDescription}
                                        </div>
                                    </td>
                                    <td>
                                        <div class="actions">
                                            <!-- Nút Hide -->
                                            <input type="checkbox" id="toggle-${b.id}" class="toggle-switch" data-post-id="${b.id}" ${b.status == 1 ? 'checked' : ''}>
                                            <label for="toggle-${b.id}" class="toggle-label">
                                                <span class="show-toggle">Show</span>
                                            </label> 
                                            <!-- Nút Edit -->
                                            <a href="postedit?id=${b.id}" class="btn">Edit</a>
                                            <!-- Nút Delete -->
                                            <a href="postdelete?id=${b.id}" class="btn">Delete</a>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </c:forEach>
                    <script>
                        function showMessage(messageId) {
                            var messageDiv = document.getElementById(messageId);
                            messageDiv.style.display = "block";
                            setTimeout(function () {
                                messageDiv.style.display = "none";
                            }, 500);
                        }
                        window.onload = function () {
                            showMessage('messageDiv');
                        };
                        //lay id bai viet sau khi nhan button Hide
                        document.querySelectorAll('.toggle-switch').forEach(function (toggle) {
                            toggle.addEventListener('change', function () {
                                var postId = this.dataset.postId;
                                var status = this.checked ? 1 : 0;

                                // Gửi yêu cầu AJAX đến servlet để cập nhật trạng thái
                                var xhr = new XMLHttpRequest();
                                xhr.open("POST", "postlist");
                                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                                xhr.onload = function () {
                                    if (xhr.status === 200) {
                                        var response = xhr.responseText;
                                        if (response === "success") {
                                            // Cập nhật trạng thái của toggle switch
                                            var toggleSwitch = document.querySelector('[data-post-id="' + postId + '"]');
                                            toggleSwitch.checked = status === 1;
                                        } else {
                                            // Xử lý lỗi nếu cần
                                        }
                                    }
                                };
                                xhr.send("id=" + postId + "&status=" + status);
                            });
                        });

                    </script>
                </div>
                <div class="right">
                    <form action="postsearch?index=1" method="post">
                        <label for="searchTerm">Search here:</label>
                        <input type="text" id="searchTerm" name="searchTerm" value="${searchTerm}">
                        <input type="submit" value="&#128269;">
                    </form>
                </div>
            </div>
        </div>            
    </body>
</html>
