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
<!--业务查询-->
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
		<div id="queryInfo" class="mb50">
			<div class="layui-row mt30">
				<fieldset class="layui-elem-field layui-field-title site-title">
					<legend>
						<a>业务申请</a>
					</legend>
				</fieldset>
				<div class="layui-col-xs7" id="userForm">
					<form class="layui-form layui-input-disabled" action="post"
						onsubmit="return false">
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
						<div class="fr mb20" style="margin-right: 5%">
							<a href="javascript:;" class="ib layui-blue none"
								id="queryInfoEdit" data-type="edit"> <i
								class="layui-icon f20">&#xe642;</i> 编辑
							</a>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">联系人:</label>
							<div class="layui-input-block">
								<input type="text" name="registerName" required
									lay-verify="required" placeholder="请输入联系人姓名" autocomplete="off"
									class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">联系电话:</label>
							<div class="layui-input-block">
								<input type="text" name="phone" required lay-verify="required"
									placeholder="请输入联系电话" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">联系邮箱:</label>
							<div class="layui-input-block">
								<input type="text" name="email" required lay-verify="required"
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

					</form>
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

								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="layui-row mt30">
				<div class="layui-col-sm12">
					<h3 class="f18 ib layui-blue">附件上传</h3>
					<p class="ib gray">
						（<span class="layui-badge-dot layui-bg-danger mr5"></span>为必传项
						<span class="layui-badge-dot layui-bg-blue mr5"></span>为已传项
						<span class="layui-badge-dot layui-bg-orange mr5"></span>为审核未通过项
						<span class="layui-badge-dot layui-bg-green mr5"></span>为审核通过项 						
						）
					</p>
					<p class="ib fr none" onclick="addAttachment()" id="addAttachment">
						<i class="layui-icon vm" style="font-size: 26px;">&#xe61f;</i> <span>添加其他附件</span>
						<span class="f12 gray mt5">（最多上传十个其他附件）</span>
					</p>

					<hr class="layui-bg-blue">
					<ul class="prl4" id="attachmentListCon">
						<script id="attachmentListTpl" type="text/html">
						{{#  layui.each(d, function(index, item){ }}
								{{# if(item.otherFlag!=null){ }}
									{{# var other='otherAttachement';}}
									{{# var delBtn='<button type="button"class="layui-btn layui-btn-danger layui-btn-xs deleteBtn" onclick="delAttachment(this)"><i class="layui-icon">&#xe640;</i>删除附件</button>'}}
								{{# }else{ }}
									{{# var other=''; }}
									{{# var delBtn='';}}
									{{# } }}
									
    							<li class="clearfix cl mb10 {{other}}" data-checktype="{{item.checkType}}" data-id="{{item.docType}}" data-otherFlag="{{item.otherFlag}}" data-attachmentid="{{item.docId}}"><p class="fl layui-elip" style="width:70%">
								{{# if(item.docId==''||item.docId==null){ }}
									<span class="layui-badge-dot layui-bg-danger mr5"></span>
									<em class="fn">{{item.displayOrder}}</em>.<em class="fileName fn">{{item.filetypeName}}</em></p>
								<div class="btn-group fr">
									<a href="" class="layui-btn layui-btn-xs checkBtn none">
										<i class="layui-icon">&#xe64a;</i>查看附件
									</a>	
																					
								{{# }else{ }}
									{{# if(item.statu=="1"){ }}		
										<span class="layui-badge-dot layui-bg-blue mr5"></span>
									{{# }else if(item.statu=="2"){ }}				
										<span class="layui-badge-dot layui-bg-orange mr5"></span>
									{{# }else{ }}
										<span class="layui-badge-dot layui-bg-green mr5"></span>
									{{# } }}
									<em class="fn">{{item.displayOrder}}</em>.<em class="fileName fn">{{item.filetypeName}}</em></p>
								<div class="btn-group fr">
								{{# if(GetQueryString("status")=='待提交'){ }}
									{{delBtn}}
								{{#	} }}
								<a href="../attachment/down/{{item.docId}}/1" class="layui-btn layui-btn-xs checkBtn">
									<i class="layui-icon">&#xe64a;</i>查看附件
								</a>
	
								{{# } }}	
								{{# if(item.statu!="3"){ }}
								<button type="button"
									class="layui-btn layui-btn-normal layui-btn-xs pr">
									<i class="layui-icon">&#xe67c;</i>上传附件
									<input type="file" name="file" class="upload-file pa" id="File{{item.id}}" onchange=ajaxFileUpload("File{{item.id}}","{{item.otherFlag}}")>									
								</button>	
								{{#}}}
							</div>		
						</li>
						{{#}); }}						
						{{#  if(d.length === 0){ }}
    						<li class="tc m0 nothing" id="nothingCon"><img src='${ctx}/static/images/noFound.png' style='width:75px'><p class="f14 gray">暂无必传附件</p></li>
						{{#  } }} 
					</script>
					</ul>
					<div class="mt40 mb20 tc">
						<button class="layui-btn layui-btn-normal w100 none" id="saveBtn"
							lay-submit lay-filter="applyFormSave">保存</button>
						<button class="layui-btn w100 none" id="submitBtn" lay-submit
							lay-filter="applyFormSubmit">提交</button>
						<button class="layui-btn layui-btn-warm w100 none" id="recallBtn">撤销</button>
						<button class="layui-btn layui-btn-danger w100 none"
							id="cancelBtn">撤回</button>
					</div>
				</div>
			</div>
		</div>
	</div>
<script src='${ctx}/static/js/company/queryInfo.js'></script>
<script id="guidesTpl" type="text/html">
{{#  layui.each(d, function(index, item){ }}
	<li class="layui-elip" data-id="{{item.id}}">
		<span class="layui-badge-dot layui-bg-green mr5"></span> 
		<a  href="#" onclick="openRuleInfo('/guides/getGuidesInfo','办事指南','{{item.id}}')">{{item.guidesName}}</a>
		</li>
{{#  }); }}
{{#  if(d.length === 0){ }}
    	<li class="tc m0 nothing"><img src='${ctx}/static/images/noFound.png' style='width:75px'><p class="f14 gray">暂无数据</p></li>
{{#  } }} 
</script>
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
</body>
</html>


