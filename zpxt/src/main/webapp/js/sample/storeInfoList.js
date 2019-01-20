/**
 * 
 */
var queryAllPerson = function(pageNum,pageSize) {
	var param = "pageNum="+pageNum + "&pageSize=" + pageSize+"&clothID="+$("#clothID").val();
	$("#frame-contect", parent.document).attr("src",basePath+"/ClothRequireStoreInfoController/getList.do?"+param);
}
var jumpInputPage = function(pageSize) {
	var param = "pageNum="+$("#jumpNumTxt").val() + "&pageSize="+pageSize+"&clothID="+$("#clothID").val();
  $("#frame-contect", parent.document).attr("src",basePath+"/ClothRequireStoreInfoController/getList.do?"+param);
}
$(document).ready(function(){
	/** 新增   **/
	$("#addBtn").click(function() {
		 $("#frame-contect", parent.document).attr("src",basePath+'/ClothRequireStoreInfoController/add.do');
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
			return;
		}
		
		 $("#frame-contect", parent.document).attr("src",basePath+'/ClothRequireStoreInfoController/edit.do?requireId='+allIDCheck);
	});
	
    /** 审核  **/
    $("#examineBtn").click(function(){
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
			return;
		}
		//判断状态
		 $.ajax({ 
	            type: "POST", 
	            data:"id="+allIDCheck,  //用form的id去找对象 ，也可以使用$('form').serialize(),
	            url: basePath+"/ClothRequireController/get.do", 
	            async:false,
	            success: function(data){   
	            	var obj = jQuery.parseJSON(data);
	               if(obj.code != 1){
	            	   alert(obj.msg);
	            	   return;
	               }else{
	            	   $("#frame-contect", parent.document).attr("src",basePath+'/ClothRequireStoreInfoController/requireExamine.do?id='+allIDCheck);
	               }
	            } 
   		  });  
		
		    });
});

/** 模糊查询来电用户  **/
function search(){
	$("#submitForm").attr("action", basePath+"/ClothRequireStoreInfoController/getList.do?clothID="+$("#clothID").val()).submit();
}

/** Excel导出  **/
function exportExcel(){
	if( confirm('您确定要导出吗？') ){
		$("#submitForm").attr("action", basePath+"/ClothRequireStoreInfoController/export.do").submit();	
	}
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
			$("#submitForm").attr("action", basePath+"/ClothRequireStoreInfoController/deleteByIds.do?requireIds="+$("#allIDCheck").val()).submit();
		}
	}
}