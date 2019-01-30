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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=basePath%>/style/authority/basic_layout.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>/style/authority/common_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/scripts/authority/commonAll.js"></script>
<script type="text/javascript" src="<%=basePath%>/scripts/fancybox/jquery.fancybox-1.3.4.js"></script>
<script type="text/javascript" src="<%=basePath%>/scripts/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/style/authority/jquery.fancybox-1.3.4.css" media="screen"></link>
<script type="text/javascript" src="<%=basePath%>/scripts/artDialog/artDialog.js?skin=default"></script>
<script type="text/javascript" src="<%=basePath %>/js/store/storeList.js"></script>
<script type="text/javascript" src="<%=basePath %>/My97DatePicker/WdatePicker.js"></script>
<title>样衣库存</title>
<style>
	.alt td{ background:black !important;}
</style>
</head>
<body style="height: 319px; ">
	<form id="submitForm" name="submitForm" action="" method="post">
	  <input name="allIDCheck" hidden="hidden" id="allIDCheck"/>
		<div id="container">
			<div class="ui_content">
				<div class="ui_text_indent">
					<div id="box_border">
					<%-- 	<div id="box_center">
						     应聘职位&nbsp;&nbsp;<input type="text" id="job" name="job" class="ui_input_txt02" value="${job}"/>
						</div> --%>
						<div id="box_bottom">
							<!-- <input type="button" value="查询" class="ui_input_btn01" onclick="search();" />
							 <input type="button" value="导出" class="ui_input_btn01" onclick="exportExcel();" /> -->
						</div>
					</div>
				</div>
			</div>
			<div class="ui_content">
				<div class="ui_tb">
					<table class="table" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
						<tr>
							<th width="30"><input type="checkbox" id="all" onclick="selectOrClearAllCheckbox(this);" />
							</th>
							<th>应聘人</th>
							
						    <th>性别</th>
						    <th>学历</th>
							<th>毕业院校</th>
							<th>联系方式</th>
							<th>工作经历</th>
							<th>邮箱</th>
							
							<th>应聘职位</th>
							<th>应聘部门</th>
							<th>期望薪资</th>
							<th>招聘薪资</th>
							<th>应聘状态</th>
							<th>操作</th>
						</tr>
						  <c:forEach items="${ypxx}" var="ps"  varStatus="i">
							<tr>
								<td><input type="checkbox" name="IDCheck" value="${ps.interviewNo}" class="acb" /></td>
								<td>${ps.interviewUser}</td>
								
								<td>${ps.sex}</td>
								<td>${ps.xl}</td>
								<td>${ps.byyx}</td>
								<td>${ps.telphone}</td>
								<td>${ps.work}</td>
								<td>${ps.email}</td>
								
								<td>${ps.ypzw}</td>
								<td>${ps.ypbm}</td>
								<td>${ps.hope}</td>
								<td>${ps.zpgz}</td>
								<c:if test="${ps.interviewState==0}">
									<td>应聘申请</td>
									<td><input type="button" value="申请通过" class="ui_input_btn01" id="applyPass" /> 
									<input type="button" value="申请不通过" class="ui_input_btn01" id="applyFail" /> </td>
								</c:if>
								<c:if test="${ps.interviewState==1}"><td>面试</td>
									<td><input type="button" value="面试通过" class="ui_input_btn01" id="pass" onclick="pass(${ps.interviewNo})"/> 
									<input type="button" value="面试不通过" class="ui_input_btn01" id="fail" onclick="fail(${ps.interviewNo})"/> </td>
								</c:if>
								<c:if test="${ps.interviewState==-1}">
									<td>应聘不通过</td>
									<td></td>
								</c:if>
								<c:if test="${ps.interviewState==2}">
									<td>面试通过</td>
									<td></td>
								</c:if>
								<c:if test="${ps.interviewState==-2}">
									<td>面试不通过</td>
									<td></td>
								</c:if>
								
							</tr>
						  </c:forEach>
					</table>
				</div>
				<div>
				 <%--  <%@ include file="/pagehelper.jsp"%>  --%>
			   </div>
			</div>
		</div>
	</form>
	<jsp:include page="/common.jsp"></jsp:include>
  </body>
  <script>
	   var basePath = "<%=basePath%>";
	   var zpNo = $("input[name=IDCheck]").val();
	   $("#applyPass").click(function(){
		   $.ajax({ 
	            type: "POST", 
	            data:{"zpNo":zpNo},
	            url: basePath+"/applyPass", 
	            success: function(data){    
	            	  if("操作成功"==data){
	            		  window.location.href=basePath+"/ypxx";
	            	  }
	            	  alert(data);
	            } 
    		  });
	   })
	   $("#applyFail").click(function(){
		   $.ajax({ 
	            type: "POST", 
	            data:{"zpNo":zpNo},
	            url: basePath+"/applyFail", 
	            success: function(data){    
	            	  if("操作成功"==data){
	            		  window.location.href=basePath+"/ypxx";
	            	  }
	            	  alert(data);
	            } 
    		  });
	   })
	   function pass(zpNo){
		   $.ajax({ 
	            type: "POST", 
	            data:{"zpNo":zpNo},
	            url: basePath+"/pass", 
	            success: function(data){    
	            	  if("操作成功"==data){
	            		  window.location.href=basePath+"/ypxx";
	            	  }
	            	  alert(data);
	            } 
     		  });  
		}
	   function fail(zpNo){
		   $.ajax({ 
	            type: "POST", 
	            data:{"zpNo":zpNo},
	            url: basePath+"/lzPass", 
	            success: function(data){    
	            	  if("操作成功"==data){
	            		  window.location.href=basePath+"/ypxx";
	            	  }
	            	  alert(data);
	            } 
     		  });  
		}
	</script> 
</html>
