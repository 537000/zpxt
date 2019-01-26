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
<script language="JavaScript" src="js/jquery-1.7.2.min.js"></script>

<script type="text/javascript">
	$(function() {
		//导航切换
		$(".menuson li").click(function() {
			$(".menuson li.active").removeClass("active")
			$(this).addClass("active");
		});

		$('.title').click(function() {
			var $ul = $(this).next('ul');
			$('dd').find('ul').slideUp();
			if ($ul.is(':visible')) {
				$(this).next('ul').slideUp();
			} else {
				$(this).next('ul').slideDown();
			}
		});
	})
	
</script>


</head>

<body style="background: #f0f9fd;">
	<div class="lefttop">
		<span></span>工作台
	</div>

	<dl class="leftmenu">
			<dd>
				<ul class="menuson" id=" menuson">
				<li class="active"><cite></cite><a href="<%=basePath%>/showZpgwxx" target="frame-contect">岗位信息</a><i></i></li>
					<c:if test="${not empty user}">
						<li class="active"><cite></cite><a href="<%=basePath%>/myInfo" target="frame-contect">个人信息</a><i></i></li>
						<li class="active"><cite></cite><a href="<%=basePath%>/ygxx" target="frame-contect">员工信息</a><i></i></li>
					</c:if>
					<c:if test="${user.jobNo==8||user.deptNo==4}">
						<li class="active"><cite></cite><a href="<%=basePath%>/lzsqlb" target="frame-contect">离职申请列表</a><i></i></li>
						<li class="active"><cite></cite><a href="<%=basePath%>/ypxx" target="frame-contect">应聘信息</a><i></i></li>
					</c:if>
				</ul>
			</dd>
			<dd></dd>
	</dl>

</body>
</html>
