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
<!DOCTYPE html>
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
					<a name="use">企业信息</a>
				</legend>
			</fieldset>
			<div class="layui-col-xs6 layui-col-xs-offset3">
				<form class="layui-form layui-input-disabled" action="" >
					<div>
						<h3 class="f18 mb30 ib">用户信息</h3>
						<div class="fr">
							<a href="#" class="ib layui-blue" id="queryInfoEdit"
								data-type="edit"> <i class="layui-icon f20">&#xe642;</i> 编辑
							</a>
						</div>
					</div>
					 <div class="layui-form-item">
						<label class="layui-form-label">企业名称:</label>
						<div class="layui-input-block">
							<input type="text" name="companyName" required lay-verify="required"
								placeholder="请输入企业名称" autocomplete="off" class="layui-input" value="${user.companyName }">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">联系人:</label>
						<div class="layui-input-block">
							<input type="text" name="registerName"
								lay-verify="required" placeholder="请输入联系人姓名" autocomplete="off"
								class="layui-input" value="${user.registerName }">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">联系电话:</label>
						<div class="layui-input-block">
							<input type="text" name="phone" lay-verify="phone"
								placeholder="请输入联系电话" autocomplete="off" class="layui-input" value="${user.phone }">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">联系邮箱:</label>
						<div class="layui-input-block">
							<input type="text" name="email" lay-verify="email"
								placeholder="请输入联系邮箱" autocomplete="off" class="layui-input" value="${user.email }">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">证件类型</label>
						<input type="hidden" id="cardType" value="${user.credentialsType }" >
						<div class="layui-input-block">
							<select id="credentialsType" name="credentialsType" lay-verify="required">
								 <c:forEach var="dict" items="${dictList }">
			                    	<option value="${dict.value }">${dict.label }</option>
			                     </c:forEach>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">证件号码:</label>
						<div class="layui-input-block">
							<input type="text" name="credentialNumber"
								lay-verify="required" placeholder="请输入证件号码" autocomplete="off"
								class="layui-input" value="${user.credentialNumber }">
						</div>
					</div>
					<div class="layui-form-item mt40 none" id="BtnCon">
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
	<script src='${ctx}/static/js/include/info.js'></script>
</body>
</html>
