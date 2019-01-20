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
		 		 var mids="",singles="",produceQuantitys="",sums="",purchaseQuantitys="",shipQuantitys="",signings="",rids="";
		  $("select[name='mid']").each(
					function(){
					mids = mids+$(this).val()+",";
				});
		  $("input[name='single']").each(
					function(){
						singles = singles+$(this).val()+",";
				});
		  $("input[name='produceQuantity']").each(
					function(){
						produceQuantitys = produceQuantitys+$(this).val()+",";
				});
		  $("input[name='sum']").each(
					function(){
						sums = sums+$(this).val()+",";
				});
		  $("input[name='purchaseQuantity']").each(
					function(){
						purchaseQuantitys = purchaseQuantitys+$(this).val()+",";
				});
		  $("input[name='shipQuantity']").each(
					function(){
						shipQuantitys = shipQuantitys+$(this).val()+",";
				});
		  $("input[name='signing']").each(
					function(){
						signings = signings+$(this).val()+",";
				});
		  $("input[name='rid']").each(
					function(){
						rids = rids+$(this).val()+",";
				});
		  
		  
		  $("#mids").val(mids);
		  $("#singles").val(singles);
		  $("#produceQuantitys").val(produceQuantitys);
		  $("#sums").val(sums);
		  $("#purchaseQuantitys").val(purchaseQuantitys);
		  $("#shipQuantitys").val(shipQuantitys);
		  $("#signings").val(signings);
		  $("#rids").val(rids);
		  
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
            url: basePath+"/purchare/update.do", 
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
            url: basePath+"/purchare/addFile.do",//上传地址
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
                $("#image").val(obj.fileName);
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
<input type="hidden" id="image" name="image" value="${purchase.image}" class="ui_input_txt02"/>
<input name="mids" type="hidden" id="mids" >
<input name="id" type="hidden" id="id" value="${purchase.id}" >
<input name="rids" type="hidden" id="rids" >
<input name="singles" type="hidden" id="singles" >
<input name="produceQuantitys" type="hidden" id="produceQuantitys" >
<input name="sums" type="hidden" id="sums" >
<input name="purchaseQuantitys" type="hidden" id="purchaseQuantitys" >
<input name="shipQuantitys" type="hidden" id="shipQuantitys" >
<input name="signings" type="hidden" id="signings" >
	<div id="container">
		<div id="nav_links">
			当前位置：采购管理&nbsp;>&nbsp;<span style="color: #1A5CC6;">采购申请</span>
			<div id="page_close">
				<a onclick="javascript:history.back(-1);">
					<img src="<%=basePath %>/images/common/page_close.png" width="20" height="20" style="vertical-align: text-top;"/>
				</a>
			</div>
		</div>
		<div class="ui_content">
			<table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
				<tr>

				<td class="ui_text_rt">公司单号</td>
					<td class="ui_text_lt">
						<input type="text" id="comNo" name="comNo" value="${purchase. comNo}"  class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					<td class="ui_text_rt" width="80">客户单号</td>
					<td class="ui_text_lt">
						<input type="text" id="cusNo" name="cusNo" value="${purchase.cusNo}" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					
				</tr>
	            <tr>
	            <td class="ui_text_rt">工厂</td>
					<td class="ui_text_lt">
						<input type="text" id="factory" name="factory" value="${purchase. factory}"  class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					<td class="ui_text_rt" width="80">物料卡</td>
					<td class="ui_text_lt">
						<input type="text" id="wuliaoka" name="wuliaoka" value="${purchase. wuliaoka}" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					
				</tr>

			  <tr>
	            <td class="ui_text_rt">大货纸样板</td>
					<td class="ui_text_lt">
						<input type="text" id="zhiyang" name="zhiyang" value="${purchase. zhiyang}" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					<td class="ui_text_rt" width="80">生产工艺制单</td>
					<td class="ui_text_lt">
						<input type="text" id="gongyi" name="gongyi" value="${purchase. gongyi}" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					
				</tr>
				
				  <tr>
	            <td class="ui_text_rt">颜色数量</td>
					<td class="ui_text_lt">
						<input type="text" id="colorNum" name="colorNum" value="${purchase. colorNum}" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					<td class="ui_text_rt" width="80">跟单员</td>
					<td class="ui_text_lt">
						<input type="text" id="pman" name="pman" value="${purchase. pman}" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					
				</tr>
				 <tr>
				 <td class="ui_text_rt">审核状态</td>
					<td class="ui_text_lt">
						<select name="status">
						<option value="0" <c:if test="${purchase.status == 0}">selected</c:if>>未审核</option>
						<option value="1" <c:if test="${purchase.status == 1}">selected</c:if>>审核成功</option>
							<option value="2" <c:if test="${purchase.status == 2}">selected</c:if>>审核失败</option>
						</select>
					</td>
	            <td class="ui_text_rt">图片</td>
					<td class="ui_text_lt">
					    <form id="uploadForm" enctype="multipart/form-data" method="post" >
                           <input type="file" name="up"  id="up" value="${purchase.image}" onchange="fileChange()"><font style="color: red;">*</font>
                      </form>
					</td>
					<td class="ui_text_rt" width="80"></td>
					<td class="ui_text_lt">
					</td>
					
				</tr>
	
