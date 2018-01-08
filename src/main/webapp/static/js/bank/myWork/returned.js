/**
 * Created by Administrator on 2017/10/11.
 * 待接收业务，数据导入，人工分派
 */ 
var laypage='',Id='',businessId='',form='',$ = "";
layui.use(['table','upload','laytpl','form'], function () {
	 laypage=layui.laypage;
	 form=layui.form;
	 $=layui.jquery;
    var table = layui.table,
    	upload=layui.upload,
    	laytpl=layui.laytpl;
    	
    	
    /*渲染数据*/
    var Url=pathUrl();
    /*待接收业务*/
    var optionReceive = {
        	id: 'dataGrid',
    		url: ctx+"/approvalform/getToReceive",
        	method: 'post',
        	elem: '#newTable', 
        	cols: [[      		
        		{field: 'formCode', title:'申请编号', width: '20%',event: 'newlayer',style:'cursor: pointer;',templet: '<div><a class="layui-blue">{{d.formCode}}</a></div>'}, 
        		{field: 'businessName', title:'申请名称', width: '20%'},
        		//{field: 'applyTime', title:'申请时间', width: '15%',sort:true,templet: '<div>{{getMyDate(d.applyTime)}}</div>'},
        		{field: 'applyName', title:'企业名称', width: '20%'},
        		{field: 'contactName', title:'联系人', width: '10%'},
        		{field: 'contactTele', title:'联系电话', width: '15%'},
/*        		{field: 'statuBank', title:'业务状态', width: '10%'},*/
        		{field: 'submitTime', title:'最后提交时间', width: '15%',sort:true, templet: '<div>{{getMyDate(d.submitTime)}}</div>'}
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
        	limits: [10, 20, 30, 50, 100]
        };
    
    /*被退回业务*/
    var optionReturned = {
        	id: 'dataGrid',
    		url: ctx+"/approvalform/getReturned",
        	method: 'post',
        	elem: '#newTable', 
        	cols: [[      		
        		{field: 'formCode', title:'申请编号', width: '20%',event: 'newlayer',style:'cursor: pointer;',templet: '<div><a class="layui-blue">{{d.formCode}}</a></div>'}, 
        		{field: 'businessName', title:'申请名称', width: '20%'},
        		//{field: 'applyTime', title:'申请时间', width: '15%',sort:true,templet: '<div>{{getMyDate(d.applyTime)}}</div>'},
        		{field: 'applyName', title:'企业名称', width: '20%'},
        		{field: 'contactName', title:'联系人', width: '10%'},
        		{field: 'contactTele', title:'联系电话', width: '15%'},
/*        		{field: 'statuBank', title:'业务状态', width: '10%'},*/
        		{field: 'submitTime', title:'最后提交时间', width: '15%',sort:true, templet: '<div>{{getMyDate(d.submitTime)}}</div>'}
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
        	limits: [10, 20, 30, 50, 100]
        };
    
    /*数据导入*/
    var optionImportant = {
        	id: 'dataGrid',
        	url: ctx+"/approvalreport/exportOrImportList",
        	method: 'post',
        	where: {flag: '2'}, 
        	elem: '#newTable', 
        	cols: [[
        		{field: 'businessVerifyCode', title:'业务编号', width: '10%'}, 
        		{field: 'formCode', title:'申请编号', width: '15%',event: 'newlayer',style:'cursor: pointer;',templet: '<div><a class="layui-blue">{{d.formCode}}</a></div>'}, 
        		{field: 'businessName', title:'申请名称', width: '15%'},
        		{field: 'applyTime', title:'申请时间', width: '10%', templet: '<div>{{getMyDate(d.applyTime)}}</div>'},
        		{field: 'applyName', title:'企业名称', width: '10%'},
        		{field: 'contactName', title:'联系人', width: '10%'},
        		{field: 'contactTele', title:'联系电话', width: '10%'},
        		{field: 'statuBank', title:'业务状态', width: '10%'},
        		{field: 'submitTime', title:'最后提交时间', width: '10%', templet: '<div>{{getMyDate(d.submitTime)}}</div>'}
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
        	limit: 20,
        	limits: [20, 30, 50, 100]
        };
   /* 人工分派*/
    var optionArtificial = {
        	id: 'dataGrid',
    		url: ctx+"/approvalform/getArtificial",
        	method: 'post',
        	elem: '#newTable', 
        	cols: [[      		
        		{field: 'formCode', title:'申请编号', width: '15%',event: 'newlayer',style:'cursor: pointer;',templet: '<div><a class="layui-blue">{{d.formCode}}</a></div>'}, 
        		{field: 'businessName', title:'申请名称', width: '15%'},
        		/*{field: 'applyTime', title:'申请时间', width: '15%',sort:true,templet: '<div>{{getMyDate(d.applyTime)}}</div>'},*/
        		{field: 'applyName', title:'企业名称', width: '15%'},
        		{field: 'contactName', title:'联系人', width: '7%'},
        		{field: 'contactTele', title:'联系电话', width: '10%'},
        		{field: 'receiveBy', title:'当前处理人', width: '8%'},
        		{field: 'statuCompany', title:'业务状态', width: '8%'}
        		/*{field: 'submitTime', title:'最后提交时间', width: '15%',sort:true, templet: '<div>{{getMyDate(d.applyTime)}}</div>'}*/
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
        	limit: 20,
        	limits: [20, 30, 50, 100]
        };
    
    if(Url==ctx+"/bank/myWork/receive"){
    	$("#import").addClass("none");
    	$(".site-title a").text("待接收业务");
    	$("#receiveBtn,#returnBtn").removeClass("none");
    	table.render(optionReceive);
    }else if(Url==ctx+"/bank/myWork/returned"){
    	$("#import").addClass("none");
    	$(".site-title a").text("被退回业务");
//    	$("#assignmentBtn").removeClass("none");
    	table.render(optionReturned);
    }else if(Url==ctx+"/bank/artificial"){
    	$("#import").addClass("none");
    	$(".site-title a").text("人工分派");
    	$("#assignmentBtn").removeClass("none");
    	table.render(optionArtificial);
    }else{
    	$("#import").removeClass("none");
    	$(".site-title a").text("数据导入");
    	$("#startUpBtn").removeClass("none");
    	table.render(optionImportant);
    	 //上传组件初始化
        var uploadInst = upload.render({
            elem: '#import', //绑定元素
            url: ctx + '/dataZip/upload', //上传接口
            accept: "file",
            exts:'zip',
            done: function(res){
            	if (res.flag == "success") {
            		$("#importResultBody").html("");
            		var list = res.lar;
            		if (!list) {list = [];}
            		var txt = "";
            		$.each(list, function(index, e) {
            			txt += "<tr><td>" + e.businessVerifyCode + "</td><td>" + e.formCode + "</td><td>" + e.businessName + "</td></tr>";
            		});
            		$("#importResultBody").html(txt);
            		
            		var index=layer.open({  
            			title: '本次共导入' + list.length + '条记录',
            			area: 'auto',
            			closeBtn: 0,
            			maxWidth: 800,
            			maxHeight: 600,
            			type: 1, 
            			content: $('#importResultDiv').html(),
            			btn: ['确定'],
            			yes: function () {
            				window.location.reload();
            			}
            		});
            		layer.full(index);
            	} else {
            		alert("导入失败！");
            	}
            },
            error: function(data){
            	errorTip(data);
            }
          });
    }
    
    
  //监听单元格事件
    table.on('tool(dataGrid)', function(obj){
      var data = obj.data;
       	  Id=data.id;
       	  businessId=data.businessId; 
       	layui.data('business', {
       	  key: 'businessId'
       	  ,value: businessId
       	});
       	//console.log(layui.data('business'))
       	  
       	$("#formId").val(Id);
      if(obj.event === 'newlayer'){
    	  $("#receiveTable").addClass("none");
    	  $("#applyInfo").removeClass("none")
    	  info(Id)
      }
      
    });
 
    function info(id) {
    	if(Url==ctx+"/bank/myWork/receive"||Url==ctx+"/bank/artificial"||Url==ctx+"/bank/myWork/returned"){
    		//待接受业务
    		var url=ctx+"/approvalform/seeApprovalForm"
    	}else{
    		var url=ctx+"/approvalreport/approvalReportInfo"	
    	}
		$.ajax({
			url :  url,
			type : "post",
			dataType : "json",
			data : {
				id : id,
			},
			success : function(data) {
					// 申请人基本信息回显
					$.each(data.item, function(index, ele) {
						if(index=="noticeGet"){
							var ele=ele==1?"自取":"邮寄";
							$('.layui-form label[id="noticeGet"]').text(ele);
						}else if(index=="applyTime"||index=="submitTime"){
							$('.layui-form label[id=' + index+ ']').text(getMyDate(ele));
						}else{
							$('.layui-form label[id=' + index+ ']').text(format(ele));
						}	
					})			
					successAttachmentListBank(data.attachments);									
			},
			error : function(data) {
				errorTip(data);
			}
		});

	}
    
    function successAttachmentListBank(data){
    	var getTpl = attachmentListTpl.innerHTML, 
    	view = document.getElementById('attachmentListCon');
    	laytpl(getTpl).render(data, function(html) {
    		view.innerHTML = html;
    	});
    }
    
    //退回操作  
    $("#returnBtn").click(function(){
    	$.ajax({
			url :  ctx+"/formoperation/turnback",
			type : "post",
			dataType : "json",
			data : {
				formId : Id,
			},
			success : function(data) {
				if(data.success=="true"){
					successTip(data);
					layer.load(1);
					setTimeout(function(){
						table.render(optionReceive);
						$("#applyInfo").addClass("none");
				    	$("#receiveTable").removeClass("none");    	
					},2000);
					
				}else{
					errorTip(data);
				}
			},
			error : function(data) {
				errorTip(data);
			}
		});
    });
 
   
    //导入启动流程  //接收启动流程操作
    $("#startUpBtn,#receiveBtn").click(function(event){  	
    	
    	var eleId=event.target.id;
    	$.ajax({
			type : "POST",
			async : false,
			url : ctx+'/reportoperation/getProcessList',
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
				  ,offset: '200px'
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
				flag:false
			},
			success : function(data) {
				if (data.success = "true") {
					successTip(data);
					_this.location.href=ctx+'/bank/myWork/approval?id='+formId;	
				}else{
					errorTip(data);	
				}
			},
			error : function(data) {
				errorTip(data);	
			}
		})	
    }
    
    function successreceiveBtn(){
     var _this=this;
   	 var processid=$("#nextApproverSelect").val();
	 var formId=$("#formId").val();
    $.ajax({
		url :  ctx+"/formoperation/receive",
		type : "post",
		dataType : "json",
		data : {
			formId : formId,								
			processId:processid,
		},
		success : function(data) {
			if(data.success=="true"){
				successTip(data);					
				_this.location.href=ctx+'/bank/myWork/approval?id='+Id;					
			}else{
				errorTip(data);
			}
		},
		error : function(data) {
			errorTip(data);
		}
	});
	
    }
    
	//分派
	$("#assignmentBtn").click(function(e) {
		$.ajax({
			type : "get",
			async : false,
			url :  ctx+"/approvalform/getArtificialList",
			dataType : "json",
			data : {
				businessId : businessId,
			},
			success : function(data) {
				if (data.success = "true") {
					var _this = $(this);
					var len=data.bankUser.length;
					var data=data.bankUser;
					htmls='';
					htmls+='<div class="layui-col-xs12">'
					htmls+= '<div class="layui-form"><div class="layui-form-item">'
					htmls+='<label class="layui-form-label">审批人：</label>'
					htmls+='<div class="layui-input-block">'
					htmls+='<select name="noticeGet" id="nextApproverSelect">'
							for(i=0;i<len;i++){
								htmls+='<option value='+data[i].userId+' data-step='+data[i].stepId+' data-loginname='+data[i].loginName+'>'+data[i].name+'</option>'
							}			
					htmls+='</select></div></div></div></div>';
					layer.open({
						  content: htmls
						  ,btn: ['确认', '取消']
						  ,area: ['500px','300px']
						  ,offset: '100px'
						  ,closeBtn: 0
						  ,yes: function(index, layero){   
							 var name= $("#nextApproverSelect").find("option:selected").data("loginname");
							 var stepId=$("#nextApproverSelect").find("option:selected").data("step");
							 var userId=$("#nextApproverSelect").val();
							  //确认提交
							  $.ajax({
									type : "POST",
									async : false,
									url :  ctx+"/formoperation/turnOther",
									dataType : "json",
									data : {
										formId : Id,
										loginName:name
									},
									success : function(data) {
										if (data.success = "true") {
											successTip(data);
											setTimeout(function(){
												freshenlocation();
											},1000);
											e.stopPropagation()
										}
									},
									error : function(data) {
										errorTip(data);
									}
								})
						  }

						});		
				}
			},
			error : function(data) {
				errorTip(data);
			}
		})				
				form.render('select');	
			})	
     
});



