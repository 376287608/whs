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
<!--历史-->
<html>
<head>
<meta charset="utf-8">
<title>历史</title>
<%@ include file="/WEB-INF/views/include/link.jsp"%>
</head>
<body>
	<div class="layui-main">
		<div class="layui-row">
			<div class="layui-col-sm12">
				<table class="layui-table" lay-size="sm" >
					<colgroup>
						<col width="150">
						<col width="200">
						<col>
					</colgroup>
					<thead>
						<tr>
							<th>任务接收时间</th>
							<th>任务结束时间</th>
							<th>操作</th>
							<th>意见</th>
							<th>操作者</th>
						</tr>
					</thead>
					<tbody id="newTable">
					<script id="historyTpl" type="text/html">
						<ul>
						  {{#  layui.each(d, function(index, item){ }}
						   	<tr>
								<td>{{getMyDate(item.receiveDate)}}</td>
								<td>{{getMyDate(item.endDate)}}</td>
								<td>{{item.opertionName}}</td>
								<td>{{format(item.operationOpinon)}}</td>
								<td>{{format(item.operatorBy)}}</td>
							</tr>
						  {{#  }); }}
						  {{#  if(d.length === 0){ }}
						    无数据
						  {{#  } }} 
						</ul>
					</script>	
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script>
	var laypage = '';
	layui.use([ 'table', 'laytpl', 'jquery', 'laypage', 'layer' ],function() {
						laypage = layui.laypage;
						var table = layui.table, laytpl = layui.laytpl, $ = layui.jquery, layer = layui.layer;
						var Id = GetQueryString("id");
						$.ajax({
							url : ctx+'/bulog/getBusinessLogList',
							type : "post",
							dataType : "json",
							data : {
								"reportId" : Id
							},
							success : function(data) {
								var getTpl = historyTpl.innerHTML, view = document.getElementById('newTable');
								laytpl(getTpl).render(data.rows, function(html) {
									view.innerHTML = html;
								});
							},
							error : function(data) {
								layer.msg("请求异常");
							}
						});
					});
</script>
</body>
</html>

