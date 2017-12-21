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
<!-- 业务查询 --监管科---->
<html>
<head>
<meta charset="utf-8">
<title>外汇业务网上预审批系统</title>
<%@ include file="/WEB-INF/views/include/specialLink.jsp"%>
</head>
<body>
	<div class="layui-main">
		<div class="layui-row">
			<fieldset class="layui-elem-field layui-field-title site-title">
				<legend>
					<a>内部业务查询</a>
				</legend>
			</fieldset>
			<div class="layui-col-sm12">
				<div class="layui-form demoTable mt30">
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">申请编号:</label>
							<div class="layui-input-inline" style="width: 230px;">
								<input type="text" name="" autocomplete="off"
									class="layui-input" id="formCode">
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label">申请人:</label>
							<div class="layui-input-inline" style="width: 230px;">
								<input type="text" name="" autocomplete="off"
									class="layui-input" id="applyName">
							</div>
						</div>
						<div class="layui-inline">
							<button class="layui-btn layui-btn-normal w200" id="comfirmBtn">搜索</button>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">业务状态</label>
							<div class="layui-input-block mr10" style="width: 230px;">
								<select name="interest" id="statuBank"></select>
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label">日期范围:</label>
							<div class="layui-input-inline" style="width: 230px;">
								<input type="text" class="layui-input" id="queryDate"
									placeholder=" - ">
							</div>
						</div>
					</div>
				</div>
				<table id="newTable" lay-filter="dataGrid"></table>
			</div>
		</div>
		<!--查询条件-->
	</div>
	<script src='${ctx}/static/js/bank/specialJianGuan/specialQuery.js'></script>
</body>
</html>


