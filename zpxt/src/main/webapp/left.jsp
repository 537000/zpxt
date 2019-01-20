<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery-1.7.2.min.js"></script>

<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
})	
</script>


</head>

<body style="background:#f0f9fd;">
	<div class="lefttop"><span></span>工作台</div>
    
    <dl class="leftmenu">
       <c:forEach items="${csgbase_user.menus}" var="ps"  varStatus="i">
		    <dd>
		    <div class="title">
		    <span>
		    <img src="images/leftico01.png" /></span>${ps.menuName}
		    </div>
		    	<ul class="menuson">
		    	    <c:forEach items="${ps.subMenus}" var="ps1"  varStatus="j">
		    	       <c:if test="${j.index ==0 }">
		                  <li class="active"><cite></cite><a href="${ps1.accessUrl}" target="frame-contect">${ps1.menuName}</a><i></i></li>
		               </c:if>
		                <c:if test="${j.index !=0 }">
		                  <li><cite></cite><a href="${ps1.accessUrl}" target="frame-contect">${ps1.menuName}</a><i></i></li>
		               </c:if>
		            </c:forEach>
		        </ul>    
		    </dd>
	    <dd>
	    </dd>
    </c:forEach>
    </dl>
    
</body>
</html>
