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
<!--办事指南，法律法规详情-->
<html>
<head>
<meta charset="utf-8">
<title>外汇业务网上预审批系统</title>
</head>
<body>
	<div class="layui-main">
		<div class="mt30">
		<fieldset class="layui-elem-field layui-field-title site-title">
			<legend>
				<a id="ruleTitle">办事指南</a>
			</legend>
		</fieldset>
		</div>
		<div id="guidesInfoCon" class="mb50"></div>
		<div id="lawsInfoCon" class="mb50"></div>
	</div>
	<script type="text/javascript">
	var $ = '';
	var laytpl = '';
	layui.use([ 'jquery', 'laytpl', 'layer' ], function() {
		$ = layui.$;
		laytpl = layui.laytpl;
		var type = GetQueryString("type");
		var id = GetQueryString("id");
		ruleInfo(type, id);
		function ruleInfo(type, id) {
			$("#ruleTitle").text(type);
			if (type == "办事指南") {
				var url = "ajaxGetGuidesInfo";
			} else {
				var url = "ajaxGetLawsInfo";
			}
			$.ajax({
				url : url,
				type : "post",
				dataType : "json",
				data : {
					id : id
				},
				success : function(data) {
					if (data.success == "true") {
						if (type == "办事指南") {
							var getTpl = guidesTpl.innerHTML, view = document
									.getElementById('guidesInfoCon');
							laytpl(getTpl).render(data, function(html) {
								view.innerHTML = html;
							});
						} else {
							var getTpl = lawsTpl.innerHTML, view = document
									.getElementById('lawsInfoCon');
							laytpl(getTpl).render(data, function(html) {
								view.innerHTML = html;
							});

						}
					} else {
						errorTip(data);
					}
				},
				error : function(data) {
					errorTip(data);
				}
			});
		}
	})
</script>
<script id="guidesTpl" type="text/html">
	<div class="tc ruleInfoTitle">
		<h4 class="layui-elip f16">{{ d.item.guidesName }}</h4>
		<p>{{getMyDate(d.item.createDate)}}</p>
	</div>
	<p>{{d.item.guidesContent }}</p> 
	<div class="mt50">
		{{#  layui.each(d.attachments, function(index, item){ }}
		<p class="ib mr5">
			<i class="layui-icon f25 layui-blue">&#xe62d;</i> 
			<a href='${ctx}/attachment/down/{{item.docId}}/1' class="layui-blue" >{{item.docName}}</a>
		</p>
		{{#}); }}
	</div>      	
	{{#  if(d.length === 0){ }}
    	<li class="tc m0"><img src='${ctx}/static/images/noFound.png' style='width:75px'><p class="f14 gray">暂无数据</p></li>
	{{#  } }} 
</script>
<script id="lawsTpl" type="text/html">
	<div class="tc ruleInfoTitle">
		<h4 class="layui-elip f16">{{ d.item.lawName }}</h4>
		<p>{{getMyDate(d.item.createDate)}}</p>
	</div>
	<p>{{d.item.lawContent }}</p> 
	<div class="mt50">
		{{#  layui.each(d.attachments, function(index, item){ }}
		<p class="ib mr5">
			<i class="layui-icon f25 layui-blue">&#xe62d;</i> 
			<a href='${ctx}/attachment/down/{{item.docId}}/1' class="layui-blue" >{{item.docName}}</a>
		</p>
		{{#}); }}
	</div>      	
	{{#  if(d.length === 0){ }}
    	<li class="tc m0"><img src='${ctx}/static/images/noFound.png' style='width:75px'><p class="f14 gray">暂无数据</p></li>
	{{#  } }} 
</script>
</body>
</html>


