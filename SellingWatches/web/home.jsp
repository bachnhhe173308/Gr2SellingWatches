<%-- 
    Document   : home
    Created on : Jan 19, 2024, 7:22:02 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="images/favicon.png">
        <title>Welcome to FShop</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,700,500italic,100italic,100' rel='stylesheet' type='text/css'>
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen"/>
        <link href="css/sequence-looptheme.css" rel="stylesheet" media="all"/>
        <link href="css/style.css" rel="stylesheet">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }


            #slider {
                width: 70%;
                height: 500px;
                overflow: hidden;
                position: relative;
                margin: 0 auto;
            }

            .slide {
                width: 100%;
                height: 100%;
                position: absolute;
                top: 0;
                left: 50%;
                transform: translateX(-50%);
                opacity: 0;
                transition: opacity 0.5s ease-in-out;
            }

            #slider {
                width: 1500px;
                height: 400px;
                overflow: hidden;
                position: relative;
                margin: 0 auto;
            }
            
            .slide img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .slide a {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
            }

            /* Hiển thị slide đầu tiên */
            .slide:first-child {
                opacity: 1;
            }

            /* Nút điều khiển */
            .control {
                position: absolute;
                top: 50%;
                z-index: 10;
                transform: translateY(-50%);
                background: rgba(255, 255, 255, 0.5); /* Đặt một nền cho nút để tạo sự tương phản */
                padding: 10px;
                border-radius: 50%; /* Để tạo hình tròn cho nút */
                cursor: pointer;
            }

            .control.prev,
            .control.next {
                width: 40px; /* Đảm bảo kích thước cố định cho nút điều khiển */
                height: 40px; /* Đảm bảo kích thước cố định cho nút điều khiển */
            }

            .control.prev {
                left: 10px;
            }

            .control.next {
                right: 10px;
            }
            .control button {
                width: 20px;
                height: 20px;
                border: none;
                background-color: transparent; /* Đặt nền trong suốt */
                cursor: pointer;
            }

            .control button:hover {
                background-color: #ddd;
            }

            /* Chuyển đổi slide */
            .slide.active {
                opacity: 1;
                z-index: 1;
            }

            .slide.active~.slide {
                opacity: 0;
                z-index: 0;
            }
            .hide{
                display: none;
            }
        </style>

    </head>
    <body id="home">
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
                                        <li><a href="bloglist">Blog</a></li>
                                        <li><a href="#">Contact us</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <!--Slider-->
            <div class="containerSlider">
                <div id="slider">
                    <c:forEach items="${requestScope.sliderlist}" var="i">
                        <div class="slide">
                            <img id="${i.getSliderID()}" src="${i.getSliderImage()}" alt="${i.getSliderID()}">
                            <a href="${i.getBacklink()}" target="_blank"></a>
                        </div>
                    </c:forEach>

                    <div class="control prev">&#10094;</div>
                    <div class="control next">&#10095;</div>
                </div>
                <div class="slider-nav">
                    <c:forEach items="${requestScope.sliderlist}" var="i" >
                        <a href="#${i.getSliderID()}"></a>
                    </c:forEach>
                </div>
            </div> 
            <!--slider-->
            <div class="clearfix"></div>
            <div class="container_fullwidth">
                <div class="container">
                    <div class="hot-products">
                        <h3 class="title"><strong>Hot</strong> Products</h3>
                        <div class="row">
                            <c:forEach items="${hot_products}" var="p">
                                <div class="col-md-3 col-sm-6 product-item">
                                    <div class="products">
                                        <c:choose>
                                            <c:when test="${p.discount ne 0}">
                                                <div class="offer">-${p.discount}%</div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="offer">New</div>
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


                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                    </div>

                    <div class="text-center">
                        <button id="showMoreBtn" class="button" onclick="showMoreProducts()">Show More Products</button>
                    </div>

                    <div class="clearfix"></div>

                    <div class="best-selling">
                        <h3 class="title"><strong>Discounted</strong> Products</h3>
                        <div class="row">
                            <c:forEach items="${best_products}" var="b" varStatus="loop">
                                <div class="col-md-3 col-sm-6 product-item2">
                                    <div class="products">
                                        <c:if test="${b.discount ne 0}">
                                            <div class="offer">-${b.discount}%</div>
                                        </c:if>
                                        <div class="thumbnail"><a href="product?pid=${b.productID}"><img src="${b.image}" alt="Product Name"></a></div>
                                        <div class="productname">${b.productName}</div>
                                        <c:choose>
                                            <c:when test="${b.discount ne 0}">
                                                <div class="price">
                                                    <del>${b.price} $</del>
                                                    ${b.getPriceDiscount()} $
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="price">${b.getPriceDiscount()} $</div>
                                            </c:otherwise>
                                        </c:choose>
                                        <div class="button_group">
                                            <button class="button add-cart" type="button" onclick="addToCart(${b.productID}, '${pageContext.request.requestURL}')">Add To Cart</button>
                                            <button class="button wishlist" type="button"><i class="fa fa-heart-o"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                        <div class="text-center">
                            <button id="showMoreBtn2" class="button" onclick="showMoreProducts2()">Show More Products</button>
                        </div>

                    </div>

                    <div class="clearfix"></div>
                    <div class="our-brand">
                        <h3 class="title"><strong>Our </strong> Brands</h3>
                        <ul id="braldLogo">
                            <li>
                                <ul class="brand_item">
                                    <c:forEach items="${brand}" var="b">
                                        <li>
                                            <a href="shop?brand=${b.brandID}">
                                                <div class="brand-logo"><img src="${b.brandImg}" alt=""></div>
                                            </a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>
            <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
            <df-messenger
                intent="WELCOME"
                chat-title="ShopChat"
                agent-id="ab4b0a8d-d8e4-487c-aab6-1069c64e1a9d"
                language-code="en"
                ></df-messenger>
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
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <script>
        function addToCart(productId) {
            // Lưu URL hiện tại vào sessionStorage
            var currentURL = window.location.href; // Lấy URL hiện tại
            sessionStorage.setItem('currentURL', currentURL);
            // Chuyển hướng đến servlet "add to cart" với productId
            window.location.href = 'AddToCart?productID=' + productId;
        }

        </script>
        <script>
            const slider = document.getElementById('slider');
            const slides = slider.querySelectorAll('.slide');
            const prevBtn = document.querySelector('.control.prev');
            const nextBtn = document.querySelector('.control.next');
            let currentSlide = 0;
            let autoSlideInterval;

            function nextSlide() {
                slides[currentSlide].classList.remove('active');
                currentSlide = (currentSlide + 1) % slides.length;
                slides[currentSlide].classList.add('active');
            }

            function prevSlide() {
                slides[currentSlide].classList.remove('active');
                currentSlide = (currentSlide - 1 + slides.length) % slides.length;
                slides[currentSlide].classList.add('active');
            }

            function startAutoSlide() {
                autoSlideInterval = setInterval(nextSlide, 3000); // Thay 3000 bằng khoảng thời gian muốn chuyển đổi slide
            }

            function stopAutoSlide() {
                clearInterval(autoSlideInterval);
            }

            prevBtn.addEventListener('click', () => {
                prevSlide();
                stopAutoSlide();
                startAutoSlide(); // Bắt đầu lại chế độ tự động sau khi dừng do bấm nút
            });

            nextBtn.addEventListener('click', () => {
                nextSlide();
                stopAutoSlide();
                startAutoSlide(); // Bắt đầu lại chế độ tự động sau khi dừng do bấm nút
            });

