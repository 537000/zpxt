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
							衣服款号&nbsp;&nbsp;<input type="text" id="clothID" name="clothID" class="ui_input_txt02" value="${clothID}"/>
						</div>
						<div id="box_bottom">
							<input type="button" value="查询" class="ui_input_btn01" onclick="search();" /> 
							<input type="button" value="新增" class="ui_input_btn01" id="addBtn" /> 
							<input type="button" value="编辑" class="ui_input_btn01" id="editBtn" /> 
							<input type="button" value="删除" class="ui_input_btn01" onclick="batchDel();" /> 
							<input type="button" value="导出" class="ui_input_btn01" onclick="exportExcel();" />
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
							<th>经办人</th>
							<th>客户</th>
							<th>名称</th>
							<th>购入日期</th>
							<th>购买数量</th>
							<th>签收人</th>
							<th>备注</th>
						</tr>
							<tr>
							<td><input type="checkbox" name="IDCheck"class="acb" /></td><td>18-3AOJIOJ10</td><td>谢峥</td><td>inshop</td><td>白色辅料</td><td>2017-07-25</td><td>30M</td><td>陈生</td><td>备注</td>
							</tr>
							<tr>
							<td><input type="checkbox" name="IDCheck"class="acb" /></td><td>18-3AOJIOJ11</td><td>谢峥</td><td>inshop</td><td>白色辅料</td><td>2017-07-20</td><td>30M</td><td>陈生</td><td>备注</td>
							</tr>
							<tr>
							<td><input type="checkbox" name="IDCheck"class="acb" /></td><td>18-3AOJIOJ12</td><td>谢峥</td><td>CCME&CO</td><td>白色辅料</td><td>2017-07-25</td><td>30M</td><td>陈生</td><td>备注</td>
							</tr>
							<tr>
							<td><input type="checkbox" name="IDCheck"class="acb" /></td><td>18-3AOJIOJ13</td><td>谢峥</td><td>CCME&CO</td><td>拉链</td><td>2018-07-25</td><td>100条</td><td>陈生</td><td>备注</td>
							</tr>
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
