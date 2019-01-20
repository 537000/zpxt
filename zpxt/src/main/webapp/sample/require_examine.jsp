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
<title>进销存系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="<%=basePath %>/style/authority/basic_layout.css" rel="stylesheet" type="text/css">
<link href="<%=basePath %>/style/authority/common_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/scripts/authority/commonAll.js"></script>
<script type="text/javascript" src="<%=basePath %>/scripts/artDialog/artDialog.js?skin=default"></script>
<script type="text/javascript" src="<%=basePath %>/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		/*
		 * 提交
		 */
		$("#submitbutton").click(function() {
		  var data = "id="+$("#id").val()+"&status="+$("#status").val()+"&remark="+$("#remark").val();
			  $.ajax({ 
	            type: "POST", 
	            data:data, 
	            url: basePath+"/ClothRequireController/examine.do", 
	            success: function(data){    
	               alert(data);
	            } 
      		  });  
      		 // $("#submitForm").attr("action",basePath+"/DesignController/addDesign.do").submit();
		});
	});
	
</script>
</head>
<body>
<form id="submitForm" name="submitForm" method="post">
  <input type="text" id="id" name="id" hidden="hidden" value="${id}"/>
	<div id="container">
		<div id="nav_links">
			当前位置：样衣管理&nbsp;>&nbsp;<span style="color: #1A5CC6;">审核</span>
			<div id="page_close">
				<a onclick="javascript:history.back(-1);">
					<img src="<%=basePath %>/images/common/page_close.png" width="20" height="20" style="vertical-align: text-top;"/>
				</a>
			</div>
		</div>
		<div class="ui_content">
			<table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
			      <tr>
					<td class="ui_text_rt" width="80">审核状态</td>
						<td class="ui_text_lt">
							<select name="status" id="status" class="ui_select02">
                               <option value="1">审核通过</option>
                               <option value="2">未通过</option>
                        </select></td>
					</tr>
				<tr>
					<td class="ui_text_rt" width="80">审核备注</td>
					<td class="ui_text_lt">
						<input type="text" id="remark" name="remark" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="ui_text_lt">
						&nbsp;<input id="submitbutton" type="button" value="提交" class="ui_input_btn01"/>
						&nbsp;<input id="cancelbutton" type="button" value="取消" class="ui_input_btn01"/>
					</td>
				</tr>
			</table>
		</div>
	</div>
</form>
	<jsp:include page="../common.jsp"></jsp:include>
</body>
</html>