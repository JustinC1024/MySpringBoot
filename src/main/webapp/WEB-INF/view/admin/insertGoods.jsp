<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css"/>
<%--上传图片的样式--%>
<style type="text/css">
	*{
		margin: 0;
		padding: 0;
	}
	#upBox{
		text-align: center;
		width:500px;
		padding: 20px;
		border: 1px solid #666;
		margin: auto;
		margin-top: 150px;
		margin-bottom: 200px;
		position: relative;
		border-radius: 10px;
	}
	#inputBox{
		width: 100%;
		height: 40px;
		border: 1px solid cornflowerblue;
		color: cornflowerblue;
		border-radius: 20px;
		position: relative;
		text-align: center;
		line-height: 40px;
		overflow: hidden;
		font-size: 16px;
	}
	#inputBox input{
		width: 114%;
		height: 40px;
		opacity: 0;
		cursor: pointer;
		position: absolute;
		top: 0;
		left: -14%;

	}
	#imgBox{
		text-align: left;
	}
	.imgContainer{
		display: inline-block;
		width: 32%;
		height: 150px;
		margin-left: 1%;
		border: 1px solid #666666;
		position: relative;
		margin-top: 30px;
		box-sizing: border-box;
	}
	.imgContainer img{
		width: 100%;
		height: 150px;
		cursor: pointer;
	}
	.imgContainer p{
		position: absolute;
		bottom: -1px;
		left: 0;
		width: 100%;
		height: 30px;
		background: black;
		text-align: center;
		line-height: 30px;
		color: white;
		font-size: 16px;
		font-weight: bold;
		cursor: pointer;
		display: none;
	}
	.imgContainer:hover p{
		display: block;
	}
	#btn{
		display: inline-block;
		text-align: center;
		line-height: 30px;
		outline: none;
		width: 100px;
		height: 30px;
		background: cornflowerblue;
		border: 1px solid cornflowerblue;
		color: white;
		cursor: pointer;
		margin-top: 30px;
		border-radius: 5px;
	}
</style>
<%--富文本的样式--%>
<style type="text/css">
	.toolbar {
		border: 1px solid #ccc;
	}
	.text {
		border: 1px solid #ccc;
		height: 400px;
	}
</style>
<script src="/webjars/jquery/3.4.0/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/adminGoods/insertGoodsColorOp.js"></script>

<head>
	<title>添加商品页面</title>
</head>
<body>
<!-- 导航栏 -->
<div class="sidebar text-left">
	<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand">商品管理</a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li><a href="<%=basePath%>/adminGood/findByPage"><strong>商品首页</strong></a></li>
				</ul>
			</div>
		</div>
	</nav>
</div>
<div class="container">
	<h1 class="text-center">客户信息添加页面</h1>
	<hr/>
	<br/>
	<form class="form-inline text-center" action="#" method="post" id="uploadForm">
		<div class="form-group form-inline">
			<label>商品名称：</label>
			<input type="text" name="name" id="goods-name" class="form-control"/>
		</div>
		<br/>
		<br/>
		<div class="form-group form-inline">
			<label>商品价格：</label>
			<input type="number" name="price" id="goods-price" class="form-control"/>
		</div>
		<br/>
		<br/>
		<div class="form-group form-inline">
			<label>商品库存：</label>
			<input type="number" name="stock" id="goods-stock" class="form-control"/>
		</div>
		<br/>
		<br/>
		<div class="form-group form-inline">
			<div id="color-div">
				<div class="row">
					<select class="form-control col-sm-8 goods-color" name="colors">
						<option value="白色">白色</option>
						<option value="黑色">黑色</option>
						<option value="金色">金色</option>
						<option value="银色">银色</option>
						<option value="玫瑰金">玫瑰金</option>
					</select>

					<button type="button" class="btn btn-link delete-color" onclick="deleteColor(this)">删除颜色</button>
				</div>
			</div>
			<div class="row" style="margin-top: 10px">
				<button type="button" id="add-color" class="col-sm-offset-2 col-sm-8 btn btn-success" onclick="addColor()">增加颜色</button>
			</div>
		</div>
		<br/>
		<br/>
		<div class="form-group form-inline" style="margin-top: 20px; margin-bottom: 20px;" id="upBox">
			<div id="inputBox"><input type="file" style="width: 100%;" title="请选择商品图片" id="file" multiple accept="image/png,image/jpg,image/gif,image/JPEG"/>点击选择图片</div>
			<div id="imgBox"></div>
		</div>
		<br/>
		<br/>
		<div class="form-group form-inline" style="margin-top: 20px;width: 100%;">
			<div id="editor-tar" class="toolbar">
			</div>
			<div style="padding: 5px 0; color: #ccc"></div>
			<div id="editer-content" class="text" style="width: 100%; min-height: 600px; "> <!--可使用 min-height 实现编辑区域自动增加高度-->
				<p>请输入商品的介绍</p>
			</div>
		</div>
		<br/>
		<br/>
		<br/>
		<input type="button" class="btn btn-info text-center" id="submit-goods" value="提交"/>
		<input type="reset" class="btn btn-info text-center"/>
	</form>
</div>

</body>

<%--富文本js--%>
<script type="text/javascript" src="/js/wangEditor.js"></script>
<script type="text/javascript">
	var E = window.wangEditor
	var editor = new E('#editor-tar', '#editer-content')  // 两个参数也可以传入 elem 对象，class 选择器
	editor.customConfig.uploadImgServer = '/adminPicture/uploadImg'
	editor.customConfig.uploadFileName = 'contentImg'
	editor.create();
</script>

<%--上传图片的js--%>
<script src="/js/adminGoods/insertGoods.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	imgUpload({
		inputId:'file', //input框id
		imgBox:'imgBox', //图片容器id
		buttonId:'submit-goods', //提交按钮id
		upUrl:'/adminGood/goods',  //提交地址
		data:'img', //参数名
		num:"10"//上传个数
	})
</script>

</html>
