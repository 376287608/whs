<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<%@ include file="/WEB-INF/views/include/taglibs.jsp"%>

<%
String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
request.setAttribute("error", error);
%>
<html>
<head>
 <meta charset="utf-8">
  <title>外汇业务网上预审批系统</title>
<%@ include file="/WEB-INF/views/include/link.jsp"%>
<script type="text/javascript">
	if (window != top) {
		top.location.href = location.href;
	}
</script>
</head>
<body id="particles-js">
<div class="layui-main overlay" id="login">
	<div class="layui-row mt180" >
	<div class="layui-col-xs6">
		<div>	
		<fieldset class="layui-elem-field layui-field-title site-title">
					<legend>
						<a>办事指南</a>
					</legend>
				</fieldset>	
			<div id="TplCon" class="layui-list"></div>
			<div class="layui-text">
				<a id="more" class="pl20" href="../guides/guidesList"><span class="layui-badge-dot layui-bg-blue mr10"></span>更多>></a>
			</div>	
		</div>
	</div>	
	 	<div class="layui-col-xs5 layui-col-md-offset1">
	 	<div class="border">
	 		<h3 class="mb20 pt10 pb10 f20  pl30 layui-bg-blue">外汇业务网上预审批系统</h3>
	 		 <form id="loginForm" class="layui-form" action="${ctx}/company/login" method="post">
	 		 	<input id="error" type="hidden" value="${error }" >
	 		 	<input id="loginError" type="hidden" value="${loginError }" >
				  <div class="layui-form-item">
				    <label class="layui-form-label">用户名:</label>
				    <div class="layui-input-inline pl">
				      <input type="text" name="username" lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input cls-button">
				     <!--  <span class="layui-icon layui-clean" onclick="clearTxt(this)">&#x1006;</span> -->
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label pl">密码:</label>
				    <div class="layui-input-inline">
				      <input type="password" name="password" lay-verify="required|password" placeholder="请输入密码" autocomplete="off" class="layui-input cls-button">
				      <!--  <span class="layui-icon layui-clean" onclick="clearTxt(this)">&#x1006;</span> -->
				    </div>
				  </div>
				  
				  <div class="layui-form-item">
				    <div class="layui-inline">
				      <label class="layui-form-label">验证码:</label>
				      <div class="layui-input-inline um-pr">
				      	<input type="text" id="Txtidcode" class="layui-input cls-button" autocomplete="off" placeholder="请输入验证码"  />
				       <!--  <span class="layui-icon layui-clean" onclick="clearTxt(this)">&#x1006;</span> -->
				      </div>
				      <span id="idcode" style="position: absolute;"></span>
				    </div>
				</div>
				<div class="layui-form-item">
					<label  class="layui-form-label"></label>
					<button class="layui-btn layui-btn-normal w200" lay-submit lay-filter="formDemo">确定</button>
				</div>
				<div class="layui-form-item m0">
					<label  class="layui-form-label layui-text">
						<a href="javascript:;" id="forgetPwd" class="fl layui-orange">找回密码</a>					
					</label>
					<div class="layui-input-block layui-text" style="padding:9px 0">
						<a href="../system/sign" class="fr layui-green">注册</a>		
					</div>
				</div>
	 		</form>
	 		</div>
	 		<p class="tr mt20 f12"><img src="${ctx}/static/images/bank.png" class="pr5" style="vertical-align: text-bottom;">中国人民银行中关村中心支行</p>
		</div>
		
	</div>
</div>  
<script src='${ctx}/static/js/jquery-1.7.1.min.js'></script>
<script src='${ctx}/static/js/include/jquery.idcode.js'></script>
<script src='${ctx}/static/js/include/login.js'></script>

<!--[if (gte IE 9)|(!IE)]> -->
<script src='${ctx}/static/js/include/particles.js'></script>
<!-- <![endif]-->
<script id="Tpl" type="text/html">
    <ul class="pl20">
        {{# layui.each(d, function(index, item){ }}
        <li class="layui-elip" data-id="{{item.id}}"data-type="{{item.type}}">
            <span class="layui-badge-dot layui-bg-blue mr10"></span>
            <a href="../guides/getGuidesInfo?type=办事指南&&id={{item.id}}">{{ item.info }}</a>
        </li>
        {{# }); }}

        {{# if(d.length === 0){ }}
        无数据
        {{# } }}
    </ul>
</script>
</body>
</html>

