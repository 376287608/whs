/*清除输入框文本*/

clearTxt = function(target) {
	$(target).prev("input").val("");
}
// 刷新
freshen = function(url) {
	if(url==undefined||url==''){
		savehistoryUrl=document.referrer;
	}else{
		savehistoryUrl=url;
	}
	 layui.data('history', {
    	  key: 'historyUrl'
          	  ,remove: true
          	});
	layer.load(1);
	setTimeout(function() {
		location.replace(savehistoryUrl);
	}, 1500);

}
freshenlocation = function() {
	layer.load(1);
	setTimeout(function() {
		location.replace(location.href);
	}, 1500);

}


// 校验
formVerify = function() {
	// 自定义验证规则
	form.verify({
		// 密码验证
		password : [ /^[a-zA-Z0-9]{6,14}$/, '密码必须为6~14位的字母或数字' ],
		//九位数字
		nineNumber : [ /^[0-9]{9}$/, '企业代码必须为9位数字' ],
		// 电话验证
		maxLen:[/^[a-zA-Z0-9]{0,512}$/, '业务描述不可多余512个字符'],
		phone : [ /^[\w-]{1,11}$/, '联系电话填写有误，请检查录入数据是否正确' ]
		// value：表单的值、item：表单的DOM对象
		// 密码确认
		,
		repwd : function(value, item) {
			if (!/^[a-zA-Z0-9]{6,14}$/.test(value)) {
				return "密码必须为6~14位的字母或数字";
			}
			var pwd = $("#password").val();
			if (pwd != value) {
				return "新密码确认与新密码输入不一致";
			}
		},
		orgBarcode : function(value, item) {
			var certificateCode = $("#certificateCode").val();
			if (value == "" && certificateCode == "") {
				return "组织机构代码和统一社会信用代码不能都为空";
			}
			if (value != "") {
				if (value.length != 9) {
					return "组织机构代码填写有误，请检查录入数据是否正确";
				}
				// 组织机构代码有效性校验
				var message = checkOrgBarcode(value);
				if (message.substring(0, 1) == '0') {
					return message.substring(2);
				}
			}

		}
		// 统一社会信用代码验证
		,
		certificateCode : function(value, item) {
			if (value != "") {
				if (value.length != 18) {
					return "统一社会信用代码填写有误，请检查录入数据是否正确";
				}
				// 组织机构代码有效性校验
				value = value.substring(8, 17);
				var message = checkOrgBarcode(value);
				if (message.substring(0, 1) == '0') {
					return message.substring(2);
				}
			}
		},
		files : function(value, item) {
			if (value == "") {
				return "请上传附件";
			}
		}
	});

}

// 毫秒转化为时分秒 XXXX-XX-XX XX：XX：XX
getMyDate = function(str) {
	if(str=='undefined'|| str==undefined){
		return '--:--'
	}else{	
	var oDate = new Date(str), oYear = oDate.getFullYear(), oMonth = oDate
			.getMonth() + 1, oDay = oDate.getDate(), oHour = oDate.getHours(), oMin = oDate
			.getMinutes(), oSen = oDate.getSeconds(), oTime = oYear + '-'
			+ getzf(oMonth) + '-' + getzf(oDay) + ' ' + getzf(oHour) + ':'
			+ getzf(oMin) + ':' + getzf(oSen);// 最后拼接时间
	return oTime;
	}
}

// 时间补0操作
getzf = function(num) {
	if (parseInt(num) < 10) {
		num = '0' + num;
	}
	return num;
}

// 获取路径参数
GetQueryString = function(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if (r != null)
		return decodeURI(r[2]);
	return "";
}
// 获取路径
pathUrl = function() {
	var pathUrl = window.location.pathname;
	return pathUrl;
}

