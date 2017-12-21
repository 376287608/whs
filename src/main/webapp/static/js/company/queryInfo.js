/**
 * Created by Administrator on 2017/10/12.
 */
var $ = '';
var laytpl = '';
var upload = '';
var laypage='';
var pageNumber=1;
var pageSize=10;
var curr=1;
layui.use([ 'form', 'upload', 'jquery', 'layer', 'laytpl','laypage'], function() {
	$ = layui.jquery;
	laytpl = layui.laytpl;
	upload = layui.upload;
	laypage=layui.laypage;
	var form = layui.form, layer = layui.layer;
	var status = GetQueryString("status");
	var Id = GetQueryString("id");
	var typeId = GetQueryString("typeId");
	var where=GetQueryString("form");
	var noticeId = GetQueryString("noticeId");
	if(where=="index"){
		notifyBank(noticeId)
	}
	info(status, Id);
	//申请表
	getFile(typeId);
	// 办事指南
	rule("guides", typeId,pageNumber,pageSize);
	// 法律法规
	rule("laws", typeId,pageNumber,pageSize);
	
//通知银行
	function notifyBank(id){
     	$.ajax({
   	        url :  ctx+'/message/view',
   	        type : "post",
   	        dataType : "json",
   	        data:{id:id},
   	        success : function(data) {
   	
   	        },
   	        error : function(data) {
   	        	errorTip(data)
			}
    	 });
    }
	function info(s, id) {
		$.ajax({
			url :  ctx+"/approvalform/seeApprovalForm",
			type : "post",
			dataType : "json",
			data : {
				id : id,
			},
			success : function(data) {
				// 申请人基本信息回显
				$.each(data.item, function(index, ele) {
					$(
							'.layui-form input[name=' + index
									+ '],.layui-form select[name=' + index
									+ ']').val(ele);
				})
				successAttachmentList(data.attachments);
				$("#formId").val(data.item.formId);
				// 保存申请表
				form.on('submit(applyFormSave)', function(data) {
					submitForm(typeId, 'save','#saveBtn',where);
					return false;
				});
				// 提交申请表
				form.on('submit(applyFormSubmit)', function(data) {
					submitForm(typeId, 'submit','#submitBtn',where);
					return false;
				});
			},
			error : function(data) {
				errorTip(data.msg);
			}
		});
		// 根据状态回显信息
		switch (s) {
		case '待提交':
			// 表单可编辑
			$("#queryInfoEdit").removeClass("none");
			$(".layui-form").addClass("layui-input-disabled").find("input")
					.attr("disabled", true);
			// 按钮显示保存，提交
			$("#submitBtn,#saveBtn,#addAttachment").removeClass("none");
			break;
		case '待接收':
			// 按钮显示撤回
			$("#cancelBtn").removeClass("none");
			break;
		case '已补正':
			// 按钮显示撤销
			$("#recallBtn").removeClass("none");
			break;
		case '办理中':
			// 按钮显示撤销
			$("#recallBtn").removeClass("none");
			break;
		case '办理中(补正)':
			// 按钮显示保存，提交，撤销
			$("#submitBtn,#saveBtn,#recallBtn,#addAttachment").removeClass("none");
			break;
		case '已办结':
			// 按钮显示撤销
			$("#recallBtn").removeClass("none");
			break;

		default:
			// 待终止，已终止，被退回
			break;
		}
	}

	$("#queryInfoEdit").click(
			function() {
				var type = $(this).data('type');
				if (type == 'edit') {
					// 表单可编辑
					$(this).data("type", "complete").html(
							"<i class='layui-icon f20'>&#xe609;</i> 完成");
					$(".layui-form").removeClass("layui-input-disabled").find(
							"input").attr("disabled", false);

				} else {
					$(this).data("type", "edit").html(
							"<i class='layui-icon f20'>&#xe642;</i> 编辑");
					$(".layui-form").addClass("layui-input-disabled").find(
							"input").attr("disabled", true);
				}
			})

	// 撤销操作
	$("#recallBtn").click(
			function(e) {
				var _this = $(this);
				layer.confirm('您确定要撤销该业务吗？点击确定后，银行工作人员将与您取得联系。', {
					btn : [ '确定', '取消' ],
					offset: '200px'
				// 按钮
				}, function() {
					$.ajax({
						type : "POST",
						async : false,
						url :  ctx+"/formoperation/recall",
						dataType : "json",
						data : {
							formId : $("#formId").val(),
						},
						success : function(data) {
							if (data.success = "true") {
								successTip(data);
								_this.attr("disabled", true).addClass(
										"layui-btn-disabled");
								setTimeout(function(){
									freshen();
								},3000);
								e.stopPropagation()
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

	// 撤回操作
	$("#cancelBtn").click(
			function(e) {
				var _this = $(this);
				$.ajax({
					type : "POST",
					async : false,
					url :  ctx+"/formoperation/withdraw",
					dataType : "json",
					data : {
						formId : $("#formId").val(),
					},
					success : function(data) {
						if (data.success = "true") {
							successTip(data);
							_this.attr("disabled", true).addClass(
									"layui-btn-disabled");
							setTimeout(function(){
								freshen();
							},3000);
							e.stopPropagation()
						}
					},
					error : function(data) {
						errorTip(data);
					}
				});
			});
});
