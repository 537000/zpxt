<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		//顶部导航切换
		$(".nav li a").click(function() {
			$(".nav li a.selected").removeClass("selected")
			$(this).addClass("selected");
		})
	})
</script>


</head>

<body style="background: url(images/topbg.gif) repeat-x;">

	<div class="topleft">
		<a href="javascript:showZpgwxx()" target="frame-contect"><img
			src="images/logo.png" title="系统首页" /></a>
	</div>

	<ul class="nav">
		<li><a href="<%=basePath%>/showZpgwxx" target="frame-contect"><img
				src="images/icon01.png" title="岗位信息" />
		<h2>岗位信息</h2></a></li>
		<c:if test="${not empty user}">
			<li><a href="<%=basePath%>/myInfo" id="${user.userNo}" name="my" target="frame-contect"><img
				src="images/icon02.png" title="个人信息" />
			<h2>个人信息</h2></a></li>
			<li><a href="<%=basePath%>/ygxx" target="frame-contect"><img
				src="images/icon03.png" title="员工信息" />
			<h2>员工信息</h2></a></li>
		</c:if>
		<c:if test="${user.jobNo==8||user.deptNo==4}">
			<li><a href="<%=basePath%>/lzsqlb" id="${user.userNo}" name="my" target="frame-contect"><img
				src="images/icon02.png" title="离职申请列表" />
			<h2>离职申请列表</h2></a></li>
			<li><a href="<%=basePath%>/ypxx" target="frame-contect"><img
				src="images/icon02.png" title="应聘信息" />
			<h2>应聘信息</h2></a></li>
		</c:if>
		
		<!-- <li><a href="computer.html" target="rightFrame"><img src="images/icon05.png" title="文件管理" /><h2>文件管理</h2></a></li>
    <li><a href="tab.html"  target="rightFrame"><img src="images/icon06.png" title="系统设置" /><h2>系统设置</h2></a></li>-->

	</ul>


	<div class="topright">
		<ul>
			<li><span><img src="images/help.png" title="帮助"
					class="helpimg" /></span><a href="#">帮助</a></li>
			<li><a href="#">关于</a></li>
			<li><a href="<%=basePath%>/logout" target="_parent">退出</a></li>
		</ul>
		<div class="user">
			<c:if test="${not empty user}">
				<span>你好，${user.userName}</span>
			</c:if>
			<c:if test="${empty user}">
				<span>应聘者，你好</span>
			</c:if>
			<!--  <i>消息</i> -->
			<!--  <b>1</b> -->
		</div>
	</div>
	<img src="<%=basePath%>/images/notice.png" height="27px;"
		width="27px;" class="notice" style="margin-top: 30px;" />
	<p class="microsoft marquee">${user.state}</p>
</body>
</html>

