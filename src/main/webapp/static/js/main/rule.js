var pageNumber=1,pageSize=10,curr=1;id='';
var $ = '', laytpl = '', laypage = '';
layui.use([ 'table', 'laytpl', 'jquery', 'laypage', 'laydate' ], function() {
	$ = layui.jquery, laytpl = layui.laytpl, laypage = layui.laypage;
	var table = layui.table, laydate = layui.laydate;

	// 时间范围选择
	laydate.render({
		elem : '#test6',
		range : true
	});

	var url = pathUrl();
	var type = "";
	if (url ==  ctx+"/guides/guidesList") {
		type = 'guides'
		// 办事指南.法律法规
		rule(type,'', pageNumber, pageSize);
	} else {
		var type = 'laws';
		type = 'laws'
		// 办事指南.法律法规
		rule(type,'', pageNumber, pageSize);
	}
	$("#btn").click(function() {
		rule(type, '', pageNumber, pageSize);
	});

});
