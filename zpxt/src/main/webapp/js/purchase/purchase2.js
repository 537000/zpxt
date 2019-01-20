/**
 * 
 */
var queryAllPerson = function(pageNum,pageSize) {
	var param = "pageNum="+pageNum + "&pageSize=" + pageSize+"&comNo="+$('#comNo').val();
	$("#frame-contect", parent.document).attr("src",basePath+"/purchare/getList2.do?"+param);
}
var jumpInputPage = function(pageSize) {
	var param = "pageNum="+$("#jumpNumTxt").val() + "&pageSize="+pageSize+"&comNo="+$('#comNo').val();
  $("#frame-contect", parent.document).attr("src",basePath+"/purchare/getList2.do?"+param);
}
$(document).ready(function(){
	
});

/** 模糊查询来电用户  **/
function search(){
	$("#submitForm").attr("action", basePath+"/purchare/getList2.do?comNo="+$("#comNo").val()).submit();
}