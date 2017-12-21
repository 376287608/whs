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
<!--流程管理-->
<html>
<head>
<meta charset="utf-8">
<title>外汇业务网上预审批系统</title>
<%@ include file="/WEB-INF/views/include/link.jsp"%>
</head>
<body>
	<div class="layui-main">
		<fieldset class="layui-elem-field layui-field-title site-title">
			<legend>
				<a>流程管理</a>
			</legend>
		</fieldset>
		<div id="ProcessMListCon">
			<button class="layui-btn" id="addProcessBtn">新增流程</button>
			<table id="newTable" lay-filter="dataGrid"></table>
		</div>
		<div id="ProcessMInfoCon" class="layui-anim-upbit none">
			<div class="layui-row">
				<div class="layui-col-xs12" id="businessForm">
					<div class="layui-form">
						<input type="hidden" id="id">
						<div id="queryInfoTitle" class="mb30">
							<h3 class="f18 ib layui-blue">流程信息</h3>
							<hr class="layui-bg-blue">
						</div>
						<div class="layui-col-xs6">
							<div class="layui-form-item">
								<label class="layui-form-label">流程名称:</label>
								<div class="layui-input-block">
									<input type="text" name="processName" lay-verify="required"
										placeholder="请输入流程名称" autocomplete="off" class="layui-input"
										id="processName">
								</div>
							</div>
						</div>
						<div class="layui-col-xs6">
							<div class="layui-form-item">
								<label class="layui-form-label">审核层级:</label>
								<div class="layui-input-block">
									<select id="verifyLevel" lay-filter="ApprovalLevel"
										lay-verify="required"></select>
								</div>
							</div>
						</div>

						<div class="layui-col-xs12">
							<div class="layui-form-item">
								<label class="layui-form-label">设置步骤:</label>
								<div class="layui-inline" id="stepCon"></div>
							</div>
						</div>
						<div class="layui-col-xs12">
							<div class="layui-form-item">
								<label class="layui-form-label">流程描述:</label>
								<div class="layui-input-block">
									<textarea style="resize: none" name="" required
										lay-verify="required" placeholder="请输入流程描述" value=""
										class="layui-textarea" id="remarks"></textarea>
								</div>
							</div>
						</div>
						<div class="mt40 mb40 tc">
							<button class="layui-btn layui-btn-primary w100"
								onclick="freshenlocation()">返回</button>
							<input class="layui-btn layui-btn-normal w100" lay-submit
								lay-filter="submitApprovalLevelBtn" value="提交"> <input
								class="layui-btn layui-btn-danger w100 none"
								id="delApprovalLevelBtn" value="删除"> <input
								class="layui-btn" style="width: 150px"
								id="ProcessAndBusinessBtn" value="设置关联业务">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="typeListCon" class="none">
			<div class="layui-row">
				<div id="queryInfoTitle" class="mb30">
					<h3 class="f18 ib layui-blue">业务类型</h3>
					<hr class="layui-bg-blue">
				</div>
				<p class="mb10">
					该流程已与<span class="f16 ml5 mr5" id="businessCount"
						style="color: #01AAED"></span>个业务相关联
				</p>

				<!--全选  -->
				<!-- <label for="checkboxAll" class="layui-btn layui-btn-sm" id="checkAll">全选</label>  
				<input type="checkbox" id="checkboxAll"> -->
				
				<table id="bussinessTable" lay-filter="dataGridBussiness"></table>

				<div id="layPage" class="fr mr20 mb50"></div>

			</div>
			<div class="mt40 mb40 tc">
				<button class="layui-btn layui-btn-primary w100" onclick="backInfo()">返回</button>
				<input class="layui-btn layui-btn-warm w100 none" id="delProcessBtn"value="一键解绑"> 
				<input class="layui-btn layui-btn-normal w100 layui-btn-disabled" id="confirmbusinessBtn" value="确认关联" disabled>
			</div>
		</div>

	</div>

	<script src='${ctx}/static/js/util/DataSet.js'></script>
	<script src="${ctx}/static/js/background/businessProcessManagement.js"></script>
	<script id="ApprovalLevelTpl" type="text/html">
		{{#  layui.each(d, function(index, item){ }}
			<option value="{{item.level}}">{{item.levelName}}</option>
		{{# }); }}		
		{{#  if(d.length === 0){ }}
    		无数据
  		{{#  } }}						
	</script>

	<script type="text/html" id="checkedTpl">
  		{{#  if(d.checked!='true'){ }}
			<input type="checkbox" name="layTableCheckbox" lay-skin="primary" checked>
  		{{#  } else { }}
    		<input type="checkbox" name="layTableCheckbox" lay-skin="primary">
  		{{#  } }}
	</script>

	<!-- //关联列表 -->

	<script id="bussinessTableTpl" type="text/html">
	<thead>
		<tr>
			<th lay-data="{field:'checked',width:50}"></th>
			<th lay-data="{field:'id',width:90}">业务编号</th>
			<th lay-data="{field:'businessName'}">业务名称</th>
		</tr>
	</thead>
<tbody>
	{{# var isCheck='';}}
	{{#  layui.each(d, function(index, item){ }}
		{{#  if(item.checked=='true'){ }}
			{{# isCheck='active';}}
  		{{#  } }}
	<tr class="{{isCheck}}">
      <td>
		{{#  if(item.checked=='true'){ }}
			<input type="checkbox" name="layTableCheckbox" lay-skin="primary" checked>
  		{{#  } else { }}
    		<input type="checkbox" name="layTableCheckbox" lay-skin="primary">
  		{{#  } }}
	  </td>
      <td>{{item.id}}</td>
      <td>{{item.businessName}}</td>
    </tr>

	{{#}); }}

	{{#  if(d.length === 0){ }}
    	<tr class="tc m0"><img src='${ctx}/static/images/noFound.png' style='width:75px'><p class="f14 gray">暂无数据</p></tr>
	{{#  } }} 
</tbody>
</script>



</body>
</html>
