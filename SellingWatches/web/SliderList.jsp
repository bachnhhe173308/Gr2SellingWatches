<%-- 
    Document   : SliderList
    Created on : Feb 20, 2024, 5:03:13 PM
    Author     : THINKPAD
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,700,500italic,100italic,100' rel='stylesheet' type='text/css'>
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen"/>
        <link href="css/sequence-looptheme.css" rel="stylesheet" media="all"/>
        <link href="css/style.css" rel="stylesheet">
        <style>
            .error-message {
                color: green;
            }
            /* Global styles */

            /* Form styling */
            form {
                display: flex;
                flex-direction: column;
                gap: 10px;
                margin: 20px auto;
                width: 50%;
                padding: 20px;
                border: 1px solid #ddd;
                border-radius: 5px;
            }

            label {
                font-weight: bold;
                margin-bottom: 5px;
            }

            select, input[type="text"] {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 3px;
            }

            input[type="submit"] {
                background-color: #007bff;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 3px;
                cursor: pointer;
                margin-top: 10px;
            }

            input[type="submit"]:hover {
                background-color: #0067cc;
            }

            /* Table styling */
            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px auto;
            }

            th, td {
                padding: 10px;
                border: 1px solid #ddd;
            }

            th {
                text-align: left;
                background-color: #f2f2f2;
            }

            .imgInSliderList img {
                width: 50px;
                height: 50px;
                object-fit: cover; /* Maintain aspect ratio */
            }

            /* Error message styling (if needed) */
            .error-message {
                color: red;
                font-weight: bold;
                margin-bottom: 10px;
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
        <c:if  test = "${!empty requestScope.noticeUpdate }">
            <h4 class="error-message" style="text-align: center; margin-top: 2%; color: green">${requestScope.noticeUpdate}</h4>
        </c:if>
        <form action="SliderList" method="POST">
            <label for="statusSearch">Search by status</label>
            <select name="statusSearch" id="statusSearch">
                <option value="">Normal Search</option>      
                <option value="1">Search Active Slider</option>
                <option value="0">Search Non-active Slider</option>                              
            </select>
            <br>
            <label for="searchByTitle">Search Title</label>
            <input type="text" name="searchByTitle" value="" />
            <br>
            <label for ="searchByBackLink">Search Backlink</label>
            <input type="text" name="searchByBackLink" value="" />
            <br><br>
            <input type="submit" name="action" value="Search">
            <input type="submit" name="action" value="Reset" />
        </form>
        <form action="CreateSlider" method="GET">
            <input type="submit" name="action" value="Create Slider" />
        </form>
        <br>

        <div class="container">
            <table border="1">
                <thead>
                    <tr>
                        <th>SlideID</th>
                        <th>UserID</th>
                        <th>Title</th>
                        <th>Image</th>
                        <th>Backlink</th>
                        <th>Status</th>
                        <th>View details / Update</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${requestScope.sliderList}" var="i">
                        <tr>                    
                            <td>${i.getSliderID()}</td>
                            <td>${i.getUserID()}</td>
                            <td>${i.getSliderTitle()}</td>                        
                            <td>
                                <div class="imgInSliderList">
                                    <img src="${i.getSliderImage()}" alt="alt"/>
                                </div>
                            </td>                        
                            <td>${i.getBacklink()}</td>
                            <td>
                                <c:if test="${i.isSliderStatus() eq true}">
                                    <p> Active</p>
                                </c:if> 
                                <c:if test="${i.isSliderStatus() ne true}">
                                    <p> Inactive</p>
                                </c:if> 
                            </td>
                            <td><button><a href="EditSlider?SliderID=${i.getSliderID()}">Update</a></button></td>
                        </tr>                
                    </c:forEach>
                </tbody>
            </table>
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