errorTip = function(data) {
	layer.msg(data.msg, {
		icon : 5,
		anim : 6,
		offset: '200px'
	});
}
successTip = function(data) {
	layer.msg(data.msg, {	  
		icon : 6,
		anim : 2,
		offset: '200px'
	});
}
// 转--
format = function(obj) {
	if (obj == '' || obj == 'undefined' || obj == 'null' || obj == null) {
		return '--';
	} else {
		return obj;
	}
}
// 生成唯一 uuid
uuid=function (len, radix) {
	  var chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'.split('');
	  var uuid = [], i;
	  radix = radix || chars.length;
	 
	  if (len) {
	   // Compact form
	   for (i = 0; i < len; i++) uuid[i] = chars[0 | Math.random()*radix];
	  } else {
	   // rfc4122, version 4 form
	   var r;
	 
	   // rfc4122 requires these characters
	   uuid[8] = uuid[13] = uuid[18] = uuid[23] = '-';
	   uuid[14] = '4';
	 
	   // Fill in random data. At i==19 set the high bits of clock sequence as
	   // per rfc4122, sec. 4.1.5
	   for (i = 0; i < 36; i++) {
	    if (!uuid[i]) {
	     r = 0 | Math.random()*16;
	     uuid[i] = chars[(i == 19) ? (r & 0x3) | 0x8 : r];
	    }
	   }
	  }
	 
	  return uuid.join('');
	}

/*---------------------------------业务类型树------------------------------*/
/**
 * 业务类型树
 */
 ajaxBubusinessList=function(){
	$.ajax({
		  type: "POST",
		  async: false,
		  url:  ctx+"/bubusiness/ajaxBubusinessList",
		  dataType: "json",
		  success: function(data){
			  var jsonArray = new Array();
			  for(var i=0;i<data.length;i++){
				  var json = {};
				  json.id = data[i].id ;
				  json.pid = data[i].pid ;
				  json.businessName = data[i].businessName ;
				  json.endNode = data[i].endNode ;
				  json.children = [] ;
				  jsonArray.push(json);
			  }
			  treeJson(jsonArray);
		  },
		  error: function(e){
			  layer.msg("请求异常");
		  }
  	});
	
}

/**
 * 生成业务类型树
 */
