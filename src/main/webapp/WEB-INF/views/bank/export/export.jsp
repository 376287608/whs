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
<!--导出列表-->
<html>
<head>
<meta charset="utf-8">
<title>外汇业务网上预审批系统</title>
<%@ include file="/WEB-INF/views/include/link.jsp"%>
</head>
<body>
	<div class="layui-main">
		<div class="layui-row">
			<div class="layui-col-sm12">
				<fieldset class="layui-elem-field layui-field-title site-title">
					<legend>
						<a>导出列表</a>
					</legend>
				</fieldset>
				<button class="layui-btn layui-btn-normal" id="export">导出</button>
				<table id="newTable" lay-filter="dataGrid"></table>
			</div>
		</div>
	</div>
	<script src='${ctx}/static/js/util/DataSet.js'></script>
	<script src='${ctx}/static/js/bank/export/export.js'></script>
</body>
</html>
