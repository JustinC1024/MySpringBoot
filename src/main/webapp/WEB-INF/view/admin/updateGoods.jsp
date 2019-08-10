<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script type="text/javascript" src="/js/adminGoods/updateGoodsColorOp.js"></script>
<%--<script src="/js/adminGoods/updateGoods.js" type="text/javascript" charset="utf-8"></script>--%>

<head>
	<title>修改商品页面</title>
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
					<li><a href="<%=basePath%>/adminGood/toInsert"><strong>添加商品</strong></a></li>

				</ul>
			</div>
		</div>
	</nav>
</div>
<div class="container">
	<h1 class="text-center">商品信息修改页面</h1>
	<hr/>
	<br/>
	<form class="form-inline text-center" action="#" method="post" id="uploadForm">
		<input type="hidden" name="id" value="${goods.id}">
		<div class="form-group form-inline">
			<label>商品名称：</label>
			<input type="text" name="name" id="goods-name" class="form-control" value="${goods.name}"/>
		</div>
		<br/>
		<br/>
		<div class="form-group form-inline">
			<label>商品价格：</label>
			<input type="number" name="price" id="goods-price" class="form-control" value="${goods.price}"/>
		</div>
		<br/>
		<br/>
		<div class="form-group form-inline">
			<label>商品库存：</label>
			<input type="number" name="stock" id="goods-stock" class="form-control" value="${goods.stock}"/>
		</div>
		<br/>
		<br/>
		<div class="form-group form-inline">
			<div id="color-div">
				<c:forEach items="${goods.colorList}" var="color">
					<div class="row">
						<select class="form-control col-sm-8 goods-former-color" name="colors" style=" background-color: #EEEEEE;" disabled="disabled">
							<option value="白色"
									<c:if test="${color.name == '白色'}">selected</c:if>> 白色
							</option>

							<option value="黑色"
									<c:if test="${color.name == '黑色'}">selected</c:if> >黑色
							</option>

							<option value="金色"
									<c:if test="${color.name == '金色'}">selected</c:if>>金色
							</option>

							<option value="银色"
									<c:if test="${color.name == '银色'}">selected</c:if>>银色
							</option>
							<option value="玫瑰金"
									<c:if test="${color.name == '玫瑰金'}">selected</c:if>>玫瑰金
							</option>

						</select>

						<button type="button" class="btn btn-link delete-color" colorId="${color.id}" onclick="deleteFormerColor(this)">删除颜色</button>
					</div>
				</c:forEach>
			</div>
			<div class="row" style="margin-top: 10px">
				<button type="button" id="add-color" class="col-sm-offset-2 col-sm-8 btn btn-success" onclick="addColor()">增加颜色</button>
			</div>
		</div>
		<br/>
		<br/>
		<div class="form-group form-inline" style="margin-top: 20px; margin-bottom: 20px;" id="upBox">
			<div id="inputBox"><input type="file" style="width: 100%;" title="请选择商品图片" id="file" multiple accept="image/png,image/jpg,image/gif,image/JPEG"/>点击选择图片</div>
			<div id="imgBox">
				<script type="text/javascript">
					$(function(){
						$("#imgBox").html("");
						<c:forEach items="${goods.imgList}" var="goodsImg" varStatus="st">
							imgName.push("${goodsImg.name}");
							imgSrc.push("/file/goodsImg/${goodsImg.name}");
							imgFile.push(null);

							var oldBox = $("#imgBox").html();
							$("#imgBox").html(oldBox + '<div class="imgContainer"><img title=${goodsImg.name} alt= ${goodsImg.name}  src=/file/goodsImg/${goodsImg.name} onclick="imgDisplay(this)"><p  alt="${goodsImg.name}" onclick="removeFormerImg(this,${st.index})" class="imgDelete">删除</p></div>');
						</c:forEach>
					})
				</script>

			</div>
		</div>
		<br/>
		<br/>
		<div class="form-group form-inline" style="margin-top: 20px;width: 100%;">
			<div id="editor-tar" class="toolbar">
			</div>
			<div style="padding: 5px 0; color: #ccc"></div>
			<div id="editer-content" class="text" style="width: 100%; min-height: 600px; "> <!--可使用 min-height 实现编辑区域自动增加高度-->
				${goods.content}
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

