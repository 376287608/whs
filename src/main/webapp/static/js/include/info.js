/**
 * Created by Administrator on 2017/10/11.
 */
layui.use(['form','jquery'], function () {
    var form = layui.form,
        layer = layui.layer,
        $ = layui.jquery;
    
    //给下拉列表赋值
    initCard();
    //更新渲染
    form.render('select');
    
  //自定义验证规则
    form.verify({
  	  //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
      //电话验证
  	  phone: [
  	    /^[\w-]{1,11}$/
  	    ,'联系电话填写有误，请检查录入数据是否正确'
  	  ]
  	});
    
    //监听提交
    form.on('submit(formDemo)', function (data) {
//        layer.msg(JSON.stringify(data.field));
        var mydata = updateUser(data.field) ;
        layer.msg(mydata.message);
        if(mydata.flag == '1'){//修改资料成功
        	//3s后返回首页
        	setTimeout(function(){
        		parent.layer.closeAll(); 
    		},3000) ;
        }else{
        	//注册失败
        	return false;
        }
        return false;
    });
  //编辑切换
    $(".layui-form").find("input").attr("disabled", true);
    $("#queryInfoEdit").click(function () {
        var type=$(this).data('type');
        if(type=='edit'){
            $(this).data("type","complete").html("<i class='layui-icon f20'>&#xe609;</i> 完成");
            $(".layui-form").removeClass("layui-input-disabled").find("input").attr("disabled", false);
            $("#BtnCon").removeClass("none")
        }else{
            $(this).data("type","edit").html("<i class='layui-icon f20'>&#xe642;</i> 编辑");
            $(".layui-form").addClass("layui-input-disabled").find("input").attr("disabled", true);
            $("#BtnCon").addClass("none")
        }
    })
    
    /**
     * 设置下拉列表值
     */
    function initCard(){
    	$("#credentialsType").val($("#cardType").val()); 
    }
    
    /**
     * 修改用户资料
     */
    function updateUser(value){
    	var mydata ;
    	$.ajax({
  		  type: "POST",
  		  async: false,
  		  url: "ajaxUpdateUser",
  		  data:value,
  		  dataType: "json",
  		  success: function(data){
  			  console.log(data);
  			  mydata = data;
  		  },
  		  error: function(e){
  		  }
    	});
    	return mydata ;
    }

});


