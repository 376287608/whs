/**
 * Created by Administrator on 2017/10/11.
 */
var $='';
var laypage='';
layui.use(['table', 'laytpl', 'jquery','laypage','layer'], function () {
    laypage=layui.laypage;
    $ = layui.jquery;
    var table = layui.table,
        laytpl = layui.laytpl,      
        layer = layui.layer;
    var option = {
        	id: 'dataGrid',
    		url: ctx+"/message/ajaxMessageList",
        	method: 'post',
        	elem: '#newTable', 
        	cols: [[      		
        		{field: 'formCode', title:'申请编号', width: '20%',event: 'newlayer',style:'cursor: pointer;',templet: '<div><a class="layui-blue">{{d.formCode}}</a></div>'}, 
        		{field: 'businessName', title:'申请名称', width: '30%'},
        		{field: 'companyName', title:'企业名称', width: '20%'},
        		{field: 'contantName', title:'联系人', width: '10%'},
        		{field: 'submitTime', title:'申请时间', width: '20%',sort:true, templet: '<div>{{getMyDate(d.submitTime)}}</div>'}
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
        	page: true,
        	limit: 10,
        	limits: [10,20, 30, 50, 100]
        };
	table.render(option);
	  //监听单元格事件
    table.on('tool(dataGrid)', function(obj){   
      var data = obj.data;
      var formId=data.formId; 
      var noticeId=data.id; 
      var status=data.status2;
      var typeId=data.businessId; 
      if(obj.event === 'newlayer'){  	 
    	  window.location.href=ctx+'/company/queryInfo?id='+formId+'&&status='+status+'&&typeId='+typeId+'&&form=index&&noticeId='+noticeId+'';
      }
    });
    
  
});









