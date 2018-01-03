/**
 * Created by Administrator on 2017/10/12. 人工录入
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
					// 业务类型
					ajaxBubusinessList();
					// 校验
					formVerify();
					var typeId = "";// 业务类型ID
					$("#horizontalTree").on("click", ".trageinfo", function() {
						var title = $(this).text();
						typeId = $(this).attr("data-id");
						$(".site-title a").text(title + '申请单');
						$("#applyList").addClass("none");
						$("#applyInfo").removeClass("none");
						// 办事指南
						rule("guides", typeId, pageNumber, pageSize);
						// 法律法规
						rule("laws", typeId, pageNumber, pageSize);
						/** *申请表基本信息** */
						// 附件列表
						fromAttachment(typeId);
						// 申请表
						getFile(typeId);
					});
					// 启动流程
					form.on('submit(applyFormStartup)', function(data) {
						// startupForm(typeId)
						submitForm(typeId, 'submit', '#submitBtn');
						//return false;
					});

					processList = function(data) {
						var _this = this;
						if (data.success == "true") {
							$("#formId").val(data.formId);
							var len = data.processList.length;
							var data = data.processList;

							htmls = '';
							htmls += '<div class="layui-col-xs12">'
							htmls += '<div class="layui-form"><div class="layui-form-item">'
							htmls += '<label class="layui-form-label">流程选择：</label>'
							htmls += '<div class="layui-input-block">'
							htmls += '<select name="noticeGet" id="nextApproverSelect">'
							for (i = 0; i < len; i++) {
								htmls += '<option value=' + data[i].id+'>'+ data[i].processName + '</option>';
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
											var formId = $("#formId").val()
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
																layer.load(1);
																setTimeout(
																		function() {
																			_this.location.href = ctx
																					+ '/bank/myWork/approval?id='
																					+ formId
																					+ '&&type=人工录入';
																		}, 1500);

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
				});
