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
<script type="text/javascript" src="<%=basePath %>/js/baojia/clothes.js"></script>
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
						     订单号&nbsp;&nbsp;<input type="text" id="word" name="word" class="ui_input_txt02" value="${word}"/>
						</div>
						<div id="box_bottom">
							<input type="button" value="查询" class="ui_input_btn01" onclick="search();" /> 
							<input type="button" value="审批" class="ui_input_btn01" id="shenpi" /> 
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
							
							<th>订单号</th>
							<th>跟单号</th>
							<th>业务员</th>
							<th>品名</th>
							<th>编码</th>
							<th>颜色</th>
							<th>规格</th>
							<th>数量</th>
							<th>单价</th>
							<th>成本价</th>
							<th>总金额</th>
							<th>成分</th>
							<th>检测</th>
							<th>信息要求</th>
							<th>包装</th>
							<th>属性4</th>
							<th>起交时间</th>
							<th>复样</th>
							<th>补货</th>
							<th>加工厂</th>
							<th>是否开票</th>
							<th>运费/税</th>
							<th>物流</th>
							<th>成本核算</th>
							<th>收款</th>
							<th>起货</th>
							<th>审批</th>
							<th>备注</th>
						
						</tr>
						  <c:forEach items="${pagehelper.list}" var="ps"  varStatus="i">
							<tr>
								<td><input type="checkbox" name="IDCheck" value="${ps.id}" class="acb" /></td>
								<td>${ps.dingdan}</td>
								<td>${ps.gendan}</td>
								<td>${ps.yewuyuan}</td>
								<td>${ps.pinmin}</td>
								<td>${ps.clothID}</td>
								<td>${ps.color}</td>
								<td>${ps.guige}</td>
								<td>${ps.shuliang}</td>
								<td>${ps.danjia}</td>
								<td>${ps.chengbenjia}</td>
								<td>${ps.zongjine}</td>
								<td>${ps.chengfen}</td>
								<td>${ps.jiance}</td>
								<td>${ps.xinxiyaoqiu}</td>
								<td>${ps.baozhuang}</td>
								<td>${ps.xfour}</td>
								<td>${ps.qijiaohuo}</td>					
								<td>${ps.fuyang}</td>
								<td>${ps.buhuo}</td>
								<td>${ps.jiagongchang}</td>
								<td>${ps.kaipiao}</td>
								<td>${ps.yunfeishui}</td>
								<td>${ps.wuliu}</td>
								<td>${ps.chengbenhesuan}</td>
								<td>${ps.shoukuan}</td>
								<td>${ps.qihuo}</td>
								<td><c:if test="${ps.shenpi ==1}">审核通过 </c:if>
								<c:if test="${ps.shenpi ==0}">审核中 </c:if>
								<c:if test="${ps.shenpi ==2}">审核失败 </c:if></td>
								<td>${ps.beizhu}</td>
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
