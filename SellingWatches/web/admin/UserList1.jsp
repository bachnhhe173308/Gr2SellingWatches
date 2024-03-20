<%-- 
    Document   : UserList1
    Created on : Feb 25, 2024, 12:25:32 AM
    Author     : Admin
--%>

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
                                                <li><a href="#"><i class="fa fa-crosshairs"></i> Checkout</a></li>
                                                <li><a href="carts"><i class="fa fa-shopping-cart"></i> Cart</a></li>

                                                <c:choose>
                                                    <c:when test="${empty sessionScope.account}">
                                                        <li><a href="login" class="active"><i class="fa fa-lock"></i> Login</a></li>
                                                        </c:when>

                                                    <c:when test="${sessionScope.account.roleID eq 1}">
                                                        <li class="dropdown"><a href="#"><i class="fa fa-user"></i>${sessionScope.account.user.userName}<i class="fa fa-angle-down"></i></a>
                                                            <ul role="menu" class="sub-menu task-bar">
                                                                <li><a href="uprofile">My Profile</a></li>
                                                                <li><a href="#">My Order</a></li> 
                                                                <li><a href="#">My Feedback</a></li> 
                                                                <li><a href="changepass">Change Password</a></li> 
                                                                <li><a href="logout">Log out</a></li> 
                                                            </ul>
                                                        </li> 
                                                    </c:when>

                                                    <c:when test="${sessionScope.account.roleID eq 2}">
                                                        <li class="dropdown"><a href="#"><i class="fa fa-user"></i>${sessionScope.account.user.userName}<i class="fa fa-angle-down"></i></a>
                                                            <ul role="menu" class="sub-menu task-bar">
                                                                <li><a href="uprofile">My Profile</a></li>
                                                                <li><a href="#">My Order</a></li> 
                                                                <li><a href="adminDashboard">Setting</a></li> 
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
                                <h2>Gender</h2>
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


                            <div class="hot-products">
                                <h3 class="title"><strong>Featured</strong> Products</h3>
                                <form action="shop" method="get">
                                    <div>
                                        <label for="searchName">Search by Name:</label>
                                        <input type="text" name="productName">
                                    </div>
                                    <button type="submit">Search</button>
                                </form>
                                <div class="row">
                                    <c:forEach items="${requestScope.products}" var="p">
                                        <div class="col-md-4 col-sm-6">
                                            <div class="products">
                                                <c:choose>
                                                    <c:when test="${p.discount ne 0}">
                                                        <div class="offer">-${p.discount}%</div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:forEach items="${requestScope.newProducts}" var="n">
                                                            <c:if test="${p.productID eq n.productID}">
                                                                <div class="offer">New</div>
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:otherwise>
                                                </c:choose>
                                                <div class="thumbnail"><a href="product?pid=${p.productID}"><img src="${p.image}" alt="Product Name"></a></div>
                                                <div class="productname">${p.productName}</div>
                                                <c:choose>
                                                    <c:when test="${p.discount ne 0}">
                                                        <div class="price">
                                                            <del>${p.price} $</del>
                                                            ${p.getPriceDiscount()} $
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="price">${p.getPriceDiscount()} $</div>
                                                    </c:otherwise>
                                                </c:choose>
                                                <div class="button_group">
                                                    <button class="button add-cart" type="button" onclick="addToCart(${p.productID}, '${pageContext.request.requestURL}')">Add To Cart</button>
                                                    <button class="button wishlist" type="button"><i class="fa fa-heart-o"></i></button>
                                                </div>

                                                <script>
                                                    function addToCart(productId) {
                                                        // Lưu URL hiện tại vào sessionStorage
                                                      
                                                        // Chuyển hướng đến servlet "add to cart" với productId
                                                        window.location.href = 'AddToCart?productID=' + productId;
                                                    }

                                                </script>

                                            </div>
                                        </div>
                                    </c:forEach>

                                </div>

                            </div>
                            <h3 style="text-align: center">
                                <c:forEach begin="1" end="${endPage}" var="i">
                                    <c:set var="urlParams" value="shop" />
                                    <!-- Kiểm tra nếu có tham số gender thì thêm vào URL -->
                                    <c:if test="${not empty param.gender}">
                                        <c:set var="urlParams" value="${urlParams}?gender=${param.gender}" />
                                    </c:if>
                                    <!-- Kiểm tra nếu có tham số brand thì thêm vào URL -->
                                    <c:if test="${not empty param.brand}">
                                        <c:set var="urlParams" value="${urlParams}?brand=${param.brand}" />
                                    </c:if>
                                    <!-- Kiểm tra nếu có tham số productName thì thêm vào URL -->
                                    <c:if test="${not empty param.productName}">
                                        <c:set var="urlParams" value="${urlParams}?productName=${param.productName}" />
                                    </c:if>
                                    <!-- Kiểm tra xem urlParams có chứa '?' không để quyết định sử dụng dấu '?' hoặc '&' -->
                                    <c:choose>
                                        <c:when test="${empty param.gender and empty param.brand and empty param.productName}">
                                            <c:set var="urlParams" value="${urlParams}?index=${i}" />
                                        </c:when>
                                        <c:otherwise>
                                            <c:set var="urlParams" value="${urlParams}&amp;index=${i}" />
                                        </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${param.index == i}">
                                            <a href="${urlParams}" style="color: #FC354C">${i}</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="${urlParams}">${i}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </h3>



                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
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
                            <form class="newsletter">
                                <input type="text" name="" placeholder="Type your email....">
                                <input type="submit" value="SignUp" class="button">
                            </form>
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
