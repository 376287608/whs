/**
 * Created by Administrator on 2017/10/12. 申请页
 */

var $ = '';
var upload = '';
var laytpl = '';
var laypage = '';
var form = '';
var pageNumber = 1, pageSize = 10, curr = 1;
layui
		.use(
				[ 'jquery', 'laytpl', 'upload', 'form', 'layer', 'element',
						'laypage' ],
				function() {
					$ = layui.jquery;
					upload = layui.upload;
					laytpl = layui.laytpl;
					laypage = layui.laypage;
					form = layui.form;
					var element = layui.element, layer = layui.layer;
					var type=GetQueryString("type");
					var formId=GetQueryString("id");
					var typeId = "";// 业务类型ID
					var title = "";
					getBusinessId();
									
					if(type=='暂存'){
						approval(formId);
						$("#backBtn").removeClass("none");
					}
					// 校验
					formVerify();
					var agent=$(window.parent.document).find("#registerName").text();
					$("#agent").text(agent);
					$(".site-title a").text(title + '申请单');
				
					/** *申请表基本信息** */		
					// 保存申请表
					form.on('submit(applyFormSave)', function(data) {
						specialJianGuanSubmitForm(typeId, 'save', '#saveBtn', 'index');
						return false;
					});

					// 启动流程
					form.on('submit(applyFormStartup)', function(data) {
						specialJianGuanSubmitForm(typeId, 'submit', '#submitBtn');
						return false;
					});

					processListSpecial= function(data) {
						var _this = this;
						if (data.success == "true") {
							var len = data.processList.length;
							formId=data.formId;
							var data = data.processList;
							
							htmls = '';
							htmls += '<div class="layui-col-xs12">'
							htmls += '<div class="layui-form"><div class="layui-form-item">'
							htmls += '<label class="layui-form-label">流程选择：</label>'
							htmls += '<div class="layui-input-block">'
							htmls += '<select name="noticeGet" id="nextApproverSelect">'
							for (i = 0; i < len; i++) {
								htmls += '<option value=' + data[i].id
										+ ' data-formId=' + formId + '>'
										+ data[i].processName + '</option>'
							}
							htmls += '</select></div></div></div></div>';
							layer
									.open({
										content : htmls,
										btn : [ '确认', '取消' ],
										area : [ '500px', '300px' ],
										offset : '100px',
										closeBtn : 0,
										yes : function(index, layero) {
											var processid = $(
													"#nextApproverSelect")
													.val();

											// 确认提交
											$
													.ajax({
														type : "POST",
														async : false,
														url : ctx
																+ "/reportoperation/startProcess",
														dataType : "json",
														data : {
															formId : formId,
															processId : processid,
															flag:false
														},
														success : function(data) {
															if (data.success = "true") {
																successTip(data);
																$("#applyFormStartupBtn").attr("disabled", true).addClass(
																"layui-btn-disabled");
																if(type=='暂存'){
																	layer.load(1);
																	setTimeout(function() {
																		freshen();
																	}, 1500);
																}
													

															} else {
																errorTip(data);
															}
														},
														error : function(data) {
															errorTip(data);
														}
													})
										}
									});

							form.render('select');
						}
					}
					//获取业务序号
					function getBusinessId() {
						$.ajax({
							url : ctx+"/specialJianGuan/getBusinessId",
							type : "post",
							dataType : "json",
							data : {
								businessNo : 'JCFX_6666',
							},
							success : function(data) {
								// 申请人基本信息回显
								if(data.success=="true"){
									typeId=data.businessId;
									$("#businessNo").val(typeId);
									// 办事指南
									rule("guides", typeId, pageNumber, pageSize);
									// 法律法规
									rule("laws", typeId, pageNumber, pageSize);
									if(type!='暂存'){
										// 附件列表
										fromAttachment(typeId);									
									}
									
								}else{
									errorTip(data);
								}
							},
							error : function(data) {
								errorTip(data);
							}
						});
					}
					//基本信息回显
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
									$('#remark').text(format(data.item.remark));
									$("#agent").text(data.item.agent);
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
					}
					
					
					// 保存,提交申请单
					/* 
					 *  @ typeId 业务类型
					 *  @ type,	 URL参数   保存，提交
					 *  @ ele,   元素名称
					 *  @ frash  index刷新当前页      -1 刷新上一页
					 *  */

					specialJianGuanSubmitForm = function(typeId, type, ele,frash) {
						var user=layui.data('user').username;
//						1为银行用户   0为企业用户
						_this = ele;
						var dataAttchmentList = new Array();
						var dataArray = new Array();
						$("#attachmentListCon li").each(function(index, ele) {
							var fileID = $(this).attr("data-id");// 附件类型ID
							var attachmentid = $(this).attr("data-attachmentid");
							var checktype = $(this).attr("data-checktype");
							var otherFlag = $(this).attr("data-otherflag");
							var filetypeName = $(this).find(".fileName").text();
							if (attachmentid == undefined && checktype == "1") {
								layer.msg('请上传所有必传附件', {
									icon : 5,
									anim : 6,
									offset: '200px'
								});
								return flag = false;
							} 
								// 上传其他非空附件
								if ($(this).hasClass("otherAttachement")) {
									var otherAttachmentId = $(this).data("attachmentid");
									if (otherAttachmentId != undefined) {
										var jsonObj = {};
										jsonObj["attachmentId"] = attachmentid;// 附件文件ID，下载ID
										jsonObj["id"] = fileID;// 附件类型ID
										jsonObj["otherFlag"] = otherFlag;// 上传标记
										jsonObj["filetypeName"] = filetypeName;// 文件名称

										dataAttchmentList.push(jsonObj);
										console.log(dataAttchmentList)
									}
									return flag = true;
								} else {
									//上传银行要求企业上传的附件
									if (!$(this).hasClass("nothing")) {
										// 上传必传附件
										var jsonObj = {};
										jsonObj["attachmentId"] = attachmentid;// 附件文件ID，下载ID
										jsonObj["id"] = fileID;// 附件类型ID
										jsonObj["otherFlag"] = otherFlag;// 上传标记
										jsonObj["filetypeName"] = filetypeName;// 文件名称
										dataAttchmentList.push(jsonObj);
										console.log(dataAttchmentList)
									}
									return flag = true;
								}
							

						});
						
						var attachmentlist = JSON.stringify(dataAttchmentList);
						if (flag != false) {
							//var businessNo = $("#businessNo").val();
								dataArray = {
										formId:formId,
						    			businessNo : 'JCFX_6666',
						    			remark:$("#remark").val(),
						    			attachmentlist : attachmentlist,
						    			reasonDesc:''
						    		}
					         if(type=='save'){
								//保存
									$.ajax({
						    			type : "POST",
						    			async : false,
						    			url : ctx+'/specialJianGuan/saveInput',
						    			data : dataArray,
						    			dataType : "json",
						    			success : function(data) {
											successTip(data);
											formId=data.formId;											
										},
						    			error : function(data) {
						    				errorTip(data);
						    			}
						    		});
								}else{
									$.ajax({
						    			type : "POST",
						    			async : false,
						    			url : ctx+'/specialJianGuan/saveInputAndGetProcessList',
						    			data : dataArray,
						    			dataType : "json",
						    			success : function(data) {
						    				if (data.success == "true") {
						    					//successTip(data);
						    					processListSpecial(data);
						    					
						    				} else {
						    					errorTip(data);
						    				}
						    			},
						    			error : function(data) {
						    				errorTip(data);
						    			}
						    		});
					    		}
						}
					};

					// 申请表列表成功回填数据  need modify
					successAttachmentList = function(data) {
						var getTpl = attachmentListTpl.innerHTML, view = document
								.getElementById('attachmentListCon');
						laytpl(getTpl).render(data, function(html) {
							view.innerHTML = html;
						});
					}
	
				});
