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
<title>商品</title>
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

	<script type="text/javascript">
        $(document).ready(function () {
            $("#search").click(function () {
                $("#aim").submit();
            });
        });

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
							<h1 class="breadcrumbs-title">商品</h1>
							<ul class="breadcrumb-list">
								<%--<li><a href="index.html">Home</a></li>
								<li>product grid view</li>--%>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- BREADCRUMBS SETCTION END -->

	<!-- Start page content -->
	<div id="page-content" class="page-wrapper">

		<!-- SHOP SECTION START -->
		<div class="shop-section mb-80">
			<div class="container" style="margin-left: 150px">
				<div class="row">
					<div class="col-md-12 col-md-push-3 col-sm-12">
						<div class="shop-content">
							<!-- shop-option start -->
							<div class="shop-option box-shadow mb-30 clearfix">
								<!-- Nav tabs -->
								<ul class="shop-tab f-left" role="tablist">
									<li class="active">
										<a href="#grid-view" data-toggle="tab"><i class="zmdi zmdi-view-module"></i></a>
									</li>
									<li>
										<a href="#list-view" data-toggle="tab"><i class="zmdi zmdi-view-list-alt"></i></a>
									</li>
								</ul>
								<!-- short-by -->
								<div class="short-by f-left text-center">
									<%--<span>Sort by :</span>--%>
									<%--<select>
										<option value="volvo">新旧↑</option>
										<option value="saab">新旧↓</option>
										<option value="mercedes">价格↑</option>
										<option value="audi">价格↓</option>
										<option value="mercedes">评论数↑</option>
										<option value="audi">评论数↓</option>
									</select> --%>
								</div> 
								<!-- showing -->
								<div class="showing f-right text-right">
									<%--<span>Showing : 01-09 of 17.</span>--%>
								</div>                                   
							</div>
							<!-- shop-option end -->
							<!-- Tab Content start -->
							<div class="tab-content">
								<!-- grid-view -->
								<div role="tabpanel" class="tab-pane active" id="grid-view">
									<div class="row" id="gListPage">
										<c:forEach var="list" items="${glist}">
											<!-- product-item start -->
											<div class="col-md-4 col-sm-4 col-xs-12">
												<div class="product-item">
													<div class="product-img">
														<a href="/client/detail/${list.id}">
															<c:forEach var="img" items="${ilist}">
																<c:if test="${img.goodsId==list.id}">
																	<img src="../../../file/goodsImg/${img.name}" alt="">
																</c:if>
															</c:forEach>
														</a>
													</div>
													<div class="product-info">
														<h6 class="product-title">
															<a href="/client/detail/${list.id}">${list.name}</a>
														</h6>
														<%--<div class="pro-rating">
															<a href="#"><i class="zmdi zmdi-star"></i></a>
															<a href="#"><i class="zmdi zmdi-star"></i></a>
															<a href="#"><i class="zmdi zmdi-star"></i></a>
															<a href="#"><i class="zmdi zmdi-star-half"></i></a>
															<a href="#"><i class="zmdi zmdi-star-outline"></i></a>
														</div>--%>
														<h3 class="pro-price">￥${list.price}</h3>
														<ul class="action-button">
															<%--<li>
																<a href="#" title="Wishlist"><i class="zmdi zmdi-favorite"></i></a>
															</li>
															<li>
																<a href="#" data-toggle="modal"  data-target="#productModal" title="Quickview"><i class="zmdi zmdi-zoom-in"></i></a>
															</li>
															<li>
																<a href="#" title="Compare"><i class="zmdi zmdi-refresh"></i></a>
															</li>--%>
															<li>
																<a href="#" onclick="joinCart(${list.id})" title="加入购物车"><i class="zmdi zmdi-shopping-cart-plus"></i></a>
															</li>
														</ul>
													</div>
												</div>
											</div>
											<!-- product-item end -->
										</c:forEach>

									</div>
								</div>
								<!-- list-view -->
								<div role="tabpanel" class="tab-pane" id="list-view">
									<div class="row" id="lListPage">
										<c:forEach var="list" items="${glist}">
											<!-- product-item start -->
											<div class="col-md-12">
												<div class="shop-list product-item">
													<div class="product-img">
														<a href="/client/detail/${list.id}">
															<c:forEach var="img" items="${ilist}">
																<c:if test="${img.goodsId==list.id}">
																	<img src="../../../file/goodsImg/${img.name}" alt="">
																</c:if>
															</c:forEach>
														</a>
													</div>
													<div class="product-info">
														<div class="clearfix">
															<h6 class="product-title f-left">
																<a href="/client/detail/${list.id}">${list.name} </a>
															</h6>
															<div class="pro-rating f-right">
																<%--<a href="#"><i class="zmdi zmdi-star"></i></a>
																<a href="#"><i class="zmdi zmdi-star"></i></a>
																<a href="#"><i class="zmdi zmdi-star"></i></a>
																<a href="#"><i class="zmdi zmdi-star-half"></i></a>
																<a href="#"><i class="zmdi zmdi-star-outline"></i></a>--%>
															</div>
														</div>
														<%--<h6 class="brand-name mb-30">Brand Name</h6>--%>
														<h3 class="pro-price">￥${list.price}</h3>
														<p>${list.content}</p>
														<ul class="action-button">
															<%--<li>
																<a href="#" title="Wishlist"><i class="zmdi zmdi-favorite"></i></a>
															</li>
															<li>
																<a href="#" data-toggle="modal"  data-target="#productModal" title="Quickview"><i class="zmdi zmdi-zoom-in"></i></a>
															</li>
															<li>
																<a href="#" title="Compare"><i class="zmdi zmdi-refresh"></i></a>
															</li>--%>
															<li>
																<a href="#" onclick="joinCart(${list.id})" title="加入购物车"><i class="zmdi zmdi-shopping-cart-plus"></i></a>
															</li>
														</ul>
													</div>
												</div>
											</div>
											<!-- product-item end -->
										</c:forEach>
									</div>                                        
								</div>
							</div>
							<!-- Tab Content end -->
						</div>
							<!--页码-->
							<!-- shop-pagination start -->
							<ul class="shop-pagination box-shadow text-center ptblr-10-30">
								<%--<li><a href="#"><i class="zmdi zmdi-chevron-left"></i></a></li>
								<li><a href="#">01</a></li>
								<li><a href="#">02</a></li>
								<li><a href="#">03</a></li>
								<li><a href="#">...</a></li>
								<li><a href="#">05</a></li>
								<li class="active"><a href="#"><i class="zmdi zmdi-chevron-right"></i></a></li>--%>
								<li><a href="#" id="priorPage"><i class="zmdi zmdi-chevron-left"></i></a></li>
									<c:forEach var="page" items="${page}">
										<li><a href="#" class="numPage" onclick="jump(${page})">${page}</a></li>
									</c:forEach>
								<li><a href="#" id="nextPage"><i class="zmdi zmdi-chevron-right"></i></a></li>
								<input type="hidden" disabled="true" id="totalPage" value="${totalPage}">
								<input type="hidden" disabled="true" id="nowPage" value="${nowPage}">
							</ul>
							<!-- shop-pagination end -->

						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- SHOP SECTION END -->             

	</div>
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
        var total=$("#totalPage").val();//总页数
		/*
		* 下一页
		* */
		$("#nextPage").click(function () {
		    var now=$("#nowPage").val();//当前页
			if (now==total){
			    alert("当前已经是最后一页");
			}else {
			    $.ajax({
					type:"post",
					url:"/client/pageTurn",
					data:{nowPage:now},
					dataType:"json",
                    success:function (data) {
                        $("#gListPage").html("");
                        $("#lListPage").html("");
                        for(var i = 0 ; i <  data.length ; i++){
                            $("#gListPage").append(
                                        "<div class='col-md-4 col-sm-4 col-xs-12'>" +
                                        "<div class='product-item'>" +
                                        "<div class='product-img'>" +
                                "<a href='/client/detail/"+ data[i].goods.id+"'>" +
                                        "<img src='../../../file/goodsImg/"+data[i].img.name+"' alt=''>" +
                                        " </a>" +
                                        "</div>" +
                                        "<div class='product-info'>" +
                                        "<h6 class='product-title'>" +
                                "<a href='/client/detail/"+ data[i].goods.id+"'>" +
								data[i].goods.name+"</a>" +
                                        "</h6>" +
                                        "<h3 class='pro-price'>￥"+data[i].goods.price+"</h3>" +
                                        "<ul class='action-button'>" +
                                        "<li>" +
                                "<a href='#' onclick='joinCart("+data[i].goods.id+
                                ")' title='加入购物车'><i class='zmdi zmdi-shopping-cart-plus'></i></a>" +
                                        "</li>" +
                                        "</ul>" +
                                        "</div>" +
                                        "</div>" +
                                        "</div>"
							);
                            $("#lListPage").append(
                                "<div class='col-md-12'>" +
                                "<div class='shop-list product-item''>" +
                                "<div class='product-img'>" +
                                "<a href='/client/detail/"+ data[i].goods.id+"'>" +
                                "<img src='../../../file/goodsImg/"+data[i].img.name+"' alt=''>" +
                                "</a>" +
                                "</div>" +
                                "<div class='product-info'>" +
                                "<div class='clearfix'>" +
                                "<h6 class='product-title f-left'>" +
                                "<a href='/client/detail/"+ data[i].goods.id+"'>" +
								data[i].goods.name+"</a>" +
                                "</h6>" +
                                "<div class='pro-rating f-right'>" +
                                "</div>" +
                                "</div>" +
                                "<h3 class='pro-price'>￥"+data[i].goods.price+"</h3>" +
                                "<p>"+data[i].goods.content+"</p>" +
                                "<ul class='action-button'>" +
                                "<li>" +
                                "<a href='#' onclick='joinCart("+data[i].goods.id+
                                ")' title='加入购物车'><i class='zmdi zmdi-shopping-cart-plus'></i></a>" +
                                "</li>" +
                                "</ul>" +
                                " </div>" +
                                "</div>" +
                                "</div>"
                            )
						};
                        var temp=now*1+1*1;
                        $("#nowPage").val(temp);
                    },
                    erorr:function (data){alert("未知错误")}
				})
			}
		});

		/*
		* 上一页
		* */
		$("#priorPage").click(function () {
            var now=$("#nowPage").val();//当前页
			if (now==1){
			    alert("当前已经是第一页");
			} else {
                $.ajax({
                    type:"post",
                    url:"/client/pageTurn",
                    data:{nowPage:now-2},
                    dataType:"json",
                    success:function (data) {
                        $("#gListPage").html("");
                        $("#lListPage").html("");
                        for(var i = 0 ; i <  data.length ; i++){
                            $("#gListPage").append(
                                "<div class='col-md-4 col-sm-4 col-xs-12'>" +
                                "<div class='product-item'>" +
                                "<div class='product-img'>" +
                                "<a href='/client/detail/"+ data[i].goods.id+"'>" +
                                "<img src='../../../file/goodsImg/"+data[i].img.name+"' alt=''>" +
                                " </a>" +
                                "</div>" +
                                "<div class='product-info'>" +
                                "<h6 class='product-title'>" +
                                "<a href='/client/detail/"+ data[i].goods.id+"'>" +
								data[i].goods.name+"</a>" +
                                "</h6>" +
                                "<h3 class='pro-price'>￥"+data[i].goods.price+"</h3>" +
                                "<ul class='action-button'>" +
                                "<li>" +
                                "<a href='#' onclick='joinCart("+data[i].goods.id+
								")' title='加入购物车'><i class='zmdi zmdi-shopping-cart-plus'></i></a>" +
                                "</li>" +
                                "</ul>" +
                                "</div>" +
                                "</div>" +
                                "</div>"
                            );
                            $("#lListPage").append(
                                "<div class='col-md-12'>" +
                                "<div class='shop-list product-item''>" +
                                "<div class='product-img'>" +
                                "<a href='/client/detail/"+ data[i].goods.id+"'>" +
                                "<img src='../../../file/goodsImg/"+data[i].img.name+"' alt=''>" +
                                "</a>" +
                                "</div>" +
                                "<div class='product-info'>" +
                                "<div class='clearfix'>" +
                                "<h6 class='product-title f-left'>" +
                                "<a href='/client/detail/"+ data[i].goods.id+"'>" +
								+data[i].goods.name+"</a>" +
                                "</h6>" +
                                "<div class='pro-rating f-right'>" +
                                "</div>" +
                                "</div>" +
                                "<h3 class='pro-price'>￥"+data[i].goods.price+"</h3>" +
                                "<p>"+data[i].goods.content+"</p>" +
                                "<ul class='action-button'>" +
                                "<li>" +
                                "<a href='#' onclick='joinCart("+data[i].goods.id+
                                ")' title='加入购物车'><i class='zmdi zmdi-shopping-cart-plus'></i></a>" +
                                "</li>" +
                                "</ul>" +
                                " </div>" +
                                "</div>" +
                                "</div>"
                            )
                        };
                        var temp=now-1;
                        $("#nowPage").val(temp);
                    },
                    erorr:function (data){alert("未知错误")}
                });
			}
        });
    });
		/*
		* 跳转
		* */
    function jump(x) {
        var now=$("#nowPage").val();//当前页
        $.ajax({
            type:"post",
            url:"/client/pageJump",
            data:{tar:x},
            dataType:"json",
            success:function (data) {
                $("#gListPage").html("");
                $("#lListPage").html("");
                for(var i = 0 ; i <  data.length ; i++){
                    $("#gListPage").append(
                        "<div class='col-md-4 col-sm-4 col-xs-12'>" +
                        "<div class='product-item'>" +
                        "<div class='product-img'>" +
                        "<a href='/client/detail/"+ data[i].goods.id+"'>" +
                        "<img src='../../../file/goodsImg/"+data[i].img.name+"' alt=''>" +
                        " </a>" +
                        "</div>" +
                        "<div class='product-info'>" +
                        "<h6 class='product-title'>" +
                        "<a href='/client/detail/"+ data[i].goods.id+"'>" +
						data[i].goods.name+"</a>" +
                        "</h6>" +
                        "<h3 class='pro-price'>￥"+data[i].goods.price+"</h3>" +
                        "<ul class='action-button'>" +
                        "<li>" +
                        "<a href='#' onclick='joinCart("+data[i].goods.id+
                        ")' title='加入购物车'><i class='zmdi zmdi-shopping-cart-plus'></i></a>" +
                        "</li>" +
                        "</ul>" +
                        "</div>" +
                        "</div>" +
                        "</div>"
                    );
                    $("#lListPage").append(
                        "<div class='col-md-12'>" +
                        "<div class='shop-list product-item''>" +
                        "<div class='product-img'>" +
                        "<a href='/client/detail/"+ data[i].goods.id+"'>" +
                        "<img src='../../../file/goodsImg/"+data[i].img.name+"' alt=''>" +
                        "</a>" +
                        "</div>" +
                        "<div class='product-info'>" +
                        "<div class='clearfix'>" +
                        "<h6 class='product-title f-left'>" +
                        "<a href='/client/detail/"+ data[i].goods.id+"'>" +
						data[i].goods.name+"</a>" +
                        "</h6>" +
                        "<div class='pro-rating f-right'>" +
                        "</div>" +
                        "</div>" +
                        "<h3 class='pro-price'>￥"+data[i].goods.price+"</h3>" +
                        "<p>"+data[i].goods.content+"</p>" +
                        "<ul class='action-button'>" +
                        "<li>" +
                        "<a href='#' onclick='joinCart("+data[i].goods.id+
                        ")' title='加入购物车'><i class='zmdi zmdi-shopping-cart-plus'></i></a>" +
                        "</li>" +
                        "</ul>" +
                        " </div>" +
                        "</div>" +
                        "</div>"
                    )
                };
                $("#nowPage").val(x);
            },
            erorr:function (data){alert("未知错误")}
        });
    }


</script>

</body>

</html>
