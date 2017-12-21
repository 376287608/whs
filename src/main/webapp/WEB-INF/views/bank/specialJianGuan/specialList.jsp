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
<!--特殊业务暂存列表---监管科-->
<html>
<head>
<meta charset="utf-8">
<title>外汇业务网上预审批系统</title>
<%@ include file="/WEB-INF/views/include/specialLink.jsp"%>
</head>
<body>
	<div class="layui-main">
		<fieldset class="layui-elem-field layui-field-title site-title">
			<legend>
				<a>申请业务列表</a>
			</legend>
		</fieldset>
		<table id="newTable" lay-filter="dataGrid"></table>
	</div>
	<script src="${ctx}/static/js/bank/specialJianGuan/specialList.js"></script>
</body>
</html>

