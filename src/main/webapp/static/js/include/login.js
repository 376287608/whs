var form='';
layui.use(['jquery','layer','form','laytpl','laypage'], function(){
	  form = layui.form; 
			  var $=layui.jquery,
			  	  laytpl=layui.laytpl,
                  layer = layui.layer,
                  laypage=layui.laypage;
                  $.idcode.setCode();
                 // var userUrl=pathName();
                  var error = $("#error").val();
                  var loginError = $("#loginError").val();
                  if(error == "org.apache.shiro.authc.AuthenticationException"){
                	  layer.msg("用户名不存在，请重试", {icon: 5,anim: 6});
                  }else if(error == "org.apache.shiro.authc.IncorrectCredentialsException"){
                	  layer.msg("帐号或密码错误，请重试", {icon: 5,anim: 6});
                  }
                  if(loginError != ""){
                	  layer.msg(loginError, {icon: 5,anim: 6});
                  }
                  
			  
			  $(".layui-list li").click(function(){
			        var ruleId=$(this).data('id');
			        var ruleType=$(this).data('type');
			        var url='../guides/getGuidesInfo?ruleType='+ruleType+'&id='+ruleId+'';
			        window.location.href = url;
			    });
			  	//	办事指南
              publicGuidesList();
			  	//监听提交
			  form.on('submit(formDemo)', function(data){
			  	var IsBy = $.idcode.validateCode(); 
			   if(IsBy){
			   	$("#Txtidcode").removeClass("layui-form-danger");
			   }else{
                   layer.msg('验证码错误', {icon: 5,anim: 6});
                   $("#Txtidcode").focus().addClass("layui-form-danger");
                   return false;
			   }
			  });
				//忘记密码
			  $("#forgetPwd").click(function(){
				  //获取路径判断用户
				  if(window.location.pathname== ctx+'/company/login'){
					  var content='企业用户如果遗失密码，可通过传真方式将企业联系电话、联系邮箱及相关企业资质证明发送给银行，银行核对后重置密码，将初始密码通过传真中的联系邮箱发送给企业。'
				  }else{
					  var content='银行用户如果遗失，请联系管理员。'
				  }
                  layer.open({
                      skin: 'demo-class',
                      title: '温馨提示',
                      area: ['500px'],
					  content:content });

			  });
			 
			 
			  
			    /**
				 * 公共办事指南
				 */
				function publicGuidesList(){
					var url = window.location.href ;
			    	//银行登录页面
			    	if(url.indexOf("company") == -1){
			    		return false ;
			    	}
					$.ajax({
			  		  type: "POST",
			  		  async: false,
			  		  url:  ctx+"/guides/ajaxGuidesList",
			  		  data:{pageNumber:1,pageSize:10},
			  		  dataType: "json",
			  		  success: function(data){
			  			  var datas = new Array() ;
		    			  var rows = data.rows ;
		    			  for(var i=0;i<rows.length;i++){
		    				  var temp = {
		    						  		"id" : rows[i].id,
		    						  		"type" : rows[i].type,
		    						  		"info" : rows[i].guidesName 
		    						  		
		    				  			 }
		    				  datas.push(temp);
		    			  }
				    		giveData(datas,data.count);
			  		  },
			  		  error: function(e){
			  			  console.log(e);
			  		  }
					});
				}
				
				/**
			     * 填充数据
			     */
			    function giveData(datas,count){
			    	 //填充数据
			        var getTpl = Tpl.innerHTML,
			            view = document.getElementById('TplCon');
			            laytpl(getTpl).render(datas, function(html){
			            view.innerHTML = html;
			        });
			    }


});