function treeJson(jsonArray){
	//记录上级节点id
	var record = new Array();
	//把末级节点放入父节点children中
	for(var i=0;i<jsonArray.length;i++){
		var temp = jsonArray[i];
		if(temp.endNode == "0"){
			for(var j=0;j<jsonArray.length;j++){
				if(temp.pid == jsonArray[j].id){
					jsonArray[j].children.push(temp);
					record.push(jsonArray[j].id);
					break ;
				}
			}
		}
	}
	//去重
	record = record.distinct();
	//console.log(record);
	var tempArray = new Array();
	while(record.length>0){
		for(var i=0;i<record.length;i++){
    		//找到此元素（元素在数组中的位置是元素id-1）
    		var temp = jsonArray[record[i]-1];
    		//此元素的pid
    		var pid = jsonArray[record[i]-1].pid ;
    		//父元素
    		var ptemp = jsonArray[pid-1] ;
    		//把子节点添加到父节点children集合中
    		ptemp.children.push(temp);
    		if(ptemp.pid != null){
    			tempArray.push(ptemp.id);
    		}
    	}
		record = tempArray ;
		tempArray = new Array();
	}
	//console.log(jsonArray);
	var jsonTree = new Array();
	for(var i=0;i<jsonArray.length;i++){
		//根节点
		if(jsonArray[i].pid == null){
			//去重后的集合
			var onlyOne = new Array();
			//记录元素id字符串 防止重复添加
			var str = "";
			//去掉根节点children集合重复的元素
			var children = jsonArray[i].children ;
			for(var j=0;j<children.length;j++){
				if(str.indexOf(children[j].id) == -1){
					onlyOne.push(children[j]);
					str = str + children[j].id + ",";
    			}
			}
			jsonArray[i].children = onlyOne ;
			jsonTree.push(jsonArray[i]);
		}
	}
	//console.log(jsonTree);
	typeList(jsonTree);
}
    
    // 业务类型显示
    function typeList(data){
      	        	var htmls='';
      	        	for(var i=0;i<data.length;i++){
      	        		//console.log("1级:"+data[i].businessName); 	
      	        		if(data[i].endNode=='1'){
      	        		htmls+='<li><div class="clearfix"><a >'+data[i].businessName+'</a>'
      	        		var children=data[i].children;	
      	        		htmls+='<dl class="leve-2">'
      	        			for(var j=0;j<children.length;j++){
      	        				//console.log(" 2级:"+children[j].businessName);
      	        				if(children[j].endNode=='1'){
      	        				htmls+='<dd><a>'+children[j].businessName+'</a>'
      		        			var childrenj=children[j].children;
      	        				htmls+='<dl class="leve-3">'
      	        					for(var k=0;k<childrenj.length;k++){	
     		        					//console.log("  3级:"+childrenj[k].businessName);	
     		        					if(childrenj[k].endNode=='1'){
     		        						htmls+='<dd><a>'+childrenj[k].businessName+'</a>';
     		        						var childrenk=childrenj[k].children;
     		        						htmls+='<dl class="leve-4">'
     		        						for(var h=0;h<childrenk.length;h++){
     		        							//console.log("   4级:"+childrenk[h].businessName);
     		        							if(childrenk[h].node=='1'){
     		        								htmls+='<dd><a>'+childrenj[k].businessName+'</a>';
     		        							}else{
     		        								htmls+='<dd><a class="layui-blue trageinfo" data-id="'+childrenk[h].id+'">'+childrenk[h].businessName+'</a></dd>';
     		        							}
     		        						}
     		        						htmls+='</dd>'
     		        					}else{
     		        						htmls+='<dd><a class="layui-blue trageinfo" data-id="'+childrenj[k].id+'">'+childrenj[k].businessName+'</a>';
     		        					}
     		        				}
      	        				
      	        				htmls+='</dd>'
      		        		}else{
      		        			htmls+='<dd><a class="layui-blue trageinfo" data-id="'+children[j].id+'">'+children[j].businessName+'</a>'
      		        		}	
      	        				htmls+='</dd>'
      	        		}
      	        		htmls+='</dl>'
      	        	
      	        	}else{
      	        		htmls+='<li><div class="clearfix"><a class="layui-blue trageinfo" data-id="'+data[i].id+'">'+data[i].businessName+'</a>'
      	        		
      	        	}
      	        		htmls+='</li>'
      	        }
      	        	$("#horizontalTree").html(htmls)
       }

    //申请表---附件列表
    fromAttachment=function(id){
    	$.ajax({
   	        url :  ctx+"/buAttachmentType/getBuAttachmentType",
   	        type : "post",
   	        dataType : "json",
   	        data:{
   	        	"businessId":id
   	        	},
   	        success : function(data) {
   	     	 //附件数据填充	
   	        	successAttachmentList(data);
   	        },
   	        error : function(data) {
   	        	layer.msg("请求异常");
			}
    	 });
    }

    /**
     * 数组扩展方法：去重
     */
    Array.prototype.distinct = function(){
   	 var res = [];
   	 var json = {};
   	 for(var i = 0; i < this.length; i++){
   	  if(!json[this[i]]){
   	   res.push(this[i]);
   	   json[this[i]] = 1;
   	  }
   	 }
   	 return res;
   }

    openRuleInfo=function(url,type,id){
        var Index=layer.open({
            type: 2,
            title:' ',
            closeBtn: 1, //涓嶆樉绀哄叧闂寜閽�
            area: ['300px', '500px'], //瀹介珮
            content: [ctx+url+'?type='+type+'&&id='+id,'no' ]
        });
        layer.full(Index);
    } 

/*---------------------------------附件------------------------------*/

