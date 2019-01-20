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
<script type="text/javascript" src="<%=basePath %>/js/sample/requireList.js"></script>
<script type="text/javascript" src="<%=basePath %>/My97DatePicker/WdatePicker.js"></script>
<title>样衣申请单</title>
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
							申请人&nbsp;&nbsp;
							<select name="requireUserID" id="requireUserID" class="ui_select01"">
                                <option value="" >--请选择--</option>
                                 <c:forEach items="${dList}" var="ps"  varStatus="i">
                                   <option value="${ps.id}" <c:if test="${requireUserID == ps.id}">selected</c:if>>${ps.cname}</option>
                                 </c:forEach>
                            </select>
						          申请日期&nbsp;&nbsp;<input id="d11b" value="${requestDateBegin}" name="requestDateBegin" id="requestDateBegin" type="text" onClick="WdatePicker()"/>-
						          <input id="requestDateEnd" value="${requestDateEnd}" type="text" name="requestDateEnd"  onClick="WdatePicker()"/>
						</div>
						<div id="box_bottom">
							<input type="button" value="查询" class="ui_input_btn01" onclick="search();" /> 
							<input type="button" value="新增" class="ui_input_btn01" id="addBtn" /> 
							<input type="button" value="编辑" class="ui_input_btn01" id="editBtn" /> 
							<input type="button" value="删除" class="ui_input_btn01" onclick="batchDel();" /> 
							<!-- <input type="button" value="导入" class="ui_input_btn01" id="importBtn" /> -->
							<input type="button" value="导出" class="ui_input_btn01" onclick="exportExcel();" />
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
							<th>申请人部门</th>
							<th>申请人</th>
							<th>日期</th>
							<th>客户公司名称</th>
							<th>数量</th>
							<th>归还预计日期</th>
							<th>用途</th>
							<th>申请理由</th>
							<th>审批人</th>
							<th>状态</th>
							<th>附件</th>
							<th>操作</th>
						</tr>
						  <c:forEach items="${pagehelper.list}" var="ps"  varStatus="i">
							<tr>
								<td><input type="checkbox" name="IDCheck" value="${ps.id}" class="acb" /></td>
								<td>${ps.department}</td>
								<td>${ps.sysUser.cname}</td>
								<td><fmt:formatDate value='${ps.requestDate}' pattern='yyyy-MM-dd'/></td>
								<td>${ps.customerOfficeName}</td>
								<td>${ps.num}</td>
								<td><fmt:formatDate value='${ps.backDate}' pattern='yyyy-MM-dd'/></td>
								<td>${ps.purpose}</td>
								<td>${ps.requestReason}</td>
								<td>${ps.examineUser.cname}</td>
								<td>${ps.statusName}</td>
								<td>${ps.fileName}</td>
								<td><c:if test="${ps.fileName != '' and ps.fileName != null }"><a href="<%=basePath %>/files/${ps.fileName}">下载附件</a></c:if></td>
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
