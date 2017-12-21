layui.use(['form', 'jquery'], function () {
    var form = layui.form,
        upload = layui.upload,
        layer = layui.layer,
        $ = layui.jquery;
    
  //自定义验证规则
    form.verify({
  	  //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
      //密码验证
  	  password: [
  	    /^[[a-zA-Z0-9]{6,14}$/
  	    ,'新密码录入有误'
  	  ]
    //value：表单的值、item：表单的DOM对象
    //密码确认
    ,repwd:function(value, item){
    	if(!/^[a-zA-Z0-9]{6,14}$/.test(value)){
    		return "新密码录入有误";
    	}
    	var pwd = $("#password").val();
    	if(pwd != value){
    		return "新密码录入有误";
    	}
    }
    ,oldPwd: function(value, item){
    	if(!/^[a-zA-Z0-9]{6,14}$/.test(value)){
    		return "密码错误";
    	}
    	var message = ajaxCheckPwd(value);
   	 	if(message.substring(0,1) == '0'){
   		 return message.substring(2);
   	 }
    }
  	});
    
    //监听提交
    form.on('submit(formDemo)', function (data) {
//        layer.msg(JSON.stringify(data.field));
    	var mydata = updatePwd(data.field) ;
        layer.msg(mydata.message);
        if(mydata.flag == '1'){//修改成功
        	//3s后跳转到登陆页面
        	setTimeout(function(){
        		if(mydata.userType == '1'){
        			window.parent.location.href = "../../bank/login";
        		}else{
        			window.parent.location.href = "../../company/login";
        		}
    		},3000) ;
        	return false;
        }else{
        	//修改失败
        	return false;
        }
    });
    
    /**
     * 修改密码
     */
    function updatePwd(value){
    	var mydata ;
    	$.ajax({
  		  type: "POST",
  		  async: false,
  		  url: "ajaxUpdatePwd",
  		  data:value,
  		  dataType: "json",
  		  success: function(data){
  			  mydata = data;
  		  },
  		  error: function(e){
  		  }
    	});
    	return mydata ;
    }
    
    /**
     * 检查原密码是否正确
     */
    function ajaxCheckPwd(oldPwd){
    	var message ;
    	$.ajax({
    		  type: "POST",
    		  async: false,
    		  url: "ajaxCheckPwd",
    		  data:{oldPwd:oldPwd},
    		  dataType: "json",
    		  success: function(data){
    			  message = data.message ;
    		  },
    		  error: function(e){
    		  }
      	});
    	
    	return message;
    }


});
