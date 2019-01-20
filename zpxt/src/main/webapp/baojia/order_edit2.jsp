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
	            url: "/userservlet", 
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
			当前位置：订单管理&nbsp;>&nbsp;<span style="color: #1A5CC6;">审批</span>
			<div id="page_close">
				<a onclick="javascript:history.back(-1);">
					<img src="<%=basePath %>/images/common/page_close.png" width="20" height="20" style="vertical-align: text-top;"/>
				</a>
			</div>
		</div>
		<div class="ui_content">
			<table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
            <input name="id" id="id" value="${dList.id}"  type="hidden"/>
					<tr>
				
					<td class="ui_text_rt" width="80">订单号</td>
					<td class="ui_text_lt">
						<input type="text" id="dingdan" name="dingdan" value="${dList.dingdan}" disabled="disabled" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td> 
					<td class="ui_text_rt">跟单号</td>
					<td class="ui_text_lt">
						<input type="text" id="gendan" name="gendan" value="${dList.gendan}" disabled="disabled"  class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					
					<td class="ui_text_rt">业务员</td>
					<td class="ui_text_lt">
						<input type="text" id="yewuyuan" name="yewuyuan" value="${dList.yewuyuan}" disabled="disabled" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					<td class="ui_text_rt">品名</td>
					<td class="ui_text_lt">
						<input type="text" id="pinmin" name="pinmin"  value="${dList.pinmin}" disabled="disabled" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
				</tr>
				
				
					<tr>
					<td class="ui_text_rt" width="80">编码</td>
					<td class="ui_text_lt">
						<%-- <input type="text" id="bianma" name="bianma" value="${dList.bianma}" class="ui_input_txt02"/><font style="color: red;">*</font> --%>
						<select name=bianma>
                             <c:forEach items="${dList1}" var="ps"  varStatus="i">
                                   <option value="${ps.clothCode}" <c:if test="${ps.clothCode == dList.bianma }">selected</c:if> >${ps.clothID}</option>
                             </c:forEach>
  					</select>
					</td>
					<td class="ui_text_rt">颜色</td>
					<td class="ui_text_lt">
						<%-- <input type="text" id="yanse" name="yanse" value="${dList.yanse}" class="ui_input_txt02"/><font style="color: red;">*</font> --%>
						<select name=yanse>
                             <c:forEach items="${dList1}" var="ps"  varStatus="i">
                                   <option value="${ps.clothCode}" <c:if test="${ps.clothCode == dList.yanse }">selected</c:if> >${ps.color}</option>
                             </c:forEach>
  					</select>
					</td>
					
					<td class="ui_text_rt">规格</td>
					<td class="ui_text_lt">
						<input type="text" id="guige" name="guige" value="${dList.guige}" disabled="disabled" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					<td class="ui_text_rt">数量</td>
					<td class="ui_text_lt">
						<input type="text" id="shuliang" name="shuliang" value="${dList.shuliang}" disabled="disabled" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
				</tr>
				
					<tr>
					<td class="ui_text_rt" width="80">单价</td>
					<td class="ui_text_lt">
						<input type="text" id="danjia" name="danjia" value="${dList.danjia}" disabled="disabled" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					<td class="ui_text_rt">成本价</td>
					<td class="ui_text_lt">
						<input type="text" id="chengbenjia" name="chengbenjia" value="${dList.chengbenjia}" disabled="disabled" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					
					<td class="ui_text_rt">总金额</td>
					<td class="ui_text_lt">
						<input type="text" id="zongjine" name="zongjine" value="${dList.zongjine}" disabled="disabled" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					<td class="ui_text_rt">成分</td>
					<td class="ui_text_lt">
						<input type="text" id="chengfen" name="chengfen" value="${dList.chengfen}" disabled="disabled" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
				</tr>
				
					<tr>
					<td class="ui_text_rt" width="80">检测</td>
					<td class="ui_text_lt">
						<input type="text" id="jiance" name="jiance" value="${dList.jiance}" disabled="disabled" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					<td class="ui_text_rt">信息要求</td>
					<td class="ui_text_lt">
						<input type="text" id="xinxiyaoqiu" name="xinxiyaoqiu" value="${dList.xinxiyaoqiu}" disabled="disabled" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					
					<td class="ui_text_rt">包装</td>
					<td class="ui_text_lt">
						<input type="text" id="baozhuang" name="baozhuang" value="${dList.baozhuang}" disabled="disabled" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					<td class="ui_text_rt">属性4</td>
					<td class="ui_text_lt">
						<input type="text" id="xfour" name="xfour" value="${dList.xfour}" disabled="disabled" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
				</tr>
				
					<tr>
					<td class="ui_text_rt" width="80">开始时间-交货时间</td>
					<td class="ui_text_lt">
						<input type="text" id="qijiaohuo" name="qijiaohuo" value="${dList.qijiaohuo}" disabled="disabled" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					<td class="ui_text_rt">复样</td>
					<td class="ui_text_lt">
						<input type="text" id="fuyang" name="fuyang" value="${dList.fuyang}" disabled="disabled" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					
					<td class="ui_text_rt">补货</td>
					<td class="ui_text_lt">
						<input type="text" id="buhuo" name="buhuo" value="${dList.buhuo}" disabled="disabled" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					<td class="ui_text_rt">加工厂</td>
					<td class="ui_text_lt">
						<input type="text" id="jiagongchang" name="jiagongchang" disabled="disabled" value="${dList.jiagongchang}" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
				</tr>
				
				
				<tr>
					<td class="ui_text_rt" width="80">是否开发票</td>
					<td class="ui_text_lt">
						<input type="text" id="kaipiao" name="kaipiao"  value="${dList.kaipiao}" disabled="disabled" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					<td class="ui_text_rt">运费（含税）</td>
					<td class="ui_text_lt">
						<input type="text" id="yunfeishui" name="yunfeishui" value="${dList.kaipiao}" disabled="disabled" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					
					<td class="ui_text_rt">物流</td>
					<td class="ui_text_lt">
						<input type="text" id="wuliu" name="wuliu" value="${dList.wuliu}" disabled="disabled" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					<td class="ui_text_rt">成本核算</td>
					<td class="ui_text_lt">
						<input type="text" id="chengbenhesuan" name="chengbenhesuan" disabled="disabled" value="${dList.chengbenhesuan}" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
				</tr>
				
				<tr>
					<td class="ui_text_rt" width="80">收款</td>
					<td class="ui_text_lt">
						<input type="text" id="shoukuan" name="shoukuan" value="${dList.shoukuan}" disabled="disabled" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					<td class="ui_text_rt">起货</td>
					<td class="ui_text_lt">
						<input type="text" id="qihuo" name="qihuo" value="${dList.qihuo}" disabled="disabled" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					
					<td class="ui_text_rt">审批</td>
					<td class="ui_text_lt">
						<%-- <input type="text" id="shenpi" name="shenpi" value="${dList.shenpi}" disabled="disabled" class="ui_input_txt02"/><font style="color: red;">*</font> --%>
						<c:if test="${dList.shenpi==1}">
						<select name="shenpi"  disabled="true">
                                   <option value="0" <c:if test="${dList.shenpi==0}">selected</c:if>>审批中</option>
                                     <option value="1" <c:if test="${dList.shenpi==1}">selected</c:if>>审批成功</option>
                                       <option value="2" <c:if test="${dList.shenpi==2}">selected</c:if>>审批失败</option>
						  </select>
						  </c:if>
						  
						  <c:if test="${dList.shenpi!=1}" >
						<select name="shenpi">
                                   <option value="0" <c:if test="${dList.shenpi==0}">selected</c:if>>审批中</option>
                                     <option value="1" <c:if test="${dList.shenpi==1}"></c:if>>审批成功</option>
                                       <option value="2" <c:if test="${dList.shenpi==2}">selected</c:if>>审批失败</option>
						  </select>
						  </c:if>
  请选择
					</td>
					<td class="ui_text_rt">备注</td>
					<td class="ui_text_lt">
						<input type="text" id="beizhu" name="beizhu" value="${dList.beizhu}" disabled="disabled" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
				</tr>
				
				<%-- <tr>
				<td class="ui_text_rt">密码</td>
					<td class="ui_text_lt">
						<input type="text" id="currentPassword" name="currentPassword"  class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					<td class="ui_text_rt">邮箱</td>
					<td class="ui_text_lt">
						<input id="d11b" name="email" type="email" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
					
						<td class="ui_text_rt">电话</td>
					<td class="ui_text_lt">
						<input type="text" id="phone" name="phone" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>
				</tr>
				<tr>
						<td class="ui_text_rt">部门</td>
					<td class="ui_text_lt">
						<input type="text" id="department" name="department" class="ui_input_txt02"/><font style="color: red;">*</font>
					</td>	
					<td class="ui_text_rt">角色</td>		
				   <td><select name="sysUserRole.id" id="sysUserRole.id" class="ui_select01">
                             <c:forEach items="${dList}" var="ps"  varStatus="i">
                                   <option value="${ps.id}">${ps.roleName}</option>
                             </c:forEach>
                        </select></td>
                        <td class="ui_text_rt">备注</td>
					<td class="ui_text_lt">
						<input type="text" id="attr1" name="attr1" class="ui_input_txt02"/>
					</td>
				</tr> --%>
				<tr>
					<td>&nbsp;</td>
					<td class="ui_text_lt">
					<c:if test="${dList.shenpi!=1}" >
						&nbsp;<input id="submitbutton" type="button" value="提交" class="ui_input_btn01"/>
						  </c:if>
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