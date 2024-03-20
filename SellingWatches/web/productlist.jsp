<%-- 
    Document   : productlist
    Created on : Mar 3, 2024, 6:52:16 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product List</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css" rel="stylesheet">
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                padding-top: 56px;
                margin: 10px 0px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            table th {
                background-color: #343a40; /* Màu nền cho header bảng */
                color: #ffffff;
                padding: 20px 5px;
            }
            table th, table td {
                padding: 10px;
                border: 1px solid #ddd; /* đường viền xám nhạt */
                text-align: left;
            }
            table img {
                max-width: 100px; /* giới hạn chiều rộng của hình ảnh */
                height: auto; /* giữ tỉ lệ chiều cao để tránh biến dạng */
            }

            a.edit {
                color: #007bff; /* màu văn bản cho liên kết chỉnh sửa */
                text-decoration: none; /* loại bỏ gạch chân mặc định của liên kết */
            }

            a.edit:hover {
                text-decoration: underline; /* gạch chân khi di chuột qua liên kết */
            }
            #sidebar {
                height: 100vh;
                position: fixed;
                top: 0;
                left: 0;
                width: 15%;
                overflow-y: auto;
                background-color: #343a40;
                padding-top: 20px;
                transition: all 0.3s;
                z-index: 999; /* High z-index to be on top of other content */
            }

            #content {
                transition: margin-left 0.3s;
                padding: 20px;
            }

            .navbar .sidebar-toggle {
                margin-right: 10px;
                cursor: pointer;
            }
            .footer {
                /*position: fixed;*/
                bottom: 0;
                width: 100%;
                text-align: center;
                padding: 10px 0;
                background-color: #f8f9fa;
            }
            .footer .container {
                max-width: 1200px;
            }
            .footer header {
                background-color: #007bff; /* Màu nền cho header */
                padding: 10px 0;
                color: #ffffff;
                margin-bottom: 20px;
            }
            .footer header h1 {
                text-align: center;
            }
            .footer nav a {
                color: #ffffff;
                margin: 0 15px;
                font-weight: bold;
                text-decoration: none;
            }
            form {
                display: flex;
                flex-direction: row;
                align-items: center;
                margin-bottom: 20px;
            }

            label{
                margin-right: 3px;
            }

            input[type="text"],
            select {
                padding: 5px;
                margin: 10px 0px;
                margin-right: 20px;
                border-radius: 5px;
            }

            input[type="submit"], .addproduct {
                padding: 10px 10px;
                background-color: #007bff;
                color: #ffffff;
                border: none;
                cursor: pointer;
                border-radius: 10px;
            }

            input[type="submit"]:hover, .addproduct:hover {
                background-color: #0056b3;

            }
            .addproduct{
                margin-top: 10px;
            }
            .edit {
                display: inline-block;
                padding: 7px 14px;
                background-color: #FDB45E; /* Màu nền */
                color: black; /* Màu chữ */
                text-align: center;
                text-decoration: none;
                border-radius: 10px; /* Bo góc */
                transition: background-color 0.3s;
            }
            .edit:hover{
                background-color: #FE980F; /* Màu nền */
            }
            h3{
                margin-top: 5%;
            }
            h3 a {
                padding: 5px 10px;
                text-decoration: none;
                border: 1px solid #ddd;
                color: #333;
                background-color: #f9f9f9;
                margin: 0 5px;
                border-radius: 10px;
                text-decoration: none;
            }

            h3 a:hover {
                background-color: #e9e9e9;
            }

        </style>
    </head>
    <body>
        <div class="row">

            <!-- Navigation -->
            <nav class="navbar navbar-expand navbar-dark bg-dark fixed-top">
                <span class="navbar-brand sidebar-toggle" id="sidebarToggle">&#9776;</span>
                <span class="navbar-text ml-auto">
                    ${sessionScope.user.fullname}
                </span>
            </nav>
            <div class="col-lg-2">


                <!-- Sidebar -->

                <div id="sidebar" class="sidebar">

                    <nav class="nav flex-column">

                        <a class="nav-item nav-link active" href="#">Home</a>
                        <a class="nav-item nav-link" href="admin">Dashboard</a>
                        <a class="nav-item nav-link" href="home">Home</a>
                        <a class="nav-item nav-link" href="userlist">User List</a>
                        <a class="nav-item nav-link" href="#">Settings</a>
                    </nav>
                </div>
            </div>

            <div class="col-lg-10">
                <!-- Page Content -->
                <div id="content">

                    <h2>Product List</h2>
                    <div class="row">
                        <div class="col-md-10">
                            <form action="productlist" method="get">

                                <label>Search: </label>
                                <input type="text" name="name" placeholder="Product Name">

                                <label>Gender: </label>
                                <select name="gender">
                                    <option value="%">All gender</option>
                                    <option value="1">Male</option>
                                    <option value="0">Female</option>
                                </select><br/>


                                <label>Brand: </label>
                                <select name="brand">
                                    <option value="%">All Brand</option>
                                    <option value="1">Rolex</option>
                                    <option value="2">Seiko</option>
                                    <option value="3">Tissot</option>
                                    <option value="4">Casio</option>
                                    <option value="5">Orient</option>
                                </select>

                                <label>Status: </label>
                                <select name="status">
                                    <option value="%">All Status</option>
                                    <option value="1">Active</option>
                                    <option value="2">Inactive</option>
                                </select>

                                <input type="submit" value="Search">
                            </form>
                        </div>
                        <div class="col-md-2">
                            <button onclick="window.location.href = 'addProduct'" class="addproduct">Add Product</button>
                        </div>
                    </div>

                    <table>
                        <thead>
                            <tr>
                                <th>Product ID</th>
                                <th class="pname">Product Name</th>
                                <th class="description">Description</th>
                                <th>Gender</th>
                                <th>Date</th>
                                <th>Brand</th>
                                <th>Price</th>
                                <th>Discount</th>
                                <th>Image</th>
                                <th>Status</th>
                                <th>Quantity</th>
                                <th>Sold</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${sessionScope.allProducts}" var="p">
                                <tr>
                                    <td>
                                        ${p.productID}
                                    </td>
                                    <td>
                                        ${p.productName}
                                    </td>
                                    <td>
                                        ${p.description}
                                    </td>
                                    <td>
                                        ${p.genderP ? "Male" : "Female"}
                                    </td>
                                    <td>
                                        ${p.dateP}
                                    </td>
                                    <td>
                                        ${p.brand.brandName}
                                    </td>
                                    <td>
                                        $${p.price}
                                    </td>
                                    <td>
                                        ${p.discount}%
                                    </td>
                                    <td>
                                        <img src="${p.image}" alt="alt" style="width: 100px"/>
                                    </td>
                                    <td>
                                        ${p.statusP ? "Active" : "Inactive"}
                                    </td>
                                    <td>
                                        ${p.quantity}
                                    </td>
                                    <td>
                                        ${p.sold}
                                    </td>
                                    <td>
                                        <button onclick="window.location.href = 'editProduct'" class="edit">View</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <h3 style="text-align: center">
                        <c:forEach begin="1" end="${endPageProduct}" var="i">
                            <c:choose>
                                <c:when test="${param.index == i}">
                                    <a href="#" onclick="navigateToPage(${i})" style="color: #FC354C">${i}</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="#" onclick="navigateToPage(${i})">${i}</a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </h3>
                </div>
            </div>
        </div>
        <!-- Footer -->
        <footer class="footer">
            <div class="container">
                <span>&copy; 2024 My App. All rights reserved.</span>
            </div>
        </footer>
        <script>
            function navigateToPage(pageNumber) {
                // Lấy URL hiện tại
                var currentURL = window.location.href;

                // Tạo URL mới với tham số truy vấn cho trang mong muốn
                var newURL = updateQueryStringParameter(currentURL, 'index', pageNumber);

                // Chuyển đến URL mới
                window.location.href = newURL;
            }

            // Hàm để thêm hoặc cập nhật tham số truy vấn trong URL
            function updateQueryStringParameter(uri, key, value) {
                var re = new RegExp("([?&])" + key + "=.*?(&|$)", "i");
                var separator = uri.indexOf('?') !== -1 ? "&" : "?";
                if (uri.match(re)) {
                    return uri.replace(re, '$1' + key + "=" + value + '$2');
                } else {
                    return uri + separator + key + "=" + value;
                }
            }
        </script>
    </body>
</html>
