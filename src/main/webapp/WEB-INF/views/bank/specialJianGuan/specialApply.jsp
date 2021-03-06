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
<!--新建申请页---监管科-->
<html>
<head>
<meta charset="utf-8">
<title>外汇业务网上预审批系统</title>
<%@ include file="/WEB-INF/views/include/specialLink.jsp"%>
</head>
<script src='${ctx}/static/js/jquery-1.7.1.min.js'></script>
<script src='${ctx}/static/js/uploadify/ajaxfileupload.js'></script>
<body>
	<div class="layui-main">
		<div id="applyInfo" class="mb50">
			<div class="layui-row mt30">
				<fieldset class="layui-elem-field layui-field-title site-title">
					<legend>
						<a>业务申请</a>
					</legend>
				</fieldset>
				<form class="layui-form" action="post" onsubmit="return false">
					<div class="layui-col-xs7" id="userForm">

						<input type="hidden" id="formId"> <input type="hidden"
							id="businessNo" value="">
						<div id="queryInfoTitle" class="mb30">
							<h3 class="f18 ib layui-blue">基本信息</h3>
							<hr class="layui-bg-blue">
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">经办人:</label>
							<div class="layui-input-block">
								<label class="label" id="agent"></label>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">业务描述:</label>
							<div class="layui-input-block">
								<textarea style="resize: none" name="remark"
									 lay-verify="maxLen" placeholder="请输入业务描述" value=""
									class="layui-textarea" id="remark"></textarea>
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

					<div class="layui-row mt30">
						<div class="layui-col-sm12">
							<h3 class="f18 ib layui-blue">附件上传</h3>
							<!-- <p class="ib gray">
						（<span class="layui-badge-dot layui-bg-danger mr5"></span>为必传项 <span
							class="layui-badge-dot layui-bg-blue mr5"></span>为已传项）
					</p> -->
							<p class="ib fr" id="addAttachment"
								onclick="addAttachment('all')">
								<i class="layui-icon vm" style="font-size: 26px;">&#xe61f;</i> <span>添加其他附件</span>
								<span class="f12 gray mt5">（最多上传十个其他附件）</span>
							</p>
							<hr class="layui-bg-blue">
							<ul class="prl4" id="attachmentListCon">
								<script id="attachmentListTpl" type="text/html">
						{{#  layui.each(d, function(index, item){ }}
							<li class="clearfix cl mb10" data-checktype="{{item.checkType}}" data-id="{{item.id}}" data-otherFlag="otherFile{{item.displayOrder}}" data-attachmentid="{{item.docId}}"><p class="fl layui-elip" style="width:70%">
								{{# if(item.checkType=="1"){ }}
									<span class="layui-badge-dot layui-bg-danger mr5"></span>
								{{# }else{ }}
										<span class="layui-badge-dot layui-bg-white mr5"></span>
								{{# } }}
								<em class="fn">{{item.displayOrder}}</em>.<em class="fileName fn">{{item.filetypeName}}</em>
							</p>
							<div class="btn-group fr">
								<a href="" class="layui-btn layui-btn-xs checkBtn">
									<i class="layui-icon">&#xe64a;</i>查看附件
								</a>
						
								<div type="button"class="layui-btn layui-btn-normal layui-btn-xs pr">
									<i class="layui-icon">&#xe67c;</i>上传附件
									<input type="file" name="file" class="upload-file pa" id="File{{item.displayOrder}}" onchange=ajaxFileUpload("File{{item.filetypeIndex}}",'','all')>
								</div>
								<button type="button" class="layui-btn layui-btn-danger layui-btn-xs deleteBtn" onclick="delAttachment(this)"><i class="layui-icon"></i>删除附件</button>

							</div></li>
						{{#}); }}						
						{{#  if(d.length === 0){ }}
    						<li class="tc m0 nothing" id="nothingCon"><img src='${ctx}/static/images/noFound.png' style='width:75px'><p class="f14 gray">暂无必传附件</p></li>
						{{#  } }} 
					</script>
							</ul>
							<div class="mt40 mb20 tc">
								<button class="layui-btn layui-btn-primary w100 none"
									onclick="freshen()" id="backBtn">返回</button>
								<button class="layui-btn layui-btn-normal w100" id="saveBtn"
									lay-submit lay-filter="applyFormSave" id="saveBtn">保存</button>
								<input type="button" class="layui-btn w100" lay-submit
									lay-filter="applyFormStartup" value="启动流程"
									id="applyFormStartupBtn">
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src='${ctx}/static/js/bank/specialJianGuan/specialApply.js'></script>
</body>
</html>




