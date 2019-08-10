<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>我的订单</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style type="text/css">
h1 {
	clear: both;
	margin-left: 460px;
}

table {
	margin: 0px auto;
	width: 1024px;
}

table img {
	width: 100px;
	height: 100px;
	vertical-align: middle;
}

td {
	text-align: center;
}

th {
	line-height: 50px;
	background-color: #A52A2A;
	color: white;
    text-align: center;
}

#empty {
	margin: 0px 0px 0px 20%;
}


</style>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	$(document).ready(function(e) {
		$(".del").click(function() {
			return confirm("确定要退款吗？");
		});

        $("#pay").click(function () {
            $("#buy").submit();
        });

        $("#search").click(function () {
            $("#aim").submit();
        })
	});
</script>

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

<!-- START HEADER AREA -->
<div id="sticky-header" class="header-middle-area plr-185" >
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
                                <form action="#">
                                    <div class="top-search-box">
                                        <form action="/client/search" id="aim" method="post">
                                            <input type="text" id="key" placeholder="">
                                            <button type="submit" id="search">
                                                <i class="zmdi zmdi-search"></i>
                                            </button>
                                        </form>
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
                                            <div class="total-cart-pro">

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
                                            <div class="top-cart-inner subtotal">
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
<!-- END MOBILE MENU AREA -->

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
                        <h1 class="breadcrumbs-title">个人订单</h1>
                        <ul class="breadcrumb-list">
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- BREADCRUMBS SETCTION END -->

	<hr>
	<form action="/client/index" method="post">
		<c:if test="${empty golist}">
			<div id="empty">
                 <h1 style="margin-left: 600px;margin-top: 100px">暂无</h1>
			</div>
		</c:if>
		<c:if test="${!empty golist}">
			<table>
				<tr>
					<th>商品编号</th>
					<th colspan="2">商品名称</th>
					<th>商品类型</th>
					<th>商品单价</th>
					<th>购买数量</th>
					<th>价格</th>
					<th>操作</th>
				</tr>
				
				<c:forEach items="${golist}" var="list">
					<tr class="td">
						<td>${list.goodsId}</td>
						<td><img src="../../../file/goodsImg/${list.img}" /></td>
						<td>${list.name}</td>
						<td>${list.type}</td>
						<td>${list.price}</td>
						<td>${list.num}</td>
						<td>${list.price*list.num}</td>
						<td><a
							href="/order/deleteOrder/${list.id}"
							class="del">退款</a></td>
					</tr>
				</c:forEach>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td style="font-size: 24px; font-weight: bold; color: #D2691E;"></td>
                <td colspan="2"></td>
                </tr>
            </table>
		</c:if>
	</form>
	<div style="height: 190px"></div>

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
                <p>2019.5.10</p>
            </div>
        </div>
    </div>
</footer>
<!-- END FOOTER AREA -->


</body>

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

</html>