// 上传附件
ajaxFileUpload = function(feid, otherid,type) {
	//feid 文件id;otherid 文件数,type 上传文件类型
	 if (fileCheck(feid,type)) { 
	$.ajaxFileUpload({
		url : ctx + '/attachment/upload',// 用于文件上传的服务器端请求地址
		secureuri : false,// 一般设置为false
		fileElementId : feid,// 文件上传控件的id属性 <input type="file" id="upload"								// name="upload" />
		dataType : 'text',// 返回值类型 一般设置为json
		success : function(data, status) // 服务器成功响应处理函数
		{
			layer.closeAll();
			layer.msg('上传成功', {
				icon : 6,
				anim : 2,
				offset: '200px'
			});
			data = $.parseJSON(jQuery(data).text());		
			// 上传完毕回调
			$("#"+feid).parents("li").find(".layui-badge-dot")
					.addClass("layui-bg-blue")
			$("#"+feid).parents("li").attr('data-id', data[0].id);
			$("#"+feid).parents("li").attr('data-otherflag',otherid);
			$("#"+feid).parents("li").attr('data-attachmentId',
					data[0].fileId);
			$("#"+feid).parents(".btn-group").find(".checkBtn")
					.removeClass("none").attr('href',
							'/whs/attachment/down/' + data[0].fileId + '/1');
			$("#"+feid).parents('li.otherAttachement').find(".fileName").text(data[0].fileSrcName)
			$("#"+feid).val("");
		},
		error : function(data, status, e)// 服务器响应失败处理函数
		{
			errorTip(data)
		}
	});
	} 
	return false;
}
function fileCheck(feid,fileType) { // 自己添加的文件后缀名的验证
	var file = document.getElementById(feid);
	if(fileType==''||fileType==undefined||fileType=='undefined'||fileType=='pdf'){
		return /.(pdf)$/.test($('#'+feid).val().toLowerCase()) ? true : (function() {
			layer.msg('仅支持.pdf格式的文件', {
				icon : 5,
				anim : 6,
				offset: '200px'
			});
			return false;
		})();
	}else if(fileType=='all'){
		return /.(pdf|doc|docx|txt|xls|xlsx)$/.test($('#'+feid).val().toLowerCase()) ? true : (function() {
			layer.msg('仅支持.pdf,.doc,.txt,.xls,.png,jpg,.jpeg,.bmp格式的文件', {
				icon : 5,
				anim : 6,
				offset: '200px'
			});
			return false;
		})();
	}
	
}
/* 添加其他附件 */
var otherLen = 0;
var fileLen = 0;
var baseLen = 0;
addAttachment = function(type) {
	$("#nothingCon").remove();
	otherLen = $("#attachmentListCon .otherAttachement").length;
	baseLen = $("#attachmentListCon li").length;
	var uuids=uuid(8,16);
	var htmls = '';
	if (otherLen < 10) {
		baseLen++;
		fileLen++;
		htmls += '<li class="clearfix cl mb10 otherAttachement">'
		htmls += '<p class="fl layui-elip" style="width:70%"><span class="layui-badge-dot layui-bg-white mr5"></span><em class="fn">'+baseLen+'</em>.<em class="fileName fn">其他附件</em></p>';
		htmls += '<div class="btn-group fr">';
		htmls += ' <button type="button"class="layui-btn layui-btn-danger layui-btn-xs deleteBtn" onclick="delAttachment(this)"><i class="layui-icon"></i>删除附件</button>';
		htmls += ' <a href="" class="layui-btn layui-btn-xs checkBtn none"><i class="layui-icon"></i>查看附件</a>';
		htmls += ' <div type="button"class="layui-btn layui-btn-normal layui-btn-xs pr oh"><i class="layui-icon"></i>上传附件<input type="file" name="file" class="upload-file pa" id="otherFile'
				+ uuids
				+ '" onchange=ajaxFileUpload("otherFile'
				+ uuids
				+ '","otherFile'
				+ uuids
				+ '","'
				+ type
				+ '")></div></div></li>';

		$("#attachmentListCon").append(htmls);

	} else {
		layer.msg("最多上传十个其他附件", {
			icon : 5,
			anim : 6,
			offset: '200px'
		});
		return false;
	}

	// element.init();

}
// 删除附件
delAttachment = function(traget) {
	pathUrl();
	if (pathUrl() == ctx + "/company/apply"||pathUrl() == ctx + "/company/queryInfo") {
		var type = 'F';
	} else {
		var type = 'R';
	}
	var doc_id = $(traget).parents("li").data("attachmentid");
	if (doc_id != undefined) {
		$.ajax({
			type : "POST",
			async : false,
			url : ctx + '/attachment/delete/' + doc_id + '/' + type + '',
			dataType : "json",
			success : function(data) {
				if (data.success == 'true') {
					successTip(data);
					$(traget).parents("li").remove();
					otherLen--;
					$("#attachmentListCon li").each(function(index, ele) {
						$(this).find("em:eq(0)").text(index+1)
					})
				} else {
					errorTip(data);
				}
			},
			error : function(data) {
				errorTip(data);
			}
		});
	} else {
		$(traget).parents("li").remove();
		otherLen--;
		$("#attachmentListCon li").each(function(index, ele) {
			$(this).find("em:eq(0)").text(index+1)
		})
	}
}
// 保存,提交申请单
/* 
 *  @ typeId 业务类型
 *  @ type,	 URL参数   保存，提交
 *  @ ele,   元素名称
 *  @ frash  index刷新当前页      -1 刷新上一页
 *  */
