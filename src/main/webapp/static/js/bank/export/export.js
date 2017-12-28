var exportIds = null;
var $ = "";
layui.use(['table', 'laytpl', 'jquery','laypage','form'], function () {
	 $ = layui.jquery;
    var table = layui.table,
        laytpl = layui.laytpl,       
        form = layui.form,
    	laypage=layui.laypage;
    
    exportIds = new DataSet();

    $("#export").click(function(){	
    	download(exportIds);
    });
    
    /*渲染数据*/
    var option = {
        	id: 'exportForm',
    		url: ctx + '/approvalreport/exportOrImportList',
        	method: 'post',
        	where: {flag: '1'}, 
        	elem: '#newTable', 
        	cols: [[
        		{checkbox: true}, 
        		{field: 'formCode', title:'业务编号', width: '170'}, 
        		{field: 'businessName', title:'申请名称', width: '140'},
        		{field: 'applyTime', title:'申请时间', width: '170', templet: '<div>{{getMyDate(d.applyTime)}}</div>'},
        		{field: 'applyName', title:'企业名称', width: '120'},
        		{field: 'contactName', title:'联系人', width: '80'},
        		{field: 'contactTele', title:'联系电话', width: '120'},
        		{field: 'statuBank', title:'业务状态', width: '100'},
        		{field: 'submitTime', title:'最后提交时间', width: '170', templet: '<div>{{getMyDate(d.applyTime)}}</div>'}
        	]],
        	even: true, 
        	request: {
        		pageName: 'pageNumber', 
        		limitName: 'pageSize'
        	},
        	response: {
        		  statusName: 'success', 
        		  statusCode: 'true', 
        		  dataName: 'rows' 
        	},
        	done: function (res) {
        		var theData = res.rows;
        		for (var i = 0; i < theData.length; i++) {
        			if (exportIds.has(theData[i].id)) {
        				var rs = $('.layui-table-body.layui-table-main table tr:eq('+i+')');
        				$.each(rs, function (index, e) {
        					e.children[0].children[0].children[1].click();
        				});
       			}
        		}
        	}, 
        	page: true,
        	limit: 2,
        	limits: [10 , 20, 30, 50, 100]
        };
    
    table.render(option);
    //导出
    function download(exportIds){
    	if(exportIds.size() < 1){
    		layer.msg("请选择要导出的记录", {
    			icon : 5,
    			anim : 6,
    			offset: '200px'
    		});	
    		return false;
    		}
  	      layer.msg('选中了：'+ exportIds.size() + ' 个');	
    	$("#export").attr("disabled",true).addClass("layui-btn-disabled");
    	$.ajax({
            url: ctx + '/dataZip/download',
            type: "post",
            dataType: "json",
            data:{
            	'reportIds': exportIds.toString()            	
            },
            success: function (data) {
                if (data.flag == 'success') {
                	window.open(data.zipUrl);
                	$("#export").attr("disabled",false).removeClass("layui-btn-disabled");
                } else {
                	
                }
            },
            error: function (data) {
            	errorTip(data);
            }
        });
    }
    

    table.on('checkbox(dataGrid)', function (obj) {
    	if (obj.type == 'all') {
    		var checkStatus = table.checkStatus('exportForm');
    		if (obj.checked) {    			
    			for (e in checkStatus.data) {
    				exportIds.add(checkStatus.data[e].id);
    			}
    			
    		} else {    			
    			exportIds.clear();
    		}
    	} else {
    		if (obj.checked) {    			
    			exportIds.add(obj.data.id);
    		} else {
    			exportIds.remove(obj.data.id);    			
    		}
    		
    	}
    });
    
});
