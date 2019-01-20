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
<script type="text/javascript" src="<%=basePath %>/js/factoryOrder/factoryOrder.js"></script>
<script type="text/javascript" src="<%=basePath %>/My97DatePicker/WdatePicker.js"></script>
<title>用户管理</title>
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
						     工厂名&nbsp;&nbsp;<input type="text" id="factory" name="factory" class="ui_input_txt02" value="${factory}"/>
						</div>
						<div id="box_bottom">
							<input type="button" value="查询" class="ui_input_btn01" onclick="search();" /> 
							<input type="button" value="新增" class="ui_input_btn01" id="addBtn" /> 
							<input type="button" value="修改" class="ui_input_btn01" id="editBtn" /> 
							<input type="button" value="删除" class="ui_input_btn01" onclick="batchDel();" /> 
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
							<th>加工厂</th>
							<th>销售</th>
							<th>客户品牌</th>
							<th>下单日期</th>
							<th>品名</th>
							<th>图片</th>
							<th>款号</th>
							<th>成分</th>
							<th>客户款号</th>
							<th>颜色</th>
							<th>xs</th>
							<th>s</th>
							<th>m</th>
							<th>l</th>
							<th>xl</th>
							<th>均码</th>
							<th>合计数量</th>
							<th>合同交货日期</th>
							<th>采购收到物料卡</th>
							<th>生产部收到工艺制单</th>
							<th>客户意见</th>
							<th>供应商合同交货日期</th>
							<th>制单到场日期</th>
							<th>纸样到厂日期</th>
							<th>面料到厂日期</th>
							<th>面料进度</th>
							<th>辅料进度</th>
							<th>开裁日期</th>
							<th>xs</th>
							<th>s</th>
							<th>m</th>
							<th>l</th>
							<th>xl</th>
							<th>均码</th>
							<th>裁床总数</th>
							<th>中查</th>
							<th>尾期</th>
							<th>后整进度</th>
							<th>包装要求</th>
							<th>备注</th>
						</tr>
						  <c:forEach items="${pagehelper.list}" var="ps"  varStatus="i">
							<tr>
								<td><input type="checkbox" name="IDCheck" value="${ps.id}" class="acb" /></td>
								<td>${ps.factory}</td>
								<td>${ps.sell}</td>
								<td>${ps.brand}</td>
								<td>${ps.orderTime}</td>
								<td>${ps.productName}</td>							
								<td><c:if test="${ps.image != null}"><img src="<%=basePath %>/files/${ps.image}" width="40px;" height="30px;"/></c:if></td>
								<td>${ps.styleNum}</td>
								<td>${ps.composition}</td>
								<td>${ps.cusStyleNum}</td>
								<td>${ps.color}</td>	
								<td>${ps.xs}</td>
								<td>${ps.s}</td>
								<td>${ps.m}</td>
								<td>${ps.l}</td>
								<td>${ps.xl}</td>
								<td>${ps.average}</td> 												
								<td>${ps.total}</td>
								<td>${ps.deliveryDate}</td>
								<td>${ps.materialsCard}</td>
								<td>${ps.processOrder}</td>
								<td>${ps.advice}</td>
								<td>${ps.payDate}</td>
								<td>${ps.turnUpDate}</td>
								<td>${ps.paperDate}</td>
								<td>${ps.fabricDate}</td>
								<td>${ps.fabricProgress}</td>								
								<td>${ps.assistantProgress}</td>
								<td>${ps.starDate}</td>							
								<td>${ps.fxs}</td>
								<td>${ps.fs}</td>
								<td>${ps.fm}</td>
								<td>${ps.fl}</td>
								<td>${ps.fxl}</td>
								<td>${ps.faverage}</td>
								<td>${ps.ftotal}</td>
								<td>${ps.zhongcha}</td>
								<td>${ps.weiqi}</td>
								<td>${ps.packageClim}</td>
								<td>${ps.remark}</td>
								<%-- <td><c:if test="${ps.isDelete ==0 }">在职</c:if><c:if test="${ps.isDelete ==1 }">离职</c:if></td>
								<td><c:if test="${ps.enabled ==0 }">不可用</c:if><c:if test="${ps.enabled ==1 }">可用</c:if></td>
								<td>${ps.sysUserRole.roleName}</td> --%>
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