submitForm = function(typeId, type, ele,frash) {
	var user=layui.data('user').username;
//	1为银行用户   0为企业用户
	_this = ele;
	var dataAttchmentList = new Array();
	var dataArray = new Array();
	$("#attachmentListCon li").each(function(index, ele) {
		var fileID = $(this).attr("data-id");// 附件类型ID
		var attachmentid = $(this).attr("data-attachmentid");
		var checktype = $(this).attr("data-checktype");
		var otherFlag = $(this).attr("data-otherflag");
		var filetypeName = $(this).find(".fileName").text();
		
		if (attachmentid == undefined && checktype == "1" && type=="submit") {
			layer.msg('请上传所有必传附件', {
				icon : 5,
				anim : 6,
				offset: '200px'
			});
			return flag = false;
		} 
			// 上传其他非空附件
			if ($(this).hasClass("otherAttachement")) {
				var otherAttachmentId = $(this).data("attachmentid");
				if (otherAttachmentId != undefined) {
					var jsonObj = {};
					jsonObj["attachmentId"] = attachmentid;// 附件文件ID，下载ID
					jsonObj["id"] = fileID;// 附件类型ID
					jsonObj["otherFlag"] = otherFlag;// 上传标记
					jsonObj["filetypeName"] = filetypeName;// 文件名称

					dataAttchmentList.push(jsonObj);
					//console.log(dataAttchmentList)
				}
				return flag = true;
			} else {
				//上传银行要求企业上传的附件
				if (!$(ele).hasClass("nothing")) {
					// 上传必传附件
					var jsonObj = {};
					jsonObj["attachmentId"] = attachmentid;// 附件文件ID，下载ID
					jsonObj["id"] = fileID;// 附件类型ID
					jsonObj["otherFlag"] = otherFlag;// 上传标记
					jsonObj["filetypeName"] = filetypeName;// 文件名称
					dataAttchmentList.push(jsonObj);
					//console.log(dataAttchmentList)
				}
				return flag = true;
			}
		

	});
	var attachmentlist = JSON.stringify(dataAttchmentList);
	//console.log(attachmentlist);
	if (flag != false) {
		var noticeGet = $("#userForm select[name='noticeGet']").val();
		var formId = $("#formId").val();
		if(user=='0'){
			dataArray = {
					formId : formId,
					businessId : typeId,
					registerName : $("#userForm input[name='registerName']").val(),
					phone : $("#userForm input[name='phone']").val(),
					email : $("#userForm input[name='email']").val(),
					address : $("#userForm input[name='address']").val(),
					noticeGet : noticeGet,
					attachmentlist : attachmentlist
				}
		//企业用户
			$.ajax({
				type : "POST",
				async : false,
				url : ctx + '/formoperation/' + type,
				data : dataArray,
				dataType : "json",
				success : function(data) {
					if (data.success == "true") {
						successTip(data);
						$("#formId").val(data.formId);
						$(_this).attr("disabled", true).addClass(
								"layui-btn-disabled");
						if(frash=="index"){				
							//刷新当前页
							freshenlocation();	
						}else{						
							
							//返回上一级					
							freshen();	
						}
						
					} else {
						errorTip(data);
					}
				},
				error : function(data) {
					errorTip(data);
				}
			});
			
		}else{
			dataArray = {	
	    			businessId : typeId,
	    			registerName : $("#userForm input[name='registerName']").val(),
	    			phone : $("#userForm input[name='phone']").val(),
	    			email : $("#userForm input[name='email']").val(),
	    			address : $("#userForm input[name='address']").val(),
	    			noticeGet : noticeGet,
	    			attachmentlist : attachmentlist,
	    			applyName:$("#bankForm input[name='businessName']").val(),
	    			applyOrgCode:$("#bankForm input[name='applyOrgCode']").val()
	    		}
		//银行用户	
			$.ajax({
    			type : "POST",
    			async : false,
    			url : ctx+'/reportoperation/saveInputAndGetProcessList',
    			data : dataArray,
    			dataType : "json",
    			success : function(data) {
    				if (data.success == "true") {
    					//successTip(data);
    					processList(data);
    					
    				} else {
    					errorTip(data);
    				}
    			},
    			error : function(data) {
    				errorTip(data);
    			}
    		});
		}
		
	}
}

