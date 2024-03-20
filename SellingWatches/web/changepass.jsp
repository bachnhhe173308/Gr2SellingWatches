<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Change password </title>
        <!--        <link rel="stylesheet" href="view/style.css">-->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,700,500italic,100italic,100' rel='stylesheet' type='text/css'>
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen"/>
        <link href="css/sequence-looptheme.css" rel="stylesheet" media="all"/>
        <link href="css/style.css" rel="stylesheet">
        <style>
            /* Reset default browser styles for a clean slate */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            /* Container for the form */
            .wrapper {
                width: 400px;
                margin: 50px auto;
                padding: 20px;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            /* Form heading */
            h2 {
                text-align: center;
                margin-bottom: 20px;
            }

            /* Form group styling */
            .form-group {
                margin-bottom: 15px;
            }

            /* Label styles */
            label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }

            /* Input field styles */
            input[type="password"] {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 3px;
                font-size: 16px;
            }

            /* Input field focus styles */
            input[type="password"]:focus {
                outline: none;
                border-color: #999;
            }

            /* Hint text styling */
            .hint {
                font-size: 12px;
                color: #999;
                margin-top: 5px;
                display: block;
            }

            /* Submit button styling */
            button[type="submit"] {
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
            }

            /* Submit button hover effect */
            button[type="submit"]:hover {
                background-color: #3e8e41;
            }
            .alert {
                padding: 15px;
                margin-bottom: 15px;
                border: 1px solid transparent;
                border-radius: 4px;
            }

            .alert-danger {
                color: #a94442;
                background-color: #f2dede;
                border-color: #ebccd1;
            }

            .alert-success {
                color: #3c763d;
                background-color: #dff0d8;
                border-color: #d6e9c6;
            }
        </style>
    </head>
    <body>        
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
                                        <ul class="option_nav">
                                            <li class="dorpdown">
                                                <a href="#">Eng</a>
                                                <ul class="subnav">
                                                    <li><a href="#">Eng</a></li>
                                                    <li><a href="#">Vns</a></li>
                                                    <li><a href="#">Fer</a></li>
                                                    <li><a href="#">Gem</a></li>
                                                </ul>
                                            </li>
                                            <li class="dorpdown">
                                                <a href="#">USD</a>
                                                <ul class="subnav">
                                                    <li><a href="#">USD</a></li>
                                                    <li><a href="#">UKD</a></li>
                                                    <li><a href="#">FER</a></li>
                                                </ul>
                                            </li>
                                        </ul>
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
                                                                <li><a href="#">My Order</a></li> 
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
                                                                <li><a href="#">My Order</a></li> 
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
        <!--            validate lỗi-->
        <%
        if (request.getAttribute("error") != null) {
        %>
        <div class="alert alert-danger">
            <strong>Error:</strong> <%= request.getAttribute("error") %>
        </div>
        <%
            }
        %>

        <!--        thong bao success-->
        <%
            if (request.getAttribute("success") != null) {
        %>
        <div class="alert alert-success">
            <strong>Success:</strong> <%= request.getAttribute("success") %>
        </div>
        <%
            }
        %>


        <div class="wrapper">
            <form action="changepass" method="post" novalidate>
                <h2>Change Password</h2>

                <div class="form-group">
                    <label for="currentpass">Current Password</label>
                    <input id="currentpass" type="password" name="currentpass" required aria-label="Enter your current password">
                </div>

                <div class="form-group">
                    <label for="newpass">New Password</label>
                    <input id="newpass" type="password" name="newpass" required aria-label="Enter your new password">
                    <span class="hint">Must be at least 8 characters, including a lowercase letter, an uppercase letter, a number, and a special character.</span>
                </div>

                <div class="form-group">
                    <label for="confirmpass">Confirm Password</label>
                    <input id="confirmpass" type="password" name="confirmpass" required aria-label="Confirm your new password">
                </div>

                <div class="form-actions">
                    <button type="submit">Submit</button>
                </div>
            </form>
        </div>
        <div class="clearfix"></div>
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
    </body>
</html>