<script type="text/javascript">
	imgSrc = []; //图片路径
	imgFile = []; //文件流
	imgName = []; //图片名字
	//选择图片
	function imgUpload(obj) {
		var oInput = '#' + obj.inputId;
		var imgBox = '#' + obj.imgBox;
		var btn = '#' + obj.buttonId;
		$(oInput).on("change", function() {
			var fileImg = $(oInput)[0];
			var fileList = fileImg.files;
			for(var i = 0; i < fileList.length; i++) {
				var imgSrcI = getObjectURL(fileList[i]);
				imgName.push(fileList[i].name);
				imgSrc.push(imgSrcI);
				imgFile.push(fileList[i]);
			}
			addNewContent(imgBox);
		})

		//提交触发的函数
		$(btn).on('click', function() {
			if(!limitNum(obj.num)){
				alert("超过限制");
				return false;
			}
			//用formDate对象上传
			var fd = new FormData($('#uploadForm')[0]);

			//获取商品图片
			for(var i=0;i<imgFile.length;i++){
				if(imgFile[i] != null){
					fd.append("files",imgFile[i]);
				}

			}

			//获取商品的描述
			fd.append("content", editor.txt.html());


			submit(obj.upUrl, fd);
		})
	}
	//图片展示
	function addNewContent(obj) {
		$(imgBox).html("");
		for(var a = 0; a < imgSrc.length; a++) {
			var oldBox = $(obj).html();
			$(obj).html(oldBox + '<div class="imgContainer"><img title=' + imgName[a] + ' alt=' + imgName[a] + ' src=' + imgSrc[a] + ' onclick="imgDisplay(this)"><p  onclick="removeImg(this,' + a + ' , -1)" class="imgDelete">删除</p></div>');
		}
	}

	//删除
	function removeImg(obj, index ) {
		imgSrc.splice(index, 1);
		imgFile.splice(index, 1);
		imgName.splice(index, 1);
		var boxId = "#" + $(obj).parent('.imgContainer').parent().attr("id");
		addNewContent(boxId);

	}

	//删除商品原有的图片
	function removeFormerImg(obj, index) {
		imgSrc.splice(index, 1);
		imgFile.splice(index, 1);
		imgName.splice(index, 1);
		var boxId = "#" + $(obj).parent('.imgContainer').parent().attr("id");
		console.log($(obj).attr("alt"));
		$.ajax({
			url: "/adminPicture/deletPicture?imgName="+$(obj).attr("alt") ,
			type: 'get',
			dataType: 'json',
			contentType: 'application/json;charset=UTF-8',
			success: function (data) {
				if(data == '1'){
					//后台删除成功之后，删除前端图片
					imgSrc.splice(index, 1);
					imgFile.splice(index, 1);
					imgName.splice(index, 1);
					var boxId = "#" + $(obj).parent('.imgContainer').parent().attr("id");
					addNewContent(boxId);
				}
			}
		});
	}

	//限制图片个数
	function limitNum(num){
		if(!num){
			return true;
		}else if(imgFile.length>num){
			return false;
		}else{
			return true;
		}
	}

	//负责提交数据
	function submit(url,data) {
		if(url&&data){
			$.ajax({
				type: "put",
				url: url,
				async: true,
				data: data,
				processData: false,
				contentType: false,
				success: function(dat) {
					if(dat == '1') {
						alert("更新商品成功！3秒后跳转");
						setTimeout(window.location.href = '/adminGood/findByPage', 3);
					}else{
						alert("更新商品失败！3秒后跳转");
					}
				},
				error: function(e) {
					console.log("更新商品失败！");
				}
			});
		}else{
			alert('请打开控制台查看传递参数！');
		}
	}

	//图片灯箱
	function imgDisplay(obj) {
		var src = $(obj).attr("src");
		var imgHtml = '<div style="width: 100%;height: 100vh;overflow: auto;background: rgba(0,0,0,0.5);text-align: center;position: fixed;top: 0;left: 0;z-index: 1000;"><img src=' + src + ' style="margin-top: 100px;width: 70%;margin-bottom: 100px;"/><p style="font-size: 50px;position: fixed;top: 30px;right: 30px;color: white;cursor: pointer;" onclick="closePicture(this)">×</p></div>'
		$('body').append(imgHtml);
	}
	//关闭
	function closePicture(obj) {
		$(obj).parent("div").remove();
	}

	//图片预览路径
	function getObjectURL(file) {
		var url = null;
		if(window.createObjectURL != undefined) { // basic
			url = window.createObjectURL(file);
		} else if(window.URL != undefined) { // mozilla(firefox)
			url = window.URL.createObjectURL(file);
		} else if(window.webkitURL != undefined) { // webkit or chrome
			url = window.webkitURL.createObjectURL(file);
		}
		return url;
	}


	//从后台数据读取商品原有的图片
	function insertImg(imgList){
		$("#imgBox").html("");
		for(var i = 0 ; i < imgList.length ; i++){
			imgName.push(imgList[i].name);
			imgSrc.push("/file/goodsImg"+imgList[i].name);
			imgFile.push(null);

			var oldBox = $("#imgBox").html();
			$("#imgBox").html(oldBox + '<div class="imgContainer"><img title=' + imgList[i].name + ' alt=' + imgList[i].name + ' src=' + "/file/goodsImg"+imgList[i].name + ' onclick="imgDisplay(this)"><p onclick="removeImg(this,' + a + ' , imgList[i].id)" class="imgDelete">删除</p></div>');
		}

	}

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
