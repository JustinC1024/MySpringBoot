<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>主页</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- All CSS Files -->
    <!-- Bootstrap fremwork main css -->
    <link rel="stylesheet" href="../../../moban3157/css/bootstrap.min.css">
    <!-- Nivo-slider css -->
    <link rel="stylesheet" href="../../../moban3157/lib/css/nivo-slider.css">
    <!-- This core.css file contents all plugings css file. -->
    <link rel="stylesheet" href="../../../moban3157/css/core.css">
    <!-- Theme shortcodes/elements style -->
    <link rel="stylesheet" href="../../../moban3157/css/shortcode/shortcodes.css">
    <!-- Theme main style -->
    <link rel="stylesheet" href="../../../moban3157/style.css">
    <!-- Responsive css -->
    <link rel="stylesheet" href="../../../moban3157/css/responsive.css">
    <!-- User style -->
    <link rel="stylesheet" href="../../../moban3157/css/custom.css">
    
    <!-- Style customizer (Remove these two lines please) -->
    <link rel="stylesheet" href="../../../moban3157/css/style-customizer.css">
    <link href="#" data-style="styles" rel="stylesheet">

    <!-- Modernizr JS -->
    <script src="../../../moban3157/js/vendor/modernizr-2.8.3.min.js"></script>


</head>

