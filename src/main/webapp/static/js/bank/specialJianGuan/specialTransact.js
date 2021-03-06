/**
 * Created by Administrator on 2017/10/11.
 * 在办理业务
 */
var laypage="";
var $ = "";
layui.use(['table', 'laytpl', 'jquery','laypage','layer'], function () {
	 laypage=layui.laypage;
	 $ = layui.jquery;
    var table = layui.table,
        laytpl = layui.laytpl,     
        layer = layui.layer;
    var option = {
        	id: 'dataGrid',
    		url: ctx+"/specialJianGuan/ajaxToTransactList",
        	method: 'post',
        	elem: '#newTable',
        	where: {status:'1'}, 
        	cols: [[      		
        		{field: 'formCode', title:'申请编号', width: '14%',event: 'newlayer',style:'cursor: pointer;',templet: '<div><a class="layui-blue">{{d.formCode}}</a></div>'}, 
        		{field: 'remark', title:'业务描述', width: '28%'},
        		{field: 'applyName', title:'申请人', width: '14%'},
        		{field: 'applyTime', title:'申请时间', width: '14%',sort:true,templet: '<div>{{getMyDate(d.applyTime)}}</div>'},
        	    {field: 'statuBank', title:'业务状态', width: '8%'},
        		{field: 'currentuser', title:'当前操作人', width: '8%'},
        		{field: 'currentstepTime', title:'当前操作时间', width: '14%',sort:true, templet: '<div>{{getMyDate(d.currentstepTime)}}</div>'}  		
        	]], 	
        	even: true, 
        	request: {
        		pageName: 'pageNumber', 
        		limitName: 'pageSize',
        	},
        	response: {
        		  statusName: 'success', 
        		  statusCode: 'true', 
        		  dataName: 'rows' 
        	},
        	page: true,
        	limit: 10,
        	limits: [10,20, 30, 50, 100]
        };
	table.render(option);
	  //监听单元格事件
    table.on('tool(dataGrid)', function(obj){
      var data = obj.data;
       Id=data.id;   
      if(obj.event === 'newlayer'){  	 
    	  window.location.href=ctx+'/bank/specialJianGuan/specialApproval?id='+Id+'';
      }
    });

});



