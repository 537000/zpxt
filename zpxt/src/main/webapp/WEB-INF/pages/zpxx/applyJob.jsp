<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html>
<html>
<head>
<title>申请岗位</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="<%=basePath %>/style/authority/basic_layout.css" rel="stylesheet" type="text/css">
<link href="<%=basePath %>/style/authority/common_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/scripts/authority/commonAll.js"></script>
<script type="text/javascript" src="<%=basePath %>/scripts/artDialog/artDialog.js?skin=default"></script>
<script type="text/javascript" src="<%=basePath %>/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		 var basePath = "<%=basePath%>";
		/*
		 * 提交
		 */
		$("#submitbutton").click(function() {
			 // alert($("#submitForm").serialize());
			  var username = $("#username").val();
		         if(username == ""){
		           alert("请输入姓名!");
		           return;
		         }
			 var param = $("#submitForm").serialize();
			 var params = param.split("&");
			 var result = "";
			 for(var i = 0;i<params.length;i++){
			    var paramTemp = params[i].split("=");
			    if(paramTemp.length==2){
			      if(paramTemp[1] != ""){
			        if(result.length==0)
			            result = params[i];
			        else
			            result += "&"+params[i];
			      }
			    }
			 }
			 
			  $.ajax({ 
	            type: "POST", 
	            data:result,  //用form的id去找对象 ，也可以使用$('form').serialize(),
	            url: basePath+"/applyJob", 
	            success: function(data){    
	               if("success"==data){
	            	   alert("申请成功");
	               }else{
	            	   alert(data);
	               }
	            } 
      		  });  
		});
	});
	
	
</script>
</head>
<body>
<form id="submitForm" name="submitForm" method="post">
	<div id="container">
		<div id="nav_links">
			当前位置：招聘岗位信息&nbsp;>&nbsp;<span style="color: #1A5CC6;">申请岗位</span>
			<div id="page_close">
				<a onclick="javascript:history.back(-1);">
					<img src="<%=basePath %>/images/common/page_close.png" width="20" height="20" style="vertical-align: text-top;"/>
				</a>
			</div>
		</div>
		<div class="ui_content">
			<table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
				<tr>
					<input type="hidden" id="jobNo" name="jobNo" value="${jobNo}"/>
					<td class="ui_text_rt" width="80">姓名</td>
					<td class="ui_text_lt">
						<input type="text" id="username" name="username" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					<td class="ui_text_rt">性别</td>
					<td class="ui_text_lt">
						<!-- <select id="sex" name="sex">
							<option value='1'>男</option>
							<option value='2'>女</option>
						</select>
						<font style="color: red;">*</font> -->
						<input type="text" id="sex" name="sex" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					<td class="ui_text_rt">期望薪资</td>
					<td class="ui_text_lt">
						<input type="text" id="hope" name="hope" class="ui_input_txt02"/><font style="color: red;">*</font>
				</tr>
				<tr>
				<td class="ui_text_rt">毕业院校</td>
					<td class="ui_text_lt">
						<input type="text" id="school" name="school"  class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
				
					
						<td class="ui_text_rt">学历</td>
					<td class="ui_text_lt">
						<input type="text" id="xl" name="xl" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
				</tr>
				<tr>
				<td class="ui_text_rt">联系方式</td>
					<td class="ui_text_lt">
						<input type="text" id="tel" name="tel" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
						
						<td class="ui_text_rt">邮箱</td>
					<td class="ui_text_lt">
						<input type="text" id="email" name="email" class="ui_input_txt02"/><font style="color: red;">*</font></td>
						<td class="ui_text_rt">工作经历</td>
					<td class="ui_text_lt">
						<input type="text" id="work" name="work" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="ui_text_lt">
						&nbsp;<input id="submitbutton" type="button" value="提交" class="ui_input_btn01"/>
						&nbsp;<input id="cancelbutton" type="button" value="取消"  onclick="javascript:history.back(-1);" class="ui_input_btn01"/>
					</td>
				</tr>
			</table>
		</div>
	</div>
</form>
	<%-- <jsp:include page="../common.jsp"></jsp:include> --%>
</body>
</html>