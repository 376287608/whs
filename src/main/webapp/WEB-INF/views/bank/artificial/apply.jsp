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
<!--人工录入-->
<html>
<head>
<meta charset="utf-8">
<title>外汇业务网上预审批系统</title>
<%@ include file="/WEB-INF/views/include/link.jsp"%>
</head>
 <script src='${ctx}/static/js/jquery-1.7.1.min.js'></script>
 <script src='${ctx}/static/js/uploadify/ajaxfileupload.js'></script>
<body>
	<div class="layui-main">
		<div id="applyList">
			<fieldset class="layui-elem-field layui-field-title site-title">
				<legend>
					<a>业务类型</a>
				</legend>
			</fieldset>
			<div class="layui-col-sm10 layui-col-sm-offset1">
				<ul class="horizontalTree f14 clearfix" id="horizontalTree"></ul>
			</div>
		</div>
	</div>
	<div class="layui-main">
		<div id="applyInfo" class="none">
			<form class="layui-form" action="post" onsubmit="return false">
			<div class="layui-row">
				<fieldset class="layui-elem-field layui-field-title site-title">
					<legend>
						<a>业务申请</a>
					</legend>
				</fieldset>
				<div class="layui-col-xs7" id="userForm">
						<input type="hidden" id="formId">
						<div id="queryInfoTitle" class="mb30">
							<h3 class="f18 ib layui-blue">基本信息</h3>
							 <div class="fr">
								<!-- <p class="ib mr5">
									<i class="layui-icon f25 layui-blue">&#xe62d;</i> <a href=""
										class="layui-blue" id="filetemplateDoc">业务申请样表</a>
								</p> -->
								<p class="ib">
									<i class="layui-icon f25 layui-green">&#xe62d;</i><a href=""
										class="layui-blue" id="fileDoc">业务申请表</a>
								</p>
							</div> 
							<hr class="layui-bg-blue">
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">联系人:</label>
							<div class="layui-input-block">
								<input type="text" name="registerName" 
									lay-verify="required" placeholder="请输入联系人姓名" autocomplete="off"
									class="layui-input">
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
								<input type="text" name="email" required lay-verify="required|email"
									placeholder="请输入联系邮箱" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">邮寄地址:</label>
							<div class="layui-input-block">
								<input type="text" name="address" required lay-verify="required"
									placeholder="请输入邮寄地址" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">通知获取方式</label>
							<div class="layui-input-block">
								<select name="noticeGet" lay-verify="required">
									<option value="1">自取</option>
									<option value="0">邮寄</option>
								</select>
							</div>
						</div>
				</div>
				<div class="layui-col-xs5">
					<div class="layui-row ml30">
						<div class="layui-col-sm12 layui-list">
							<div class="pall10 border mb10" style="margin-top: -10px">
								<h3 class="f16 mb10">
									<i class="layui-icon f18 mr5">&#xe63c;</i>办事指南
								</h3>
								<hr class="layui-bg-blue">
								<ul id="guidesCon">
									<script id="guidesTpl" type="text/html">
									{{#  layui.each(d, function(index, item){ }}
										<li class="layui-elip" data-id="{{item.id}}">
											<span class="layui-badge-dot layui-bg-green mr5"></span> 
											<a  href="#" onclick="openRuleInfo('/guides/getGuidesInfo','办事指南','{{item.id}}')">{{item.guidesName}}</a>
										</li>
									{{#  }); }}
									{{#  if(d.length === 0){ }}
    									<li class="tc m0"><img src='${ctx}/static/images/noFound.png' style='width:75px'><p class="f14 gray">暂无数据</p></li>
									{{#  } }} 
								</script>
								</ul>
							</div>
						</div>
						
						<div class="layui-col-sm12 layui-list">
							<div class="pall10 border">
								<h3 class="f16 mb10">
									<i class="layui-icon f19 mr5">&#xe705;</i>法律法规
								</h3>
								<hr class="layui-bg-blue">
								<ul class="ml5" id="lawsCon">
								<script id="lawsTpl" type="text/html">
									{{#  layui.each(d, function(index, item){ }}
										<li class="layui-elip" data-id="{{item.id}}">
											<span class="layui-badge-dot layui-bg-blue mr5"></span> 
											<a href="#" onclick="openRuleInfo('/laws/getLawsInfo','法律法规','{{item.id}}')">{{item.lawName}}</a>
										</li>
									{{#}); }}
									{{#  if(d.length === 0){ }}
    									<li class="tc m0"><img src='${ctx}/static/images/noFound.png' style='width:75px'><p class="f14 gray">暂无数据</p></li>
									{{#  } }} 
								</script>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="layui-row mt30">
				<div class="layui-col-sm12" id="bankForm">							
						<div id="queryInfoTitle" class="mb30">
							<h3 class="f18 ib layui-blue">企业信息</h3>
							<hr class="layui-bg-blue">
						</div>
						<div class="layui-col-sm7">
						<div class="layui-form-item">
							<label class="layui-form-label">申请单位:</label>
							<div class="layui-input-block">
								<input type="text" name="businessName" required
									lay-verify="required" placeholder="请输入企业名称" autocomplete="off"
									class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">企业代码:</label>
							<div class="layui-input-block">
								<input type="text" name="applyOrgCode" required lay-verify="required|nineNumber"
									placeholder="请输入企业组织机构代码" autocomplete="off" class="layui-input">
							</div>
						</div>
						</div>	
				</div>
			</div>
			<div class="layui-row mt30">
				<div class="layui-col-sm12" id="uploadAttachmentListCon">
					<h3 class="f18 ib layui-blue">附件上传</h3>
					<p class="ib gray">（<span class="layui-badge-dot layui-bg-orange mr5"></span>为必传项  <span class="layui-badge-dot layui-bg-blue mr5"></span>为已传项）</p>					
					<p class="ib fr"  id="addAttachment" onclick="addAttachment()">
						<i class="layui-icon vm" style="font-size: 26px;">&#xe61f;</i> <span>添加其他附件</span> <span
							class="f12 gray mt5">（最多上传十个其他附件）</span>
					</p>
					<hr class="layui-bg-blue">
					<ul class="prl4" id="attachmentListCon">
						<script id="attachmentListTpl" type="text/html">
						{{#  layui.each(d, function(index, item){ }}
							<li class="clearfix cl mb10" data-checktype="{{item.checkType}}" data-id="{{item.id}}" data-otherFlag="otherFile{{item.filetypeIndex}}"><p class="fl layui-elip" style="width:70%">
								{{# if(item.checkType=="1"){ }}
									<span class="layui-badge-dot layui-bg-orange mr5"></span>
								{{# }else{ }}
										<span class="layui-badge-dot layui-bg-white mr5"></span>
								{{# } }}
								<em class="fn">{{item.filetypeIndex}}</em>.<em class="fileName fn">{{item.filetype}}</em>
							</p>
							<div class="btn-group fr">
								<a href="" class="layui-btn layui-btn-xs checkBtn none">
									<i class="layui-icon"></i>查看附件
								</a>
								<div type="button"class="layui-btn layui-btn-normal layui-btn-xs pr oh">
									<i class="layui-icon"></i>上传附件
									<input type="file" name="file" class="upload-file pa" id="File{{item.filetypeIndex}}" onchange=ajaxFileUpload("File{{item.filetypeIndex}}",'')>
								</div>
							</div></li>
						{{#}); }}						
						{{#  if(d.length === 0){ }}
    						<li class="tc m0 nothing" id="nothingCon"><img src='${ctx}/static/images/noFound.png' style='width:75px'><p class="f14 gray">暂无必传附件</p></li>
						{{#  } }} 
					</script>
					</ul>
					<div class="mt40 mb40 tc"> 
					<button class="layui-btn layui-btn-primary w100" onclick="freshenlocation()">返回</button>
						<button class="layui-btn w100" lay-submit lay-filter="applyFormStartup">启动流程</button>
					</div>
				</div>
			</div>
		</form>				
		</div>		
	</div>	
<script src='${ctx}/static/js/bank/myWork/apply.js'></script>

</body>
</html>



