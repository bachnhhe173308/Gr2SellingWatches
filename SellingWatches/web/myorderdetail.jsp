<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Order Detail</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                text-align: center;
                background-image: url("images/anh-myorderdetail.jpg"); /* Đường dẫn đến tệp ảnh đồng hồ */
                background-size: cover;
                background-position: center;
            }
            h1, h2 {
                margin-top: 20px;
            }
            table {
                margin: 20px auto;
                border-collapse: collapse;
                border: 1px solid #ddd;
                background-color: #fff;
            }
            th, td {
                padding: 10px;
                border: 1px solid #ddd;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            tr:nth-child(even) {
                background-color: #f9f9f9;
            }
            tr:hover {
                background-color: #f2f2f2;
            }
            button {
                display: block;
                margin: 20px auto;
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            button:hover {
                background-color: #45a049;
            }

        </style>
    </head>
    <body>
        <h1>Order Detail</h1>

        <%-- Hiển thị thông tin người dùng --%>
        <h2>Customer Information:</h2>
        <p>Fullname: ${user.fullname}</p>
        <p>Mail: ${user.mail}</p>
        <p>Address: ${user.address}</p>
        <p>Phone: ${user.phone}</p>

        <hr>

        <%-- Hiển thị thông tin đơn hàng --%>
        <h2>Order Information:</h2>
        <p>Order ID: ${order.getOrderID()}</p>
        <p>Order Date: ${order.getOder_date()}</p>
        <p>Total: ${order.getTotal()}</p>

        <hr>

        <table border="1">
            <tr>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Price</th>
            </tr>
            <c:forEach var="detail" items="${orderDetails}">
                <tr>
                    <td><a href="product?pid=${detail.getProductID()}"style="text-decoration: none; color: inherit;">${detail.getProductNameorder()}</td>
                    <td>${detail.getQuantity()}</td>
                    <td>${detail.getPrice()}</td>
                </tr>
            </c:forEach>
        </table>
        <%-- Nút "Back to My Order" --%>
        <button onclick="window.location.href = 'myorder';">Back to My Order</button>
    </body>
</html>