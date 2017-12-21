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
<!--首页-->
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
				<div class="mt30">
					<h3 class="f16 mb10">
						<i class="layui-icon f18 mr5"></i>声明
					</h3>
					<div id="TplCon" class="layui-list">
						<p>声明详情声明详情声明详情声明详情声明详情声明详情声明详情声明详情声明详情声明详情声明详情声明详情声明详情声明详情声明详情声明详情声明详情</p>
					</div>
				</div>
			</div>
			<div class="layui-col-sm12">
				<div class="mt30 mb50">
					<fieldset class="layui-elem-field layui-field-title site-title">
						<legend>
							<a>消息通知</a>
						</legend>
					</fieldset>
					<table id="newTable" lay-filter="dataGrid"></table>
				</div>
			</div>
		</div>
	</div>
	<script src='${ctx}/static/js/company/index.js'></script>
</body>
</html>
