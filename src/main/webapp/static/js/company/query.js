/**
 * Created by Administrator on 2017/10/12.
 * :
 */
//当前页
var pageNumber = 1,pageSize = 10,curr=1;
var formCode='',businessName='',statuCompany='',queryDate='',laypage='';
layui.use(['table','laydate','jquery','laytpl','laypage'], function () {
	 laypage=layui.laypage;
    var table = layui.table,
        form = layui.form,
        $=layui.jquery,
        laydate = layui.laydate,
        laytpl=layui.laytpl;

	  //日期范围
	    laydate.render({
	        elem: '#queryDate'
	        , range: true
	    });  
	    var option = {
	        	id: 'dataGrid',
	    		url: ctx+"/approvalform/ajaxApprovalFormList",
	        	method: 'post',
	        	elem: '#newTable', 
	        	where: {
		        	formCode:formCode,//申请编号
		        	businessName:businessName,//企业名称
		        	statuCompany:statuCompany,//申请状态
		        	queryDate:queryDate//时间范围
	        	}, 
	        	cols: [[      		
	        		{field: 'formCode', title:'申请编号', width: '20%',event: 'newlayer',style:'cursor: pointer;',templet: '<div><a class="layui-blue">{{d.formCode}}</a></div>'}, 
	        		{field: 'businessName', title:'业务名称', width: '40%'},
	        		{field: 'submitTime', title:'修改时间', width: '20%',sort:true,templet: '<div>{{getMyDate(d.modifyTime)}}</div>'},
	        		{field: 'statuCompany', title:'业务状态', width: '20%'},
	        	]], 	
	        	even: true, 
	        	request: {
	        		pageName: 'pageNumber', 
	        		limitName: 'pageSize',
	        		status:2
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
		var tableIns=table.render(option); 
		$('#comfirmBtn').on('click', function(){	
			//这里以搜索为例
			formCode=$("#formCode").val()
			businessName=$("#businessName").val();
		    statuCompany=$("#statuCompany").val();
		    queryDate=$("#queryDate").val();
			tableIns.reload({
			    where: { 
			    	formCode:formCode,//申请编号
		        	businessName:businessName,//企业名称
		        	statuCompany:statuCompany,//申请状态
		        	queryDate:queryDate//时间范围   
			    }
			  });
			  
		  });
		 //监听单元格事件
	    table.on('tool(dataGrid)', function(obj){
	      var data = obj.data;
	       Id=data.id;
	      var status=data.statuCompany;
	      var typeId=data.businessId;
	      if(obj.event === 'newlayer'){
	    	  window.location.href=ctx+'/company/queryInfo?status='+status+'&&id='+Id+'&&typeId='+typeId+'';
	      }
	    });

});

