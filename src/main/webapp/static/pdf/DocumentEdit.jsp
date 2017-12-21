<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.*,java.sql.*,java.text.SimpleDateFormat,java.text.DateFormat,java.util.Date" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>金格科技-iWebPDF2015在线管理中间件示例程序</title>
 <meta http-equiv="X-UA-Compatible" content="IE=9" />
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
 <link rel='stylesheet' type='text/css' href='css/iWebProduct.css' />
  <script type="text/javascript">
		var url = '<%=basePath%>static/pdf/';
		var fileName = '<%=request.getParameter("fileName")%>';
		var timeStr = '<%=request.getParameter("timeStr")%>';
		var userName = '<%=request.getParameter("userName")%>';
		var docId = '<%=request.getParameter("docId")%>';
		//alert(fileName + timeStr + userName);
		</script>
 <script language="javascript">
  function init(){
       //打开文档
		/*iWebPDF2018.COMAddins("KingGrid.ComControl").Object.Copyright = "";		//设置授权码*/
		var iWebPDFServer=iWebPDF2018.COMAddins.Item("KingGrid.MsgServer2000").Object;
		iWebPDFServer.WebUrl = url + "PDFServer.jsp";
		var tempFile = iWebPDFServer.CreateTempFileName();
		iWebPDFServer.SetMsgByName("DBSTEP","DBSTEP");
		iWebPDFServer.SetMsgByName("OPTION","LOADFILE");//与PDFServer.jsp 里面的LOADFILE进行交互
		iWebPDFServer.SetMsgByName("FILETYPE","PDF");//文档类型
		iWebPDFServer.SetMsgByName("USERNAME",userName);//用户名称
		iWebPDFServer.SetMsgByName("RECORDID","111");//文档id
		iWebPDFServer.SetMsgByName("FILENAME",fileName);//文档名称
		//iWebPDFServer.SetMsgByName("INFO","\\static\\annoTemp\\" + timeStr + "\\");//文档路径
		iWebPDFServer.SetMsgByName("INFO","/static/annoTemp/" + timeStr + "/");//文档路径 
		if (iWebPDFServer.PostDBPacket(false)) { 
			iWebPDFServer.MsgFileSave(tempFile);
			iWebPDF2018.Documents.Open(tempFile);
			iWebPDF2018.Options.UserName = userName;
			iWebPDF2018.Documents.ActiveDocument.Views.ActiveView.Zoom = 100;
		} else {
			alert("打开失败");
		}
	}

   function connect(message) {
	   $.ajax({  
			type: "get",  
			async: false,  
			url: "http://127.0.0.1:9588/SendMsg?targetid=111$msg=" + message, 
			jsonp: "hookback",
			dataType: "jsonp",  
			success: function(data){ 
				var jsonobj = eval(data);
				window.close();
			},  
			error: function(a,b,c){  
				alert(JSON.stringify(a));
				alert(b);
				alert(c);
			}  
		  });  
	}
function WebSave(){
	try{
			//在线保存文档
			if ( 0 == iWebPDF2018.Documents.Count )
			{
				alert("没有要保存的文档");
				return false;
			}
			var iWebPDFServer=iWebPDF2018.COMAddins.Item("KingGrid.MsgServer2000").Object;
			iWebPDFServer.WebUrl = url + "PDFServer.jsp";
			var tempFile = iWebPDFServer.CreateTempFileName();
			iWebPDF2018.Documents.ActiveDocument.Save(tempFile);
			iWebPDFServer.MsgFileLoad(tempFile);
			iWebPDFServer.SetMsgByName("DBSTEP","DBSTEP");
			iWebPDFServer.SetMsgByName("OPTION","SAVEFILE");
			iWebPDFServer.SetMsgByName("FILETYPE","PDF");
			iWebPDFServer.SetMsgByName("USERNAME",userName);
			iWebPDFServer.SetMsgByName("FILENAME",fileName);
			//iWebPDFServer.SetMsgByName("INFO","\\static\\annoTemp\\" + timeStr + "\\");
			iWebPDFServer.SetMsgByName("INFO","/static/annoTemp/" + timeStr + "/");
			
			if (iWebPDFServer.PostDBPacket(false)) { 
				alert("保存成功！");
				return true;
			} else {
				alert("保存失败！");
				return false;
			}
		}catch(e){
		  alert("保存失败"); 
		  alert(e.description);
		  return false;
		}	

};	
	
	 //作用：保存文档
	function SaveDocument(){
	  if (WebSave()){
		$.ajax({  			
			url: "<%=basePath%>attachment/savePdfAway", 
			type: "post",  
			dataType:"json",
			data: {'timeStr': timeStr, 'docId': docId},
			success:function(data){	
				if (data.flag == 'success') {
					setTimeout("connect('save');",100);	
				}
			}  
	});  
	} 
}
 </script>
</head>
<body onload="init()"  KGBrowser="KGBrowser金格浏览器[演示版];V5.0S0xGAAEAAAAAAAAAEAAAADIBAABAAQAALAAAAO5gCH6XXjEwSLxdfzzU2kzUVRlPMJ59TBa4njitgnn48o3ET5WlKtc5QcOvJy4+xqcS5fR/g5GWSD/G28F1eXw8mdJL6ZxrQtis2JBgYSYr/oj6hHOwgG5+YPWNGIU/n3IvCchbzlxJhdoz33CcS5UkO1g+PMNQGA5+TsPjikYBZz7MDs/y1Y4Y3mIugoxogffn3jCPJRvNcaqVM0qvGnIxc/mSok5YJB3RAMe6hSJSi9n6535jW6aUOZec2sm6E2jS3M93bX3SrsU1l/EtSRRt7TIcWTmywVNaaPWlil7M4MZgx8PYO/iIDWhNLnNInSssXTYEDhitSVRc2nvj0qdqR4GMPd0xysExU8050/yEaM52nKOJATQaYHoITojPibq80X7ouCs8MVznfPlGikTT0qABvoRzlzvwzrjUbCjLl9PUMNi251Gt23P23P6Dew==">
    <input type="button" value="保存文档" onclick="SaveDocument()"/>
	<object  classid="clsid:7017318C-BC50-4DAF-9E4A-10AC8364C315" codebase="iWebPDF2018.cab#version=2,0,5,1138" id=iWebPDF2018 height=750 width=100%></object>
</body> 
</html>