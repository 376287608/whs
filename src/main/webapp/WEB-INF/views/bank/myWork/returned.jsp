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
%>
<!--待接收，人工分派，数据导入-->
<html>
<head>
<meta charset="utf-8">
<title>外汇业务网上预审批系统</title>
<%@ include file="/WEB-INF/views/include/link.jsp"%>
</head>
<body>
	<div class="layui-main">
		<div id="receiveTable">
			<div class="layui-row">
				<div class="layui-col-sm12">
					<fieldset class="layui-elem-field layui-field-title site-title">
						<legend>
							<a></a>
						</legend>
					</fieldset>
					<button class="layui-btn layui-btn-normal none" id="import">导入</button>
					<table id="newTable" lay-filter="dataGrid"></table>
				</div>
			</div>
		</div>
		<div id="applyInfo" class="layui-anim-upbit none">
			<div class="layui-row">
				<fieldset class="layui-elem-field layui-field-title site-title">
					<legend>
						<a>业务申请</a>
					</legend>
				</fieldset>
				<div class="layui-col-xs12" id="userForm">
					<div class="layui-form">					
						<input type="hidden" id="formId">
						<input type="hidden" id="formCode">
						<div id="queryInfoTitle" class="mb30">
							<h3 class="f18 ib layui-blue">基本信息</h3>
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
				</div>
			</div>
			<div class="layui-row">
				<div class="layui-col-xs12" id="userForm">
					<div class="layui-form">
						<input type="hidden" id="formId">
						<div id="queryInfoTitle" class="mb30">
							<h3 class="f18 ib layui-blue">业务信息</h3>
							<hr class="layui-bg-blue">
						</div>
						<div class="layui-col-xs4">
							<div class="layui-form-item">
								<label class="layui-form-label">申请编号:</label>
								<div class="layui-input-block">
									<label class="label" id="formCode"></label>
								</div>
							</div>
						</div>
						<div class="layui-col-xs8">
							<div class="layui-form-item">
								<label class="layui-form-label">业务申请名称:</label>
								<div class="layui-input-block">
									<label class="label" id="businessName"></label>
								</div>
							</div>
						</div>
					<!-- 	<div class="layui-col-xs4">
							<div class="layui-form-item">
								<label class="layui-form-label">申请时间:</label>
								<div class="layui-input-block">
									<label class="label" id="applyTime"></label>
								</div>
							</div>
						</div> -->
						<div class="layui-col-xs4">
							<div class="layui-form-item">
								<label class="layui-form-label">最后提交时间:</label>
								<div class="layui-input-block">
									<label class="label" id="submitTime"></label>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="layui-row">
				<div class="layui-col-sm12">
					<h3 class="f18 ib layui-blue">附件</h3>
					<hr class="layui-bg-blue">
					<ul class="prl4" id="attachmentListCon">
						<script id="attachmentListTpl" type="text/html">
						{{#  layui.each(d, function(index, item){ }}
							<li class="clearfix cl mb10" data-checktype="{{item.checkType}}" data-id="{{item.id}}" data-otherFlag="otherFile{{item.otherFlag}}"><p class="fl layui-elip" style="width:70%">
								<span class="layui-badge-dot layui-bg-white mr5"></span>
								<em class="fn">{{item.displayOrder}}</em>.<em class="fileName fn">{{item.filetypeName}}</em>
							</p>
							<div class="btn-group fr">
								<a href='${ctx}/attachment/down/{{item.docId}}/1' class="layui-btn layui-btn-xs checkBtn">
									<i class="layui-icon"></i>查看附件
								</a>
							</div></li>
						{{#}); }}						
						{{#  if(d.length === 0){ }}
    						<li class="tc m0 nothing" id="nothingCon"><img src='${ctx}/static/images/noFound.png' style='width:75px'><p class="f14 gray">暂无必传附件</p></li>
						{{#  } }} 
					</script>
					</ul>
					<div class="mt40 mb40 tc">
						<button class="layui-btn layui-btn-primary w100" onclick="freshenlocation()">返回</button>
						<button class="layui-btn layui-btn-danger w100 none"
							id="returnBtn">退回</button>
						<button class="layui-btn none" id="receiveBtn">接收并启动流程</button>
						<button class="layui-btn layui-btn-normal w100 none"
							id="assignmentBtn">分派</button>
						<button class="layui-btn none"  id="startUpBtn">启动流程</button>
							
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id='importResultDiv' style='display: none;'>
		<table class="layui-table">
			<colgroup>
				<col width="180">
				<col>
			</colgroup>
			<thead>
				<tr>
					<th>业务编号</th>
					<th>申请编号</th>
					<th>申请名称</th>
				</tr>
			</thead>
			<tbody id='importResultBody'>
			</tbody>
		</table>
	</div>
	<script src="${ctx}/static/js/bank/myWork/returned.js"></script>
</body>
</html>


