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
			      }else{
			         if(i!=params.length-1){
			           alert("请填写必填选项");
			           return;
			         }
			      }
			    }
			 }
			 
			  $.ajax({ 
	            type: "POST", 
	            data:result,  //用form的id去找对象 ，也可以使用$('form').serialize(),
	            url: basePath+"/UserController/update.do", 
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
			当前位置：员工管理&nbsp;>&nbsp;<span style="color: #1A5CC6;">员工新增</span>
			<div id="page_close">
				<a onclick="javascript:history.back(-1);">
					<img src="<%=basePath %>/images/common/page_close.png" width="20" height="20" style="vertical-align: text-top;"/>
				</a>
			</div>
		</div>
		<div class="ui_content">
			<table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
				<tr>
					<td class="ui_text_rt" width="80">用户名</td>
					<td class="ui_text_lt">
						<input type="text" id="username" value="${username}" name="username" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					<td class="ui_text_rt">姓名</td>
					<td class="ui_text_lt">
						<input type="text" id="cname" name="cname" value="${cname}" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					
					<td class="ui_text_rt">是否可用</td>
					<td class="ui_text_lt">
						<select name="enabled" id="enabled" class="ui_select01">
                                   <option value="1">可用</option>
                                    <option value="0">禁用</option>
                        </select>
					</td>
					
				</tr>
				<tr>
				<td class="ui_text_rt">密码</td>
					<td class="ui_text_lt">
						<input type="text" id="currentPassword" name="currentPassword"  class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					<td class="ui_text_rt">邮箱</td>
					<td class="ui_text_lt">
						<input id="d11b" name="email" type="email" value="${email}" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					
						<td class="ui_text_rt">电话</td>
					<td class="ui_text_lt">
						<input type="text" id="phone"  value="${phone}" name="phone" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
				</tr>
				<tr>
						<td class="ui_text_rt">部门</td>
					<td class="ui_text_lt">
						<input type="text" id="department"  value="${department}" name="department" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>	
					<td class="ui_text_rt">角色</td>		
				   <td><select name="sysUserRole.id" id="sysUserRole.id" class="ui_select01">
                             <c:forEach items="${dList}" var="ps"  varStatus="i">
                                   <option value="${ps.id}">${ps.roleName}</option>
                             </c:forEach>
                        </select></td>
                        <td class="ui_text_rt">备注</td>
					<td class="ui_text_lt">
						<input type="text" id="attr1" name="attr1" value="${attr1}" class="ui_input_txt02"/>
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