<!-- 
				<tr>
					<td>&nbsp;</td>
					<td class="ui_text_lt">
						&nbsp;<input id="submitbutton" type="button" value="提交" class="ui_input_btn01"/>
						&nbsp;<input id="cancelbutton" type="button" value="取消"  onclick="javascript:history.back(-1);" class="ui_input_btn01"/>
					</td>
				</tr>
				 -->
			</table>
			<br><br>
			<table style="margin-top: 20px;padding-top: 20px; padding-left: 120px;"  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
			
			
			<c:forEach items="${purchase.fabricList}" var="pz"  varStatus="j">
							
<tr style="padding-top: 20px">
  <td class="tableleft">物料</td>
      <td>
  <select name="mid">
  	<!-- <option value="">--请选择--</option> -->
                             <c:forEach items="${pist}" var="ps"  varStatus="i">
                                   <option value="${ps.id}" <c:if test="${pz.mid==ps.id}">selected</c:if>>${ps.material}</option>
                             </c:forEach>
  </select>
 &nbsp;&nbsp; <lable>单间用量</lable>
  <input name="single" type="text" id="single" value="${pz.single }" style="width:100px;vertical-align:middle;" maxlength="40" >
   <input name="rid" type="text" id="rid" value="${pz.id }">
  &nbsp;&nbsp;<lable>生产件数</lable>
  <input name="produceQuantity" type="text" value="${pz.produceQuantity }" id="produceQuantity" style="width:100px;vertical-align:middle;" maxlength="40" >
  &nbsp;&nbsp;<lable>总量</lable>
  <input name="sum"  type="text" id="sum" value="${pz.sum }" style="width:80px;vertical-align:middle;" maxlength="20"  >
  &nbsp;&nbsp; <lable>采购量</lable>
  <input name="purchaseQuantity"  type="text" value="${pz.purchaseQuantity }" id="purchaseQuantity" style="width:80px;vertical-align:middle;" maxlength="20"  >
   &nbsp;&nbsp;<lable>发货数量</lable>
  <input name="shipQuantity"  type="text" value="${pz.shipQuantity }" id="shipQuantity" style="width:80px;vertical-align:middle;" maxlength="20"  >
  &nbsp;&nbsp;<lable>工厂签收人</lable>
  <input name="signing"  type="text" value="${pz.signing }" id="signing" style="width:80px;vertical-align:middle;" maxlength="20"  >
  &nbsp;<input type="button"   class="btn btn-success"  value="增加" id="addTable" onclick="add_tr(this)"/>
  <input type="button"  class="btn btn-success"   value="删除" id="deleteTable" onclick="del_t(this)"/>
  </td>            
</tr>
    	</c:forEach>
</table>
<br><br>
<input id="submitbutton" type="button" value="提交" class="ui_input_btn01"/>
&nbsp;<input id="cancelbutton" type="button" value="取消"  onclick="javascript:history.back(-1);" class="ui_input_btn01"/>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script>
  function add_tr(obj) {
    var tr = $(obj).parent().parent();
    tr.after(tr.clone());
  }

  function del_t(obj) {
    $(obj).parent().parent().remove();
  }
  
  
</script>
		</div>
	</div>
</form>
<div style="width:300px;height:300px;position:absolute;top:130px;right:0" id="div_show_image">
</div>
	<jsp:include page="/common.jsp"></jsp:include>
</body>
</html>