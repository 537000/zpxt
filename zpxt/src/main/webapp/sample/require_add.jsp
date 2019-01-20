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
			  var fileName = $("#cname").val();
		         if(fileName == ""){
		           alert("请选择申请人!");
		           return;
		         }
		       var clothID = $("#clothID").val();
		          if(clothID == ""){
		           alert("填写衣服款号!");
		           return;
		         }
		         var userID = $("#userID").val();
		          if(userID == ""){
		           alert("请选择设计师!");
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
	            url: basePath+"/ClothRequireController/save.do", 
	            success: function(data){    
	               alert(data);
	            } 
      		  });  
      		 // $("#submitForm").attr("action",basePath+"/DesignController/addDesign.do").submit();
		});
	});
	function fileChange(){
	        var fileName = $("#up").val();
		         if(fileName == ""){
		           alert("请选择文件!");
		           return;
		         }
		    var fileType = fileName.substr(fileName.length-4,fileName.length);
		   // fd.append("upfile", $("#upfile").get(0).files[0]);//上传的文件file
		    var fd = new FormData();
		   fd.append("up", document.getElementById("up").files[0]); 
		   // if(fileType=='.jpg'|| fileType=='.jpeg'|| fileType=='.JPG'|| fileType=='.JPEG'|| fileType=='.png'|| fileType=='.PNG'){//验证文件类型,此处验证也可使用正则
		         $.ajax({
		            url: basePath+"/UploadFileController/addFile.do",//上传地址
		            type: 'POST',
		            cache: false,
		            data: fd,//new FormData($('#uploadForm')[0]),//表单数据
		           // data: fd,//表单数据
		            processData: false,
		            contentType: false,
		            success:function(data){
		                 var obj = jQuery.parseJSON(data);
		                 if(obj.code==1){
		                   alert("上次成功");
		                 }
		                 $("#fileName").val(obj.fileName);
		               // $("input[name='enclosureCode']").attr('value',data);
		            }
		        }); 
		   // }else{
		    //   alert('*上传文件类型错误,支持类型: jpg.png.gif');
		   // }
	}
	
	
</script>
</head>
<body>
<form id="submitForm" name="submitForm" method="post">
<input type="text" id="fileName" name="fileName" hidden="hidden"/>
	<div id="container">
		<div id="nav_links">
			当前位置：样衣管理&nbsp;>&nbsp;<span style="color: #1A5CC6;">申请单</span>
			<div id="page_close">
				<a onclick="javascript:history.back(-1);">
					<img src="<%=basePath %>/images/common/page_close.png" width="20" height="20" style="vertical-align: text-top;"/>
				</a>
			</div>
		</div>
		<div class="ui_content">
			<table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
				<tr>
					<td class="ui_text_rt" width="80">申请部门</td>
					<td class="ui_text_lt">
						<input type="text" id="department" name="department" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					<td class="ui_text_rt">申请人</td>
					<td class="ui_text_lt">
						<select name="requireUserID" id="requireUserID" class="ui_select01">
                            <option value="">--请选择--</option>
                             <c:forEach items="${dList}" var="ps"  varStatus="i">
                                   <option value="${ps.id}">${ps.cname}</option>
                             </c:forEach>
                        </select><font style="color: red;">*</font>
					</td>
					
					<td class="ui_text_rt">公司名称</td>
					<td class="ui_text_lt">
						<input type="text" id="customerOfficeName" name="customerOfficeName" class="ui_input_txt02"/>
					</td>
					
				</tr>
				<tr>
				<td class="ui_text_rt">数量</td>
					<td class="ui_text_lt">
						<input type="text" id="num" name="num"  class="ui_input_txt02"/>
					</td>
					<td class="ui_text_rt">预计规还日期</td>
					<td class="ui_text_lt">
						<input id="d11b" name="backDate" type="text" onClick="WdatePicker()"/>
					</td>
					
						<td class="ui_text_rt">用途</td>
					<td class="ui_text_lt">
						<input type="text" id="purpose" name="purpose" class="ui_input_txt02"/>
					</td>
				</tr>
				<tr>
						<td class="ui_text_rt">申请理由</td>
					<td class="ui_text_lt">
						<input type="text" id="requestReason" name="requestReason" class="ui_input_txt02"/>
					</td>
						<td class="ui_text_rt">备注</td>
					<td class="ui_text_lt">
						<input type="text" id="remark" name="remark" class="ui_input_txt02"/></td>
						 <td class="ui_text_rt">附件</td>
					<td class="ui_text_lt">
					    <form id="uploadForm" enctype="multipart/form-data" method="post" >
                           <input type="file" name="up"  id="up" value="" onchange="fileChange()"><font style="color: red;">*</font>
                      </form>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="ui_text_lt">
						&nbsp;<input id="submitbutton" type="button" value="提交" class="ui_input_btn01"/>
						&nbsp;<input id="cancelbutton" type="button" value="取消"   onclick="javascript:history.back(-1);" class="ui_input_btn01"/>
					</td>
				</tr>
			</table>
		</div>
	</div>
</form>
	<jsp:include page="../common.jsp"></jsp:include>
</body>
</html>