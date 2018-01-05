/**
 * Created by Administrator on 2017/10/11.
 * 申请单暂存列表--监察科
 */ 
var laypage='',Id='',businessId='',form='',$ = "";
layui.use(['table','laytpl','jquery','laypage','layer'], function () {
	 laypage=layui.laypage;
	 $=layui.jquery;
    var table = layui.table,
    	laytpl=layui.laytpl;
    layer = layui.layer;
    /*申请业务*/
    var option= {
        	id: 'dataGrid',
    		url: ctx+"/specialJianGuan/getSaveList",
        	method: 'post',
        	elem: '#newTable', 
        	cols: [[      		
        			{field: 'formCode', title:'申请编号', width: '15%',event: 'newlayer',style:'cursor: pointer;',
            			templet: '<div><a class="layui-blue">{{d.formCode}}</a></div>'
            				}, 
            		{field: 'remark', title:'业务描述', width: '45%',templet:'<div>{{format(d.remark)}}</div>'},
            		{field: 'applyName', title:'申请人', width: '15%'},
            		{field: 'modifyTime', title:'最后修改时间', width: '15%',sort:true,templet: '<div>{{getMyDate(d.modifyTime)}}</div>'},
            	    {field: 'statuBank', title:'业务状态', width: '10%'}
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
       	  Id=data.id;
       	  businessId=data.businessId; 
       	layui.data('business', {
       	  key: 'businessId'
       	  ,value: businessId
       	});
       	console.log(layui.data('business'))       	  
       	$("#formId").val(Id);
      if(obj.event === 'newlayer'){
    	  window.location.href=ctx+'/bank/specialJianGuan/specialApply?id='+Id+'&&type=zancun';
      }
      
    });

   /*
    //导入启动流程  //接收启动流程操作
    $("#startUpBtn").click(function(event){  	
    	
    	var eleId=event.target.id;
    	$.ajax({
			type : "POST",
			async : false,
			url : ctx+'/specialJianGuan/saveInputAndGetProcessList',
			data : {
				businessId:businessId
			},
			dataType : "json",
			success : function(data) {
				if (data.success == "true") {
					processList(data,eleId);
					
				} else {
					errorTip(data);
				}
			},
			error : function(data) {
				errorTip(data);
			}
		});
    });
    
    function processList(data,ele){
		if (data.success == "true") {
			var len=data.processList.length;
			var data=data.processList;
			
			htmls='';
			htmls+='<div class="layui-col-xs12">'
			htmls+= '<div class="layui-form"><div class="layui-form-item">'
			htmls+='<label class="layui-form-label">流程选择：</label>'
			htmls+='<div class="layui-input-block">'
			htmls+='<select name="noticeGet" id="nextApproverSelect">'
					for(i=0;i<len;i++){
						htmls+='<option value='+data[i].id+' data-formId='+formId+'>'+data[i].processName+'</option>'
					}			
			htmls+='</select></div></div></div></div>';
			layer.open({
				  content: htmls
				  ,btn: ['确认', '取消']
				  ,area: ['500px','300px']
				  ,closeBtn: 0
				  ,yes: function(index, layero){  
					  eval('success'+ele+'()');
					  
				  }
				});	
			
			form.render('select');	
		}
   }
    
    
    function successstartUpBtn(){ 
    	var _this=this;
   	 var processid=$("#nextApproverSelect").val();
	 var formId=$("#formId").val()
	  //确认提交
	  $.ajax({
			type : "POST",
			async : false,
						url : ctx+"/reportoperation/startProcess",
			dataType : "json",
			data : {
				formId : formId,								
				processId:processid,
			},
			success : function(data) {
				if (data.success = "true") {
					successTip(data);
					_this.location.href=ctx+'/bank/myWork/approval?id='+formId+'&&type=导入';	
				}else{
					errorTip(data);	
				}
			},
			error : function(data) {
				errorTip(data);	
			}
		})	
    }*/
     
});