<body>
    <!--[if lt IE 8]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->

    <!-- 导向栏 -->
    <!-- Body main wrapper start -->
    <div class="wrapper">

        <!-- PC端 -->
        <!-- START HEADER AREA -->
        <header class="header-area header-wrapper header-2">
            <!-- header-middle-area -->
            <div id="sticky-header" class="header-middle-area plr-185">
                <div class="container-fluid">
                    <div class="full-width-mega-dropdown">
                        <div class="row">
                            <!-- logo -->
                            <div class="col-md-2 col-sm-6 col-xs-12">
                                <div class="logo">
                                    <a href="index.html">
                                        <img src="../../../moban3157/img/logo/logo.png" alt="main logo">
                                    </a>
                                </div>
                            </div>
                            <!-- primary-menu -->
                            <div class="col-md-8 hidden-sm hidden-xs">
                                <nav id="primary-menu">
                                    <ul class="main-menu text-center">
                                        <li><a href="/client/index">主页</a></li>
                                        <li><a href="/client/search">商品</a></li>
                                        <li><a href="/order/list">我的订单</a></li>
                                        <li><a href="/userInfo/toLogin">登录</a></li>
                                    </ul>
                                </nav>
                            </div>
                            <!-- header-search & total-cart -->
                            <div class="col-md-2 col-sm-6 col-xs-12">
                                <div class="search-top-cart  f-right">
                                    <!-- header-search -->
                                    <div class="header-search header-search-2 f-left">
                                        <div class="header-search-inner">
                                           <button class="search-toggle">
                                            <i class="zmdi zmdi-search"></i>
                                           </button>
                                            <form action="/client/search" method="post" id="aim">
                                                <div class="top-search-box">
                                                        <input type="text" name="key" placeholder="">
                                                        <button type="submit" id="search">
                                                            <i class="zmdi zmdi-search"></i>
                                                        </button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="header-account header-account-2 f-left">

                                    </div>
                                    <!-- total-cart -->
                                    <div class="total-cart total-cart-2 f-left">
                                        <div class="total-cart-in">
                                            <div class="cart-toggler">
                                                <a href="#">
                                                    <span class="cart-quantity"></span><br>
                                                    <span class="cart-icon">
                                                        <i class="zmdi zmdi-shopping-cart-plus"></i>
                                                    </span>
                                                </a>
                                            </div>
                                            <ul>
                                                <li>
                                                    <div class="top-cart-inner your-cart">
                                                        <h5 class="text-capitalize">我的购物车</h5>
                                                    </div>
                                                </li>
                                                <c:if test="${!empty list2}">
                                                    <li>
                                                        <div class="total-cart-pro" id="sinCart">

                                                            <c:forEach var="list" items="${list2}">
                                                                <!-- single-cart -->
                                                                <div class="single-cart clearfix">
                                                                    <div class="cart-img f-left">
                                                                        <a href="#">
                                                                            <img src="../../../file/goodsImg/${list.getImg()}" width="100xp" height="111px" alt="Cart Product" />
                                                                        </a>
                                                                    </div>
                                                                    <div class="cart-info f-left">
                                                                        <h6 class="text-capitalize">
                                                                            <a href="#">
                                                                                <p style="width:150px; white-space:nowrap; text-overflow:ellipsis; overflow:hidden;">${list.getName()}</p>
                                                                            </a>
                                                                        </h6>
                                                                        <p>
                                                                            <span>价格 <strong>:</strong></span>${list.getPrice()}
                                                                        </p>
                                                                        <p>
                                                                            <span>颜色 <strong>:</strong></span>${list.getType()}
                                                                        </p>
                                                                        <p>
                                                                            <span>数量 <strong>:</strong></span>${list.getNum()}
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </c:forEach>

                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="top-cart-inner subtotal" id="sinTotal">
                                                            <h4 class="text-uppercase g-font-2">
                                                                合计  ：
                                                                <span>￥${total}</span>
                                                            </h4>
                                                        </div>
                                                    </li>
                                                </c:if>
                                                <c:if test="${empty list2}">
                                                    <li>
                                                        <h5 class="text-uppercase">
                                                           暂时为空
                                                        </h5>
                                                    </li>
                                                </c:if>
                                                <li>
                                                    <div class="top-cart-inner view-cart">
                                                        <h4 class="text-uppercase">
                                                            <a href="/cart/list">详情</a>
                                                        </h4>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- END HEADER AREA -->

        <!-- 移动端 -->
        <!-- START MOBILE MENU AREA -->
        <div class="mobile-menu-area hidden-lg hidden-md">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="mobile-menu">
                            <nav id="dropdown">
                                <ul>
									<li><a href="/client/index">主页</a></li>
									<li><a href="/client/search">商品</a></li>
									<li><a href="/order/list">我的订单</a></li>
                                    <li><a href="/cart/list">购物车</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END MOBILE MENU AREA -->

        <!-- START SLIDER AREA -->
        <div class="slider-area slider-2">
            <div class="bend niceties preview-2">
                <div id="nivoslider-2" class="slides">
                    <img src="../../../moban3157/img/slider/slider-2/slider-1.jpg" alt="" title="#slider-direction-1"  />
                    <img src="../../../moban3157/img/slider/slider-2/slider-1.jpg" alt="" title="#slider-direction-2"  />
                    <img src="../../../moban3157/img/slider/slider-2/slider-1.jpg" alt="" title="#slider-direction-3"  />
                    <img src="../../../moban3157/img/slider/slider-2/slider-1.jpg" alt="" title="#slider-direction-4"  />
                    <img src="../../../moban3157/img/slider/slider-2/slider-1.jpg" alt="" title="#slider-direction-5"  />
                </div>
                <!-- ===== direction 1 ===== -->
                <div id="slider-direction-1" class="slider-direction">
                    <div class="slider-content-1">
                        <div class="title-container">
                            <div class="wow rotateInDownLeft" data-wow-duration="2s" data-wow-delay="0.5s">
                                <h6 class="slider2-title-1">Best price : $866</h6>
                            </div>
                            <div class="wow fadeInUp" data-wow-duration="1s" data-wow-delay="1s">
                                <h1 class="slider2-title-2">new smart phone</h1>
                            </div>
                            <div class="wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.5s">
                                <h2 class="slider2-title-3">Samsung grand 6</h2>
                            </div>
                            <div class="wow fadeInUp" data-wow-duration="1s" data-wow-delay="2s">
                                <p class="slider2-title-4">There are many variations of passages of Lorem Ipsum availables, but the majority have suffered alteration in some form.</p>
                            </div>
                            <div class="slider-button wow fadeInUp" data-wow-duration="1s" data-wow-delay="2.5s">
                                <a href="#" class="button extra-small button-black">
                                    <span class="text-uppercase">Buy now</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- layer 1 -->
                    <div class="slider-content-1-image">
                        <div class="wow fadeInLeft" data-wow-duration="1s" data-wow-delay="0.5s">
                            <div class="layer-1-1">
                                <img src="../../../moban3157/img/slider/slider-2/layer-1.png" alt="" />
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ===== direction 2 ===== -->
                <div id="slider-direction-2" class="slider-direction">
                    <div class="slider-content-2">
                        <div class="title-container">
                            <div class="wow rotateInDownLeft" data-wow-duration="2s" data-wow-delay="0.5s">
                                <h6 class="slider2-title-1">Best price : $866</h6>
                            </div>
                            <div class="wow fadeInUp" data-wow-duration="1s" data-wow-delay="1s">
                                <h1 class="slider2-title-2">new smart phone</h1>
                            </div>
                            <div class="wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.5s">
                                <h2 class="slider2-title-3">Samsung grand 6</h2>
                            </div>
                            <div class="wow fadeInUp" data-wow-duration="1s" data-wow-delay="2s">
                                <p class="slider2-title-4">There are many variations of passages of Lorem Ipsum availables, but the majority have suffered alteration in some form.</p>
                            </div>
                            <div class="slider-button wow fadeInUp" data-wow-duration="1s" data-wow-delay="2.5s">
                                <a href="#" class="button extra-small button-black">
                                    <span class="text-uppercase">Buy now</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- layer 1 -->
                    <div class="wow fadeInRight" data-wow-duration="1s" data-wow-delay="0.5s">
                        <div class="layer-1-1 layer-2-1">
                            <img src="../../../moban3157/img/slider/slider-2/layer-2.png" alt="" />
                        </div>
                    </div>
                </div>
                <!-- ===== direction 3 ===== -->
                <div id="slider-direction-3" class="slider-direction">
                    <div class="slider-content-1">
                        <div class="title-container">
                            <div class="wow rotateInDownLeft" data-wow-duration="2s" data-wow-delay="0.5s">
                                <h6 class="slider2-title-1">Best price : $866</h6>
                            </div>
                            <div class="wow fadeInUp" data-wow-duration="1s" data-wow-delay="1s">
                                <h1 class="slider2-title-2">new smart phone</h1>
                            </div>
                            <div class="wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.5s">
                                <h2 class="slider2-title-3">Samsung grand 6</h2>
                            </div>
                            <div class="wow fadeInUp" data-wow-duration="1s" data-wow-delay="2s">
                                <p class="slider2-title-4">There are many variations of passages of Lorem Ipsum availables, but the majority have suffered alteration in some form.</p>
                            </div>
                            <div class="slider-button wow fadeInUp" data-wow-duration="1s" data-wow-delay="2.5s">
                                <a href="#" class="button extra-small button-black">
                                    <span class="text-uppercase">Buy now</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- layer 1 -->
                    <div class="slider-content-1-image">
                        <div class="wow fadeInLeft" data-wow-duration="1s" data-wow-delay="0.5s">
                            <div class="layer-1-1">
                                <img src="../../../moban3157/img/slider/slider-2/layer-1.png" alt="" />
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ===== direction 4 ===== -->
                <div id="slider-direction-4" class="slider-direction">
                    <div class="slider-content-2">
                        <div class="title-container">
                            <div class="wow rotateInDownLeft" data-wow-duration="2s" data-wow-delay="0.5s">
                                <h6 class="slider2-title-1">Best price : $866</h6>
                            </div>
                            <div class="wow fadeInUp" data-wow-duration="1s" data-wow-delay="1s">
                                <h1 class="slider2-title-2">new smart phone</h1>
                            </div>
                            <div class="wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.5s">
                                <h2 class="slider2-title-3">Samsung grand 6</h2>
                            </div>
                            <div class="wow fadeInUp" data-wow-duration="1s" data-wow-delay="2s">
                                <p class="slider2-title-4">There are many variations of passages of Lorem Ipsum availables, but the majority have suffered alteration in some form.</p>
                            </div>
                            <div class="slider-button wow fadeInUp" data-wow-duration="1s" data-wow-delay="2.5s">
                                <a href="#" class="button extra-small button-black">
                                    <span class="text-uppercase">Buy now</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- layer 1 -->
                    <div class="wow fadeInRight" data-wow-duration="1s" data-wow-delay="0.5s">
                        <div class="layer-1-1 layer-2-1">
                            <img src="../../../moban3157/img/slider/slider-2/layer-2.png" alt="" />
                        </div>
                    </div>
                </div>
                <!-- ===== direction 5 ===== -->
                <div id="slider-direction-5" class="slider-direction">
                    <div class="slider-content-1">
                        <div class="title-container">
                            <div class="wow rotateInDownLeft" data-wow-duration="2s" data-wow-delay="0.5s">
                                <h6 class="slider2-title-1">Best price : $866</h6>
                            </div>
                            <div class="wow fadeInUp" data-wow-duration="1s" data-wow-delay="1s">
                                <h1 class="slider2-title-2">new smart phone</h1>
                            </div>
                            <div class="wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.5s">
                                <h2 class="slider2-title-3">Samsung grand 6</h2>
                            </div>
                            <div class="wow fadeInUp" data-wow-duration="1s" data-wow-delay="2s">
                                <p class="slider2-title-4">There are many variations of passages of Lorem Ipsum availables, but the majority have suffered alteration in some form.</p>
                            </div>
                            <div class="slider-button wow fadeInUp" data-wow-duration="1s" data-wow-delay="2.5s">
                                <a href="#" class="button extra-small button-black">
                                    <span class="text-uppercase">Buy now</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- layer 1 -->
                    <div class="slider-content-1-image">
                        <div class="wow fadeInLeft" data-wow-duration="1s" data-wow-delay="0.5s">
                            <div class="layer-1-1">
                                <img src="../../../moban3157/img/slider/slider-2/layer-1.png" alt="" />
                            </div>
                        </div>
                    </div>
                </div>

                <!-- ==== -->
            </div>
        </div>
        <!-- END SLIDER AREA -->

        <!-- START PAGE CONTENT -->
        <section id="page-content" class="page-wrapper">

            <!-- BANNER-SECTION START -->
            <div class="banner-section ptb-60">
                <div class="container">
                    <div class="row">
                        <!-- banner-item start -->
                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="banner-item banner-2">
                                <div class="banner-img">
                                    <a href="#"><img src="../../../moban3157/img/banner/2.jpg" alt=""></a>
                                </div>
                                <h3 class="banner-title-2"><a href="#">sony smartphone</a></h3>
                                <h3 class="pro-price">$ 869.00</h3>
                                <div class="banner-button">
                                   <a href="#">Shop now <i class="zmdi zmdi-long-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <!-- banner-item end -->
                        <!-- banner-item start -->
                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="banner-item banner-3">
                                <div class="banner-img">
                                    <a href="#"><img src="../../../moban3157/img/banner/3.jpg" alt=""></a>
                                </div>
                                <div class="banner-info">
                                    <h3 class="banner-title-2"><a href="#">Product Name</a></h3>
                                    <ul class="banner-featured-list">
                                        <li>
                                            <i class="zmdi zmdi-check"></i><span>Lorem ipsum dolor</span>
                                        </li>
                                        <li>
                                            <i class="zmdi zmdi-check"></i><span>amet, consectetur</span>
                                        </li>
                                        <li>
                                            <i class="zmdi zmdi-check"></i><span>adipisicing elitest,</span>
                                        </li>
                                        <li>
                                            <i class="zmdi zmdi-check"></i><span>eiusmod tempor</span>
                                        </li>
                                        <li>
                                            <i class="zmdi zmdi-check"></i><span>labore et dolore.</span>
                                        </li>
                                    </ul>
                                    <div class="banner-button">
                                       <a href="#">Discover <i class="zmdi zmdi-long-arrow-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- banner-item end -->
                        <!-- banner-item start -->
                        <div class="col-md-4 hidden-sm col-xs-12">
                            <div class="banner-item banner-4">
                                <div class="banner-img">
                                    <a href="#"><img src="../../../moban3157/img/banner/4.jpg" alt=""></a>
                                </div>
                                <h3 class="banner-title-2"><a href="#">phone name</a></h3>
                                <div class="banner-button">
                                   <a href="#">Shop now <i class="zmdi zmdi-long-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <!-- banner-item end -->
                    </div>
                </div>
            </div>
            <!-- BANNER-SECTION END -->

            <!-- FEATURED PRODUCT SECTION START -->
            <div class="featured-product-section section-bg-tb pt-80 pb-55">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="section-title text-left mb-20">
                                <h2 class="uppercase">最新上市</h2>
                            </div>
                        </div>
                    </div>
                    <div class="featured-product">
                        <div class="row active-featured-product slick-arrow-2">

                            <c:forEach var="list" items="${glist}">
                                <!-- product-item start -->
                                <div class="col-xs-12">
                                    <div class="product-item product-item-2">
                                        <div class="product-img">
                                            <a href="/client/detail/${list.id}">
                                                <%--<img src="../../../moban3157/img/product-2/1.jpg" alt="">--%>
                                                <%--<img class="gImg" alt="">--%>
                                                <c:forEach var="img" items="${ilist}">
                                                    <c:if test="${img.goodsId==list.id}">
                                                        <img class="gImg" src="../../../file/goodsImg/${img.name}" alt="">
                                                    </c:if>
                                                </c:forEach>
                                            </a>
                                        </div>
                                        <div class="product-info">
                                            <h6 class="product-title">
                                                <%--<a href="single-product.html">Product Name</a>--%>
                                                <a href="/client/detail/${list.id}">${list.name}</a>
                                            </h6>
                                            <%--<c:forEach var="owner" items="${slist}">
                                                <c:if test="${owner.id==list.ownerId}">
                                                    <h6 class="brand-name">${owner.name}</h6>
                                                </c:if>
                                            </c:forEach>--%>
                                            <h3 class="pro-price">￥${list.price}</h3>
                                        </div>
                                        <ul class="action-button">
                                            <%--<li>
                                                <a href="#" title="Wishlist"><i class="zmdi zmdi-favorite"></i></a>
                                            </li>--%>
                                            <li>
                                                <a href="#" data-toggle="modal"  data-target="#quickview-wrapper${list.id} #productModal" title="查看"><i class="zmdi zmdi-zoom-in"></i></a>
                                            </li>
                                            <%--<li>
                                                <a href="#" title="Compare"><i class="zmdi zmdi-refresh"></i></a>
                                            </li>--%>
                                            <li>
                                                <a href="#" onclick="joinCart(${list.id})"
                                                   title="加入购物车"><i class="zmdi zmdi-shopping-cart-plus"></i></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- product-item end -->

                                <!--JSON图片读取-->
                                <%--<script src="js/jquery.1.7.1.min.js"></script>
                                <script type="text/javascript">
                                    $(document).ready(function () {
                                        $.ajex({
                                            type:"GET",//请求类型
                                            url:"/client/ImgJson",//请求的url
                                            data:{id:${list.id}},//请求参数
                                            dataType:"json",//ajax接口（请求url）返回的数据类型
                                            success:function(data) {//data：返回数据（json对象）
                                                $(".gImg").html("src=\"" +
                                                    "../../../file/goodsImg/data.name" +
                                                    "\"");
                                            }
                                        });
                                    });
                                </script>--%>

                            </c:forEach>

                        </div>
                    </div>
                </div>
            </div>
            <!-- FEATURED PRODUCT SECTION END -->

        </section>
        <!-- END PAGE CONTENT -->

        <!-- 底部 -->
        <!-- START FOOTER AREA -->
        <footer id="footer" class="footer-area footer-2">
            <div class="footer-top footer-top-2 text-center ptb-60">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="footer-logo">
                                <img src="../../../moban3157/img/logo/logo.png" alt="">
                            </div>
                            <ul class="footer-menu-2">
                                <li><a href="#">Home</a></li>
                                <li><a href="#">Products</a></li>
                                <li><a href="#">Blog</a></li>
                                <li><a href="#">Pages</a></li>
                                <li><a href="#">About us</a></li>
                                <li><a href="#">Contact</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-bottom footer-bottom-2 text-center gray-bg">
                <div class="container">
                    <div class="row">
                       <%-- <div class="col-md-4 col-sm-5">
                            <div class="copyright-text copyright-text-2">
                                <p>Copyright &copy; 2018.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-4">
                            <ul class="footer-social footer-social-2">
                                <li>
                                    <a class="facebook" href="" title="Facebook"><i class="zmdi zmdi-facebook"></i></a>
                                </li>
                                <li>
                                    <a class="google-plus" href="" title="Google Plus"><i class="zmdi zmdi-google-plus"></i></a>
                                </li>
                                <li>
                                    <a class="twitter" href="" title="Twitter"><i class="zmdi zmdi-twitter"></i></a>
                                </li>
                                <li>
                                    <a class="rss" href="" title="RSS"><i class="zmdi zmdi-rss"></i></a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-4 col-sm-3">
                            <ul class="footer-payment">
                                <li>
                                    <a href="#"><img src="../../../moban3157/img/payment/1.jpg" alt=""></a>
                                </li>
                                <li>
                                    <a href="#"><img src="../../../moban3157/img/payment/2.jpg" alt=""></a>
                                </li>
                                <li>
                                    <a href="#"><img src="../../../moban3157/img/payment/3.jpg" alt=""></a>
                                </li>
                                <li>
                                    <a href="#"><img src="../../../moban3157/img/payment/4.jpg" alt=""></a>
                                </li>
                            </ul>
                        </div>--%>
                        <p>2019.5.10</p>
                    </div>
                </div>
            </div>
        </footer>
        <!-- END FOOTER AREA -->

        <!-- 商品放大镜功能 -->
        <!-- START QUICKVIEW PRODUCT -->

        <c:forEach var="list" items="${glist}">
            <div id="quickview-wrapper${list.id}">
                <!-- Modal -->
                <div class="modal fade," id="productModal" tabindex="-1" role="dialog">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            </div>
                            <div class="modal-body">
                                <div class="modal-product clearfix">

                                    <!--图片-->
                                    <div class="product-images">
                                        <div class="main-image images">
                                            <c:forEach var="img" items="${ilist}">
                                                <c:if test="${img.goodsId==list.id}">
                                                    <img id="qwImg" src="../../../file/goodsImg/${img.name}"  alt="">
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                    </div><!-- .product-images -->

                                    <!--内容-->
                                    <div class="product-info">
                                        <h1 id="qwH1">${list.name}</h1>
                                        <div class="price-box-3">
                                            <div class="s-price-box">
                                                <span class="new-price" id="qwSpan">￥${list.price}</span>
                                            </div>
                                        </div>
                                        <a href="/client/detail/${list.id}" class="see-all">详情</a>
                                        <div class="quick-add-to-cart">
                                            <form id="minCart${list.id}" method="post" class="cart" onsubmit="return sub()">
                                                <div class="numbers-row">
                                                    <input type="number" min="1" id="french-hens" name="goodsCount" value="1">
                                                    <input type="hidden" name="goodsId" value="${list.id}">
                                                </div>
                                                <button class="single_add_to_cart_button" type="submit" onclick="joinCartWithNum(${list.id})">加入购物车</button>
                                            </form>
                                        </div>
                                        <div class="quick-desc" id="qwDiv">
                                            ${list.content}
                                        </div>

                                    </div><!-- .product-info -->

                                </div><!-- .modal-product -->
                            </div><!-- .modal-body -->
                        </div><!-- .modal-content -->
                    </div><!-- .modal-dialog -->
                </div>
                <!-- END Modal -->
            </div>
        </c:forEach>

        <!-- END QUICKVIEW PRODUCT -->
    </div>
    <!-- Body main wrapper end -->


    <!-- Placed JS at the end of the document so the pages load faster -->

    <!-- jquery latest version -->
    <script src="../../../moban3157/js/vendor/jquery-3.1.1.min.js"></script>
    <!-- Bootstrap framework js -->
    <script src="../../../moban3157/js/bootstrap.min.js"></script>
    <!-- jquery.nivo.slider js -->
    <script src="../../../moban3157/lib/js/jquery.nivo.slider.js"></script>
    <!-- All js plugins included in this file. -->
    <script src="../../../moban3157/js/plugins.js"></script>
    <!-- Main js file that contents all jQuery plugins activation. -->
    <script src="../../../moban3157/js/main.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {

            $("#search").click(function () {
                $("#aim").submit();
            });
        });
        //封面的加入购物车
        function joinCart(x) {
            $.ajax({
                type:"post",
                url:"/buy/addCart",
                data:{goodsId:x},
                dataType:"json",
                success:function (data) {
                    if (data){
                        alert("已加入购物车");
                    } else {
                        alert("加入失败");
                    }
                    reCart()
                    reMoney()
                },
                error:function (data) {
                    alert("错误加载")
                }
            })
        }

        function joinCartWithNum(x){
            var bu="#minCart"+x;
            $.ajax({
                type:"post",
                url:"/buy/addCartWithNum",
                data:$(bu).serialize(), //区别上面的单个，封装了数量
                dataType:"json",
                success:function (data) {
                    if (data){
                        alert("已加入购物车");
                    } else {
                        alert("加入失败");
                    }
                    reCart() //刷新方法
                    reMoney()
                },
                error:function (data) {
                    alert("错误加载")
                }
            })
        }

        function sub() {
            return false;
        }
        //刷新购物车
        function reCart() {
            $.ajax({
                async:false,
                url:"/client/refleshCart",
                dataType:"json",
                success:function (data) {
                    $("#sinCart").html("");
                    for(var i = 0 ; i <  data.length ; i++) {
                        $("#sinCart").append(
                            "<div class='single-cart clearfix'><div class=\"cart-img f-left\"><a href='#'>" +
                            "<img src='../../../file/goodsImg/" + data[i].img + "' width='100xp' height='111px' alt='Cart Product' />" +
                            "</a></div><div class='cart-info f-left'>" +
                            "<h6 class='text-capitalize'><a href='#'>" +
                            " <p style='width:150px; white-space:nowrap; text-overflow:ellipsis; overflow:hidden;'>" +
                            data[i].name + "</p></a></h6><p>" +
                            " <span>价格 <strong>:</strong></span>" + data[i].price +
                            "</p><p>" +
                            "<span>颜色 <strong>:</strong></span>" + data[i].type +
                            "</p><p>" +
                            "<span>数量 <strong>:</strong></span>" + data[i].num +
                            "</p></div></div>"
                        );
                    }
                },
                error:function (data) {
                    alert("错误加载")
                }
            })
        }

        function reMoney() {
            $.ajax({
                async:false,
                url:"/client/refleshMoney",
                dataType:"json",
                success:function (data) {
                    $("#sinTotal").html("");
                    $("#sinTotal").html("<h4 class=\"text-uppercase g-font-2\">合计  ：<span>￥"
                        +data+"</span></h4>");
                },
                error:function (data) {
                    alert("错误加载")
                }
            })
        }
    </script>

</body>

</html>
