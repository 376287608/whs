
/**
 * Created by Administrator on 2017/10/12.
 */
var formCode='',businessName='',statuCompany='',queryDate='',laypage='',$='';
layui.use(['table','laydate','jquery','laytpl','laypage'], function () {
	 laypage=layui.laypage;
     $=layui.jquery;
    var table = layui.table,
        form = layui.form,   
        laydate = layui.laydate,
        laytpl=layui.laytpl;
    	delSelect();
	  //日期范围
	    laydate.render({
	        elem: '#queryDate'
	        , range: true
	    });  
	    var option = {
	        	id: 'dataGrid',
	    		url:  ctx+"/approvalreport/ajaxApprovalReportList",
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
	        		{field: 'submitTime', title:'修改时间', width: '20%',sort:true,templet: '<div>{{getMyDate(d.submitTime)}}</div>'},
	        		{field: 'statuBank', title:'业务状态', width: '20%'},
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
			formCode=$("#formCode").val();
			businessName=$("#businessName").val();
		    statuCompany=$("#statuCompany").val();
		    queryDate=$("#queryDate").val();
			tableIns.reload({
			    where: { 
			    	formCode:formCode,//申请编号
		        	businessName:businessName,//企业名称
		        	statuBank:statuCompany,//申请状态
		        	queryDate:queryDate//时间范围   
			    }
			  });
			  
		  });
		 //监听单元格事件
	    table.on('tool(dataGrid)', function(obj){
	      var data = obj.data;
	       Id=data.id;
	       if(data.statuCompany=='待审批'){
	    	   var status='daishenpi'
	       }else{
	    	   var status=''
	       }
	      var typeId=data.businessId;
	      if(obj.event === 'newlayer'){
	    	  window.location.href=ctx+'/bank/myWork/approval?id='+Id+'&&type='+status+'';
	      }
	    });
	    
	    function delSelect(){
	    	$.ajax({
				type : "POST",
				async : false,
				url :  ctx+"/approvalreport/getBankStatus",
				dataType : "json",
				success : function(data) {
					if (data.success == "true") {
						var datas=data.statusOfBank;
						var len=datas.length;
						var htmls='';
						for(i=0;i<len;i++){
							htmls+='<option value='+datas[i].status+'>'+datas[i].status+'</option>'
						}
						$("#statuCompany").html(htmls);
						
					}else{
						errorTip(data);
					}
				},
				error : function(data) {
					errorTip(data);
				}
			})
			form.render('select');	
	    }
	    
});

