/*0:企业用户 1:互联网-银行 2:业务网-银行*/
var $='';
layui.use([ 'jquery', 'laytpl', 'element','layer','laypage','table'], function() {
	$ = layui.jquery;
	var laytpl = layui.laytpl, element = layui.element,layer=layui.layer,table=layui.table;
	
	/**
	 * 退出
	 */
	$("#logout").click(function(){
		var url = window.location.href ;
		var flag = "0" ;
		if(url.indexOf("bank") != "-1"){
			flag = "1" ;
		}
		$.ajax({
  		  type: "POST",
  		  async: false,
  		  url: $("#ctx").val()+"/company/logout",
  		  dataType: "json",
  		  success: function(data){
  			  if(flag == "0"){
  				  window.location.href = $("#ctx").val()+"/company/login";
  			  }else{
  			      window.location.href = $("#ctx").val()+"/bank/login";
  			  }
  		  },
  		  error: function(e){
  		  }
		});
	});
	
	/**
	 * 修改密码弹框 
	 */
	$("#updatePwd").click(function(){
		var index = layer.open({
					  type: 2,
					  content: $("#ctx").val()+'/system/user/updatePwd',
					  area: ['1300px', '600px'],
					  maxmin: true
					});
	});
	
	/**
	 * 修改资料弹框
	 */
	$("#updateCompany").click(function(){
		var index = layer.open({
					  type: 2,
					  content: $("#ctx").val()+'/company/updateUser',
					  area: ['1300px', '600px'],
					  maxmin: true
					});
	});
	
	Menu();
	function Menu() {
		$.ajax({
			url : $("#ctx").val()+'/system/resource/i/json',
			type : "post",
			dataType : "json",
			success : function(data) {
				layui.data('user', {
					  key: 'username'
					  ,value:data.type
					});
				if (data.type == "1") {
					// 银行数据填充
					var getTpl = menuBankTpl.innerHTML, view = document
							.getElementById('sideNav');
					laytpl(getTpl).render(data.rows, function(html) {
						view.innerHTML = html;
						element.init();
						$("#sideNav li:first").addClass("layui-nav-itemed");
						$.getScript(ctx+"/static/js/main/tab-bank.js");
						// 银行布局
						$(".layui-layout-left,#companyCon").html("");
						$(".layui-side,#bankCon").removeClass("none");
						$(".layui-body,.layui-footer").css("left", "200px");
					});
					
					$("#registerName").text(data.bankUser.name);
					$("#updateCompany").parent("dd").remove();
					 bankNotice()

				} else {
					// 企业数据填充
					var getTpl = menuCompanyTpl.innerHTML, view = document.getElementById('navLeft');
					laytpl(getTpl).render(data.rows,function(html) {
								view.innerHTML = html;	
								// 企业布局
								$("#navLeft li:first").addClass("layui-this");
								$(".layui-layout-left,#companyCon").removeClass("none");
								$(".layui-side,#bankCon").addClass("none");
								$(".layui-body,.layui-footer").css("left","0px");
								$.getScript(ctx+"/static/js/main/tab-company.js");								
							});
					$("#registerName").text(data.companyUser.registerName)
				}
				
				

			},
			error : function(data) {
				//layer.msg("")
			}
		});
	}
	function bankNotice(){
	//消息通知
	layui.use(['table', 'laytpl', 'jquery','laypage','layer'], function () {
	    laypage=layui.laypage;
	    var table = layui.table,
	        laytpl = layui.laytpl,
	        $ = layui.jquery,
	        layer = layui.layer;
	    var option = {
	        	id: 'dataGrid',
	    		url: ctx+"/message/ajaxMessageList",
	        	method: 'post',
	        	elem: '#newTable', 
	        	cols: [[      		
	        		{field: 'formCode', title:'申请编号', width: '20%',templet: '<div>{{d.formCode}}</div>'}, 
	        		{field: 'businessName', title:'申请名称', width: '30%'},
	        		{field: 'companyName', title:'企业名称', width: '20%'},
	        		{field: 'contantName', title:'联系人', width: '10%'},
	        		{field: 'submitTime', title:'申请时间', width: '20%',sort:true, templet: '<div>{{getMyDate(d.submitTime)}}</div>'}
	        	]], 	
	        	even: true, 
	        	request: {
	        		pageName: 'pageNumber', 
	        		limitName: 'pageSize'
	        	},
	        	response: {
	        		  statusName: 'success', 
	        		  statusCode: 'true', 
	        		  dataName: 'rows' 
	        	},
	        	page: true,
	        	limit: 10,
	        	limits: [10,20, 30, 50, 100]
	        };
		table.render(option);
		  //监听单元格事件
	   /* table.on('tool(dataGrid)', function(obj){   
	      var data = obj.data;
	      var formId=data.formId; 
	      var noticeId=data.id; 
	      var status=data.status2;
	      var typeId=data.businessId; 
	      if(obj.event === 'newlayer'){  	 
	    	  window.location.href=ctx+'/company/queryInfo?id='+formId+'&&status='+status+'&&typeId='+typeId+'&&form=index&&noticeId='+noticeId+'';
	      }
	    });*/
	
	});
	}
});