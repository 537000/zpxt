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
<script type="text/javascript" src="<%=basePath %>/js/financial/financial.js"></script>
<script type="text/javascript" src="<%=basePath %>/My97DatePicker/WdatePicker.js"></script>
<title>财务管理</title>
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
						<div id="box_center">
						类别
						 <select name="type" id="type" class="ui_select02">
						     <option value="" >-------请选择-------</option>
                            <option value="收款单" <c:if test="${financial.type =='收款单'}">selected</c:if>>收款单</option>
                            <option value="付款单" <c:if test="${financial.type =='付款单'}">selected</c:if>>付款单</option>
                            <option value="日常费用" <c:if test="${financial.type =='日常费用'}">selected</c:if>>日常费用</option>
                            <option value="其他收入" <c:if test="${financial.type =='其他收入'}">selected</c:if>>其他收入</option>
                            <option value="其他支出" <c:if test="${financial.type =='其他支出'}">selected</c:if>>其他支出</option>
                        </select>
						          申请日期&nbsp;&nbsp;<input value="<fmt:formatDate value='${financial.startDay}' pattern='yyyy-MM-dd'/>" name="startDay" id="startDay" type="text" onClick="WdatePicker()"/>-
						          <input value="<fmt:formatDate value='${financial.endDay}' pattern='yyyy-MM-dd'/>" type="text" name="endDay" id="endDay" onClick="WdatePicker()"/>
						</div>
						<div id="box_bottom">
							<input type="button" value="查询" class="ui_input_btn01" onclick="search();" /> 
							<input type="button" value="新增" class="ui_input_btn01" id="addBtn" /> 
							<input type="button" value="编辑" class="ui_input_btn01" id="editBtn" /> 
							<input type="button" value="删除" class="ui_input_btn01" onclick="batchDel();" />
							<input type="button" value="审核" class="ui_input_btn01" id="examineBtn" />
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
							<th>应付单位</th>
							<th>应收单位</th>
							<th>类别</th>
							<th>应收/付总额</th>
							<th>应收/付日期</th>
							<th>申请人</th>
							<th>审核人</th>
							<th>描述</th>
							<th>状态</th>
						</tr>
						  <c:forEach items="${pagehelper.list}" var="ps"  varStatus="i">
							<tr>
								<td><input type="checkbox" name="IDCheck" value="${ps.id}" class="acb" /></td>
								<td>${ps.payOffice}</td>
								<td>${ps.receivOffice}</td>
								<td>${ps.type}</td>
								<td>${ps.money}</td>
								<td><fmt:formatDate value='${ps.requireDate}' pattern='yyyy-MM-dd'/></td>
								<td>${ps.requireUser.id}</td>
								<td>${ps.auditUser.id}</td>
								<td>${ps.description}</td>
								<td>
								   <c:if test="${ps.status ==0}">未审核</c:if>
								   <c:if test="${ps.status ==1}">审核通过</c:if>
								   <c:if test="${ps.status ==2}">审核不通过</c:if>
								</td>
								</tr>
						  </c:forEach>
					</table>
				</div>
				<div>
				  <%@ include file="../pagehelper.jsp"%> 
			   </div>
			</div>
		</div>
	</form>
	<jsp:include page="../common.jsp"></jsp:include>
  </body>
</html>
