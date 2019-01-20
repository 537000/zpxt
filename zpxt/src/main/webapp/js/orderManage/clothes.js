/**
 * 
 */
var queryAllPerson = function(pageNum,pageSize) {
	var param = "pageNum="+pageNum + "&pageSize=" + pageSize+"&word="+$('#word').val();
	$("#frame-contect", parent.document).attr("src",basePath+"/orderManager/getList.do?"+param);
}
var jumpInputPage = function(pageSize) {
	var param = "pageNum="+$("#jumpNumTxt").val() + "&pageSize="+pageSize+"&word="+$('#word').val();
  $("#frame-contect", parent.document).attr("src",basePath+"/orderManager/getList.do?"+param);
}
$(document).ready(function(){
	/** 新增   **/
	$("#addBtn").click(function() {
		 $("#frame-contect", parent.document).attr("src",basePath+'/orderManager/addClothes.do');
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
			return;orderManager
		}
		 $("#frame-contect", parent.document).attr("src",basePath+'/orderManager/cedit.do?requireId='+allIDCheck);
	});
	
});

/** 模糊查询来电用户  **/
function search(){
	$("#submitForm").attr("action", basePath+"/orderManager/getList.do?word="+$("#word").val()).submit();
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
			$("#submitForm").attr("action", basePath+"/orderManager/colthesDeleteByIds.do?requireIds="+$("#allIDCheck").val()).submit();
		}
	}
}