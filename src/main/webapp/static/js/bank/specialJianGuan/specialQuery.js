
/**
 * Created by Administrator on 2017/10/12.
 */
var formCode='',applyName='',statuBank='',queryDate='',laypage='',$='';
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
	    		url:  ctx+"/specialJianGuan/ajaxApprovalReportList",
	        	method: 'post',
	        	elem: '#newTable', 
	        	where: {
		        	formCode:formCode,//申请编号
		        	applyName:applyName,//申请人
		        	statuBank:statuBank,//申请状态
		        	queryDate:queryDate//时间范围
	        	}, 
	        	cols: [[      		
	        		{field: 'formCode', title:'申请编号', width: '20%',event: 'newlayer',style:'cursor: pointer;',templet: '<div><a class="layui-blue">{{d.formCode}}</a></div>'},
	        		{field: 'remark', title:'业务描述', width: '30%'},
	        		{field: 'applyName', title:'申请人', width: '10%'},
	        		{field: 'applyTime', title:'申请时间', width: '20%',sort:true,templet: '<div>{{getMyDate(d.applyTime)}}</div>'},
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
			applyName=$("#applyName").val();
			statuBank=$("#statuBank").val();
		    queryDate=$("#queryDate").val();
			tableIns.reload({
			    where: { 
			    	formCode:formCode,//申请编号
			    	applyName:applyName,//企业名称
		        	statuBank:statuBank,//申请状态
		        	queryDate:queryDate//时间范围   
			    }
			  });
			  
		  });
		 //监听单元格事件
	    table.on('tool(dataGrid)', function(obj){
	      var data = obj.data;
	       Id=data.id;
	      var status=data.statuBank;
	      var typeId=data.businessId;
	      if(obj.event === 'newlayer'){
	    	  // window.location.href=ctx+'/bank/myWork/approval?id='+Id+'&&type='+statuCompany+'';
	    	  window.location.href = ctx+'/bank/specialJianGuan/specialApproval?id='+Id+'';
	      }
	    });
	    
	    function delSelect(){
	    	$.ajax({
				type : "POST",
				async : false,
				url :  ctx+"/specialJianGuan/getSpecialJianGuanBankStatus",
				dataType : "json",
				success : function(data) {
					if (data.success == "true") {
						var datas=data.statusOfBank;
						var len=datas.length;
						var htmls='';
						for(i=0;i<len;i++){
							htmls+='<option value='+datas[i].status+'>'+datas[i].status+'</option>'
						}
						$("#statuBank").html(htmls);
						
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

