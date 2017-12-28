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
<!-- 审批页--监管科-- -->
<html lang="en">
<head>
<meta charset="UTF-8">
<title>外汇业务网上预审批系统</title>
<%@ include file="/WEB-INF/views/include/specialLink.jsp"%>
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
			<p class="tr mb5">
				办结权限:<span id="lastApprover"></span>
			</p>
			<!-- 
			<p class="tr mb5">
				业务凭证编码:<span id="businessDocumentCode"></span>
			</p>  -->

		</div>
		<div class="layui-form clearfix layui-col-xs12" id="userForm">
			<input type="hidden" id="formId">
		<h3 class="f18 ib layui-blue">中关村中心支局外汇业务内部审批报告单</h3>
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
		<form class="layui-form" action="post" onsubmit="return false">
			<div class="layui-row">
			<div class="layui-col-xs6">
					<div class="layui-form-item">
						<label class="layui-form-label">经办人:</label>
						<div class="layui-input-block">
							<label class="label" id="agent"></label>
						</div>
					</div>
				</div>
				<div class="layui-col-xs6">
					<div class="layui-form-item">
						<label class="layui-form-label">经办时间:</label>
						<div class="layui-input-block">
							<label class="label" id="agentTime"></label>
						</div>
					</div>
				</div>
			    <!--  
				<div class="layui-col-xs6">
					<div class="layui-form-item">
						<label class="layui-form-label">业务事项:</label>
						<div class="layui-input-block">
							<label class="label" id="reasonDesc"></label>
						</div>
					</div>
				</div> -->
				
	           <div class="layui-col-xs6">
					<div class="layui-form-item">
						<label class="layui-form-label">业务描述:</label>
						<div class="layui-input-block">
							<label class="label" id="remark"></label>
						</div>
					</div>
				</div>
			
				<div class="layui-col-xs12">
				<div class="layui-form-item">
						<label class="layui-form-label">申请材料:</label>	
						<!-- <div class="layui-input-block">
							<label class="gray fl" style="padding:10px 0;">(<span class="layui-badge-dot layui-bg-danger mr5"></span>为上一级审批未通过 <span
							class="layui-badge-dot layui-bg-green mr5"></span>为上一级审批通过 <span class="layui-badge-dot layui-bg-blue mr5"></span>为待审批)</label>	
						</div> -->
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
							<li class="clearfix cl mb10 {{isCheck}}" data-checktype="{{item.checkType}}" data-id="{{item.id}}" data-otherFlag="otherFile{{item.filetypeIndex}}"><p class="fl layui-elip" style="width:60%">
								<span class="layui-badge-dot mr5 {{dot}}"></span>
								<em class="fn">{{item.displayOrder}}</em>.<em class="filetype fn">{{item.filetypeName}}</em>
							</p>
							<div class="btn-group fr">
								<a href='${ctx}/attachment/down/{{item.docId}}/1' class="layui-btn layui-btn-xs checkBtn">
									<i class="layui-icon">&#xe64a;</i>查看附件
								</a>			
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
			<!-- 科长办结  -->
			<button class="layui-btn w100 none" id="leaderPassBtn">办结</button>			
			
			<!-- <button class="layui-btn layui-btn-danger w100 none" id="endPreApproval">终止</button> -->
			<button class="layui-btn layui-btn-warm w100 none" id="changeProcessBtn">撤销流程</button>
			
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
	<script src='${ctx}/static/js/bank/specialJianGuan/specialApproval.js'></script>
</body>
</html>
