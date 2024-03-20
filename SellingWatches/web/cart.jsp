<%-- 
    Document   : product-detail
    Created on : Feb 12, 2024, 11:48:35 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,700,500italic,100italic,100' rel='stylesheet' type='text/css'>
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen"/>
        <link href="css/sequence-looptheme.css" rel="stylesheet" media="all"/>
        <link href="css/style.css" rel="stylesheet">
        <style>

            /* CSS cho bảng */
            .custom-table {
                border-collapse: collapse;
                width: 100%;
                box-shadow: 0 2px 4px rgba(0,0,0,0.2); /* Cập nhật độ mờ của bóng */
                border-radius: 5px;
                overflow: hidden;
            }
            .custom-table thead {
                background-color: #000; /* Đổi màu nền thành màu đen */
                color: #ffffff; /* Màu chữ trắng */
            }
            .custom-table th, .custom-table td {
                padding: 12px 15px;
                text-align: left;
                border-bottom: 1px solid #ddd; /* Giữ nguyên màu viền */
            }
            .custom-table tr:nth-child(even) {
                background-color: #f2f2f2; /* Màu nền cho hàng chẵn */
            }
            .custom-table tr:hover {
                background-color: #ddd; /* Màu nền khi hover */
            }
            /* Nút tùy chỉnh */
            .btn-custom {
                background-color: #000; /* Màu nền màu đen */
                color: white; /* Màu chữ trắng */
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s; /* Hiệu ứng chuyển màu */
            }
            .btn-custom:hover {
                background-color: #333; /* Màu khi hover */
            }


            /* Khi di chuột vào nút */
            .buttonv:hover {
                background-color: #45a049; /* Màu nền thay đổi khi hover */
            }
            .product-item {
                margin-bottom: 20px;
            }

            .product-item .thumbnail {
                height: 100px; /* Thiết lập chiều cao cho ảnh */
                /* Thêm bất kỳ kiểu dáng khác bạn muốn cho phần thumbnail */
            }

            .product-item .product-details {
                padding: 10px;
            }

            .product-item .product-name {
                font-size: 18px;
                font-weight: bold;
            }

            .product-item .product-price {
                color: #FC354C;
                font-size: 16px;
            }

            .product-item .product-price del {
                color: #999; /* Màu cho giá cũ */
            }
            .product-thumbnail {
                /*border: 1px solid #269abc;  Viền cho hình ảnh */
                padding: 10px; /* Tạo khoảng cách với các phần tử khác */
                box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1); /* Đường ngăn cách mờ */
                margin: 20px 0; /* Khoảng cách dưới giữa các sản phẩm */
            }
        </style>
    </head>
    <body>
        <div class="wrapper">
            <div class="header">
                <div class="container">
                    <div class="row">
                        <div class="col-md-2 col-sm-2">
                            <div class="logo"><a href="home"><img src="images/logo.png" alt="FlatShop"></a></div>
                        </div>
                        <div class="col-md-10 col-sm-10">
                            <div class="header_top">
                                <div class="row">
                                    <div class="col-md-4">

                                    </div>
                                    <div class="col-sm-8">
                                        <div class="pull-right" style="margin-top: 3%;">
                                            <ul class="nav navbar-nav">
                                                <li><a href="checkout"><i class="fa fa-crosshairs"></i> Checkout</a></li>
                                                <li><a href="carts"><i class="fa fa-shopping-cart"></i> Cart</a></li>

                                                <c:choose>
                                                    <c:when test="${empty sessionScope.user}">
                                                        <li><a href="login" class="active"><i class="fa fa-lock"></i> Login</a></li>
                                                        </c:when>

                                                    <c:when test="${sessionScope.user.roleID == 1}">
                                                        <li class="dropdown"><a href="#"><i class="fa fa-user"></i>${sessionScope.user.fullname}<i class="fa fa-angle-down"></i></a>
                                                            <ul role="menu" class="sub-menu task-bar">
                                                                <li><a href="uprofile">My Profile</a></li>
                                                                <li><a href="myorder">My Order</a></li> 
                                                                <li><a href="#">My Feedback</a></li> 
                                                                <li><a href="changepass">Change Password</a></li> 
                                                                <li><a href="logout">Log out</a></li> 
                                                            </ul>
                                                        </li> 
                                                    </c:when>

                                                    <c:when test="${sessionScope.user.roleID eq 2}">
                                                        <li class="dropdown"><a href="#"><i class="fa fa-user"></i>${sessionScope.user.fullname}<i class="fa fa-angle-down"></i></a>
                                                            <ul role="menu" class="sub-menu task-bar">
                                                                <li><a href="uprofile">My Profile</a></li>
                                                                <li><a href="myorder">My Order</a></li> 
                                                                <li><a href="admin">Setting</a></li> 
                                                                <li><a href="changepass">Change Password</a></li> 
                                                                <li><a href="logout">Log out</a></li> 
                                                            </ul>
                                                        </li>
                                                    </c:when>


                                                    <c:when test="${sessionScope.user.roleID eq 3}">
                                                        <li class="dropdown"><a href="#"><i class="fa fa-user"></i>${sessionScope.user.fullname}<i class="fa fa-angle-down"></i></a>
                                                            <ul role="menu" class="sub-menu task-bar">
                                                                <li><a href="#">MKT Dashboard</a></li>
                                                                <li><a href="postlist">Post Manager</a></li>
                                                                <li><a href="postdetail">Post detail</a></li>
                                                                <li><a href="SliderList">Slider List</a></li>
                                                                <li><a href="CustomerList">Customer List</a></li>
                                                                <li><a href="changepass">Change Password</a></li> 
                                                                <li><a href="logout">Log out</a></li> 
                                                            </ul>
                                                        </li>
                                                    </c:when>

                                                </c:choose>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="header_bottom">
                                <ul class="option">
                                    <li class="search">
                                        <form action="shop">
                                            <input class="search-submit" type="submit" value="">
                                            <input class="search-input" placeholder="Enter your search term..." type="text" value="" name="productName">
                                        </form>
                                    </li>
                                    <li class="option-cart">
                                        <a href="carts" class="cart-icon">Cart (${size} items)</a>

                                    </li>
                                </ul>
                                <div class="navbar-header"><button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button></div>
                                <div class="navbar-collapse collapse">
                                    <ul class="nav navbar-nav">
                                        <li><a href="home">Home</a></li>
                                        <li><a href="shop">Shop</a></li>
                                        <li><a href="shop?gender=1">Men</a></li>
                                        <li><a href="shop?gender=0">Women</a></li>
                                        <li><a href="blog">Blog</a></li>
                                        <li><a href="contact.html">Contact us</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="clearfix"></div>


            <div class="container_fullwidth">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="left-sidebar">



                                <div class="brands_products"><!--brands_products-->
                                    <div class="panel-group" id="accordian"><!--category-productsr-->                                       
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


                        </div>
                        <div class="col-sm-7">
                            <div class="product-information"><!--/product-information-->
                                <c:if test="${not empty cart}">
                                    <table class="custom-table">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th>ProductID</th>
                                                <th>ProductName</th>
                                                <th>img</th>
                                                <th>Quantity</th>
                                                <th>Price</th>
                                                <th>Total</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="item" items="${cart.items}">
                                            <form action="updateQuantity"> 
                                                <tr>
                                                <input type="hidden" name="productId" value="${item.product.getProductID()}" >
                                                <td>${item.product.getProductID()}</td>
                                                <td>${item.product.getProductName()}</td>
                                                <td><img src="${item.product.image}" width="50"></td>
                                                <td><input onchange="this.form.submit()" type="number" name="quantity" value="${item.quantity}" class="form-control"></td>
                                                <td>${item.price}$</td>
                                                <td>${item.quantity * item.price}$</td>
                                                <td><a href="delete?productID=${item.product.getProductID()}" class="btn btn-danger">Delete</a></td>
                                                </tr>
                                            </form>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <h4 style="margin: 5% 0px"><b>Total Cart : </b>${cart.totalMoney}$</h4>
                                    <a href="checkout" class="btn-custom btn-margin">Check Out</a>
                                    <a href="shop" class="btn-custom">Choose More Product</a>

                                </c:if>
                                <c:if test="${empty cart}">
                                    <p>Your cart is empty.</p>
                                </c:if>
                            </div><!--/product-information-->
                        </div>
                    </div>
                    <h2 style="text-align: center">
                    </h2>



                </div>
                <div class="clearfix"></div>
            </div>
        </div>

    </div>
    <div class="footer">
        <div class="footer-info">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <div class="footer-logo"><a href="#"><img src="images/logo.png" alt=""></a></div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <h4 class="title">Contact <strong>Info</strong></h4>
                        <p>FPTU, Hoa Lac, Hanoi , Vietnam</p>
                        <p>Call Us : (084) 1900 1008</p>
                        <p>Email : bachnhhe173308@fpt.edu.vn</p>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <h4 class="title">Customer<strong> Support</strong></h4>
                        <ul class="support">
                            <li><a href="#">FAQ</a></li>
                            <li><a href="#">Payment Option</a></li>
                            <li><a href="#">Booking Tips</a></li>
                            <li><a href="#">Infomation</a></li>
                        </ul>
                    </div>
                    <div class="col-md-3">
                        <h4 class="title">Get Our <strong>Newsletter </strong></h4>
                        <p>Lorem ipsum dolor ipsum dolor.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="copyright-info">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <p>Copyright © 2012. Designed by <a href="#">B</a>. All rights reseved</p>
                    </div>
                    <div class="col-md-6">
                        <ul class="social-icon">
                            <li><a href="#" class="linkedin"></a></li>
                            <li><a href="#" class="google-plus"></a></li>
                            <li><a href="#" class="twitter"></a></li>
                            <li><a href="#" class="facebook"></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Bootstrap core JavaScript==================================================-->
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.sequence-min.js"></script>
<script type="text/javascript" src="js/jquery.carouFredSel-6.2.1-packed.js"></script>
<script defer src="js/jquery.flexslider.js"></script>
<script type="text/javascript" src="js/script.min.js" ></script>
</body>
</html>
