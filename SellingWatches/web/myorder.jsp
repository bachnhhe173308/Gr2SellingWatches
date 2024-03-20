<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>My Orders</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,700,500italic,100italic,100' rel='stylesheet' type='text/css'>
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen"/>
        <link href="css/sequence-looptheme.css" rel="stylesheet" media="all"/>
        <link href="css/style.css" rel="stylesheet">
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }
            h1 {
                text-align: center;
                margin-top: 20px;
            }
            form {
                text-align: center;
                margin-bottom: 20px;
            }
            table {
                width: 80%;
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
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="left-sidebar">
                        <h2 style="margin-top: 15%">Gender</h2>
                        <div class="panel-group" id="accordian"><!--category-productsr-->

                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title"><a href="shop?gender=1">Mans</a></h4>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title"><a href="shop?gender=0">Womans</a></h4>
                                </div>
                            </div>
                        </div><!--/category-productsr-->

                        <div class="brands_products"><!--brands_products-->
                            <h2>Brands</h2>
                            <div class="panel-group" id="accordian"><!--category-productsr-->
                                <c:forEach items="${brand}" var="b">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title"><a href="shop?brand=${b.brandID}">${b.brandName}</a></h4>
                                        </div>
                                    </div>
                                </c:forEach>

                            </div><!--/category-productsr-->
                        </div><!--/brands_products-->
                        <h2 style="margin-top: 15%">The latest products</h2>
                        <c:forEach items="${sessionScope.lastestP}" var="l">
                            <div class="product-item product-thumbnail row">
                                <div class="col-md-5">
                                    <div class="thumbnail">
                                        <img src="${l.image}" alt="${l.productName}"/>
                                    </div>
                                </div>
                                <div class="col-md-7">
                                    <div class="product-details">
                                        <div class="product-name" style="color: #007bff">${l.productName}</div>
                                        <div class="product-price">
                                            <c:choose>
                                                <c:when test="${l.discount ne 0}">
                                                    <del>${l.price} $</del>
                                                    ${l.getPriceDiscount()} $
                                                </c:when>
                                                <c:otherwise>
                                                    ${l.getPriceDiscount()} $
                                                </c:otherwise>
                                            </c:choose>
                                            <a href="product?pid=${l.productID}" class="btn btn-primary">Show</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <div class="col-lg-9">
                    <h1>My Orders</h1>
                    <form action="myorder" method="post">
                        <label for="orderDate">Search by Order Date:</label>
                        <input type="date" id="orderDate" name="orderDate">
                        <button type="submit">Search</button>
                    </form>
                    <table border="1">
                        <tr>
                            <th>Order ID</th>
                            <th>Order Date</th>
                            <th>Total</th>
                            <th>Action</th>
                        </tr>
                        <c:forEach var="order" items="${orders}">
                            <tr>
                                <td>${order.getOrderID()}</td>
                                <td>${order.getOder_date()}</td>
                                <td>${order.getTotal()}</td>
                                <td><a href="orderdetail?orderId=${order.getOrderID()}">View more</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                    <%-- Nút "Back to My Order" --%>
                    <button onclick="window.location.href = 'home';">Back to Home</button>

                </div>
                <div class="clearfix"></div>
            </div>
        </div>

    </body>
</html>