// 申请表列表成功回填数据
successAttachmentList = function(data) {
	var getTpl = attachmentListTpl.innerHTML, view = document
			.getElementById('attachmentListCon');
	laytpl(getTpl).render(data, function(html) {
		view.innerHTML = html;
	});
}

/* 获取申请表样表 */
getFile = function(id) {
	$.ajax({
		url : ctx + '/bubusiness/ajaxGetFileId',
		type : "post",
		dataType : "json",
		data : {
			"businessId" : id
		},
		success : function(data) {
			// 申请表样表信息回显
			$("#filetemplateDoc").attr("href",
					ctx + '/attachment/down/' + data.filetemplateDocId + '/1')
			$("#fileDoc").attr("href",
					ctx + '/attachment/down/' + data.fileDocId + '/1')

		},
		error : function(data) {
			layer.msg("请求异常");
		}
	});
}

// 办事指南，法律法规
rule = function(type, id, pn, ps) {
	if (type == 'laws') {
		url = ctx + "/laws/ajaxLawsList";
	} else {
		url = ctx + "/guides/ajaxGuidesList";
	}
	var time = $("#test6").val() == undefined ? "" : $("#test6").val();
	var name = $("#guidesName").val() == undefined ? "" : $("#guidesName")
			.val();
	$.ajax({
		url : url,
		type : "post",
		dataType : "json",
		data : {
			"businessId" : id,
			"pageNumber" : pn,
			"pageSize" : ps,
			"guidesName" : name,
			"queryDate" : $("#test6").val()
		},
		success : function(data) {
			var count = data.count;
			pn = curr;
			layRulePage(type, count, pn, ps);
			// 银行数据填充
			if (type == 'laws') {
				var getTpl = lawsTpl.innerHTML, view = document
						.getElementById('lawsCon');
				laytpl(getTpl).render(data.rows, function(html) {
					view.innerHTML = html;
				});
			} else {
				var getTpl = guidesTpl.innerHTML, view = document
						.getElementById('guidesCon');
				laytpl(getTpl).render(data.rows, function(html) {
					view.innerHTML = html;

				});
			}
		},
		error : function(data) {
			errorTip(data)
		}
	});
}

/**
 * 分页
 */
layRulePage = function(type, count, pn, ps) {
	laypage.render({
		elem : 'layPage',
		count : count,
		curr : pn,
		theme : '#1E9FFF',
		limit : ps,
		layout : [ 'count', 'prev', 'page', 'next', 'limit', 'skip' ],
		jump : function(obj, first) {
			curr = obj.curr;
			if (!first) {
				rule(type, id, curr, obj.limit);
			}
		}
	});
}

/* 分页 */
layPage = function(count, pn, ps) {
	laypage.render({
		elem : 'layPage',
		count : count,
		curr : pn,
		theme : '#1E9FFF',
		limit : ps,
		layout : [ 'count', 'prev', 'page', 'next', 'limit', 'skip' ],
		jump : function(obj, first) {
			curr = obj.curr;
			if (!first) {
				dealData(curr, obj.limit);
			}
		}
	});
}

layui.use(['jquery'],function(){
	/*var $=layui.jquery;
	 $.ajaxSetup({ complete: function (XMLHttpRequest) { if
	  (XMLHttpRequest.getResponseHeader("SessionStatus") == "TimeOut") {
	  window.location.href = ctx + "/bank/login"; } } });*/
	})



