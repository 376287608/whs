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
<!-- 企业信息-->
<html>
<head>
<meta charset="utf-8">
<title>外汇业务网上预审批系统</title>
<%@ include file="/WEB-INF/views/include/link.jsp"%>
<body>
	<div class="layui-main">
		<div class="mt50">
			<fieldset class="layui-elem-field layui-field-title site-title">
				<legend>
					<a name="use">修改密码</a>
				</legend>
			</fieldset>
			<div class="layui-col-xs6 layui-col-xs-offset3">
				<form class="layui-form" action="" >
					<div>
						<h3 class="f18 mb30 ib">用户信息</h3>	
					</div>
					
					<div class="layui-form-item">
						<label class="layui-form-label">原密码:</label>
						<div class="layui-input-block">
							<input type="password" name="oldpwd" lay-verify="required|oldPwd"
								placeholder="请输入密码" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">新密码:</label>
						<div class="layui-input-block">
							<input type="password" id="password" name="pwd" lay-verify="required|password"
								placeholder="请输入新密码" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">新密码确认:</label>
						<div class="layui-input-block">
							<input type="password" name="repwd" lay-verify="required|repwd"
								placeholder="请再次输入密码" autocomplete="off" class="layui-input">
						</div>
					</div>
				
					<div class="layui-form-item mt40" id="BtnCon">
						<div class="layui-input-block">
							<button
								class="layui-btn layui-btn-normal w100"
								lay-submit lay-filter="formDemo">提交</button>
							<button type="reset" class="layui-btn layui-btn-primary w100">重置</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src='${ctx}/static/js/include/pwd.js'></script>
</body>
</html>
