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
<script type="text/javascript" src="<%=basePath %>/js/store/storeList.js"></script>
<script type="text/javascript" src="<%=basePath %>/My97DatePicker/WdatePicker.js"></script>
<title>样衣库存</title>
<style>
	.alt td{ background:black !important;}
</style>
</head>
<body style="height: 319px; ">
	<form id="submitForm" name="submitForm" action="" method="post">
	  <input name="allIDCheck" hidden="hidden" id="allIDCheck"/>
		<div id="container">
			<div class="ui_content">
				<%-- <div class="ui_text_indent">
					<div id="box_border">
						<div id="box_center">
						    员工姓名&nbsp;&nbsp;<input type="text" id="userName" name="userName" class="ui_input_txt02" value="${job}"/>
						</div>
						<div id="box_bottom">
							<input type="button" value="查询" class="ui_input_btn01" onclick="search();" />
							<!-- <input type="button" value="导出" class="ui_input_btn01" onclick="exportExcel();" /> -->
						</div>
					</div>
				</div> --%>
			</div>
			<div class="ui_content">
				<div class="ui_tb">
					<table class="table" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
						<tr>
							<!-- <th width="30"><input type="checkbox" id="all" onclick="selectOrClearAllCheckbox(this);" />
							</th> -->
							<th>员工编号</th>
							<th>员工姓名</th>
							<th>员工性别</th>
							<th>员工职位</th>
							<th>员工部门</th>
							<th>离职申请时间</th>
							<th>操作</th>
						</tr>
						  <c:forEach items="${lzsqlb}" var="ps"  varStatus="i">
							<tr>
								<%-- <td><input type="checkbox" name="IDCheck" value="${ps.userNo}" class="acb" /></td> --%>
								<td>${ps.userNo}</td>
								<td>${ps.userName}</td>
								<td>${ps.userSex}</td>
								<td>${ps.jobNo}</td>
								<td>${ps.deptNo}</td>
								<td><fmt:formatDate value="${ps.lzsqTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td>
									<input type="button" value="通过" class="ui_input_btn01" onclick="pass(${ps.userNo});" />
									<input type="button" value="不通过" class="ui_input_btn01" onclick="unpass(${ps.userNo});" />
								</td>
							</tr>
						  </c:forEach>
					</table>
				</div>
				<div>
				 <%--  <%@ include file="/pagehelper.jsp"%>  --%>
			   </div>
			</div>
		</div>
	</form>
	<jsp:include page="/common.jsp"></jsp:include>
  </body>
  <script>
	   var basePath = "<%=basePath%>";
	   
	   function pass(userNo){
		   $.ajax({ 
	            type: "POST", 
	            data:{"userNo":userNo},
	            url: basePath+"/lzPass", 
	            success: function(data){    
	            	  if("操作成功"==data){
	            		  window.location.href=basePath+"/lzsqlb";
	            	  }
	            	  alert(data);
	            } 
     		  });  
		}
	   
	   function unpass(userNo){
		   $.ajax({ 
	            type: "POST", 
	            data:{"userNo":userNo},
	            url: basePath+"/lzUnpass", 
	            success: function(data){    
	            	if("操作成功"==data){
	            		  window.location.href=basePath+"/lzsqlb";
	            	  }
	            	  alert(data);
	            } 
    		  }); 
	   }
	</script> 
</html>
