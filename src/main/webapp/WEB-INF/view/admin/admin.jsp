<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>店家管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
table{margin: 13% auto;width: 130px;}
html body{background-image: url("img/admin/control.jpg") none;}

</style>
  </head>
  
  <body>
    <div>
    	<table>
    	<caption>店家管理平台</caption>
    		<tr><td>&nbsp;</td></tr>
    		<tr><td><a href="/">1、网站首页</a></td></tr>
			<tr><td>&nbsp;</td></tr>
			<tr><td><a href="/shopOwner/toLogin">2、返回登录</a></td></tr>
			<tr><td>&nbsp;</td></tr>
			<tr><td><a href="/shopOwner/findOwnerById">3、个人管理</a></td></tr>
    		<tr><td>&nbsp;</td></tr>
    		<tr><td><a href="/adminGood/findByPage">4、商品信息管理</a></td></tr>
    	</table>
    </div>
  </body>
</html>
