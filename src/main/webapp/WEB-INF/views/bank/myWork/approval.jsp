<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<%@ include file="/WEB-INF/views/include/taglibs.jsp"%>

<%
	String error = (String) request
			.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
	request.setAttribute("error", error);
	String jsessionid = request.getSession().getId();
%>
<!-- 审批页 -->
<html lang="en">
<head>
<meta charset="UTF-8">
<title>外汇业务网上预审批系统</title>
<%@ include file="/WEB-INF/views/include/link.jsp"%>
<script type="text/javascript">
	var jsessionid = '<%=jsessionid%>';
</script>
</head>
<body>
	<div class="layui-main">
		<fieldset class="layui-elem-field layui-field-title site-title">
			<legend>
				<a>业务审批</a>
			</legend>
		</fieldset>
		<div class="clearfix">
		<!-- 测试添加批注后--各个按钮操作后跳会列不同入口首页 -->
		<!-- <input type="button" id="test" value="test"> -->
			<p class="tr mb5">
				办结权限:<span id="lastApprover"></span>
			</p>
			<p class="tr mb5">
				业务凭证编码:<span id="businessDocumentCode"></span>
			</p>

		</div>
		<div class="layui-form clearfix layui-col-xs12" id="userForm">
			<input type="hidden" id="formId">
			<div id="queryInfoTitle" class="mb30">
				<h3 class="f18 ib layui-blue">基本信息</h3>
				<div class="fr">
					<p class="ib mr5">
						<a href="#" class="layui-blue none" id="returnBtn">内部退回</a>
					</p>
					<p class="ib">
						<a href="#" class="layui-blue none" id="cancelBtn">内部撤回</a>
					</p>
					<p class="ib">
						<a href="#" class="layui-blue none" id="sendBtn">转派</a>
					</p>
					<p class="ib">
						<a href="#" class="layui-blue none" id="endPreApproval">终止</a>
					</p>
				</div>
				<hr class="layui-bg-blue">
			</div>
			<div class="layui-col-xs4">
				<div class="layui-form-item">
					<label class="layui-form-label">联系人:</label>
					<div class="layui-input-block">
						<label class="label" id="registerName"></label>
					</div>
				</div>
			</div>
			<div class="layui-col-xs4">
				<div class="layui-form-item">
					<label class="layui-form-label">联系电话:</label>
					<div class="layui-input-block">
						<label class="label" id="phone"></label>
					</div>
				</div>
			</div>
			<div class="layui-col-xs4">
				<div class="layui-form-item">
					<label class="layui-form-label">联系邮箱:</label>
					<div class="layui-input-block">
						<label class="label" id="email"></label>
					</div>
				</div>
			</div>
			<div class="layui-col-xs4">
				<div class="layui-form-item">
					<label class="layui-form-label">邮寄地址:</label>
					<div class="layui-input-block">
						<label class="label" id="address"></label>
					</div>
				</div>
			</div>
			<div class="layui-col-xs4">
				<div class="layui-form-item">
					<label class="layui-form-label">通知获取方式:</label>
					<div class="layui-input-block">
						<label class="label" id="noticeGet"></label>
					</div>
				</div>
			</div>
		</div>

		<h3 class="f18 ib layui-blue">中关村中心支局行政许可证业务受理报告单</h3>
		<hr class="layui-bg-blue">
		<form class="layui-form" action="post" onsubmit="return false">
			<div class="layui-row">
			<div class="layui-col-xs6">
					<div class="layui-form-item">
						<label class="layui-form-label">申请编号:</label>
						<div class="layui-input-block">
							<label class="label" id="formCode"></label>
						</div>
					</div>
				</div>
				<div class="layui-col-xs6">
					<div class="layui-form-item">
						<label class="layui-form-label">申请单位:</label>
						<div class="layui-input-block">
							<label class="label" id="applyName"></label>
						</div>
					</div>
				</div>
				<div class="layui-col-xs6">
					<div class="layui-form-item">
						<label class="layui-form-label">业务种类:</label>
						<div class="layui-input-block">
							<label class="label" id="businessName"></label>
						</div>
					</div>
				</div>
				<div class="layui-col-xs6">
					<div class="layui-form-item">
						<label class="layui-form-label">企业代码:</label>
						<div class="layui-input-block">
							<label class="label" id="applyOrgCode"></label>
						</div>
					</div>
				</div>
				<div class="layui-col-xs6">
					<div class="layui-form-item">
						<label class="layui-form-label">业务申请时间:</label>
						<div class="layui-input-block">
							<label class="label" id="applyTime"></label>
						</div>
					</div>
				</div>
				<div class="layui-col-xs6">
					<div class="layui-form-item">
						<label class="layui-form-label">材料齐备时间:</label>
						<div class="layui-input-block">
							<input type="text" class="layui-input" id="completeTime"
								lay-key='26'>
						</div>
					</div>
				</div>
				<div class="layui-col-xs12" id="uploadAttachmentListCon">
				<div class="layui-form-item">
						<label class="layui-form-label">申请材料:</label>	
						<div class="layui-input-block">
							<label class="gray fl" style="padding:10px 0;">(<span class="layui-badge-dot layui-bg-red mr5"></span>为上一级审批未通过 <span
							class="layui-badge-dot layui-bg-green mr5"></span>为上一级审批通过 <span class="layui-badge-dot layui-bg-blue mr5"></span>为待审批)</label>	
						</div>
					</div>
					<div class="layui-form-item">
						<!-- <label class="layui-form-label"></label> -->	
						<div class="layui-input-block">
							<ul id="attachmentListCon">
								<script id="attachmentListTpl" type="text/html">
								{{# var isCheck='';var dot=''}}	
						{{#  layui.each(d, function(index, item){ }}							
							{{# if(item.statu=="3"){ }}
							{{#	
									 isCheck='checked';
									 dot="layui-bg-green";	
								}}
							{{# }else if(item.statu=="2"){ }}
							{{#		isCheck='checked';
									dot="layui-bg-red";}}
							{{#	}else{ }}
							{{#	isCheck='';dot="layui-bg-blue";}}
							{{# } }}
							<li class="clearfix cl mb10 {{isCheck}}" data-checktype="{{item.checkType}}" data-id="{{item.id}}" data-otherFlag="otherFile{{item.filetypeIndex}}"><p class="fl layui-elip" style="width:48%">
								<span class="layui-badge-dot mr5 {{dot}}"></span>
								<em class="fn">{{item.displayOrder}}</em>.<em class="filetype fn">{{item.filetypeName}}</em>
							</p>
							<div class="btn-group fr">
								{{# if(item.preVersion!=null){ }}
									<a href='${ctx}/attachment/down/{{item.preVersion}}/1' class="layui-btn layui-btn-xs layui-btn-primary checkBtn">
										<i class="layui-icon"></i>上一版本
									</a>
								{{# } }}
							
								<a href='${ctx}/attachment/down/{{item.docId}}/1' class="layui-btn layui-btn-xs checkBtn">
									<i class="layui-icon"></i>查看附件
								</a>
								<button type="button"
									class="layui-btn layui-btn-warm layui-btn-xs addAnnotationBtn none" onclick="addAnnotation('{{item.docId}}')">
									<i class="layui-icon"></i>添加批注									
								</button>

								{{# if(item.statu=="2"){ }}
								<button type="button"
									class="layui-btn layui-btn-normal layui-btn-xs passBtn none" onclick="verifyAttachment('{{item.docId}}',3,'.passBtn',this)">
									<i class="layui-icon"></i>审核通过									
								</button>
								<button type="button"
									class="layui-btn layui-btn-danger layui-btn-xs passBtn layui-btn-disabled none" disabled onclick="verifyAttachment('{{item.docId}}',2,'.noPassBtn',this)">
									<i class="layui-icon"></i>审核不通过									
								</button>
								{{# } else if(item.statu=="3"){ }}
					
								<button type="button"
									class="layui-btn layui-btn-normal layui-btn-xs passBtn layui-btn-disabled none" disabled onclick="verifyAttachment('{{item.docId}}',3,'.passBtn',this)">
									<i class="layui-icon"></i>审核通过									
								</button>
								<button type="button"
									class="layui-btn layui-btn-danger layui-btn-xs passBtn none" onclick="verifyAttachment('{{item.docId}}',2,'.noPassBtn',this)">
									<i class="layui-icon"></i>审核不通过									
								</button>
									{{# }else{ }}
									<button type="button"
									class="layui-btn layui-btn-normal layui-btn-xs passBtn none"onclick="verifyAttachment('{{item.docId}}',3,'.passBtn',this)">
									<i class="layui-icon"></i>审核通过									
								</button>
								<button type="button"
									class="layui-btn layui-btn-danger layui-btn-xs passBtn none" onclick="verifyAttachment('{{item.docId}}',2,'.noPassBtn',this)">
									<i class="layui-icon"></i>审核不通过									
								</button>
									{{# }}}

							</div></li>
						{{#}); }}						
						{{#  if(d.length === 0){ }}
    						<li class="tc m0 checked" id="nothingCon"><img src='${ctx}/static/images/noFound.png' style='width:75px'><p class="f14 gray">暂无必传附件</p></li>
						{{#  } }} 
					</script>
							</ul>
						</div>
					</div>
				</div>
				<div class="layui-col-xs12">
					<div class="layui-form-item">
						<label class="layui-form-label">处理意见:</label>
						<div class="layui-input-block">
							<textarea style="resize: none" name="" required
								lay-verify="required" placeholder="请输入处理意见" value="同意"
								class="layui-textarea" id="operationOpinion">同意</textarea>
						</div>
						<a href="#" class="layui-blue fr mt10" onclick="historyPage()">历史</a>
					</div>
				</div>
			</div>
		</form>

		<div class="mt40 mb20 tc">
			<button class="layui-btn layui-btn-primary w100" onclick="freshen()">返回</button>
			<button class="layui-btn w100 none" id="saveBtn">保存</button>
			<button class="layui-btn layui-btn-normal w100 none" id="commitBtn">提交</button>
			<button class="layui-btn layui-btn-warm w100 none"
				id="correctLaderBtn">科长补正</button>
			<button class="layui-btn w100 none" id="acceptBtn">受理</button>
			<!-- 加凭证编码办结  -->
			<button class="layui-btn w100 none" id="passBtn">办结</button>
			<!-- 办结加水印  -->
			<button class="layui-btn w100 none" id="outPassBtn">办结</button>
			<!-- 科长办结  -->
			<button class="layui-btn w100 none" id="leaderPassBtn">办结</button>			
			<button class="layui-btn layui-btn-danger w100 none"
				id="refuseToPassBtn">办结不通过</button>
			<button class="layui-btn layui-btn-warm w100 none" id="correctBtn">补正</button>
			<!-- <button class="layui-btn layui-btn-danger w100 none" id="endPreApproval">终止</button> -->
			<button class="layui-btn w100 none" id="exportBtn">导出</button>
			<button class="layui-btn w100 none" id="fileBtn">归档</button>
			<button class="layui-btn layui-btn-warm w100 none" id="changeProcessBtn">变更流程</button>
			
		</div>

	<!-- 	<ul class="prl4">
			<li class="clearfix cl mb10">
				<div class="btn-group fr">
					<a href="#" class="layui-blue none" id="endPreApproval">终止</a> <a
						href="#" class="layui-blue none" id="exportBtn">导出</a> <a href="#"
						class="layui-blue none" id="fileBtn">归档</a>
				</div>
			</li>
		</ul> -->
	</div>
	<script src="${ctx}/static/js/bank/myWork/approval.js"></script>
</body>
</html>
