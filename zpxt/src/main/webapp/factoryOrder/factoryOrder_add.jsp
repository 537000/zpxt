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
			  var factory = $("#factory").val();
			  var sell = $("#sell").val();
		         if(factory == ""){
		           alert("请输入工厂!");
		           return;
		         }else if(sell==""){
		        	 alert("请输入销售人!");
			           return;
		         }
			 /* var param = $("#submitForm").serialize();
			 var params = param.split("&");
			 var result = ""; */
			 /* for(var i = 0;i<params.length;i++){
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
			  */
			  $.ajax({ 
	            type: "POST", 
	            data:result,  //用form的id去找对象 ，也可以使用$('form').serialize(),
	            url: basePath+"/factoryOrder/addDesign.do", 
	            success: function(data){    
	               alert(data);
	            } 
      		  });  
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
	<div id="container">
		<div id="nav_links">
			当前位置：工厂管理&nbsp;>&nbsp;<span style="color: #1A5CC6;">生产新增</span>
			<div id="page_close">
				<a onclick="javascript:history.back(-1);">
					<img src="<%=basePath %>/images/common/page_close.png" width="20" height="20" style="vertical-align: text-top;"/>
				</a>
			</div>
		</div>
		<div class="ui_content">
			<table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
				<tr>
					<td class="ui_text_rt">加工厂</td>
					<td class="ui_text_lt">	
					   <select name="factory" id="factory" class="ui_select01">
                            <option value="">--请选择--</option>
                             <c:forEach items="${fList}" var="ps"  varStatus="i">
                                   <option value="${ps.id}" >${ps.factoryName}</option>
                             </c:forEach>
                        </select>
					</td>
					<td class="ui_text_rt">销售人员</td>
					<td class="ui_text_lt">	
					<select name="sell" id="sell" class="ui_select01">
                            <option value="">--请选择--</option>
                             <c:forEach items="${dList}" var="ps"  varStatus="i">
                                   <option value="${ps.id}" >${ps.cname}</option>
                             </c:forEach>
                        </select>
                      </td>
					
					<td class="ui_text_rt">客户品牌</td>
					<td class="ui_text_lt">
						<input type="text" id="brand" name="brand"  class="ui_input_txt02"/>
					</td>
					<td class="ui_text_rt">下单日期</td>
					<td class="ui_text_lt">
						<input id="orderTime" name="orderTime" type="text"  onClick="WdatePicker()" class="ui_input_txt02"/>
					</td>
					</tr>
					<tr>
						<td class="ui_text_rt">品名</td>
					<td class="ui_text_lt">
						<input id="productName" name="productName" type="text" class="ui_input_txt02"/>
					</td>		
				<!-- 	<td class="ui_text_rt" width="80">图片</td>
					<td class="ui_text_lt">
						<input type="text" id="image" name="image" class="ui_input_txt02"/>
					</td> -->
						 <td class="ui_text_rt">设计稿</td>
					<td class="ui_text_lt">
					    <form id="uploadForm" enctype="multipart/form-data" method="post" >
                           <input type="file" name="image"  id="image" value="" onchange="fileChange()">
                      </form>
					</td>
					<td class="ui_text_rt">款号</td>
					<td class="ui_text_lt">
						<input type="text" id="styleNum" name="styleNum" class="ui_input_txt02"/>
					</td>
			</tr>
						<tr>
				<td class="ui_text_rt">成分</td>
					<td class="ui_text_lt">
						<input type="text" id="composition" name="composition"  class="ui_input_txt02"/>
					</td>
					<td class="ui_text_rt">客户款号</td>
					<td class="ui_text_lt">
						<input id="cusStyleNum" name="cusStyleNum"  type="text"  class="ui_input_txt02"/>
					</td>
					<td class="ui_text_rt">颜色</td>
					<td class="ui_text_lt">
						<input id="color" name="color" type="text" class="ui_input_txt02"/>
					</td>
				</tr>
					
				
					<tr>
					<td class="ui_text_rt" width="80">XS</td>
					<td class="ui_text_lt">
						<input type="text" id="xs" name="xs" class="ui_input_txt02"/>
					</td>
					<td class="ui_text_rt">S</td>
					<td class="ui_text_lt">
						<input type="text" id="s" name="s" class="ui_input_txt02"/>
					</td>
					
					<td class="ui_text_rt">M</td>
					<td class="ui_text_lt">
						<input type="text" id="m" name="m"  class="ui_input_txt02"/>
					</td>
					<td class="ui_text_rt">L</td>
					<td class="ui_text_lt">
						<input id="l" name="l" type="text" class="ui_input_txt02"/>
					</td>
					
				</tr>
				
							<tr>
		         	<td class="ui_text_rt">XL</td>
					<td class="ui_text_lt">
						<input id="xl" name="xl" type="text" class="ui_input_txt02"/>
					</td>
					<td class="ui_text_rt">均码</td>
					<td class="ui_text_lt">
						<input id="average" name="average" type="text" class="ui_input_txt02"/>
					</td>
						<td class="ui_text_rt">总数量</td>
					<td class="ui_text_lt">
						<input type="text" id="total" name="total"  class="ui_input_txt02"/>
					</td>
					
				</tr>
					
				
					<tr>
					<td class="ui_text_rt" width="80">合同交货日期</td>
					<td class="ui_text_lt">
						<input type="text" onClick="WdatePicker()" id="deliveryDate" name="deliveryDate" class="ui_input_txt02"/>
					</td>
					<td class="ui_text_rt">采购收到物料卡</td>
					<td class="ui_text_lt">
						<input type="text" id="materialsCard" name="materialsCard" class="ui_input_txt02"/>
					</td>
					
					<td class="ui_text_rt">生产部收到工艺制单</td>
					<td class="ui_text_lt">
						<input type="text" id="processOrder" name="processOrder"  class="ui_input_txt02"/>
					</td>
					<td class="ui_text_rt">客户意见</td>
					<td class="ui_text_lt">
						<input id="advice" name="advice" type="email" class="ui_input_txt02"/>
					</td>
				</tr>
				
					<tr>
					<td class="ui_text_rt" width="80">交货日期</td>
					<td class="ui_text_lt">
						<input type="text" onClick="WdatePicker()" id="payDate" name="payDate" class="ui_input_txt02"/>
					</td>
					<td class="ui_text_rt">到厂日期</td>
					<td class="ui_text_lt">
						<input type="text" id="turnUpDate" name="turnUpDate" onClick="WdatePicker()" class="ui_input_txt02"/>
					</td>
					
					<td class="ui_text_rt">纸料到厂日期</td>
					<td class="ui_text_lt">
						<input type="text" id="paperDate" name="paperDate" onClick="WdatePicker()" class="ui_input_txt02"/>
					</td>
					<td class="ui_text_rt">面料到厂日期</td>
					<td class="ui_text_lt">
						<input id="fabricDate" name="fabricDate" onClick="WdatePicker()" type="text" class="ui_input_txt02"/>
					</td>
				</tr>
				
					<tr>
					<td class="ui_text_rt" width="80">面料进度</td>
					<td class="ui_text_lt">
						<input type="text" id="fabricProgress" name="fabricProgress" class="ui_input_txt02"/>
					</td>
					<td class="ui_text_rt">辅料进度</td>
					<td class="ui_text_lt">
						<input type="text" id="assistantProgress" name="assistantProgress" class="ui_input_txt02"/>
					</td>
					
					<td class="ui_text_rt">开裁日期</td>
					<td class="ui_text_lt">
						<input type="text" id="starDate" name="starDate"  onClick="WdatePicker()"  class="ui_input_txt02"/>
					</td>

				</tr>
				
					<tr>
					<td class="ui_text_rt" width="80">实际裁数：XS</td>
					<td class="ui_text_lt">
						<input type="text" id="fxs" name="fxs" class="ui_input_txt02"/>
					</td>
					<td class="ui_text_rt">S</td>
					<td class="ui_text_lt">
						<input type="text" id="fs" name="fs" class="ui_input_txt02"/>
					</td>

					<td class="ui_text_rt">M</td>
					<td class="ui_text_lt">
						<input id="fm" name="fm" type="text" class="ui_input_txt02"/>
					</td>
						<td class="ui_text_rt">L</td>
					<td class="ui_text_lt">
						<input id="fl" name="fl" type="text" class="ui_input_txt02"/>
			
				</tr>
				
					<tr>
						</td>
						<td class="ui_text_rt">XL</td>
					<td class="ui_text_lt">
						<input id="fxl" name="fxl" type="text" class="ui_input_txt02"/>
					</td>
										
					<td class="ui_text_rt">均码</td>
					<td class="ui_text_lt">
						<input type="text" id="faverage" name="faverage"  class="ui_input_txt02"/>
					</td>
						<td class="ui_text_rt">总数量</td>
					<td class="ui_text_lt">
						<input type="text" id="ftotal" name="ftotal"  class="ui_input_txt02"/>
					</td>
				</tr>
				 
					<tr>
					<td class="ui_text_rt" width="80">中查</td>
					<td class="ui_text_lt">
						<input type="text" id="zhongcha" name="zhongcha" class="ui_input_txt02"/>
					</td>
					<td class="ui_text_rt">尾期</td>
					<td class="ui_text_lt">
						<input type="text" id="weiqi" name="weiqi" class="ui_input_txt02"/>
					</td>
					
					<td class="ui_text_rt">后整进度</td>
					<td class="ui_text_lt">
						<input type="text" id="houzheng" name="houzheng"  class="ui_input_txt02"/>
					</td>
				</tr>
				
					<tr>
					<td class="ui_text_rt" width="80">包装要求</td>
					<td class="ui_text_lt">
						<input type="text" id="packageClim" name="packageClim" class="ui_input_txt02"/>
					</td>
					<td class="ui_text_rt">备注</td>
					<td class="ui_text_lt">
						<input type="text" id="remark" name="remark" class="ui_input_txt02"/>
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