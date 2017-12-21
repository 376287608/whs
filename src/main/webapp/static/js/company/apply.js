/**
 * Created by Administrator on 2017/10/12.
 */
var $ = '';
var upload = '';
var laytpl = '';
var laypage = '';
var pageNumber = 1;
var pageSize = 10;
var curr = 1;
layui
		.use(
				[ 'jquery', 'laytpl', 'upload', 'form', 'layer', 'element',
						'laypage' ],
				function() {
					$ = layui.jquery;
					upload = layui.upload;
					laytpl = layui.laytpl;
					laypage = layui.laypage;
					var form = layui.form, element = layui.element, layer = layui.layer;
					// 业务类型
					ajaxBubusinessList();
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
						// 申请人基本信息
						applyerBaseInfo();
						// 申请表
						getFile(typeId);
					});

					// 保存申请表
					form.on('submit(applyFormSave)', function(data) {
						submitForm(typeId, 'save', '#saveBtn', 'index');
						return false;
					});
					// 提交申请表
					form.on('submit(applyFormSubmit)', function(data) {
						submitForm(typeId, 'submit', '#submitBtn', 'index');
						return false;
					});

					function applyerBaseInfo() {
						$
								.ajax({
									url : ctx
											+ '/approvalform/buildApprovalForm',
									type : "post",
									dataType : "json",
									success : function(data) {
										// 申请人基本信息回显
										$
												.each(
														data.companyUser,
														function(index, ele) {
															$(
																	'.layui-form input[name='
																			+ index
																			+ '],.layui-form select[name='
																			+ index
																			+ ']')
																	.val(ele);
														})
									},
									error : function(data) {
										layer.msg("请求异常");
									}
								});
					}

				});
