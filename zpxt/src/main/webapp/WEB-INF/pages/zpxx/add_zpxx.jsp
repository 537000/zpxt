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
<title>申请岗位</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="<%=basePath %>/style/authority/basic_layout.css" rel="stylesheet" type="text/css">
<link href="<%=basePath %>/style/authority/common_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/scripts/authority/commonAll.js"></script>
<script type="text/javascript" src="<%=basePath %>/scripts/artDialog/artDialog.js?skin=default"></script>
<script type="text/javascript" src="<%=basePath %>/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		 var basePath = "<%=basePath%>";
		/*
		 * 提交
		 */
		$("#submitbutton").click(function() {
			 // alert($("#submitForm").serialize());
	 
			  var zp_job = $("#zp_job").val();
			  var zp_num = $("#zp_num").val();
			  var zp_dept = $("#zp_dept").val();
			  var salary = $("#salary").val();
			  var description = $("#description").val();
			  var work_addr = $("#work_addr").val();
		         if(zp_job == ""||zp_num == ""||zp_dept == ""
		         ||salary == ""||description == ""||work_addr == ""){
		           alert("请输入必填信息!");
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
	            data:$('form').serialize(),  //用form的id去找对象 ，也可以使用$('form').serialize(),
	            url: basePath+"/sqfb", 
	            success: function(data){    
	               if("success"==data){
	            	   alert("申请成功");
	               }else{
	            	   alert(data);
	               }
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
			当前位置：招聘岗位信息&nbsp;>&nbsp;<span style="color: #1A5CC6;">申请岗位</span>
			<div id="page_close">
				<a onclick="javascript:history.back(-1);">
					<img src="<%=basePath %>/images/common/page_close.png" width="20" height="20" style="vertical-align: text-top;"/>
				</a>
			</div>
		</div>
		<div class="ui_content">
			<table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
				<tr>
				<input type="hidden" id="zpOwn" name="zpOwn" value="${user.userNo}"/>
				<input type="hidden" id="jobNo" name="jobNo" value="${user.jobNo}"/>
					<td class="ui_text_rt" width="80">招聘职位</td>
					<td class="ui_text_lt">
						<!-- <input type="text" id="zp_job" name="zp_job" class="ui_input_txt02"/><font style="color: red;">*</font> -->
					 <select id="zpJob" name="zpJob">
							<option value='1'>会计师</option>
							<option value='2'>出纳师</option>
							<option value='3'>Java开发工程师</option>
							<option value='4'>C++开发工程师</option>
							<option value='5'>Java高级开发工程师</option>
							<option value='6'>架构师</option>
							<option value='7'>数据工程师</option>
							<option value='8'>经理</option>
							<option value='9'>主管</option>		
						</select>
					</td>					
					<td class="ui_text_rt">招聘人数</td>
					<td class="ui_text_lt">
						<input type="text" id="zpNum" name="zpNum" class="ui_input_txt02"/><font style="color: red;">*</font>
				</tr>
	            <tr>
					
					<td class="ui_text_rt" width="80">招聘部门</td>
					<td class="ui_text_lt">
						<!-- <input type="text" id="zp_dept" name="zp_dept" class="ui_input_txt02"/><font style="color: red;">*</font> -->
		           <select id="zpDept" name="zpDept">
							<option value='1'>财务部</option>
							<option value='2'>行政部</option>
							<option value='3'>研发部</option>
							<option value='4'>人事部</option>
							<option value='5'>技术支持部</option>
							<option value='6'>监督部</option>
							<option value='7'>招聘部</option>
							<option value='8'>经理</option>
							<option value='9'>主管</option>		
						   </select>
					</td>
					
					<td class="ui_text_rt">期望薪资</td>
					<td class="ui_text_lt">
						<input type="text" id="salary" name="salary" class="ui_input_txt02"/><font style="color: red;">*</font>
				</tr>
		         <tr>		
					<td class="ui_text_rt" width="80">职位描述</td>
					<td class="ui_text_lt">
						<input type="text" id="description" name="description" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					
					<td class="ui_text_rt">工作地点</td>
					<td class="ui_text_lt">
						<input type="text" id="workAddr" name="workAddr" class="ui_input_txt02"/><font style="color: red;">*</font>
				</tr>
	        	<tr>
					<td class="ui_text_rt" width="80">招聘截至日期</td>
					<td class="ui_text_lt">
						<input type="date" id="lastDates" name="lastDates" class="ui_input_txt02"/><font style="color: red;">*</font>
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
	<%-- <jsp:include page="../common.jsp"></jsp:include> --%>
</body>
</html>