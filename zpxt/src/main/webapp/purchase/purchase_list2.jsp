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
<script type="text/javascript" src="<%=basePath %>/js/purchase/purchase2.js"></script>
<script type="text/javascript" src="<%=basePath %>/My97DatePicker/WdatePicker.js"></script>
<title>资产管理</title>
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
						     公司单号&nbsp;&nbsp;<input type="text" id="comNo" name="comNo" class="ui_input_txt02" value="${comNo}"/>
						</div>
						<div id="box_bottom">
							<input type="button" value="查询" class="ui_input_btn01" onclick="search();" /> 
							<!-- <input type="button" value="新增" class="ui_input_btn01" id="addBtn" /> 
							<input type="button" value="修改" class="ui_input_btn01" id="editBtn" /> 
							<input type="button" value="删除" class="ui_input_btn01" onclick="batchDel();" />  -->
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
							<th>采购编号</th>
							<th>公司单号</th>
							<th>客户单号</th>				
							<th>物料卡</th>
							<th>工厂</th>
							<th>大货纸样板</th>
							<th>生产工艺制单</th>
							<th>颜色数量</th>
							<th>跟单员</th>
							<th>图片</th>
							<th>状态</th>
							<th>生产物料</th>
						
						</tr>
						  <c:forEach items="${pagehelper.list}" var="ps"  varStatus="i">
							<tr>
								<td><input type="checkbox" name="IDCheck" value="${ps.id}" class="acb" /></td>
								<td>${ps.id}</td>
								<td>${ps.comNo}</td>
								<td>${ps.cusNo}</td>
								<td>${ps.wuliaoka}</td>
								<td>${ps.factory}</td>
								<td>${ps.zhiyang}</td>
								<td>${ps.gongyi}</td>
								<td>${ps.colorNum}</td>
								<td>${ps.pman}</td>
								<td><c:if test="${ps.image != null}"><img src="<%=basePath %>/files/${ps.image}" width="80px;" height="80px;"/></c:if></td>
								<td><c:if test="${ps.status ==1}">审核通过 </c:if>
								<c:if test="${ps.status ==0}">审核中 </c:if>
								<c:if test="${ps.status ==2}">审核失败 </c:if></td>
								<td>
								  <table class="table" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
								  <tr><td>物料名称</td>
								  <td>单间用量</td>
								  <td>生产件数</td>
								  <td>总量</td>
								  <td>采购量</td>								  
								   <td>发货数量</td>
								    <td>工厂签收人</td>
								  
								  </tr>
								    <c:forEach items="${ps.fabricList}" var="pz"  varStatus="j">
								        <tr>
								         <td>${pz.mname}</td>
								         <td>${pz.single}</td>
								         <td>${pz.produceQuantity}</td>
								         <td>${pz.sum}</td>
								         <td>${pz.purchaseQuantity} </td>
								         <td>${pz.shipQuantity} </td>
								         <td>${pz.signing} </td>
								        </tr>
							    	</c:forEach>
					             	</table>
								</td>
						  </c:forEach>
					</table>
				</div>
				<div>
				  <%@ include file="/pagehelper.jsp"%> 
			   </div>
			</div>
		</div>
	</form>
	<jsp:include page="/common.jsp"></jsp:include>
  </body>
</html>
