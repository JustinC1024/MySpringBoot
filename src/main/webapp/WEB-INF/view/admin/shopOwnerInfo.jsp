<%--
  Created by IntelliJ IDEA.
  User: my-deepin
  Date: 18-4-14
  Time: 下午4:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<script type="text/javascript" src="<%=basePath%>/webjars/jquery/3.4.0/jquery.min.js"></script>
<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css"/>
<script src="<%=basePath%>/js/bootstrap.min.js"></script>
<head>
    <title>添加客户功能页面</title>
</head>
<body>
<!-- 导航栏 -->
<div class="sidebar text-left">
    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand">店家个人信息</a>
            </div>
            <div>
                <ul class="nav navbar-nav">
                    <li><a href="<%=basePath%>/shopOwner/toAdmin"><strong>功能菜单</strong></a></li>
                </ul>
            </div>
        </div>
    </nav>
</div>

<div class="container">
    <h1 class="text-center">店家个人信息</h1>
    <hr/>
    <br/>
    <form class="form-inline text-center" action="#" method="post">

        <div class="form-group form-inline">
            <label>店家姓名：</label>
            <input type="text" name="name" class="form-control" value="${shopOwner.name}"/>
        </div>
        <br/>
        <br/>
        <div class="form-group form-inline">
            <label>店家密码：</label>
            <input type="password"  value="${shopOwner.password}" name="telephone" class="form-control"/>
        </div>
        <br/>
        <br/>
        <div class="form-group form-inline">
            <label>店家电话：</label>
            <input type="text" value="${shopOwner.phone}" name="telephone" class="form-control"/>
        </div>
        <br/>
        <br/>
        <div class="form-group form-inline">
            <label>店家身份证：</label>
            <input type="text" value="${shopOwner.idCard}" name="address" class="form-control"/>
        </div>
        <br/>
        <br/>

        <br/>
        <input type="button" class="btn btn-info text-center" value="修改信息" onclick="return edit()"/>
    </form>


    <!-- 编辑的模态框 -->
    <form class="form-horizontal" role="form" method="post" action="<%=basePath%>/customer/update.do"
          id="form_edit">
        <div class="modal fade" id="editModal" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">修改店家信息</h4>
                    </div>
                    <div class="modal-body" style="margin-left: 80px;">
                        <input name="id" id="id" hidden="hidden"/>
                        <div class="form-group form-inline">
                            <label>店家姓名：</label>
                            <input type="text" name="name" class="form-control" id="name"/>
                        </div>
                        <br/>
                        <br/>
                        <div class="form-group form-inline">
                            <label>店家密码：</label>
                            <input type="text" name="password" class="form-control" id="password"/>
                        </div>
                        <br/>
                        <br/>
                        <div class="form-group form-inline">
                            <label>店家电话：</label>
                            <input type="text" name="phone" class="form-control" id="phone"/>
                        </div>
                        <br/>
                        <br/>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="editSure btn btn-info" data-dismiss="modal">提交</button>
                        <button type="reset" class="btn btn-secondary" data-dismiss="modal">取消</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

</body>

<script type="text/javascript">
    // 编辑信息的方法
    function edit() {
            // 先去查询数据
            $.ajax({
                url: '<%=basePath%>/shopOwner/toUpdate',
                type: 'get',
                dataType: 'json',
                contentType: 'application/json;charset=UTF-8',
                success: function (data) {
                    $("#name").val(data.name);
                    $("#phone").val(data.phone);
                    $("#password").val(data.password);
                    $("#editModal").modal('show');
                },
                error: function () {
                    alert("错误");
                }
            });
    }

    //提交表单的方法
    $(".editSure").click(function () {
        var fd = new FormData( $("#form_edit"));
        fd.append("name" , $("#name").val());
        fd.append("password" , $("#password").val());
        fd.append("phone" , $("#phone").val());

        // 先去查询数据
        $.ajax({
            url: '<%=basePath%>/shopOwner/shopOwner',
            type:'put',
            async: true,
            data: fd,
            processData: false,
            contentType: false,
            success: function (data) {
                if(data == "1"){
                    alert("修改店家成功！");
                    $("#editModal").modal('hide');
                    setTimeout(window.location.href='/shopOwner/findOwnerById',3);

                }
            },
            error: function () {
                alert("错误");
            }
        });
    });
</script>
</html>
