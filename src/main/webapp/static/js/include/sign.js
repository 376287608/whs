/**
 * Created by Administrator on 2017/10/11.
 * 企业信息
 */
var form="";
var $ ="";
layui.use(['form', 'jquery','upload','laypage'], function () {
     	form = layui.form;
     	$ = layui.jquery;
     var upload = layui.upload,
        layer = layui.layer,     
        laypage=layui.laypage;
    //表单校验
    formVerify();
    //提交按钮
    $("#signBtnCon .layui-btn-normal").attr("disabled", true);
    
    $("#agree").click(function(){
    	 //页面层
        layer.open({
                type: 2,
                closeBtn: 1, //不显示关闭按钮
                offset:'100px',//弹出框坐标高度
                area: ['700px', '500px'], //宽高
                content: [ctx+'/system/agreement','no' ]
            });
    });
    
    //组织机构代码改变 则赋值给用户名称
    $("#orgBarcode").change(function(){
    	$("#title").val($("#orgBarcode").val());
    });
    //从统一社会信用代码中提取用户名
    $("#certificateCode").change(function(){
    	//组织机构代码为空 并且统一社会信用代码大于等于17位
    	if(($("#orgBarcode").val().length == 0) && $("#certificateCode").val().length>=17){
    		$("#title").val($("#certificateCode").val().substring(8, 17));
    	}
    });
        
 // 上传附件
    ajaxFileUpload = function(feid) {
    	 if (imgCheck(feid)) { 
    	$.ajaxFileUpload({
    		url : ctx + '/attachment/upload',// 用于文件上传的服务器端请求地址
    		secureuri : false,// 一般设置为false
    		fileElementId : feid,// 文件上传控件的id属性 <input type="file" id="upload"
    								// name="upload" />
    		dataType : 'text',// 返回值类型 一般设置为json
    		success : function(data, status) // 服务器成功响应处理函数
    		{
    			layer.msg('上传成功', {
    				icon : 6,
    				anim : 2,
    				offset: '200px'
    			});
    			data = $.parseJSON(jQuery(data).text());
    			$("#docId").val(data[0].fileId);
    			$("#docName").val(data[0].fileName);
				$("#docNameByuser").text($("#"+feid).val());
				$("#"+feid).val("").parent('button').text("图片已上传");
    		},
    		error : function(data, status, e)// 服务器响应失败处理函数
    		{
    			errorTip(data)
    		}
    	});
    	} 
    	return false;
    }
    function imgCheck(feid) { // 自己添加的文件后缀名的验证
    	var file = document.getElementById(feid);
    	return /.(png|jpg|bpm)$/.test($('#'+feid).val()) ? true : (function() {
    		layer.msg('仅支持.png,.jpg,.bpm格式的图片', {
    			icon : 5,
    			anim : 6,
    			offset: '200px'
    		});
    		return false;
    	})();
    }
    
    /**
     * 组织机构代码有效性校验
     */
    checkOrgBarcode = function (orgBarcode){
    	var message ;
    	$.ajax({
    		  type: "POST",
    		  async: false,
    		  url: "checkOrgBarcode",
    		  data:{orgBarcode:orgBarcode},
    		  dataType: "json",
    		  success: function(data){
    			  console.log(data);
    			  message = data.message ;
    		  },
    		  error: function(e){
    			  console.log(e);
    		  }
      	});
    	
    	return message;
    }
    
    //监听提交
    form.on('submit(formDemo)', function (data) {
//        layer.msg(JSON.stringify(data.field));
    	var mydata = registerCompany(data.field) ;
        if(mydata.flag == '1'){//注册成功
        	layer.msg(mydata.message, {icon: 6,anim: 6});
        	setTimeout(function(){
        		//返回登陆页
            	window.location.href = ctx+"/company/login";
            }, 3000);
        }else{
        	layer.msg(mydata.message, {icon: 5,anim: 6});
        	//注册失败
        	return false;
        }
    });
    
    form.on('checkbox(test)', function (data) {
        if (data.elem.checked == true) {
            $("#signBtnCon .layui-btn-normal").removeClass("layui-btn-disabled");
            $("#signBtnCon .layui-btn-normal").attr("disabled", false);
//            e.stopPropagation();
        } else {
            $("#signBtnCon .layui-btn-normal").addClass("layui-btn-disabled");
            $("#signBtnCon .layui-btn-normal").attr("disabled", true);
        }
    });
    
    /**
     * 注册用户
     */
    function registerCompany(value){
    	var mydata ;
    	$.ajax({
  		  type: "POST",
  		  async: false,
  		  url: "registerCompany",
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
