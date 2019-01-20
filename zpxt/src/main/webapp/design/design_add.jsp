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
<script type="text/javascript" src="<%=basePath %>/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/scripts/authority/commonAll.js"></script>
<script src="<%=basePath %>/scripts/My97DatePicker/WdatePicker.js" type="text/javascript" defer="defer"></script>
<script type="text/javascript" src="<%=basePath %>/scripts/artDialog/artDialog.js?skin=default"></script>
<script type="text/javascript">
	$(document).ready(function() {
		/*
		 * 提交
		 */
		$("#submitbutton").click(function() {
			 // alert($("#submitForm").serialize());
			  var fileName = $("#up").val();
		         if(fileName == ""){
		           alert("请选择文件!");
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
	            url: basePath+"/DesignController/addDesign.do", 
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
		    if(fileType=='.jpg'|| fileType=='.jpeg'|| fileType=='.JPG'|| fileType=='.JPEG'|| fileType=='.png'|| fileType=='.PNG'){//验证文件类型,此处验证也可使用正则
		         $.ajax({
		            url: basePath+"/DesignController/addFile.do",//上传地址
		            type: 'POST',
		            cache: false,
		            data: fd,//new FormData($('#uploadForm')[0]),//表单数据
		           // data: fd,//表单数据
		            processData: false,
		            contentType: false,
		            success:function(data){
		                if(data=='fileTypeError'){
		                    alert('*上传文件类型错误,支持类型: jpg.png.gif');//根据后端返回值,回显错误信息
		                }
		                 var obj = jQuery.parseJSON(data);
		                $("#div_show_image").empty();
		                $("#div_show_image").append("<img src='"+basePath+"/files/"+obj.fileName+"'  width='300' height='300' />");
		                $("#fileName").val(obj.fileName);
		               // $("input[name='enclosureCode']").attr('value',data);
		            }
		        }); 
		    }else{
		       alert('*上传文件类型错误,支持类型: jpg.png.gif');
		    }
	}
	
	
</script>
</head>
<body>
<form id="submitForm" name="submitForm" method="post">
<input type="text" id="fileName" name="fileName" hidden="hidden"/>
	<div id="container">
		<div id="nav_links">
			当前位置：打版管理&nbsp;>&nbsp;<span style="color: #1A5CC6;">设计单</span>
			<div id="page_close">
				<a onclick="javascript:history.back(-1);">
					<img src="<%=basePath %>/images/common/page_close.png" width="20" height="20" style="vertical-align: text-top;"/>
				</a>
			</div>
		</div>
		<div class="ui_content">
			<table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
				<tr>
					<td class="ui_text_rt" width="80">衣服款号</td>
					<td class="ui_text_lt">
						<input type="text" id="clothID" name="clothID" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					<td class="ui_text_rt">物料C</td>
					<td class="ui_text_lt">
						<input type="text" id="cname" name="cname"  class="ui_input_txt02"/>
					</td>
					
					<td class="ui_text_rt">价格E</td>
					<td class="ui_text_lt">
						<input type="text" id="eprice" name="eprice" class="ui_input_txt02"/>
					</td>
					 <td class="ui_text_rt">设计稿</td>
					<td class="ui_text_lt">
					    <form id="uploadForm" enctype="multipart/form-data" method="post" >
                           <input type="file" name="up"  id="up" value="" onchange="fileChange()"><font style="color: red;">*</font>
                      </form>
					</td>
				</tr>
				<tr>
				<td class="ui_text_rt">物料A</td>
					<td class="ui_text_lt">
						<input type="text" id="aname" name="aname"  class="ui_input_txt02"/>
					</td>
					<td class="ui_text_rt">价格C</td>
					<td class="ui_text_lt">
						<input type="text" id="cprice" name="cprice" class="ui_input_txt02"/>
					</td>
					
						<td class="ui_text_rt">衣宽E</td>
					<td class="ui_text_lt">
						<input type="text" id="ewidth" name="ewidth" class="ui_input_txt02"/>m
					</td>
				</tr>
				<tr>
						<td class="ui_text_rt">价格A</td>
					<td class="ui_text_lt">
						<input type="text" id="aprice" name="aprice" class="ui_input_txt02"/>
					</td>
						<td class="ui_text_rt">衣宽C</td>
					<td class="ui_text_lt">
						<input type="text" id="cwidth" name="cwidth" class="ui_input_txt02"/>m
					</td>
					
						<td class="ui_text_rt">使用E</td>
					<td class="ui_text_lt">
						<input type="text" id="eused" name="eused" class="ui_input_txt02"/>m
					</td>
				</tr>
				<tr>
				<td class="ui_text_rt">衣宽A</td>
					<td class="ui_text_lt">
						<input type="text" id="awidth" name="awidth"  class="ui_input_txt02"/>m
					</td>
					<td class="ui_text_rt">使用C</td>
					<td class="ui_text_lt">
						<input type="text" id="cused" name="cused" class="ui_input_txt02"/>m
					</td>
					<td class="ui_text_rt">厂家E</td>
					<td class="ui_text_lt">	
					   <select name="efactory" id="efactory" class="ui_select01">
                            <option value="">--请选择--</option>
                             <c:forEach items="${fList}" var="ps"  varStatus="i">
                                   <option value="${ps.id}" >${ps.factoryName}</option>
                             </c:forEach>
                        </select>
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt">使用A</td>
					<td class="ui_text_lt">
						<input type="text" id="aused" name="aused"  class="ui_input_txt02"/>m
					</td>
					<td class="ui_text_rt">厂家C</td>
					<td class="ui_text_lt">	
					   <select name="cfactory" id="cfactory" class="ui_select01">
                            <option value="">--请选择--</option>
                             <c:forEach items="${fList}" var="ps"  varStatus="i">
                                   <option value="${ps.id}" >${ps.factoryName}</option>
                             </c:forEach>
                        </select>
					</td>
						<td class="ui_text_rt">物料F</td>
					<td class="ui_text_lt">
						<input type="text" id="fname" name="fname"  class="ui_input_txt02"/>
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt">厂家A</td>
					<td class="ui_text_lt">	
					<select name="afactory" id="afactory" class="ui_select01">
                            <option value="">--请选择--</option>
                             <c:forEach items="${fList}" var="ps"  varStatus="i">
                                   <option value="${ps.id}" >${ps.factoryName}</option>
                             </c:forEach>
                        </select>
					</td>
					<td class="ui_text_rt">物料D</td>
					<td class="ui_text_lt">
						<input type="text" id="dname" name="dname" class="ui_input_txt02"/>
					</td>
					
						<td class="ui_text_rt">价格F</td>
					<td class="ui_text_lt">
						<input type="text" id="fprice" name="fprice" class="ui_input_txt02"/>
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt">物料B</td>
					<td class="ui_text_lt">
						<input type="text" id="bname" name="bname"  class="ui_input_txt02"/>
					</td>
					
					<td class="ui_text_rt">价格D</td>
					<td class="ui_text_lt">
						<input type="text" id="dprice" name="dprice"  class="ui_input_txt02"/>
					</td>
					
					<td class="ui_text_rt">衣宽F</td>
					<td class="ui_text_lt">
						<input type="text" id="fwidth" name="fwidth"  class="ui_input_txt02"/>m
					</td>
					</tr>
					
				<tr>
					<td class="ui_text_rt">价格B</td>
					<td class="ui_text_lt">
						<input type="text" id="bprice" name="bprice"   class="ui_input_txt02"/>
					</td>
					<td class="ui_text_rt">衣宽D</td>
					<td class="ui_text_lt">
						<input type="text" id="dwidth" name="dwidth"  class="ui_input_txt02"/>m
					</td>
					<td class="ui_text_rt">使用F</td>
					<td class="ui_text_lt">
						<input type="text" id="fused" name="fused"  class="ui_input_txt02"/>m
					</td>
				</tr>
				<tr>
						<td class="ui_text_rt">衣宽B</td>
					<td class="ui_text_lt">
						<input type="text" id="bwidth" name="bwidth"   class="ui_input_txt02"/>m
					</td>
					<td class="ui_text_rt">使用D</td>
					<td class="ui_text_lt">
						<input type="text" id="dused" name="dused"  class="ui_input_txt02"/>m
					</td>
					<td class="ui_text_rt">厂家F</td>
					<td class="ui_text_lt">	
					  <select name="ffactory" id="ffactory" class="ui_select01">
                            <option value="">--请选择--</option>
                             <c:forEach items="${fList}" var="ps"  varStatus="i">
                                   <option value="${ps.id}" >${ps.factoryName}</option>
                             </c:forEach>
                        </select></td>
				</tr>
				<tr>
				<td class="ui_text_rt">使用B</td>
					<td class="ui_text_lt">
						<input type="text" id="bused" name="bused"  class="ui_input_txt02"/>m
					</td>
					<td class="ui_text_rt">厂家D</td>
					<td class="ui_text_lt">	
					   <select name="dfactory" id="dfactory" class="ui_select01">
                            <option value="">--请选择--</option>
                             <c:forEach items="${fList}" var="ps"  varStatus="i">
                                   <option value="${ps.id}" >${ps.factoryName}</option>
                             </c:forEach>
                        </select>
					</td>
					<td class="ui_text_rt">设计师</td>
					<td class="ui_text_lt">	
					<select name="userID" id="userID" class="ui_select01">
                            <option value="">--请选择--</option>
                             <c:forEach items="${dList}" var="ps"  varStatus="i">
                                   <option value="${ps.id}" >${ps.cname}</option>
                             </c:forEach>
                        </select><font style="color: red;">*</font>
                      </td>
				</tr>
				<tr>
					<td class="ui_text_rt">厂家B</td>
					<td class="ui_text_lt">	
					   <select name="bfactory" id="bfactory" class="ui_select01">
                            <option value="">--请选择--</option>
                             <c:forEach items="${fList}" var="ps"  varStatus="i">
                                   <option value="${ps.id}" >${ps.factoryName}</option>
                             </c:forEach>
                        </select>
					</td>
					<td class="ui_text_rt">物料E</td>
					<td class="ui_text_lt">
						<input type="text" id="ename" name="ename"  class="ui_input_txt02"/>
					</td>
				</tr>
				<tr>
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
<div style="width:300px;height:300px;position:absolute;top:130px;right:0" id="div_show_image">
</div>
			<jsp:include page="../common.jsp"></jsp:include>
</body>
</html>