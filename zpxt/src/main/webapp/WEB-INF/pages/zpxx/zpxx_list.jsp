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
						<div id="box_bottom">
							
							<c:if test="${user.jobNo==8||user.deptNo==4}">
								<input type="button" value="发布" class="ui_input_btn01" id="addBtn1" onclick="addBtn()"  /> 
								
							</c:if>
							<c:if test="${user.deptNo==4}">
							    <input type="button" value="编辑" class="ui_input_btn01" id="editBtn" /> 
								<input type="button" value="删除" class="ui_input_btn01" onclick="batchDel();" /> 
							</c:if>
							<!-- <input type="button" value="导出" class="ui_input_btn01" onclick="exportExcel();" /> -->
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
							<th>招聘职位</th>
							<th>招聘人数</th>
							<th>招聘部门</th>
							<th>薪资待遇</th>
							<th>职位描述</th>
							<th>工作地址</th>
							<th>招聘截止日期</th>
							<th>状态</th>
							<c:if test="${empty user}"><th>操作</th></c:if>
						</tr>
						  <c:forEach items="${zpxx}" var="ps"  varStatus="i">
							<tr>
								<td><input type="checkbox" name="IDCheck" value="${ps.zpNo}" class="acb" /></td>
								<td>${ps.zpJob}</td>
								<td>${ps.zpNum}</td>
								<td>${ps.zpDept}</td>
								<td><fmt:formatNumber value="${ps.salary}" pattern="0.00"></fmt:formatNumber></td>
								<td>${ps.description}</td>
								<td>${ps.workAddr}</td>
								<td><fmt:formatDate value="${ps.lastDate}" pattern="yyyy-MM-dd"/></td>
								<c:if  test="${ps.zpState==2}" >
									<td>已发布</td>
								</c:if>
								<c:if  test="${ps.zpState==1}" >
									<td>待审核</td>
								</c:if>
								<c:if test="${empty user}">
									<td><input type="button" id="${ps.zpNo}" name="applyButton" value="申请岗位" class="ui_input_btn01" onclick="apply();" /> </td>
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
	   
	   function apply(){
		   location.href = basePath + "/apply?jobNo="+$("input[name=applyButton]").attr("id");
		}
	   
	  function addBtn(){
		  location.href = basePath + "/addzp";
		  	  }
	  
	</script> 
</html>
