<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<%@ include file="/WEB-INF/views/include/taglibs.jsp"%>
<%@ include file="/WEB-INF/views/include/link.jsp"%>

<%
	String error = (String) request
			.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
	request.setAttribute("error", error);
%>
<!--办事指南,法律法规-->
<html>
<head>
<meta charset="utf-8">
<title>外汇业务网上预审批系统</title>
 <%@ include file="/WEB-INF/views/include/link.jsp"%>
</head>
<body>
	<div class="layui-main">
		<div class="mt30">
			<fieldset class="layui-elem-field layui-field-title site-title">
				<legend>
					<a name="use">${typeName }</a>
				</legend>
				<input id="hid" type="hidden" value="${type}"></input>
			</fieldset>
		</div>
		<div class="layui-form demoTable mt30" id="ruleForm">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">关键字: </label>
					<div class="layui-input-inline" style="width: 230px;">
						<input type="text" name="" autocomplete="off" id="guidesName"
							class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">日期范围: </label>
					<div class="layui-input-inline" style="width: 230px;">
						<input type="text" class="layui-input" id="test6">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label"><button id="btn"
							class="layui-btn layui-btn-normal w200" data-type="reload">搜索</button></label>
				</div>
			</div>
		</div>
		<div class="layui-list ml30 mr30">
			<ul id="guidesCon"></ul>
			<ul id="lawsCon"></ul>
	
		</div>
		<div id="layPage" class="fr mr20 mb50"></div>
	</div>
<script src="${ctx}/static/layui/layui.js"></script>
<script src="${ctx}/static/js/main/rule.js"></script>
<script id="guidesTpl" type="text/html">
	{{#  layui.each(d, function(index, item){ }}
		<li class="layui-elip" data-id="{{item.id}}">
			<span class="layui-badge-dot layui-bg-blue mr5"></span> 
			<a href="getGuidesInfo?type=办事指南&&id={{item.id}}" class='blue'>{{item.guidesName}}</a>
		</li>
	{{#}); }}

	{{#  if(d.length === 0){ }}
    	<li class="tc m0"><img src='${ctx}/static/images/noFound.png' style='width:75px'><p class="f14 gray">暂无数据</p></li>
	{{#  } }} 
</script>
<script id="lawsTpl" type="text/html">
	{{#  layui.each(d, function(index, item){ }}
		<li class="layui-elip" data-id="{{item.id}}">
			<span class="layui-badge-dot layui-bg-blue mr5"></span> 
			<a href="getLawsInfo?type=法律法规&&id={{item.id}}" class='blue'>{{item.lawName}}</a>
		</li>
	{{#}); }}
<li><a href="http://baidu.com" class="layui-blue" target="_blank">更多>></a></li>
	{{#  if(d.length === 0){ }}
    	<li class="tc m0"><img src='${ctx}/static/images/noFound.png' style='width:75px'><p class="f14 gray">暂无数据</p></li>
	{{#  } }} 
</script>
</body>
</html>

