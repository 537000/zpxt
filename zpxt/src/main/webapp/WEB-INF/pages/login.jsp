<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎来到Mlxg人力招聘系统</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="${ctx}/js/jquery-1.7.2.min.js"></script>
<script src="js/cloud.js" type="text/javascript"></script>

<script language="javascript">
	$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
});  
</script> 

</head>

<body style="background-color:#1c77ac; background-image:url(images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">

    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  
    
    <div class="loginbody">
    
    <span class="systemlogo"></span> 
       
    <div class="loginbox">
    
    <ul>
    <li><input name="username" id="username" type="text" class="loginuser"  onclick="JavaScript:this.value=''"/></li>
    <li><input name="password" id="password"  type="password" class="loginpwd"  onclick="JavaScript:this.value=''"/></li>
    <li>
    	<select id="loginType" name="loginType" class="logintype">
    		<option value="1">员工</option>
    		<option value="2">经理</option>
    	</select>
    </li>
    
    <li>
	    <input name="login" type="button" class="loginbtn" value="登陆"  onclick="Submit();"  />
	    <input name="yp" type="button" class="ypbtn" value="我要应聘"  onclick="yp();"  />
	    <label><input name="" type="checkbox" value="" checked="checked" />记住密码</label>
    </li>
    </ul>
    
    
    </div>
    
    </div>
    <script>
	   var basePath = "<%=basePath%>";
	   var Submit = function(){
		    var username = $("#username").val();
			var pwd = $("#password").val();
			var logintype = $("#loginType").val();
			if (!username) {
				alert("请输入用户名");
				return;
			}
			if (!pwd) {
				alert("请输入密码");
				return;
			}
			var surl = basePath + "/login";
			var stype = "post";
			var asyn = true;
			var josnParams = {};
			josnParams.username = username;
			josnParams.password = pwd;
			josnParams.logintype = logintype;
			
		 	$.ajax({
				url : surl,
				type : stype,
				async : asyn,
				data : josnParams,
				success : function(data) {
					if (data=="success") {
						location.href = basePath + "/"+"index";
					} else {
						alert(data);
					}
				}
			}); 
		}
	   
	   function yp(){
		   location.href = basePath + "/index";
		}
	</script> 
</body>

</html>
