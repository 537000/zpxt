<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!--   -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>光伏发电</title>
</head>
<body>
<div class="ui_tb_h30">
					<div class="ui_flt" style="height: 30px; line-height: 30px;">
						共有
						<span class="ui_txt_bold04">${pagehelper.total}</span>
						条记录，当前第
						<span class="ui_txt_bold04">${pagehelper.pageNum}/${pagehelper.pages}</span>
						页
					</div>
             	<div class="ui_frt">
						<!--    如果是第一页，则只显示下一页、尾页 -->
							<input type="button" value="首页" class="ui_input_btn01" onclick="javascript:queryAllPerson(${pagehelper.firstPage}, ${pagehelper.pageSize});" />
							<input type="button" value="上一页" class="ui_input_btn01" onclick="javascript:queryAllPerson(${pagehelper.prePage}, ${pagehelper.pageSize});" />
							<input type="button" value="下一页" class="ui_input_btn01" onclick="javascript:queryAllPerson(${pagehelper.nextPage}, ${pagehelper.pageSize});" />
							<input type="button" value="尾页" class="ui_input_btn01"	onclick="javascript:queryAllPerson(${pagehelper.lastPage}, ${pagehelper.pageSize});" />
						<!--     如果是最后一页，则只显示首页、上一页 -->
						转到第<input type="text" id="jumpNumTxt" class="ui_input_txt01" value="${pagehelper.pageNum}"/>页
							 <input type="button" class="ui_input_btn01" value="跳转" onclick="javascript:jumpInputPage(${pagehelper.pageSize});" />
					</div>
	</div>
</body>
</html>