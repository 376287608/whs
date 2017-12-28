<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
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
<title>外汇业务网上预约审批系统</title>
<%@ include file="/WEB-INF/views/include/link.jsp"%>
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">
				<i class="layui-icon" style="color: #fff; font-size: 30px;">&#xe68e;</i>
				<input id="ctx" type="hidden" value="${ctx }">
			</div>
			<ul class="layui-nav layui-layout-left none" id='navLeft'
				lay-filter='navLeft'>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"
					id="registerName"> </a>
					<dl class="layui-nav-child">
						<dd>
							<a id="updateCompany" href="#">修改资料</a>
						</dd>
						<dd>
							<a id="updatePwd" href="#">修改密码</a>
						</dd>
					</dl></li>
				<li id="logout" class="layui-nav-item"><a href="#">退出</a></li>
				<!-- 	<li class="layui-nav-item"><a href="#" name="1" id="test">test切换银行用户</a></li>
			 -->
			</ul>
		</div>
		<div class="layui-side layui-bg-black none">
			<div class="layui-side-scroll">
				<!-- 银行菜单 -->
				<ul class="layui-nav layui-nav-tree" id='sideNav'
					lay-filter='sideNav'>

				</ul>
			</div>
		</div>
		<div class="layui-body">
			<!-- 内容主体区域 -->
			<!-- 银行用户 -->
			<div class="none" id="bankCon">
				<div class="layui-tab" lay-filter="page-tab" lay-allowclose="true">
					<ul class="layui-tab-title" id="tabTitle">
						<li class="layui-this" lay-id="0"><label>首页</label></li>
					</ul>
					<div class="layui-tab-content" id="tabContainers">
						<div class="layui-tab-item layui-show">
							<div class="layui-main">
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
			</div>
			<!-- 企业用户 -->
			<div class="none" id="companyCon">
				<iframe id="companyIframe" src="${ctx}/company/index"  frameborder="no" border="0"> </iframe>
			</div>
		</div>
		<div class="layui-footer">
			<!-- 底部固定区域 -->
		</div>
	</div>
	<script src='${ctx}/static/js/main/index.js'></script>
	
	<script id="menuBankTpl" type="text/html">
{{#  layui.each(d, function(index, item){ }}
	{{# if(item.parentId==null){ }}
    	<li class="layui-nav-item">
    		<a class="" href="javascript:;">{{item.name}}</a>
			<dl class="layui-nav-child">
				{{#  layui.each(d, function(indexs, items){ }}
					{{# if(item.id==items.parentId){ }}			
    						<dd><a href="javascript:;" data-url="${ctx}/{{items.href}}" ><label>{{items.name}}</label></a></dd>   					
					{{#} }}
  				{{#  }); }}
			</dl>
  		</li>
	{{#} }}
{{#  }); }}
{{#  if(d.length === 0){ }}
    	<li class="layui-nav-item layui-nav-itemed">暂无数据</li>
{{#  } }} 
</script>
<script id="menuCompanyTpl" type="text/html">
{{#  layui.each(d, function(index, item){ }}
<li class="layui-nav-item"
	data-url="${ctx}/{{item.href}}"><a href="#"><label>{{item.name}}</label></a></li>
	{{#  }); }}
	{{#  if(d.length === 0){ }}
	    	<li class="layui-nav-item layui-nav-itemed">暂无数据</li>
	{{#  } }} 
</script>
</body>
</html>



