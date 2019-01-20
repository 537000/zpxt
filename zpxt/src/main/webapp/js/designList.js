/**
 * 
 */
var queryAllPerson = function(pageNum,pageSize) {
	var param = "pageNum="+pageNum + "&pageSize=" + pageSize+"&userID="+$("#clothDesignUserID option:selected").val()+"&clothID="+$('#clothID').val();
	$("#frame-contect", parent.document).attr("src",basePath+"/DesignController/getList.do?"+param);
}
var jumpInputPage = function(pageSize) {
	var param = "pageNum="+$("#jumpNumTxt").val() + "&pageSize="+pageSize+"&userID="+$("#clothDesignUserID option:selected").val()+"&clothID="+$('#clothID').val();
  $("#frame-contect", parent.document).attr("src",basePath+"/DesignController/getList.do?"+param);
}
$(document).ready(function(){
	/** 新增   **/
	$("#addBtn").click(function() {
		 $("#frame-contect", parent.document).attr("src",basePath+'/DesignController/designAdd.do');
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
		
		 $("#frame-contect", parent.document).attr("src",basePath+'/DesignController/designEdit.do?designId='+allIDCheck);
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
	            url: basePath+"/DesignController/get.do", 
	            async:false,
	            success: function(data){   
	            	var obj = jQuery.parseJSON(data);
	               if(obj.code != 1){
	            	   alert(obj.msg);
	            	   return;
	               }else{
	            	   $("#frame-contect", parent.document).attr("src",basePath+'/DesignController/requireExamine.do?id='+allIDCheck);
	               }
	            } 
   		  });  
		
    });
	
});

/** 模糊查询来电用户  **/
function search(){
	$("#submitForm").attr("action", basePath+"/DesignController/getList.do?userID="+$("#clothDesignUserID option:selected").val()+"&clothID="+$("#clothID").val()).submit();
}

/** Excel导出  **/
function exportExcel(){
	if( confirm('您确定要导出吗？') ){
		$("#submitForm").attr("action", basePath+"/DesignController/export.do").submit();	
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
			$("#submitForm").attr("action", basePath+"/DesignController/deleteByIds.do?designIds="+$("#allIDCheck").val()).submit();
		}
	}
}