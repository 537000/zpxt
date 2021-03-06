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
			  var clothCode = $("#clothCode option:selected").val();
		         if(clothCode == ""){
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
	            url: basePath+"/ClothRequireStoreInfoController/update.do", 
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
   <input type="text" id="id" name="id" value="${clothDesignVo.id}" hidden="hidden"/>
	<div id="container">
		<div id="nav_links">
			当前位置：样衣管理&nbsp;>&nbsp;<span style="color: #1A5CC6;">样衣出入库编辑</span>
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
						<select name="clothCode" id="clothCode" class="ui_select01">
                            <option value="">--请选择--</option>
                             <c:forEach items="${dList}" var="ps"  varStatus="i">
                                   <option value="${ps.clothCode}" <c:if test="${clothRequireStore.clothCode == ps.clothCode}">selected</c:if>>${ps.clothID}/${ps.color}</option>
                             </c:forEach>
                        </select><font style="color: red;">*</font></td>
					
					<td class="ui_text_rt">XS</td>
					<td class="ui_text_lt">
						<input type="text" id="xs" name="xs" value="${clothRequireStore.xs}" class="ui_input_txt02"/>
					</td>
					
				</tr>
				<tr>
				<td class="ui_text_rt">S</td>
					<td class="ui_text_lt">
						<input type="text" id="s" name="s" value="${clothRequireStore.s}" class="ui_input_txt02"/>
					</td>
					<td class="ui_text_rt">M</td>
					<td class="ui_text_lt">
						<input id="d11b" name="m" type="m" value="${clothRequireStore.m}" class="ui_input_txt02"/>
					</td>
					
				</tr>
				<tr>
						<td class="ui_text_rt">XL</td>
					<td class="ui_text_lt">
						<input type="text" id="xl" name="xl" value="${clothRequireStore.xl}" class="ui_input_txt02"/>
					</td>
						<td class="ui_text_rt">均码</td>
					<td class="ui_text_lt">
						<input type="text" id="eva" name="eva" value="${clothRequireStore.eva}" class="ui_input_txt02"/></td>
					</tr>
					<tr>
					
						<td class="ui_text_rt">L</td>
					<td class="ui_text_lt">
						<input type="text" id="l" name="l" value="${clothRequireStore.l}" class="ui_input_txt02"/>
					</td>
					
						<td class="ui_text_rt">出入库</td>
					<td class="ui_text_lt">
						<input type="text" id="outIn" name="outIn" value="${clothRequireStore.outIn}" class="ui_input_txt02"/>
					</td>
					</tr>
					<tr>
					<td class="ui_text_rt">备注</td>
					<td class="ui_text_lt">
						<input type="text" id="remark" name="remark" value="${clothRequireStore.remark}" class="ui_input_txt02"/>
					</td>
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