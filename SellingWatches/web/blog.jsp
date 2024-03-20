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
                <h1><i>Blogs</i></h1>
            </div>
            <div class="menu">
                <a href="home"><b>Home</b></a>
            </div>
            <div class="main">
                <div class="left">
                    <c:forEach var="b" items="${blogs}">
                        <div class="title">
                            <h2><a href="blogdetail?id=${b.id}">${b.title}</a></h2>
                        </div>
                        <div class="image">
                            <img src="images/${b.imageUrl}" alt="Cac" class="logo"/>
                        </div>
                        <div class="description">
                            ${b.shortDescription}
                        </div>
                    </c:forEach>
                </div>
                <div class="right"><table border="1">
                        <tbody>
                            <tr>
                                <td>
                                    <form action="blogsearch?index=1" method="post">
                                        <label for="searchTerm">Search here:</label>
                                        <input type="text" id="searchTerm" name="searchTerm" value="${searchTerm}" required>
                                        <input type="submit" value="&#128269;">
                                    </form>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table border="0">
                                        <thead>
                                            <tr>
                                                <th class="most-popular"><a href="https://www.youtube.com/watch?v=dQw4w9WgXcQ">Most Popular</a></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="most-views">
                                                        <c:forEach var="b5" items="${blogs1}">
                                                            <div class="title">
                                                                <h3><a href="blogdetail?id=${b5.id}">${b5.title}</a></h3>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
