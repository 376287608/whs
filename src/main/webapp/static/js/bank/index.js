   var $='';
layui.use([ 'jquery', 'laytpl', 'element','layer','laypage','table'], function() {
	$ = layui.jquery;
	var laytpl = layui.laytpl, element = layui.element,layer=layui.layer,table=layui.table;
var option = {
        	id: 'dataGrid',
    		url: ctx+"/message/ajaxMessageList",
        	method: 'post',
        	elem: '#newTable', 
        	where: {status:'2'}, 
        	cols: [[      		
        		{field: 'formCode', title:'申请编号', width: '20%',style:'cursor: pointer;',templet: '<div>{{d.formCode}}</div>'}, 
        		{field: 'businessName', title:'申请名称', width: '30%'},
        		{field: 'companyName', title:'企业名称', width: '20%'},
        		{field: 'contantName', title:'联系人', width: '10%'},
        		{field: 'submitTime', title:'申请时间', width: '20%',sort:true, templet: '<div>{{getMyDate(d.submitTime)}}</div>'}
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
	  //鐩戝惉鍗曞厓鏍间簨浠�
 /*   table.on('tool(dataGrid)', function(obj){
      var data = obj.data;
       Id=data.id;   
      if(obj.event === 'newlayer'){  	 
    	  window.location.href=ctx+'/bank/myWork/approval?id='+Id+'';
      }
    });*/
});