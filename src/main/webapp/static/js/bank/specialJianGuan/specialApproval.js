/*审批*/
var $ = '';
var layer='';
var form='';
var Type='';
layui.use([ 'upload', 'laydate', 'layer', 'jquery', 'laytpl','form'], function() {
	$ = layui.jquery;
	layer = layui.layer;
	form=layui.form;
	
	var businessId = layui.data('business').businessId;
	console.log(layui.data('business'))
	var upload = layui.upload;
	var laydate = layui.laydate;	
	
	laytpl = layui.laytpl; 
	laydate.render({
		elem : '#completeTime',
		type:'datetime'
	});
	var data={
			formId : Id,
			operationOpinion : $("#operationOpinion").val(),
	}
	var Id = GetQueryString("id");
	Type=GetQueryString("type");
	var name="";
	approval(Id);
	btnShow(Id);
	if(Type=="待审批"){
		checkView(Id);
	}
	function approval(Id) {
		$.ajax({
			url : ctx+"/specialJianGuan/approvalReportInfo",
			type : "post",
			dataType : "json",
			data : {
				id : Id,
			},
			success : function(data) {
				// 申请人基本信息回显
				if(data.success=="true"){
				$("#lastApprover").text(format(data.topUser.approvalRoleName));
				$.each(data.item, function(index, ele) {
					if(index=="createTime"||index=="applyTime"||index=="agentTime"){
						$("#"+index).val(getMyDate(ele));
						$("#"+index).text(getMyDate(ele));
					}else {
						$('.layui-form label[id=' + index + ']').text(format(ele));
					}
				});
				if(data.currentSug != null){
					$("#operationOpinion").text(data.currentSug);
				}
				successAttachmentListBank(data.attachments);	
				}else{
					errorTip(data);
				}
			},
			error : function(data) {
				errorTip(data);
			}
		});
	}
	function successAttachmentListBank(data) {
		var getTpl = attachmentListTpl.innerHTML, view = document
				.getElementById('attachmentListCon');
		laytpl(getTpl).render(data, function(html) {
			view.innerHTML = html;
		});
		/*
		if(Type=="待审批"){
			$(".addAnnotationBtn").removeClass("none");	
		}else if(Type=="待接收"){
			$(".passBtn,.noPassBtn,.addAnnotationBtn").removeClass("none");
		}else if(Type=="导入"||Type=="人工录入"){
			$(".noPassBtn,.addAnnotationBtn").removeClass("none");
		}
		else{
			$(".checkBtn").removeClass("none");
			$(".passBtn,.noPassBtn").addClass("none");
		}*/
	}
	// 内部撤回
	$("#cancelBtn").click(
			function(e) {
				var _this = $(this);
				layer.confirm('您确定要撤回该业务吗？', {
					btn : [ '确定', '取消' ]
				 	,offset: '200px'
				 	,closeBtn: 0
				// 按钮
				}, function() {
					$.ajax({
						type : "POST",
						async : false,
						url :  ctx+"/specialJianGuan/internalWithdrawal",
						dataType : "json",
						data : {
							formId :Id,
						},
						success : function(data) {
							if (data.success =="true") {
								successTip(data);
								_this.attr("disabled", true).addClass(
										"layui-btn-disabled");
								setTimeout(function(){
									freshen();
								},1500);
								e.stopPropagation()
							}else{
								errorTip(data);
							}
						},
						error : function(data) {
							errorTip(data);
						}
					});
				}, function() {
					layer.closeAll();
				});

			})

	// 内部退回
	$("#returnBtn").click(function(e) {
		var _this = $(this);
		$.ajax({
			type : "get",
			async : false,
			url :  ctx+"/reportoperation/backPersonList",
			dataType : "json",
			data : {
				formId : Id,
			},
			success : function(data) {
				if (data.success == "true") {	
					var len=data.user.length;
					var user=data.user;
					var history=data.historyUsers;
					var historyLen=history.length;
					htmls='';
					htmls+='<div class="layui-col-xs12">'
					htmls+= '<div class="layui-form">'
					htmls+='<div class="layui-form-item"><label class="layui-form-label">历史审批人：</label>'
						htmls+='<div class="layui-input-block"><div id="historyUser" style="padding:6px 0">'
						for(i=0;i<historyLen;i++){	
							htmls+='<p class="ib gray"> '+history[i].name+'</p>'
						}
					htmls+='</div></div></div>'	
					htmls+='<div class="layui-form-item"><label class="layui-form-label">上一位审批人：</label>'
					htmls+='<div class="layui-input-block">'
					htmls+='<select name="noticeGet" id="nextApproverSelect">'
							for(i=0;i<len;i++){							
								htmls+='<option value='+user[i].userId+' data-step='+user[i].stepId+' data-loginname='+user[i].loginName+'>'+user[i].name+'</option>'
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
									url : ctx+"/specialJianGuan/turnback",
									dataType : "json",
									data : {
										formId : Id,
										userId:userId,
										loginName:name,
										stepId:stepId,
										operationOpinion : $("#operationOpinion").val()
									},
									success : function(data) {
										if (data.success == "true") {
											successTip(data);
											_this.attr("disabled", true).addClass(
													"layui-btn-disabled");
											setTimeout(function(){
												freshen();
											},1500);
											e.stopPropagation()
										}else{
											errorTip(data);
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
			
	//转派
	$("#sendBtn").click(function(e) {
		$.ajax({
			type : "get",
			async : false,
			url :  ctx+"/reportoperation/sameLevelPersonList",
			dataType : "json",
			data : {
				formId : Id,
			},
			success : function(data) {
				if (data.success == "true") {
					var _this = $(this);
					var len=data.user.length;
					var data=data.user;
					if(len<0) {
						errorTip(data);
						return false;
					}
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
									url :  ctx+"/specialJianGuan/turnOther",
									dataType : "json",
									data : {
										formId : Id,
										operationOpinion : $("#operationOpinion").val(),
										userId:userId,
										loginName:name,
										stepId:stepId,
									},
									success : function(data) {
										if (data.success == "true") {
											successTip(data);
											setTimeout(function(){
												freshen();
											},1500);
											e.stopPropagation()
										}else{
											errorTip(data);
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
	//撤销流程		
	$("#changeProcessBtn").click(function(e) {
		$.ajax({
			type : "post",
			async : false,
			url :  ctx+"/specialJianGuan/withdrawProcess",
			dataType : "json",
			data : {
				formId : Id,
				businessId:businessId
			},
			success : function(data) {
				if (data.success == "true") {
					successTip(data);
					setTimeout(function(){
						freshen();
					},1500);
					e.stopPropagation()
				}else{
					errorTip(data);
				}
			},
			error : function(data) {
				errorTip(data);
			}
		})
	});
			
			
	// 保存
	$("#saveBtn").click(function(e) {
				var _this = $(this);
				$.ajax({
					type : "POST",
					async : false,
					url :  ctx+"/specialJianGuan/save",
					dataType : "json",
					data : {
						formId : Id,
						operationOpinion : $("#operationOpinion").val(),
					},
					success : function(data) {
						if (data.success == "true") {
							successTip(data);
							_this.attr("disabled", true).addClass(
									"layui-btn-disabled");
							setTimeout(function(){
								freshen();
							},1500);
						/*	if(Type=="导入"||Type=="人工录入"){
								freshenlocation();
							}*/
							e.stopPropagation()
						}else{
							errorTip(data);
						}
					},
					error : function(data) {
						errorTip(data);
					}
				})
			});
	// 提交
	$("#commitBtn").click(function(e) {
		$.ajax({
			type : "get",
			async : false,
			url :  ctx+"/reportoperation/submitPersonList",
			dataType : "json",
			data : {
				formId : Id,
			},
			success : function(data) {
				if (data.success = "true") {
					var _this = $(this);
					var len=data.user.length;
					var data=data.user;
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
						  ,yes: function(index, layero){   
							 var name= $("#nextApproverSelect").find("option:selected").data("loginname");
							 var stepId=$("#nextApproverSelect").find("option:selected").data("step");
							 var userId=$("#nextApproverSelect").val();
							  //确认提交
							  $.ajax({
									type : "POST",
									async : false,
									url : ctx+"/specialJianGuan/submit",
									dataType : "json",
									data : {
										formId : Id,
										operationOpinion : $("#operationOpinion").val(),
										userId:userId,
										loginName:name,
										stepId:stepId,
									},
									success : function(data) {
										if (data.success == "true") {
											successTip(data);
											setTimeout(function(){
												freshen();
											},1500);		
										}else{
											errorTip(data);
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
		
	//办结通过
	$("#leaderPassBtn").click(function(e) {
		var _this = $(this);
		$.ajax({
			type : "POST",
			async : false,
			url :  ctx+"/specialJianGuan/passThough",
			dataType : "json",
			data : {
				formId : Id,
				operationOpinion : $("#operationOpinion").val()
			},
			success : function(data) {
				if (data.success == "true") {
					successTip(data);
					_this.attr("disabled", true).addClass(
							"layui-btn-disabled");
					setTimeout(function(){
						freshen();
					},1500);
					e.stopPropagation()
				}else{
					errorTip(data);
				}
			},
			error : function(data) {
				errorTip(data);
			}
		})
	});

	// 历史弹出层
	historyPage=function () {
		var Index=layer.open({
			type : 2,
			title : [ '处理意见历史记录:', 'font-size:18px;' ],
			area : [ '100%', '100%' ],
			content : ctx+'/bank/history?id='+Id
		});
		layer.full(Index)

	}
	 
//终止
$("#endPreApproval").click(function(){
	//二次确认
	layer.confirm('您确定要终止该业务吗？', {
	  offset: '200px',
	  btn: ['确定','取消'] //按钮
	}, function(){
		$.ajax({
			type : "POST",
			async : false,
			url :  ctx+"/reportoperation/endPreApproval",
			dataType : "json",
			data:{formId:Id},
			success : function(data) {
				if (data.success == "true") {
					successTip(data);
					setTimeout(function(){
						freshen();
					},3000);
					
				}else{
					errorTip(data);
				}
			},
			error : function(data) {
				errorTip(data);
			}
		})
	}, function(){
		//取消
	});
	
});

//按钮显示
function btnShow(){
	$.ajax({
		type : "get",
		async : false,
		url :  ctx+"/system/resource/specialJianGuan/button",
		dataType : "json",
		data:{formId:Id},
		success : function(data) {
			if (data.success == "true") {
				$.each(data.rows,function(index,ele){
					console.log(ele.name);
					console.log(ele.remarks);
					var name=ele.name;
					var id=ele.remarks;
					$("#"+id).removeClass("none").text(name);					
					})				
			}else{
				errorTip(data);
			}
		},
		error : function(data) {
			errorTip(data);
		}
	})
}

//是否查看
function checkView(Id){
	$.ajax({
		type : "POST",
		async : false,
		url :  ctx+"/reportoperation/view",
		dataType : "json",
		data:{formId:Id},
		success : function(data) {
		},
		error : function(data) {
			errorTip(data);
		}
	})
}
});