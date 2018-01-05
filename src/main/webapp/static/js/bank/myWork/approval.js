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
	var upload = layui.upload;
	var laydate = layui.laydate;
	//上一个地址
	var historyUrl=document.referrer;
	//当前页面地址
	var currentUrl=location.href;
	var newUrl=JSON.stringify(layui.data('history').historyUrl)=="{}"?'':layui.data('history').historyUrl; 	
	//alert("get"+newUrl);
	if(historyUrl != currentUrl){	
		 layui.data('history', {
	     	  key: 'historyUrl'
	           	  ,value: historyUrl
	           	});
		//alert("set"+layui.data('history').historyUrl);
	}else{
		historyUrl=newUrl;
	}
	
	laytpl = layui.laytpl; 
	laydate.render({
		elem : '#completeTime',
		type:'datetime'
	});
	var data={
			formId : Id,
			applyName : $("#applyName").text(),
			applyOrgCode : $("#applyOrgCode").text(),
			businessName : $("#businessName").text(),
			completeTime : $("#completeTime").val(),
			operationOpinion : $("#operationOpinion").val(),
	}
	var Id = GetQueryString("id");
	Type=GetQueryString("type");
	//alert('id:'+Id+'type:'+Type);
	var name="";
	approval(Id);
	btnShow(Id);
	if(Type=="daishenpi"){
		checkView(Id);
	}
	$("#test").click(function(){
		//
		//刷新页面
		layer.load(1);	
		setTimeout(function(){
//			location.replace("http://localhost:8080/whs/bank/myWork/approval?id=f892791bfb134bfaa68fb5ecdcee350c&&type=%E5%BE%85%E5%AE%A1%E6%89%B9");	
			location.replace(currentUrl);	
		},1500);
	})
		
	
	function approval(Id) {
		$.ajax({
			url : ctx+"/approvalreport/approvalReportInfo",
			type : "post",
			dataType : "json",
			data : {
				id : Id,
			},
			success : function(data) {
				// 申请人基本信息回显
				if(data.success=="true"){
				$("#lastApprover").text(format(data.topUser.approvalRoleName));
				$("#businessDocumentCode").text(format(data.businessDocumentCode));
				$.each(data.item, function(index, ele) {
					if (index == "noticeGet") {
						var ele = ele == 1 ? "自取" : "邮寄";
						$('.layui-form label[id="noticeGet"]').text(ele);
					}else if(index=="createTime"||index=="completeTime"||index=="applyTime"){
						$("#"+index).val(getMyDate(ele));
						$("#"+index).text(getMyDate(ele));
					}else if(index==="businessDocumentCode"){
						$("#"+index).text(format(ele))
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
		
		if(Type=="daishenpi"){					
			$(".checkBtn").removeClass("none");			
		}else if(Type==""){
			$(".checkBtn").removeClass("none");	
		}else{	
			$(".addAnnotationBtn").removeClass("none");
			$(".passBtn").removeClass("none");
			$(".checkBtn").removeClass("none");	
		}
				
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
						url :  ctx+"/reportoperation/internalWithdrawal",
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
									freshen(historyUrl);
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
									url : ctx+"/reportoperation/turnback",
									dataType : "json",
									data : {
										formId : Id,
										applyName : $("#applyName").text(),
										applyOrgCode : $("#applyOrgCode").text(),
										businessName : $("#businessName").text(),
										completeTime : $("#completeTime").val(),
										operationOpinion : $("#operationOpinion").val(),
										userId:userId,
										loginName:name,
										stepId:stepId,
									},
									success : function(data) {
										if (data.success == "true") {
											successTip(data);
											_this.attr("disabled", true).addClass(
													"layui-btn-disabled");
											setTimeout(function(){
												freshen(historyUrl);
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
									url :  ctx+"/reportoperation/turnOther",
									dataType : "json",
									data : {
										formId : Id,
										applyName : $("#applyName").text(),
										applyOrgCode : $("#applyOrgCode").text(),
										businessName : $("#businessName").text(),
										completeTime : $("#completeTime").val(),
										operationOpinion : $("#operationOpinion").val(),
										userId:userId,
										loginName:name,
										stepId:stepId,
									},
									success : function(data) {
										if (data.success == "true") {
											successTip(data);
											setTimeout(function(){
												freshen(historyUrl);
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
			url :  ctx+"/reportoperation/withdrawProcess",
			dataType : "json",
			data : {
				formId : Id,
				businessId:businessId
			},
			success : function(data) {
				if (data.success == "true") {
					var _this = $(this);
					var len=data.processList.length;
					var data=data.processList;
					if(len<0) {
						errorTip(data);
						return false;
					}
					htmls='';
					htmls+='<div class="layui-col-xs12">'
					htmls+= '<div class="layui-form"><div class="layui-form-item">'
					htmls+='<label class="layui-form-label">流程名称：</label>'
					htmls+='<div class="layui-input-block">'
					htmls+='<select name="noticeGet" id="nextApproverSelect">'
							for(i=0;i<len;i++){
								htmls+='<option value='+data[i].id+'>'+data[i].processName+'</option>'
							}			
					htmls+='</select></div></div></div></div>';
					layer.open({
						  content: htmls
						  ,btn: ['确认', '取消']
						  ,area: ['500px','300px']
						  ,offset: '100px'
						  ,closeBtn: 0
						  ,yes: function(index, layero){   
							 var processId=$("#nextApproverSelect").val();
							  //确认提交
							  $.ajax({
									type : "POST",
									async : false,
									url :  ctx+"/reportoperation/startProcess",
									dataType : "json",
									data : {
										formId : Id,
										processId:processId,
										flag:true
									},
									success : function(data) {
										if (data.success == "true") {
											successTip(data);
											setTimeout(function(){
												freshen(historyUrl);
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
			
			
	// 保存
	$("#saveBtn").click(function(e) {
				var _this = $(this);
				$.ajax({
					type : "POST",
					async : false,
					url :  ctx+"/reportoperation/save",
					dataType : "json",
					data : {
						formId : Id,
						applyName : $("#applyName").text(),
						applyOrgCode : $("#applyOrgCode").text(),
						businessName : $("#businessName").text(),
						completeTime : $("#completeTime").val(),
						operationOpinion : $("#operationOpinion").val(),
					},
					success : function(data) {
						if (data.success == "true") {
							successTip(data);
							_this.attr("disabled", true).addClass(
									"layui-btn-disabled");
							setTimeout(function(){
								freshen(historyUrl);
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
		var attachementLen=$("#attachmentListCon li").length;
		var checkAttachementLen=$("#attachmentListCon li.checked").length;
		if(attachementLen!=checkAttachementLen){
			//审核文件才可以点击提交
			layer.msg("请审核全部材料", {
				icon : 5,
				anim : 6,
				offset: '200px'
				
			});
			return false;
		}else{
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
									url : ctx+"/reportoperation/submit",
									dataType : "json",
									data : {
										formId : Id,
										applyName : $("#applyName").text(),
										applyOrgCode : $("#applyOrgCode").text(),
										businessName : $("#businessName").text(),
										completeTime : $("#completeTime").val(),
										operationOpinion : $("#operationOpinion").val(),
										userId:userId,
										loginName:name,
										stepId:stepId,
									},
									success : function(data) {
										if (data.success == "true") {
											successTip(data);
											setTimeout(function(){
												freshen(historyUrl);
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
		
	}
			form.render('select');	
			})

//科长补正					
$("#correctLaderBtn").click(function(e) {
				var _this = $(this);
				$.ajax({
					type : "POST",
					async : false,
					url :  ctx+"/reportoperation/addAndCorrect",
					dataType : "json",
					data : {
						formId : Id,
						applyName : $("#applyName").text(),
						applyOrgCode : $("#applyOrgCode").text(),
						businessName : $("#businessName").text(),
						completeTime : $("#completeTime").val(),
						operationOpinion : $("#operationOpinion").val(),
					},
					success : function(data) {
						if (data.success == "true") {
							successTip(data);
							_this.attr("disabled", true).addClass(
									"layui-btn-disabled");
							setTimeout(function(){
								freshen(historyUrl);
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
//补正					
$("#correctBtn").click(function(e) {
				var _this = $(this);
				$.ajax({
					type : "POST",
					async : false,
					url :  ctx+"/reportoperation/turnCompanyToCorrect",
					dataType : "json",
					data : {
						formId : Id
					},
					success : function(data) {
						if (data.success == "true") {
							successTip(data);
							_this.attr("disabled", true).addClass(
									"layui-btn-disabled");
							setTimeout(function(){
								freshen(historyUrl);
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

//受理
	$("#acceptBtn").click(function(e) {
		var _this = $(this);
		$.ajax({
			type : "POST",
			async : false,
			url :  ctx+"/reportoperation/acceptReport",
			dataType : "json",
			data : {
				formId : Id,
				applyName : $("#applyName").text(),
				applyOrgCode : $("#applyOrgCode").text(),
				businessName : $("#businessName").text(),
				completeTime : $("#completeTime").val(),
				operationOpinion : $("#operationOpinion").val()
			},
			success : function(data) {
				if (data.success == "true") {
					successTip(data);
					_this.attr("disabled", true).addClass(
							"layui-btn-disabled");
					setTimeout(function(){
						freshen(historyUrl);
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
	
	//加凭证编码办结
	$("#passBtn").click(function(e) {
		var _this = $(this);
		//prompt层
		layer.prompt({title: '请输入业务凭证编码，并确认',maxlength:18, formType: 1, value: '',offset: '200px'}, function(pass, index){
		  layer.close(index);
			$.ajax({
				type : "POST",
				async : false,
				url :  ctx+"/reportoperation/afterFinish",
				dataType : "json",
				data : {
					formId : Id,
					businessDocumentCode : pass	
				},
				success:function(data){
					if (data.success == "true") {
						successTip(data);
						_this.attr("disabled", true).addClass(
								"layui-btn-disabled");
						setTimeout(function(){
							freshen(historyUrl);
						},1500);
						e.stopPropagation()
					}else{
						errorTip(data);
					}
					
				},
				error:function(data){
					afterFinish()
					}
			})
		});

	});
	
	
	//办结通过
	$("#leaderPassBtn").click(function(e) {
		var _this = $(this);
		$.ajax({
			type : "POST",
			async : false,
			url :  ctx+"/reportoperation/passThough",
			dataType : "json",
			data : {
				formId : Id,
				applyName : $("#applyName").text(),
				applyOrgCode : $("#applyOrgCode").text(),
				businessName : $("#businessName").text(),
				completeTime : $("#completeTime").val(),
				operationOpinion : $("#operationOpinion").val()
			},
			success : function(data) {
				if (data.success == "true") {
					successTip(data);
					_this.attr("disabled", true).addClass(
							"layui-btn-disabled");
					setTimeout(function(){
						freshen(historyUrl);
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
	
	//办结通过----外网加水印
	$("#outPassBtn").click(function(e) {
		var _this = $(this);
		$.ajax({
			type : "POST",
			async : false,
			url :  ctx+"/reportoperation/addWaterPrint",
			dataType : "json",
			data : {
				formId : Id,
							},
			success : function(data) {
				if (data.success == "true") {
					successTip(data);
					_this.attr("disabled", true).addClass(
							"layui-btn-disabled");
					setTimeout(function(){
						freshen(historyUrl);
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
	
	//办结不通过
	$("#refuseToPassBtn").click(function(e) {
		var _this = $(this);
		$.ajax({
			type : "POST",
			async : false,
			url :  ctx+"/reportoperation/refuseToPass",
			dataType : "json",
			data : {
				formId : Id,
				applyName : $("#applyName").text(),
				applyOrgCode : $("#applyOrgCode").text(),
				businessName : $("#businessName").text(),
				completeTime : $("#completeTime").val(),
				operationOpinion : $("#operationOpinion").val()
			},
			success : function(data) {
				if (data.success == "true") {
					successTip(data);
					_this.attr("disabled", true).addClass(
							"layui-btn-disabled");
					setTimeout(function(){
						freshen(historyUrl);
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
	
	//附件审核
	 verifyAttachment=function(id,type,ele,_this){
		 var _this=_this;
		$.ajax({
			type : "POST",
			async : false,
			url :  ctx+"/attachment/verify/"+id+"/"+type,
			dataType : "json",
			success : function(data) {
				if (data.success == "true") {
					successTip(data);
					$(_this).parents("li").addClass("checked")
					//当前Btn禁用，兄弟btn开启
					$(_this).attr("disabled", true).addClass(
							"layui-btn-disabled");
					$(_this).siblings(".passBtn").attr("disabled", false).removeClass("layui-btn-disabled");
					if(type=="3"){
						//审核通过
						$(_this).parents("li").find(".layui-badge-dot").removeClass("layui-bg-red").addClass(
						"layui-bg-green");	
						
					}else{
						//审核不通过
						$(_this).parents("li").find(".layui-badge-dot").removeClass("layui-bg-green").addClass(
						"layui-bg-red");	
					}
					
				}else{
					errorTip(data);
				}
			},
			error : function(data) {
				errorTip(data);
			}
		})
	}	
/************* 附件添加批注处理 开始 *****************/
	 addAnnotation = function (docId) {
		 $.ajax({
			 url: ctx + "/attachment/downloadToEdit/" + docId, 
			 type: "get", 
			 dataType: "json", 
			 success: function (data) {
				 if (data.flag == "success") {
					 openKingGridBrowser(data, docId);
				 }
			 }
		 });
	 }
	 
	 function openKingGridBrowser(data, docId) {
		 var url = ctx + "/static/pdf/DocumentEdit.jsp?fileName=" + data.fileName 
		 	+ "&timeStr=" + data.timeStr + "&userName=" + data.userName + "&docId=" + docId;
		 var  link = "KGBrowser://$link:" + data.host + url + "$id:aid$session:" + jsessionid;
		 location.href = link;
		 connect();
	 }
	 
	function connect(){  //与金格浏览器页面通讯使用
		$.ajax({
			type: "get",
			async: false,
			url: "http://127.0.0.1:9588/LongListen?id=111", //此代码ip固定，端口号与Edit页面该方法一致，其他固定。
			jsonp: "hookback",
			dataType: "jsonp",
			success: function (data) {
				var jsonobj = eval(data);
				//此判断处理Edit页面Msg传过来的值，判断之后下面做响应处理即可
				if (jsonobj.ret == "save") {
					//刷新页面
					layer.load(1);	
					setTimeout(function(){
						location.reload();	
					},1500);
				} else if (jsonobj.ret == "none") {
					connect();    //这里一定要调用，不可删除
				}
			},
			error: function (a, b, c) {
			}
		});
	}
/************* 附件添加批注处理 结束 *****************/
	 
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
						freshen(historyUrl);
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

//导出
$("#exportBtn").click(function(e){
	$.ajax({
        url: ctx + '/dataZip/download',
        type: "post",
        dataType: "json",
        data:{
        	'reportIds':Id             	
        },
        success: function (data) {
            if (data.flag == 'success') {
            	successTip(data);
            	window.open(data.zipUrl);
				setTimeout(function(){
					freshen(historyUrl);
				},1500);
				e.stopPropagation()
            } else {
            	errorTip(data);
            }
        },
        error: function (data) {
        	errorTip(data);
        }
    });
});
//按钮显示
function btnShow(){
	$.ajax({
		type : "get",
		async : false,
		url :  ctx+"/system/resource/button/json",
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