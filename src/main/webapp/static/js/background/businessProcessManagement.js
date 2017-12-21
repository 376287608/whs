/**
 * Created by Administrator on 2017/10/11. 流程列表
 */
var laypage = '';
var $ = "";
var form="";
var Level = '2';
var flag = '';// 添加，更新标记
var Id='';//流程序号
var businessCount='';
var newbusinessCount='';
layui
		.use(
				[ 'table', 'laytpl', 'jquery', 'laypage', 'layer', 'form' ],
				function() {
					laypage = layui.laypage;
					$ = layui.jquery;
					form=layui.form;
					var table = layui.table, laytpl = layui.laytpl, layer = layui.layer, form = layui.form;
					var option = {
						id : 'dataGrid',
						url : ctx + "/process/getProcessList",
						method : 'post',
						elem : '#newTable',
						cols : [ [ {
							field : 'processName',
							title : '流程名称',
							width : '15%',
							event : 'newlayer',
							style : 'cursor: pointer;',
							templet : '<div>{{format(d.processName)}}</div>'
						}, {
							field : 'remarks',
							title : '流程描述',
							width : '15%',
							templet : '<div>{{format(d.remarks)}}</div>'
						}, {
							field : 'verifyLevel',
							title : '审核层级',
							width : '15%',
							templet : '<div>{{format(d.verifyLevel)}}</div>'
						}, {
							field : 'updateBy',
							title : '创建人',
							width : '15%',
							templet : '<div>{{format(d.updateBy)}}</div>'
						}, {
							field : 'updateDate',
							title : '创建日期',
							width : '7%',
							sort : true,
							templet : '<div>{{getMyDate(d.updateDate)}}</div>'
						}, ] ],
						even : true,
						request : {
							pageName : 'pageNumber',
							limitName : 'pageSize',
							status : 0
						},
						response : {
							statusName : 'success',
							statusCode : 'true',
							dataName : 'rows'
						},
						page : true,
						limit : 10,
						limits : [ 10, 20, 30, 50, 100 ]
					};
					table.render(option);
				
					// 监听流程列表点击进入详情
					table.on('tool(dataGrid)', function(obj) {
						var data = obj.data;
						Id = data.id;//流程序号
						$("#id").val(Id);
						flag='2';//标记修改流程
						if (obj.event === 'newlayer') {
							$("#ProcessMInfoCon").removeClass("none").addClass(
									"layui-anim layui-anim-up");							
							$("#ProcessMListCon").addClass("none");
							//删除按钮显示
							$("#delApprovalLevelBtn").removeClass("none")
						}
						//获取审核层级
						getApprovalLevel();
						//流程详情
						getProcessInfo(Id);
						// 关联业务列表
						//ProcessAndBusiness(Id)
						
						
					});
					//新建流程
					$("#addProcessBtn").click(
							function() {
								$("#ProcessMInfoCon").removeClass("none")
										.addClass("layui-anim layui-anim-up");
								$("#ProcessMListCon,#ProcessAndBusinessBtn").addClass("none");
								flag='1';//标记新建流程
								getApprovalLevel()
								ApprovalLevel(Level);
								getGtRole('', "#role1");
					})

					// 监听审核层级下拉菜单
					form.on('select(ApprovalLevel)', function(data) {
						Level = data.value;
						//修改审核层级----设置步骤联动
						ApprovalLevel(Level);
						//初始化步骤的角色列表
						getGtRole('', "#role1");						
					});

					// 监听设置角色下拉菜单----联动下一个菜单列表项目
					form.on('select(GtRole)', function(data) {
						var id = data.value;
						var thisId = +$(data.elem).data("id");
						var nextId = thisId + 1;
						if (thisId < +Level) {
							getGtRole(id, "#role" + nextId)
						}

					});
					
					
					
					// 提交功能----1添加流程，2更新流程
					form.on('submit(submitApprovalLevelBtn)', function(data){	
						_this=$(this);
						$("#verifyLevel").val();
						var dataProStepList=new Array();						
						$("#stepCon select").each(function(index,ele){
							var Id=$(this).data("id")
							var stepName='步骤'+Id;
							var stepOrder=Id;
							var approvalRoleId=$(this).val();
							var approvalRoleName=$(this).find("option:selected").text();
							if(approvalRoleId=='null'||approvalRoleId==null){
								layer.msg("请设置步骤", {	  
									icon : 5,
									anim : 6,
									offset: '200px'
								});
								return selectflag=false;
							}else{
								var jsonObj={};
								jsonObj["stepName"]=stepName;//环节名称
								jsonObj["stepOrder"]=stepOrder;//步骤顺序
								jsonObj["approvalRoleId"]=approvalRoleId;//审批角色ID
								jsonObj["approvalRoleName"]=approvalRoleName;// 审批角色名称
								dataProStepList.push(jsonObj);
								return selectflag=true;
							}
							
						});
						
						var dataProStepList = JSON.stringify(dataProStepList);
						if(selectflag==true){
						$.ajax({
							type : "post",
							async : false,
							url : ctx+ "/process/addOrUpdateProcess",
							dataType : "json",
							data : {
								"processId" : $("#id").val(),
								"processName" : $("#processName").val(),
								"verifyLevel" : $("#verifyLevel").val(),
								"remarks" : $("#remarks").val(),
								"flag" : flag,
								"proStepList" :dataProStepList
							},
							success : function(data) {
								if(data.success=="true"){
									successTip(data);
									if(flag=="1"){
										setTimeout(function(){
											//新建流程设置关联业务
											Id=data.processId;
											ProcessAndBusiness(Id);
										},1000);
										
									}
									
								}else{
									errorTip(data);
								}
							},
							error : function(data) {
							}
						});
						}
					  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
		  
					});	
					
				//查看关联业务列表
				$("#ProcessAndBusinessBtn").click(function() {
					ProcessAndBusiness(Id)
				});
			
					// 审核层级赋值
					function getApprovalLevel() {
						$.ajax({
									type : "post",
									async : false,
									url : ctx + "/system/role/getApprovalLevel",
									dataType : "json",
									success : function(data) {
										var getTpl = ApprovalLevelTpl.innerHTML, view = document
												.getElementById('verifyLevel');
										laytpl(getTpl).render(data.rows,
												function(html) {
													view.innerHTML = html;
												});
										form.render('select');
										ApprovalLevel(Level)
									},
									error : function(data) {
									}
								});
					}

					// 获取角色
					function getGtRole(roleid, ele) {
						$.ajax({
							type : "post",
							async : false,
							url : ctx + "/system/role/getGtRole",
							dataType : "json",
							data : {
								id : roleid
							},
							success : function(data) {
								if (data.success == "true") {
									var data = data.rows;
									var len = data.length;
									var htmls = '';
									for (i = 0; i < len; i++) {
										htmls += '<option value=' + data[i].id
												+ '>' + data[i].name
												+ '</option>'
									}
									$(ele).html(htmls)
									form.render('select');

								} else {
									errorTip(data)
								}

							},
							error : function(data) {
							}
						});
					}
					
					//审核层级
					function ApprovalLevel(len) {
						var htmls = '';
						var roleId = '';
						for (i = 0; i < len; i++) {
							if (i != 0) {
								htmls += '<div class="layui-form-mid">-</div>'
							}
							var j = i + 1;
							htmls += '<div class="layui-input-inline mb10" style="width: 135px;">'
							htmls += '<select id="role' + j + '" data-id=' + j
									+ ' lay-filter="GtRole"></select></div>'
						}
						$("#stepCon").html(htmls);
			
						form.render('select');
					}
					
					// 查看流程详情
					function getProcessInfo(id) {
						$.ajax({
							type : "post",
							async : false,
							url : ctx + "/process/getProcessInfo",
							dataType : "json",
							data : {
								id : id
							},
							success : function(data) {
								if (data.success == "true") {
									var item = data.item;
									var proSteps=data.proSteps;
									Level= item.verifyLevel;
									ApprovalLevel(Level);
									$.each(item,function(index,ele){
										$("#"+index).val(ele);										
									});
									
									$.each(proSteps,function(index,ele){
										var approvalRoleId=ele.approvalRoleId;
										getGtRole('', "#role" + ele.stepOrder);										
										$("#role"+ele.stepOrder).val(approvalRoleId);
									});
								
									form.render('select');
									

								} else {
									errorTip(data)
								}

							},
							error : function(data) {
							}
						});
					}

					//---------------业务列表------------------					
					exportIds = new DataSet();
					// 提交所选业务
					$("#confirmbusinessBtn").click(function() {
						confirmbusiness(exportIds);
					});
							
					//流程关联业务列表
					function ProcessAndBusinesss(id){						
						/* 渲染数据 */
						var optionBusiness = {
							id : 'dataGridBussiness',
							url : ctx + '/process/getProcessAndBusiness',
							method : 'post',
							where : {
								"id" : id,	
							},
							elem : '#bussinessTable',
							cols : [ [ 							           
							{
								checkbox : true,
								
							}, {
								field : 'id',
								title : '业务编号',
								width : '20%'
							}, {
								field : 'businessName',
								title : '业务名称',
								width : '70%'
							} ] ],
							even : true,
							request : {
								pageName : 'pageNumber',
								limitName : 'pageSize'
							},
							response : {
								statusName : 'success',
								statusCode : 'true',
								dataName : 'allEndBusiness'
							},
							done : function(res) {

								var theData = res.allEndBusiness;
								for (var i = 0; i < theData.length; i++) {								
									if (exportIds.has(theData[i].id)) {
										var rs = $('.layui-table-body:eq(1).layui-table-main table tr:eq('+i+')');				
										$.each(rs, function(index, e) {
											e.children[0].children[0].children[1].click();
										});	
									}
																		
								}
								console.log(exportIds);
							},
							page : true,
							limit : 10,
							limits : [ 10, 20, 30, 50, 100 ]
						};
						table.render(optionBusiness);
						$("#ProcessMInfoCon").addClass("none");
						$("#typeListCon").addClass("layui-anim-up").removeClass("none");
					}
					
					//流程关联业务列表
					function ProcessAndBusiness(id){						
						/* 渲染数据 */
						$.ajax({
				            url: ctx + '/process/getProcessAndBusiness',
				            type: "post",
				            dataType: "json",
				            data:{
				            	'id':Id,
				            	"pageNumber" : 1,
								"pageSize" : 100,
				            },
				            success: function (data) {
				                if (data.success == 'true') {
				                	//关联业务数
				                	businessCount=data.businessCount;								
									newbusinessCount=businessCount;	
									$("#businessCount").text(newbusinessCount);
									//已关联的业务存入数组
									var theData = data.allEndBusiness;
									for (var i = 0; i < theData.length; i++) {
										var isChecked=theData[i].checked;
										if(isChecked=='true'){
											exportIds.add(theData[i].id);	
										}
									}
									ProcessAndBusinesss(id);
									//渲染表格
				              /*  	var getTpl=bussinessTableTpl.innerHTML,
				                	view=document.getElementById("bussinessTable");
				                	laytpl(getTpl).render(data.allEndBusiness,function(html){
				                		view.innerHTML=html;
				                	})
				                	changeStaticTable();
				                	$("#ProcessMInfoCon").addClass("none");
									$("#typeListCon").addClass("layui-anim-up").removeClass("none");*/
				                	
				                } else {
				                	errorTip(data);
				                }
				            },
				            error: function (data) {
				            	errorTip(data);
				            }
				        });										
					}
					
					//转换静态表格
					function changeStaticTable(){				
		               	table.init('dataGridBussiness', {
		                	   height: '475' //高度最大化减去差值 //设置高度
		                	  ,limit: 10 //
		                	  ,loading:true
		                	  ,page:true
		                	  //支持所有基础参数
		                	});
					}		
					//监听业务checkbox
					table.on('checkbox(dataGridBussiness)', function(obj) {
						if (obj.type == 'all') {
							//全选
						var checkStatus = table.checkStatus('dataGridBussiness');	
						if (obj.checked) {
							for (e in checkStatus.data) {
								exportIds.add(checkStatus.data[e].id);									       
							}

							$("#confirmbusinessBtn").attr("disabled",false).removeClass("layui-btn-disabled");
						} else {
							//当前页全不选
							 var rs = $('.layui-table-body:eq(1).layui-table-main table tr');				
								$.each(rs, function(index, e) {			
										var delId=$(e).find('.laytable-cell-2-id').text();
										exportIds.remove(delId);
								})	
	
							console.log(exportIds.toString());
						}
						
					}else {
							if (obj.checked) {
								exportIds.add(obj.data.id);
								console.log(exportIds.toString());
							} else {
								exportIds.remove(obj.data.id);
								console.log(exportIds.toString());
							}
							$("#confirmbusinessBtn").attr("disabled",false).removeClass("layui-btn-disabled");
							var checkLen=exportIds.size();		
						}	
						//勾选业务数计算
						var str=exportIds.toString();
						var reg = new RegExp(",undefined");
						var str = str.replace(reg,"");
						var strArr=str.split(",");
						$("#businessCount").text(strArr.length);
					});
					
					//提交关联业务
					function confirmbusiness(exportIds) {	
							_this=$(this);
				        	if(exportIds.size() < 1){
				        		layer.msg("请选择要关联的业务", {
				        			icon : 5,
				        			anim : 6,
				        			offset: '200px'
				        		});	
				        		return false;
				        		}
				        	var str=exportIds.toString();
							var reg = new RegExp(",undefined");
							var str = str.replace(reg,"");
											        	
						    	$.ajax({
						            url: ctx + '/process/setProcessAndBusiness',
						            type: "post",
						            dataType: "json",
						            data:{
						            	'id':Id,
						            	'businessIds': str   			
						            },
						            success: function (data) {
						                if (data.success == 'true') {
						                	successTip(data);
						                	setTimeout(function(){
						                		freshenlocation();
											},1500);
						                	_this.attr("disabled",true).addClass("layui-btn-disabled");
						                } else {
						                	errorTip(data);
						                }
						            },
						            error: function (data) {
						            	errorTip(data);
						            }
						        });
				        		
						}
					//删除流程
					$("#delApprovalLevelBtn").click(function(e){
						$("#delProcessBtn").removeClass("none")
						var _this=$(this);
						$.ajax({
							type : "post",
							async : false,
							url : ctx + "/process/deleteProcessByIds",
							dataType : "json",
							data : {
								ids : Id
							},
							success : function(data) {
								if (data.success == "true") {
									successTip(data);		
				                	setTimeout(function(){
				                		freshenlocation();
									},1500);
				                	_this.attr("disabled",true).addClass("layui-btn-disabled");
				                	e.stopPropagation();
								} else {
									errorTip(data)
								}
							},
							error : function(data) {
								errorTip(data)
							}
						});
					});
					
					//一键解绑					
					$("#delProcessBtn").click(function(e){
						$.ajax({
				            url: ctx + '/process/setProcessAndBusiness',
				            type: "post",
				            dataType: "json",
				            data:{
				            	'id':Id,
				            	'businessIds':''    			
				            },
				            success: function (data) {
				                if (data.success == 'true') {
				                	successTip(data);
				                	setTimeout(function(){
				                		layer.closeAll();
				                		backInfo();
					                	$("#ProcessAndBusinessBtn").addClass("none");
				                	},1500);
				                } else {
				                	errorTip(data);
				                }
				            },
				            error: function (data) {
				            	errorTip(data);
				            }
				        });
					});
					//返回设置流程页
				 backInfo=function(){
					$("#ProcessMInfoCon").removeClass("none").addClass("layui-anim layui-anim-up")
                	$("#typeListCon").addClass("none");
				}	
				});
