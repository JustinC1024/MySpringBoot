
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css"/>
<link rel="stylesheet" href="<%=basePath%>/css/font-awesome.min.css"/>
<head>
	<title>商品管理页面</title>
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
					<li><a href="<%=basePath%>/shopOwner/toAdmin"><strong>店家功能菜单</strong></a></li>
					<li><a href="<%=basePath%>/adminGood/toInsert"><strong>添加信息功能</strong></a></li>
				</ul>
			</div>
		</div>
	</nav>
</div>
<br/>
<div class="container">
	<h1 class="text-center">商品信息页面</h1>
	<hr/>
	<br/>
	<form class="form-inline" action="<%=basePath%>/adminGood/findByPage" method="post">
		<div class="form-group">
			<label>商品名称：</label>
			<input type="text" class="form-control" name="name"/>
		</div>

		&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;
		<div class="form-group">
			<input type="submit" value="查询" class="form-control btn btn-info"/>
			&nbsp;&nbsp;
			<input type="reset" value="重置" class="form-control btn btn-danger"/>
		</div>
	</form>
	<br/>
	<hr/>
	<div class="table-responsive">
		<table class="table table-hover table-striped">
			<thead>
			<tr>
				<th style="text-align: center;">商品编号</th>
				<th style="text-align: center;">商品名称</th>
				<th style="text-align: center;">商品价格</th>
				<th style="text-align: center;">商品库存</th>
				<th style="text-align: center;">商品颜色</th>
				<th style="text-align: center;">操作</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${requestScope.pageInfo.list}" var="goods">
				<tr class="text-center">
					<td>${goods.id}</td>
					<td>${goods.name}</td>
					<td>${goods.price}</td>
					<td>${goods.stock}</td>
					<td>${goods.colorList[0].name}</td>
					<td>
						<a href="/adminGood/goods/${goods.id}" style="text-decoration: none;">
							<span class="fa fa-edit fa-fw"></span>
						</a>
						<a href="#" onclick="return trash(this , '/adminGood/goods/${goods.id}')" style="text-decoration: none;"
						   data-toggle="modal" data-target="#trashModal">
							<span class="fa fa-trash-o fa-fw"></span>
						</a>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<form class="listForm" method="post" action="<%=basePath%>/adminGood/findByPage">
		<div class="row">
			<div class="form-inline">
				<label style="font-size:14px;margin-top:22px;">
					<strong>共<b>${requestScope.pageInfo.total}</b>条记录，共<b>${requestScope.pageInfo.pages}</b>页</strong>
					&nbsp;
					&nbsp;
					<strong>每页显示</strong>
					<input name="pageCode" value="${requestScope.pageInfo.pageNum}" hidden="hidden"/>
					<select class="form-control" name="pageSize">
						<option value="2"
								<c:if test="${requestScope.pageInfo.pageSize == 2}">selected</c:if> >2
						</option>
						<option value="3"
								<c:if test="${requestScope.pageInfo.pageSize == 3}">selected</c:if> >3
						</option>
						<option value="4"
								<c:if test="${requestScope.pageInfo.pageSize == 4}">selected</c:if> >4
						</option>
						<option value="5"
								<c:if test="${requestScope.pageInfo.pageSize == 5}">selected</c:if> >5
						</option>
					</select>
					<strong>条</strong>
					&nbsp;
					&nbsp;
					<strong>到第</strong>&nbsp;<input type="text" size="3" id="page" name="pageNum"
													class="form-control input-sm"
													style="width:11%"/>&nbsp;<strong>页</strong>
					&nbsp;
					<button type="submit" class="btn btn-sm btn-info">GO!</button>
				</label>

				<ul class="pagination" style="float:right;">
					<li>
						<a href="<%=basePath%>/adminGood/findByPage?pageNum=1"><strong>首页</strong></a>
					</li>
					<li>
						<c:if test="${requestScope.pageInfo.pageNum > 2}">
							<a href="<%=basePath%>/adminGood/findByPage?pageNum=1?pageNum=${requestScope.pageInfo.pageNum - 1}">&laquo;</a>
						</c:if>
					</li>

					<!-- 写关于分页页码的逻辑 -->
					<c:choose>
						<c:when test="${requestScope.pageInfo.pages <= 5}">
							<c:set var="begin" value="1"/>
							<c:set var="end" value="${requestScope.pageInfo.pages}"/>
						</c:when>
						<c:otherwise>
							<c:set var="begin" value="${requestScope.pageInfo.pages - 1}"/>
							<c:set var="end" value="${requestScope.pageInfo.pages + 3}"/>

							<!-- 头溢出 -->
							<c:if test="${begin < 1}">
								<c:set var="begin" value="1"/>
								<c:set var="end" value="5"/>
							</c:if>

							<!-- 尾溢出 -->
							<c:if test="${end > requestScope.pageInfo.pages}">
								<c:set var="begin" value="${requestScope.pageInfo.pages -4}"/>
								<c:set var="end" value="${requestScope.pageInfo.pages}"/>
							</c:if>
						</c:otherwise>
					</c:choose>

					<!-- 显示页码 -->
					<c:forEach var="i" begin="${begin}" end="${end}">
						<!-- 判断是否是当前页 -->
						<c:if test="${i == requestScope.pageInfo.pageNum}">
							<li class="active"><a href="javascript:void(0);">${i}</a></li>
						</c:if>
						<c:if test="${i != requestScope.pageInfo.pageNum}">
							<li>
								<a href="<%=basePath%>/adminGood/findByPage?pageNum=${i}&pageSize=${requestScope.pageInfo.pageSize}">${i}</a>
							</li>
						</c:if>
					</c:forEach>

					<li>
						<c:if test="${requestScope.page.pageCode < requestScope.page.totalPage}">
							<a href="<%=basePath%>/adminGood/findByPage.do?pageNum=${requestScope.pageInfo.pageNum + 1}">&raquo;</a>
						</c:if>
					</li>
					<li>
						<a href="<%=basePath%>/adminGood/findByPage?pageNum=${requestScope.pageInfo.total}"><strong>末页</strong></a>
					</li>
				</ul>
			</div>
		</div>
	</form>

	<!-- 删除的模态框 -->
	<div class="modal fade" id="trashModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- 模糊框头部 -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;
					</button>
					<h4 class="modal-title">警告！</h4>
				</div>
				<!-- 模糊框主体 -->
				<div class="modal-body">
					<strong>你确定要删除吗？</strong>
				</div>
				<!-- 模糊框底部 -->
				<div class="modal-footer">
					<button type="button" class="delSure btn btn-info" data-dismiss="modal">确定</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>


</div>
</body>
<script src="<%=basePath%>/js/jquery-3.3.1.min.js"></script>
<script src="<%=basePath%>/js/bootstrap.min.js"></script>

<script type="text/javascript">
	// 删除信息的方法
	function trash(myself , path) {
		$(".delSure").click(function () {
			$.ajax({
				url: path,
				type: 'delete',
				dataType: 'json',
				contentType: 'application/json;charset=UTF-8',
				success: function (data) {
					if(data == '1'){
						alert("删除商品成功!");
						$(myself).parent().parent().remove();
					}
				},
				error: function () {
					alert("商品删除失败！");
				}
			});
		});
	}

</script>
</html>