// Set initial slide to active và bắt đầu auto slide
            slides[0].classList.add('active');
            startAutoSlide();
        </script>

        <script>
            $(document).ready(function () {
                // Ẩn tất cả các sản phẩm
                $(".product-item").hide();

                // Hiển thị 4 sản phẩm đầu tiên
                $(".product-item:lt(4)").show();
            });

            function showMoreProducts() {
                // Hiển thị thêm 4 sản phẩm
                $(".product-item:hidden").slice(0, 4).slideDown();

                // Kiểm tra xem còn sản phẩm ẩn nào không
                if ($(".product-item:hidden").length === 0) {
                    // Nếu không còn sản phẩm ẩn, ẩn nút "Show More Products"
                    $("#showMoreBtn").hide();
                }
            }
            
            $(document).ready(function () {
                // Ẩn tất cả các sản phẩm
                $(".product-item2").hide();

                // Hiển thị 4 sản phẩm đầu tiên
                $(".product-item2:lt(4)").show();
            });

            function showMoreProducts2() {
                // Hiển thị thêm 4 sản phẩm
                $(".product-item2:hidden").slice(0, 4).slideDown();

                // Kiểm tra xem còn sản phẩm ẩn nào không
                if ($(".product-item2:hidden").length === 0) {
                    // Nếu không còn sản phẩm ẩn, ẩn nút "Show More Products"
                    $("#showMoreBtn2").hide();
                }
            }
        </script>
    </body>
</html>