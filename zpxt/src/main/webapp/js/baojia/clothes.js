/**
 * 
 */
var queryAllPerson = function(pageNum,pageSize) {
	var param = "pageNum="+pageNum + "&pageSize=" + pageSize+"&word="+$('#word').val();
	$("#frame-contect", parent.document).attr("src",basePath+"/baojia/getList.do?"+param);
}
var jumpInputPage = function(pageSize) {
	var param = "pageNum="+$("#jumpNumTxt").val() + "&pageSize="+pageSize+"&word="+$('#word').val();
  $("#frame-contect", parent.document).attr("src",basePath+"/baojia/getList.do?"+param);
}
$(document).ready(function(){
	/** 新增   **/
	$("#addBtn").click(function() {
		 $("#frame-contect", parent.document).attr("src",basePath+'/baojia/addClothes.do');
	});
	/** 编辑   **/
	$("#editBtn").click(function() {
		if($("input[name='IDCheck']:checked").size()<=0){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'请选择一条', ok:true,});
			return;
		}
		var allIDCheck = "";
		var num=0;
		$("input[name='IDCheck']:checked").each(function(){
			allIDCheck = $(this).val();
			num++;
		});
		if(num!=1){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'只能选择一条', ok:true,});
			return;baojia
		}
		 $("#frame-contect", parent.document).attr("src",basePath+'/baojia/cedit.do?requireId='+allIDCheck);
	});
	/** 编辑   **/
	$("#insert").click(function() {
		if($("input[name='IDCheck']:checked").size()<=0){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'请选择一条', ok:true,});
			return;
		}
		var allIDCheck = "";
		var num=0;
		$("input[name='IDCheck']:checked").each(function(){
			allIDCheck = $(this).val();
			num++;
		});
		if(num!=1){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'只能选择一条', ok:true,});
			return;baojia
		}
		if(confirm("您确定要生成预订单吗？")){
		 $("#frame-contect", parent.document).attr("src",basePath+'/baojia/cedit2.do?requireId='+allIDCheck);
		}
	});
	
	/** 编辑   **/
	$("#shenpi").click(function() {
		if($("input[name='IDCheck']:checked").size()<=0){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'请选择一条', ok:true,});
			return;
		}
		var allIDCheck = "";
		var num=0;
		$("input[name='IDCheck']:checked").each(function(){
			allIDCheck = $(this).val();
			num++;
		});
		if(num!=1){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'只能选择一条', ok:true,});
			return;baojia
		}
		 $("#frame-contect", parent.document).attr("src",basePath+'/baojia/ceditshenpi.do?requireId='+allIDCheck);
	});
	
	
	
	
});

/** 模糊查询来电用户  **/
function search(){
	$("#submitForm").attr("action", basePath+"/baojia/getList.do?word="+$("#word").val()).submit();
}

/** 批量删除 **/
function batchDel(){
	if($("input[name='IDCheck']:checked").size()<=0){
		art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'至少选择一条', ok:true,});
		return;
	}
	// 1）取出用户选中的checkbox放入字符串传给后台,form提交
	var allIDCheck = "";
	$("input[name='IDCheck']:checked").each(function(){
		allIDCheck += $(this).val()+",";
	});
	// 截掉最后一个","
	if(allIDCheck.length>0) {
		allIDCheck = allIDCheck.substring(0, allIDCheck.length-1);
		// 赋给隐藏域
		$("#allIDCheck").val(allIDCheck);
		if(confirm("您确定要批量删除这些记录吗？")){
			$("#submitForm").attr("action", basePath+"/baojia/colthesDeleteByIds.do?requireIds="+$("#allIDCheck").val()).submit();
		}
	}
}