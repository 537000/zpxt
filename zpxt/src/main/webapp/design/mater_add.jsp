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
<link href="<%=basePath %>/style/base.css" type="text/css" rel="stylesheet" />
<link href="<%=basePath %>/style/table.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/scripts/authority/commonAll.js"></script>
<script type="text/javascript" src="<%=basePath %>/scripts/artDialog/artDialog.js?skin=default"></script>
<script type="text/javascript" src="<%=basePath %>/My97DatePicker/WdatePicker.js"></script>
<script language="javascript" type="text/javascript" src="<%=basePath %>/js/editTable.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		/*
		 * 提交
		 */
		$("#submitbutton").click(function() {
			 // alert($("#submitForm").serialize());
			  var clothID = $("#mater").val();
		         if(clothID == ""){
		           alert("请输入物料名称!");
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
			 
			 //拼接参数
			 var maters = "";
			 var descriptions = "";
				$("td[name='mater']").each(function(){
					maters += $(this).children("input").val()+",";
				});
				
				if(maters.length>0) {
					maters = maters.substring(0, maters.length-1);
				}
				$("td[name='description']").each(function(){
					descriptions += $(this).children("input").val()+",";
				});
				
				if(descriptions.length>0) {
					descriptions = descriptions.substring(0, descriptions.length-1);
				}
				
			 
				
			  $.ajax({ 
	            type: "POST", 
	            data:{"maters":maters,"descriptions":descriptions},  //用form的id去找对象 ，也可以使用$('form').serialize(),
	            url: basePath+"/MaterController/save.do", 
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
	<div id="container">
		<div id="nav_links">
			当前位置：打版管理&nbsp;>&nbsp;<span style="color: #1A5CC6;">物料新增</span>
			<div id="page_close">
				<a onclick="javascript:history.back(-1);">
					<img src="<%=basePath %>/images/common/page_close.png" width="20" height="20" style="vertical-align: text-top;"/>
				</a>
			</div>
		</div>
		<div class="ui_content">
		
		<table class="edtitable">
			<thead>
				<tr>
					<th colspan="3">可以编辑的表格</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>物料名称</th>
					<th>描述</th>
					<th class="del-col">操作</th>
				</tr>
			<!-- 	<tr>
					<td  ></td>
					<td name="description" ></td>
					<td class="del-col">
						<a href="javascript:void(0);" class="delBtn">删除</a>
					</td>
				</tr> -->
				<tr class="append-row">
					<td colspan="3" align="right">
						<input type="button" id="addBtn" value="添 加" />
					</td>
				</tr>
			</tbody>		
		</table>
			<tr>
					<td>&nbsp;</td>
					<td class="ui_text_lt">
						&nbsp;<input id="submitbutton" type="button" value="提交" class="ui_input_btn01"/>
						&nbsp;<input id="cancelbutton" type="button" value="取消"  onclick="javascript:history.back(-1);" class="ui_input_btn01"/>
					</td>
				</tr>
		<!-- 	<table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
				<tbody>
				<tr>
					<td class="ui_text_rt" width="80">物料名称</td>
					<td class="ui_text_lt">
						<input type="text" id="mater" name="mater" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
				</tr>
				<tr>
				<td class="ui_text_rt">描述</td>
					<td class="ui_text_lt">
						<input type="text" id="description" name="description"  class="ui_input_txt02"/>
					</td>
				</tr>
					</tbody>
				<tr>
					<td>&nbsp;</td>
					<td class="ui_text_lt">
						&nbsp;<input id="submitbutton" type="button" value="提交" class="ui_input_btn01"/>
						&nbsp;<input id="cancelbutton" type="button" value="取消"  onclick="javascript:history.back(-1);" class="ui_input_btn01"/>
					</td>
				</tr>
			</table> -->
		</div>
	</div>
</form>
	<jsp:include page="../common.jsp"></jsp:include>
</body>
</html>