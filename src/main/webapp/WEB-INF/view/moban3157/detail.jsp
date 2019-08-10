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
    <title>${glist[0].name}</title>
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

    <!-- Body main wrapper start -->
    <div class="wrapper">

        <!-- START HEADER AREA -->
        <header class="header-area header-wrapper">
            <%--<!-- header-top-bar -->
            <div class="header-top-bar plr-185">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-6 hidden-xs">
                            <div class="call-us">
                                <p class="mb-0 roboto">(+88) 01234-567890</p>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xs-12">
                            <div class="top-link clearfix">
                                <ul class="link f-right">
                                    <li>
                                        <a href="#">
                                            <i class="zmdi zmdi-account"></i>
                                            My Account
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="zmdi zmdi-favorite"></i>
                                            Wish List (0)
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="zmdi zmdi-lock"></i>
                                            Login
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- header-middle-area -->--%>
            <div id="sticky-header" class="header-middle-area plr-185">
                <div class="container-fluid">
                    <div class="full-width-mega-dropdown">
                        <div class="row">
                            <!-- logo -->
                            <div class="col-md-2 col-sm-6 col-xs-12">
                                <div class="logo">
                                    <a href="/client/index">
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
                                    </ul>
                                </nav>
                            </div>
                            <!-- header-search & total-cart -->
                            <div class="col-md-2 col-sm-6 col-xs-12">
                                <div class="search-top-cart  f-right">
                                    <!-- header-search -->
                                    <div class="header-search f-left">
                                        <div class="header-search-inner">
                                           <button class="search-toggle">
                                            <i class="zmdi zmdi-search"></i>
                                           </button>
                                            <form action="/client/search" method="post" id="aim">
                                                <div class="top-search-box">
                                                    <input type="text" name="key" placeholder="Search here your product...">
                                                    <button type="submit" id="search">
                                                        <i class="zmdi zmdi-search"></i>
                                                    </button>
                                                </div>
                                            </form>
                                        </div>
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
                                    <li><a href="#">我的订单</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END MOBILE MENU AREA -->

        <!-- BREADCRUMBS SETCTION START -->
        <div class="breadcrumbs-section plr-200 mb-80">
            <div class="breadcrumbs overlay-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="breadcrumbs-inner">
                                <h1 class="breadcrumbs-title">${slist[0].name}</h1>
                                <ul class="breadcrumb-list">
                                    <%--<li><a href="index.html">Home</a></li>
                                    <li>Single Product</li>--%>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- BREADCRUMBS SETCTION END -->

        <!-- Start page content -->
        <section id="page-content" class="page-wrapper">

            <!-- SHOP SECTION START -->
            <div class="shop-section mb-80">
                <div class="container">
                    <div class="row">
                        <div class="col-md-9 col-xs-12">
                            <!-- single-product-area start -->
                            <div class="single-product-area mb-80">
                                <div class="row">

                                    <!-- 图片-->
                                    <!-- imgs-zoom-area start -->
                                    <div class="col-md-5 col-sm-5 col-xs-12">
                                        <div class="imgs-zoom-area">
                                            <img id="zoom_03" src="../../../file/goodsImg/${ilist[0].name}" data-zoom-image="../../../file/goodsImg/${ilist[0].name}" alt="">
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <div id="gallery_01" class="carousel-btn slick-arrow-3 mt-30">
                                                        <c:forEach var="img" items="${ilist}">
                                                            <div class="p-c">
                                                                <a href="#" data-image="../../../file/goodsImg/${img.name}"
                                                                   data-zoom-image="../../../file/goodsImg/${img.name}">
                                                                    <img class="zoom_03" src="../../../file/goodsImg/${img.name}" alt="">
                                                                </a>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- imgs-zoom-area end -->

                                    <!-- 内容-->
                                    <!-- single-product-info start -->
                                    <div class="col-md-7 col-sm-7 col-xs-12"> 
                                        <div class="single-product-info">
                                            <h3 class="text-black-1">${glist[0].name}</h3>
                                            <%--<h6 class="brand-name-2">brand name</h6>--%>
                                            <!--  hr -->
                                            <hr>
                                            <!-- single-pro-color-rating -->
                                            <div class="single-pro-color-rating clearfix">
                                                <div class="sin-pro-color f-left">
                                                    <p class="color-title f-left">颜色</p>
                                                    <div class="widget-color f-left">
                                                        <c:forEach var="col" items="${clist}">
                                                            <input type="radio" name="attendColor" value="${col.name}">&nbsp;${col.name}&nbsp;&nbsp;
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                                <%--<div class="pro-rating sin-pro-rating f-right">
                                                    <a href="#" tabindex="0"><i class="zmdi zmdi-star"></i></a>
                                                    <a href="#" tabindex="0"><i class="zmdi zmdi-star"></i></a>
                                                    <a href="#" tabindex="0"><i class="zmdi zmdi-star"></i></a>
                                                    <a href="#" tabindex="0"><i class="zmdi zmdi-star-half"></i></a>
                                                    <a href="#" tabindex="0"><i class="zmdi zmdi-star-outline"></i></a>
                                                    <span class="text-black-5">( 27 Rating )</span>
                                                </div>--%>
                                            </div>
                                            <!-- hr -->
                                            <hr>
                                            <!-- plus-minus-pro-action -->
                                            <div class="plus-minus-pro-action clearfix">
                                                <div class="sin-plus-minus f-left clearfix">
                                                    <p class="color-title f-left">数量</p>
                                                    <div >
                                                        <%--<input type="text" value="1" name="qtybutton" id="" class="cart-plus-minus-box">--%>
                                                        <input type="number" min="1" id="attendCount" name="goodsCount" value="1" style="margin-left: 60px;width: 60px; text-align: center;">
                                                        <input type="hidden" id="attendId" value="${glist[0].id}">
                                                    </div>   
                                                </div>

                                            </div>
                                            <!-- plus-minus-pro-action end -->
                                            <!-- hr -->
                                            <hr>
                                            <!-- single-product-price -->
                                            <h3 class="pro-price">Price: ￥${glist[0].price}</h3>
                                            <!--  hr -->
                                            <hr>
											<div>
												<a href="#" class="button extra-small button-black" tabindex="-1" id="attendCart">
													<span class="text-uppercase">加入购物车</span>
												</a>
											</div>
                                        </div>    
                                    </div>
                                    <!-- single-product-info end -->
                                </div>
								<!-- single-product-tab -->
								<div class="row">
									<div class="col-md-12">
										<!-- hr -->
										<hr>
										<div class="single-product-tab">
											<ul class="reviews-tab mb-20">
												<li  class="active"><a href="#description" data-toggle="tab">详情</a></li>
												<li ><a href="#reviews" data-toggle="tab">评价</a></li>
											</ul>
											<div class="tab-content">
												<div role="tabpanel" class="tab-pane active" id="description">
                                                    ${glist[0].content}
                                                </div>
												<div role="tabpanel" class="tab-pane" id="reviews">

                                                    <c:choose>
                                                        <c:when test="${!empty alist}">
                                                            <c:forEach var="list" items="${alist}">
                                                                <!-- reviews-tab-desc -->
                                                                <div class="reviews-tab-desc">
                                                                    <!-- single comments -->
                                                                    <div class="media mt-30">
                                                                        <div class="media-left">
                                                                                <%--<a href="#"><img class="media-object" src="../../../moban3157/img/author/1.jpg" alt="#"></a>--%>
                                                                        </div>
                                                                        <div class="media-body">
                                                                            <div class="clearfix">
                                                                                <div class="name-commenter pull-left">
                                                                                    <h6 class="media-heading">
                                                                                            <%--<a href="#">Gerald Barnes</a>--%>
                                                                                        <c:forEach var="user" items="${ulist}">
                                                                                            <c:if test="${user.id==list.userId}">
                                                                                                <a href="#">${user.name}</a>
                                                                                            </c:if>
                                                                                        </c:forEach>
                                                                                    </h6>
                                                                                    <p class="mb-10">${list.createTime}</p>
                                                                                </div>
                                                                                    <%--<div class="pull-right">
                                                                                        <ul class="reply-delate">
                                                                                            <li><a href="#">Reply</a></li>
                                                                                            <li>/</li>
                                                                                            <li><a href="#">Delate</a></li>
                                                                                        </ul>
                                                                                    </div>--%>
                                                                            </div>
                                                                            <p class="mb-0">${list.content}</p>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <p>暂无评价</p>
                                                        </c:otherwise>
                                                    </c:choose>

												</div>
											</div>
										</div>
										<!--  hr -->
										<hr>
									</div>
								</div>
                            </div>
                            <!-- single-product-area end -->

                        </div>

                        <!--右侧栏-->
                        <div class="col-md-3 col-xs-12">
                            <!-- widget-product -->
                            <aside class="widget widget-product box-shadow">
                                <h6 class="widget-title border-left mb-20">相似产品</h6>

                                <c:forEach var="list" items="${gslist}">
                                    <!-- product-item start -->
                                    <div class="product-item">
                                        <div class="product-img">
                                            <a href="/client/detail/${list.id}">
                                                <c:forEach var="img" items="${filist}">
                                                    <c:if test="${img.goodsId==list.id}">
                                                        <img class="gImg" src="../../../file/goodsImg/${img.name}" alt="">
                                                    </c:if>
                                                </c:forEach>
                                                <%--<img src="../../../moban3157/img/product/12.jpg" alt="">--%>
                                            </a>
                                        </div>
                                        <div class="product-info">
                                            <h6 class="product-title">
                                                <a href="/client/detail/${list.id}">${list.name}</a>
                                            </h6>
                                            <h3 class="pro-price">￥${list.price}</h3>
                                        </div>
                                    </div>
                                    <!-- product-item end -->
                                </c:forEach>

                            </aside>
                        </div>
                    </div>
                </div>
            </div>
            <!-- SHOP SECTION END -->             

        </section>
        <!-- End page content -->

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

            $("#attendCart").click(function () {
                var x=$("input[name='attendColor']:checked").val();
                var y=$("#attendId").val();
                var z=$("#attendCount").val();
                if (x!=null) {
                    $.ajax({
                        type:"post",
                        url:"/buy/addCartWithColor",
                        data:{
                            goodsId:y,
                            goodsColor:x,
                            goodsCount:z
                        },
                        dataType:"json",
                        success:function (data) {
                            if (data){
                                alert("已加入购物车");
                            } else {
                                alert("加入失败");
                            }

                            reMoney()
                            reCart()

                        },
                        error:function (data) {
                            alert("错误加载")
                        }
                    })
                }else {
                    alert("请选择颜色");
                }
            })

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
        });
    </script>

</body>

</html>
