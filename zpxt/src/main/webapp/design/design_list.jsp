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
<script type="text/javascript" src="<%=basePath%>/scripts/jquery/jquery-1.7.1.js"></script>
<link href="<%=basePath%>/style/authority/basic_layout.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>/style/authority/common_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=basePath%>/scripts/authority/commonAll.js"></script>
<script type="text/javascript" src="<%=basePath%>/scripts/fancybox/jquery.fancybox-1.3.4.js"></script>
<script type="text/javascript" src="<%=basePath%>/scripts/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/style/authority/jquery.fancybox-1.3.4.css" media="screen"></link>
<script type="text/javascript" src="<%=basePath%>/scripts/artDialog/artDialog.js?skin=default"></script>
<script type="text/javascript" src="<%=basePath %>/js/designList.js"></script>
<title>进销存系统</title>
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
							设计师&nbsp;&nbsp;
							<select name="userID" id="clothDesignUserID" class="ui_select01"">
                                <option value="" >--请选择--</option>
                                 <c:forEach items="${dList}" var="ps"  varStatus="i">
                                   <option value="${ps.id}" <c:if test="${userID == ps.id}">selected</c:if>>${ps.cname}</option>
                                 </c:forEach>
                            </select>
							衣服款号&nbsp;&nbsp;<input type="text" id="clothID" name="clothID" class="ui_input_txt02" value="${clothID}"/>
						</div>
						<div id="box_bottom">
							<input type="button" value="查询" class="ui_input_btn01" onclick="search();" /> 
							<input type="button" value="新增" class="ui_input_btn01" id="addBtn" /> 
							<input type="button" value="编辑" class="ui_input_btn01" id="editBtn" /> 
							<input type="button" value="删除" class="ui_input_btn01" onclick="batchDel();" /> 
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
							<th>衣服款号</th>
							<th>物料A</th>
							<th>价格A</th>
							<th>衣宽A</th>
							<th>使用A</th>
							<th>工厂A</th>
							<th>物料B</th>
							<th>价格B</th>
							<th>衣宽B</th>
							<th>使用B</th>
							<th>工厂B</th>
							<th>设计师</th>
							<th>设计稿</th>
							<th>审核状态</th>
							<th>审核人</th>
							<th>审核日期</th>
						</tr>
						  <c:forEach items="${pagehelper.list}" var="ps"  varStatus="i">
							<tr>
								<td><input type="checkbox" name="IDCheck" value="${ps.id}" class="acb" /></td>
								<td>${ps.clothID}</td>
								<td>${ps.aname}</td>
								<td>${ps.aprice}</td>
								<td>${ps.awidth}</td>
								<td>${ps.aused}</td>
								<td>${ps.factoryA.factoryName}<c:if test="${ps.factoryA != null}">${ps.factoryA.factoryName}</c:if></td>
								<td>${ps.bname}</td>
								<td>${ps.bprice}</td>
								<td>${ps.bwidth}</td>
								<td>${ps.bused}</td>
								<td><c:if test="${ps.factoryB != null}">${ps.factoryB.factoryName}</c:if></td>
								<td><c:if test="${ps.sysUser != null}">${ps.sysUser.cname}</c:if></td>
								<td><c:if test="${ps.fileName != null}"><img src="<%=basePath %>/files/${ps.fileName}" width="40px;" height="30px;"/></c:if></td>
							    <td>${ps.statusName}</td>
								<td>${ps.examineUser.cname}</td>
								<td><fmt:formatDate value='${ps.examineDate}' pattern='yyyy-MM-dd'/></td>
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
