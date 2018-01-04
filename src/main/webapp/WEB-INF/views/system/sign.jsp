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
<!-- 注册 -->
<html>
<head>
<meta charset="utf-8">
<title>外汇业务网上预审批系统</title>
<%@ include file="/WEB-INF/views/include/link.jsp"%>
 <script src='${ctx}/static/js/jquery-1.7.1.min.js'></script>
 <script src='${ctx}/static/js/uploadify/ajaxfileupload.js'></script>
<body>
	<div class="layui-main">
		<div class="mt50">
			<fieldset class="layui-elem-field layui-field-title site-title">
				<legend>
					<a name="use">注册</a>
				</legend>
			</fieldset>
			<div class="layui-col-xs6 layui-col-xs-offset3">
				<form class="layui-form" action="post" onsubmit="return false">
				<h3 class="f18 mb30">企业信息</h3>
					<div class="layui-form-item">
						<label class="layui-form-label">企业名称:</label>
						<div class="layui-input-block">
							<input type="text" name="companyName" lay-verify="required"
								placeholder="请输入企业名称" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">组织机构代码:</label>
						<div class="layui-input-block">
							<input type="text" id="orgBarcode" name="orgBarcode"
								lay-verify="orgBarcode" placeholder="请输入组织机构代码"
								autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">统一社会信用代码:</label>
						<div class="layui-input-block">
							<input type="text" id="certificateCode" name="certificateCode"
								lay-verify="certificateCode" placeholder="请输入统一社会信用代码"
								autocomplete="off" class="layui-input">
						</div>
					</div>
					<hr class="mt30 mb30">
					<h3 class="f18 mb30">用户信息</h3>
					<div class="layui-form-item">
						<label class="layui-form-label">用户名称:</label>
						<div class="layui-input-block">
							<input type="text" id="title" name="title" disabled="disabled"
								placeholder="和组织机构代码一致" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">密码:</label>
						<div class="layui-input-block">
							<input type="password" id="password" name="password"
								lay-verify="required|password" placeholder="请输入密码" autocomplete="off"
								class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">确认密码:</label>
						<div class="layui-input-block">
							<input type="password" name="repwd" lay-verify="required|repwd"
								placeholder="请再次输入密码" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">联系人:</label>
						<div class="layui-input-block">
							<input type="text" name="registerName" required lay-verify="required"
								placeholder="请输入联系人姓名" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">联系电话:</label>
						<div class="layui-input-block">
							<input type="text" name="phone" lay-verify="required|phone"
								placeholder="请输入联系电话" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">联系邮箱:</label>
						<div class="layui-input-block">
							<input type="text" name="email" lay-verify="required|email"
								placeholder="请输入联系邮箱" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">证件类型</label>
						<div class="layui-input-block">
							<select name="credentialsType" lay-verify="required">
								<c:forEach var="dict" items="${dictList }">
									<option value="${dict.value }">${dict.label }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">证件号码:</label>
						<div class="layui-input-block">
							<input type="text" name="credentialNumber" lay-verify="required"
								placeholder="请输入证件号码" autocomplete="off" class="layui-input">
						</div>
					</div> 
					<div class="layui-form-item">
						<label class="layui-form-label">上传附件:</label>
						<div class="layui-input-block">			
							<a type="button" class="layui-btn layui-btn-normal pr oh">
								<i class="layui-icon">&#xe67c;</i>上传图片
								<input type="file" name="file" class="upload-file pa" id="signFile" onchange="ajaxImgUpload('signFile')" >
							</a>
							<input id="docId" name="docId" type="hidden" lay-verify="files">
							<input id="docName" name="docName" type="hidden" lay-verify="files">
							
							<p class="mt10" id="docNameByuser"></p>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label"></label>
						<div class="layui-input-block" style="height: 41px;">
							<div class="fl">
								<input type="checkbox" name="" title="我同意" lay-skin="primary"
									lay-filter="test">
							</div>
							<a href="#" id="agree" class="db fl layui-blue"
								style="margin-top: 8px;">《XXXX》</a>
						</div>
					</div>
					<div class="layui-form-item mt40" id="signBtnCon">
						<div class="layui-input-block" style="margin-bottom: 100px;">
							<button
								class="layui-btn layui-btn-normal w100 layui-btn-disabled"
								lay-submit lay-filter="formDemo">提交</button>
							<button type="reset" class="layui-btn layui-btn-primary w100">重置</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src='${ctx}/static/js/include/sign.js'></script>
</body>
</html>
