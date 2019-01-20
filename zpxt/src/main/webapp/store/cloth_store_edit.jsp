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
			 // alert($("#submitForm").serialize());
			  var clothID = $("#clothID").val();
		         if(clothID == ""){
		           alert("请输入款号!");
		           return;
		         }
			 var param = $("#submitForm").serialize();
			 var params = param.split("&");
			 var result = "";
			 for(var i = 0;i<params.length;i++){
			    var paramTemp = params[i].split("=");
			    if(paramTemp.length==2){
			      if(paramTemp[1] != ""){
			        if(result.length==0)
			            result = params[i];
			        else
			            result += "&"+params[i];
			      }
			    }
			 }
			 
			  $.ajax({ 
	            type: "POST", 
	            data:result,  //用form的id去找对象 ，也可以使用$('form').serialize(),
	            url: basePath+"/StoreController/update.do", 
	            success: function(data){    
	               alert(data);
	            } 
      		  });  
		});
	});
	
	
</script>
</head>
<body>
<form id="submitForm" name="submitForm" method="post">
   <input type="text" id="clothCode" name="clothCode" value="${store.clothCode}" hidden="hidden"/>
	<div id="container">
		<div id="nav_links">
			当前位置：订单管理&nbsp;>&nbsp;<span style="color: #1A5CC6;">库存编辑</span>
			<div id="page_close">
				<a onclick="javascript:history.back(-1);">
					<img src="<%=basePath %>/images/common/page_close.png" width="20" height="20" style="vertical-align: text-top;"/>
				</a>
			</div>
		</div>
		<div class="ui_content">
			<table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
				<tr>
					<td class="ui_text_rt" width="80">款号</td>
					<td class="ui_text_lt">
						<input type="text" id="clothID" name="clothID" value="${store.clothID}" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					<td class="ui_text_rt">颜色</td>
					<td class="ui_text_lt">
						<input type="text" id="color" name="color" value="${store.color}" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					
					<td class="ui_text_rt">XS</td>
					<td class="ui_text_lt">
						<input type="text" id="xs" name="xs" value="${store.xs}" class="ui_input_txt02"/>
					</td>
					
				</tr>
				<tr>
				<td class="ui_text_rt">S</td>
					<td class="ui_text_lt">
						<input type="text" id="s" name="s"  value="${store.s}" class="ui_input_txt02"/>
					</td>
					<td class="ui_text_rt">M</td>
					<td class="ui_text_lt">
						<input id="d11b" name="m" type="m" value="${store.m}" class="ui_input_txt02"/>
					</td>
					
						<td class="ui_text_rt">L</td>
					<td class="ui_text_lt">
						<input type="text" id="l" name="l" value="${store.l}" class="ui_input_txt02"/>
					</td>
				</tr>
				<tr>
						<td class="ui_text_rt">XL</td>
					<td class="ui_text_lt">
						<input type="text" id="xl" name="xl" value="${store.xl}" class="ui_input_txt02"/>
					</td>
						<td class="ui_text_rt">均码</td>
					<td class="ui_text_lt">
						<input type="text" id="eva" name="eva" value="${store.eva}" class="ui_input_txt02"/></td>
						<td class="ui_text_rt">总数</td>
					<td class="ui_text_lt">
						<input type="text" id="storeNum" name="storeNum" value="${store.storeNum}" class="ui_input_txt02"/></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="ui_text_lt">
						&nbsp;<input id="submitbutton" type="button" value="提交" class="ui_input_btn01"/>
						&nbsp;<input id="cancelbutton" type="button" value="取消"  onclick="javascript:history.back(-1);" class="ui_input_btn01"/>
					</td>
				</tr>
			</table>
		</div>
	</div>
</form>
	<jsp:include page="../common.jsp"></jsp:include>
</body>
</html>