$(
function(){
/**��������**/	
    var nClick = 1;//���������
	var ToolBarId;
	var MenuId;

	//����
    var isNotLoad = true;
	$(".tableAll").click(function(){
        if(isNotLoad){
            isNotLoad = false;	 
			  var noneY = $(this).next().css("display");
			  $(".tableAll").next().css("display","none");
			  $(".tableAll").find('td:eq(0)').css({'background-color':'#E6DBEC'});
			  $(".tableAll").find('span:eq(0)').html('+');

				  if( noneY== 'none'){
					  var s = $(this).find('td:eq(0)').html();                
					  $(this).find('td:eq(0)').html(s.replace("+", "-")) ;                              
					  $(this).find('td:eq(0)').css({'background-color':'#FFFFFF'});
		              $(this).next().slideToggle(function(){isNotLoad = true;});
				  }else{
					  isNotLoad = true;
				  }
            }
	});
	//����
	var hide = false;
	$("#disPlayNone").click(function(){
		
		 if(hide){
			 $('#showTD').width('204px');
			 $(this).siblings().css("display", "")
			
			 hide = false;
		 }else{	
			 $('#showTD').width('25px');
			 $(this).siblings().css("display", "none")
			 hide = true;
		 }

	});	
    //״̬��Ϣ
	function addState(value){
		$("#state").html(value);	
	}

	
    //���ĵ�
	function WebOpen()
	{   
		/*iWebPDF2018.COMAddins("KingGrid.ComControl").Object.Copyright = "";		//������Ȩ��*/
		iWebPDF2018.COMAddins.Item("KingGrid.MsgServer2000").Object.WebUrl = url + "PDFServer.jsp";
//		alert(url);
		var tempFile = iWebPDF2018.COMAddins.Item("KingGrid.MsgServer2000").Object.CreateTempFileName();
		iWebPDF2018.COMAddins.Item("KingGrid.MsgServer2000").Object.SetMsgByName("DBSTEP","DBSTEP");
		iWebPDF2018.COMAddins.Item("KingGrid.MsgServer2000").Object.SetMsgByName("OPTION","LOADFILE");
		iWebPDF2018.COMAddins.Item("KingGrid.MsgServer2000").Object.SetMsgByName("FILETYPE","PDF");
		iWebPDF2018.COMAddins.Item("KingGrid.MsgServer2000").Object.SetMsgByName("USERNAME","��ʾ��");
		iWebPDF2018.COMAddins.Item("KingGrid.MsgServer2000").Object.SetMsgByName("RECORDID",mRecordID);
		iWebPDF2018.COMAddins.Item("KingGrid.MsgServer2000").Object.SetMsgByName("FILENAME","1385716767003.pdf");
		if (iWebPDF2018.COMAddins.Item("KingGrid.MsgServer2000").Object.PostDBPacket(false))
		{ 
			iWebPDF2018.COMAddins.Item("KingGrid.MsgServer2000").Object.MsgFileSave(tempFile);
			iWebPDF2018.Documents.Open(tempFile);
			iWebPDF2018.Documents.ActiveDocument.Views.ActiveView.Zoom = 100;
			addState("�򿪳ɹ�");
		}
		else
		{
			addState("��ʧ��");
		}


	}
	if(mRecordID != 'null' && mIsExsitRId){
		WebOpen();
	}
	

	

/**�ĵ�����**/	
		

$("#saveFile").click(function(){
	try{
		//���߱����ĵ�
		if ( 0 == iWebPDF2018.Documents.Count )
		{
			alert("û��Ҫ������ĵ�");
			return;
		}
		iWebPDF2018.COMAddins("KingGrid.MsgServer2000").Object.WebUrl = url + "PDFServer.jsp";
		var tempFile = iWebPDF2018.COMAddins("KingGrid.MsgServer2000").Object.CreateTempFileName();
		iWebPDF2018.Documents.ActiveDocument.Save(tempFile);
		iWebPDF2018.COMAddins("KingGrid.MsgServer2000").Object.MsgFileLoad(tempFile);
		iWebPDF2018.COMAddins("KingGrid.MsgServer2000").Object.SetMsgByName("DBSTEP","DBSTEP");
		iWebPDF2018.COMAddins("KingGrid.MsgServer2000").Object.SetMsgByName("OPTION","SAVEFILE");
		iWebPDF2018.COMAddins("KingGrid.MsgServer2000").Object.SetMsgByName("FILETYPE","PDF");
		iWebPDF2018.COMAddins("KingGrid.MsgServer2000").Object.SetMsgByName("USERNAME","��ʾ��");
		iWebPDF2018.COMAddins("KingGrid.MsgServer2000").Object.SetMsgByName("RECORDID",mRecordID);

		if (iWebPDF2018.COMAddins("KingGrid.MsgServer2000").Object.PostDBPacket(false))
		{ 
			
			$('#Subject').val($('#txtSubject').val());
			$('#Author').val($('#txtAuthor').val());
			$('#iWebPDF').submit();
			addState("����ɹ����ĵ�����ǣ�"+mRecordID);
		}
		else
		{
			addState("����ʧ�ܣ�");
		}
	}catch(e){
	  addState("��ʧ��"); 
	  alert(e.description);
	}	

});		
	
	
	
	
/** �ĵ��Ķ�����**/	

  //�򿪱����ĵ� 		   
  $("#openLocalFile").click(function(){
	 try{

		iWebPDF2018.Documents.Open();
		addState("�򿪳ɹ�");
	 }catch(e){
	    addState("��ʧ��"); 
	    alert(e.description);
	 }								 
  });		   
//��URL�ĵ� 		   
  $("#openURLFile").click(function(){
	 try{

		iWebPDF2018.Documents.OpenFromURL("http://www.kinggrid.com/pub/temp/Test.pdf");
		addState("�򿪳ɹ�");
	 }catch(e){
	    addState("��ʧ��"); 
	    alert(e.description);
	 }								 
  });		   		   
  //���汾���ĵ�
  $("#saveLocalFile").click(function(){
	 try{
		   if ( 0 == iWebPDF2018.Documents.Count ){
				alert("û���Ѵ��ĵ�");
				return;
		}
		iWebPDF2018.Documents.ActiveDocument.Save("c://test.pdf");
		addState("����ɹ�(c://test.pdf)");
		alert('����ɹ�');
	 }catch(e){
	   addState("��ʧ��"); 	 
	   alert(e.description);
	 }								 
  });
		   
  //�رյ�ǰ���ĵ�
   $("#closeActiveFile").click(function(){
	 try{
		if ( 0 == iWebPDF2018.Documents.Count ){
				alert("û���Ѵ��ĵ�");
				return;
		}
		iWebPDF2018.Documents.ActiveDocument.Close();
		addState("�رճɹ�");
	 }catch(e){
	   addState("�ر�ʧ��"); 	 
	   alert(e.description);
	 }								 
  });
   
  //�ر������ĵ�
  $("#closeAllFile").click(function(){
	 try{
		   if ( 0 == iWebPDF2018.Documents.Count ){
				alert("û���Ѵ��ĵ�");
				return;
		}
		iWebPDF2018.Documents.CloseAll();
		addState("�رճɹ�");
	 }catch(e){
	   addState("�ر�ʧ��"); 	 
	   alert(e.description);
	 }								 
  });
  //��ǰҳ
  $("#GetCurrentPageNo").click(function(){
	 try{
		   if ( 0 == iWebPDF2018.Documents.Count ){
				alert("û���Ѵ��ĵ�");
				return;
		}
		var PageNo = iWebPDF2018.Documents.ActiveDocument.Views.ActiveView.PageNum;
		var nPageCount = iWebPDF2018.Documents.ActiveDocument.Pages.Count;
		alert("���ĵ�����"+nPageCount+"ҳ����ǰҳ��"+PageNo+"ҳ");
		addState("��ǰҳ��"+PageNo+"ҳ");
	 }catch(e){
	   addState("��ȡ��ǰҳʧ��"); 	 
	   alert(e.description);
	 }								 
  });
  //��ת��ָ��ҳ
  $("#GoToPage").click(function(){
	 try{
		   if ( 0 == iWebPDF2018.Documents.Count ){
				alert("û���Ѵ��ĵ�");
				return;
		}
		var PageNo = prompt("������Ҫ��ת����ҳ��","");
		iWebPDF2018.Documents.ActiveDocument.Views.ActiveView.PageNum = PageNo;
		var info;
		if ( PageNo > iWebPDF2018.Documents.ActiveDocument.Pages.Count || PageNo < 1 )
		{
			info = "ҳ�����,��תʧ�ܣ�";
			alert(info);
		}
		else
		{
			info = "��ǰҳ��"+PageNo+"ҳ";
			alert("��ת�ɹ���");
		}
		addState(info);
	 }catch(e){
	   addState("��תʧ�ܣ�"); 	 
	   alert(e.description);
	 }								 
  });
  //��ת��ҳ
  $("#GoToPageFirst").click(function(){
	 try{
		   if ( 0 == iWebPDF2018.Documents.Count ){
				alert("û���Ѵ��ĵ�");
				return;
		}
		
		iWebPDF2018.Documents.ActiveDocument.Views.ActiveView.PageNum = 1;
		addState("��ת����ҳ��");
	 }catch(e){
	   addState("��תʧ�ܣ�"); 	 
	   alert(e.description);
	 }								 
  });
  //ǰһҳ
  $("#GoToPagePrv").click(function(){
	 try{
		   if ( 0 == iWebPDF2018.Documents.Count ){
				alert("û���Ѵ��ĵ�");
				return;
		}
		
		var pageNo = iWebPDF2018.Documents.ActiveDocument.Views.ActiveView.PageNum;
		if (pageNo - 1 == 0)
		{
			pageNo = 1;
		}
		else
		{
			pageNo--;
		}
		
		iWebPDF2018.Documents.ActiveDocument.Views.ActiveView.PageNum = pageNo;
		addState("��ת��ǰһҳ��");
	 }catch(e){
	   addState("��תʧ�ܣ�"); 	 
	   alert(e.description);
	 }								 
  });
  //��һҳ
  $("#GoToPageNext").click(function(){
	 try{
		   if ( 0 == iWebPDF2018.Documents.Count ){
				alert("û���Ѵ��ĵ�");
				return;
		}
		var nPageCount = iWebPDF2018.Documents.ActiveDocument.Pages.Count;
		var pageNo = iWebPDF2018.Documents.ActiveDocument.Views.ActiveView.PageNum;
		if (pageNo + 1 > nPageCount)
		{
			pageNo = nPageCount;
		}
		else
		{
			pageNo++;
		}
		iWebPDF2018.Documents.ActiveDocument.Views.ActiveView.PageNum = pageNo;
		
		addState("��ת����һҳ��");
	 }catch(e){
	   addState("��תʧ�ܣ�"); 	 
	   alert(e.description);
	 }								 
  });
  //δҳ
  $("#GoToPageLast").click(function(){
	 try{
		   if ( 0 == iWebPDF2018.Documents.Count ){
				alert("û���Ѵ��ĵ�");
				return;
		}
		var nPageCount = iWebPDF2018.Documents.ActiveDocument.Pages.Count;
		iWebPDF2018.Documents.ActiveDocument.Views.ActiveView.PageNum = nPageCount;
		
		addState("��ת��δҳ��");
	 }catch(e){
	   addState("��תʧ�ܣ�"); 	 
	   alert(e.description);
	 }								 
  });
  //��ͼ��ת
  $("#RoateView").click(function(){
	 try{
		   if ( 0 == iWebPDF2018.Documents.Count ){
				alert("û���Ѵ��ĵ�");
				return;
		}
		
		var Roate = iWebPDF2018.Documents.ActiveDocument.Views.ActiveView.Rotation;
		alert(Roate);
		Roate = Roate + 90;
		alert(Roate);
		iWebPDF2018.Documents.ActiveDocument.Views.ActiveView.Rotation = 90;
		iWebPDF2018.Documents.ActiveDocument.Views.ActiveView.Refresh();
		alert(iWebPDF2018.Documents.ActiveDocument.Views.ActiveView.Rotation);
		addState("��ͼ��ת�ɹ���");
	 }catch(e){
	   addState("��ͼ��תʧ�ܣ�"); 	 
	   alert(e.description);
	 }								 
  });
  $("#getVersion").click(function(){
		 try{
			 
			 alert(iWebPDF2018.Version);
			addState("��ȡ�ɹ���");
		 }catch(e){
		   addState("��ȡʧ�ܡ�"); 	 
		   alert(e.description);
		 }								 
   });
  
  $("#moveToNextPage").click(function(){
	 try{
		   if ( 0 == iWebPDF2018.Documents.Count ){
				alert("û���Ѵ��ĵ�");
				return;
		} 
		iWebPDF2018.Documents.CloseAll();
		addState("�رճɹ�");
	 }catch(e){
	   addState("�ر�ʧ��"); 	 
	   alert(e.description);
	 }								 
  });  


/** �ĵ����ƹ���**/	

 //�Ƿ�������ע�ƶ�
  $("#IsAllowAnnotMove").click(function(){
	try{
		if ( 0 == iWebPDF2018.Documents.Count ){
			alert("û���Ѵ��ĵ�");
			return;
	  }
	  
	  var Res = false;
	  var document = iWebPDF2018.Documents.ActiveDocument;
	  var pages = iWebPDF2018.Documents.ActiveDocument.Pages;
	  var pcnt = pages.Count;
	  for(var i = 0;i < pcnt;i++)
	  {
		  var annots = pages.Item(i).Annots;	
		  var cnt = annots.Count;
		  if (cnt)
		  {	  
			  nClick++;
			  if(nClick%2)
			  {
				 Res = false;
				 alert("��������ע�ƣ�");
			  }
			  else
			  {
				 Res = true;
				 alert("��ֹ��ע�ƶ���");
			  }
			  for(var j = 0 ;j < cnt; j++)
			  {
				  annots.Item(j).Locked = Res;	
			  }
			  addState("��ע�ƶ����Ƴɹ���"); 
		  }
	  }
	 }catch(e){
	   addState("��ע�ƶ�����ʧ��"); 	 
	   alert(e.description);
	 }
	});	 
  
  //���ҳ
  $("#addPage").click(function(){
	 try{
	  if ( 0 == iWebPDF2018.Documents.Count ){
			alert("û���Ѵ��ĵ�");
			return;
	  }
	  if(!iWebPDF2018.Documents.ActiveDocument.HasPermissions(1)){
		alert("��û���޸ĵ�Ȩ�ޣ��޷�����ҳ��");  
	  }
	  nClick++;
	  var Res;
	  if(nClick%2)
	  {
		 Res = iWebPDF2018.Documents.ActiveDocument.Pages.Add(592, 842, 0, 0);
	  }
	  else
	  {
		 Res = iWebPDF2018.Documents.ActiveDocument.Pages.Delete(1);
	  }
	  if (Res)
	  {
			addState("����/ɾ��ҳ�ɹ���"); 
	  }else
	  {
		addState("����/ɾ��ҳʧ�ܣ�"); 
	  }
	 }catch(e){
	   addState("����ҳʧ��"); 	 
	   alert(e.description);
	 }								 
  }); 
  //���������ע
  $("#addAnnotText").click(function(){
	 try{
	  if ( 0 == iWebPDF2018.Documents.Count ){
			alert("û���Ѵ��ĵ�");
			return;
	  }
		var annot = iWebPDF2018.Documents.ActiveDocument.Pages.Item(0).Annots.Add(0);
		annot.FromUserRect(400,800,425,825);
		annot.Title = "KingGrid";
		annot.Color = "&123123123";
		annot.Contents = "���Ƽ�";
		//�Զ�����ע��Ϣ
		annot.SetCustomEntry("AnnotInfo","\"type\":\"Text\",\"filename\":\"hehe\",\"author\":\"TK\"");
		annot.UpdateAppearance();
		iWebPDF2018.Documents.ActiveDocument.Views.ActiveView.Refresh();
	 }catch(e){
	   addState("����ҳʧ��"); 	 
	   alert(e.description);
	 }								 
  });

  //����/��ʾ��ǩҳ
   $("#HideShowNavBar").click(function(){
		try
		{
			if ( 0 == iWebPDF2018.Documents.Count ){
			alert("û���Ѵ��ĵ�");
			return;
		}	
        nClick++;
		if ( 0 == (nClick%2))
		{
			iWebPDF2018.Options.TabBarVisible = false;
		}
		else
		{
			iWebPDF2018.Options.TabBarVisible = true;
		}
		addState("����/��ʾ��ǩҳ�ɹ���"); 
	  }catch(e){
	   addState("����/��ʾ��ǩҳʧ�ܡ�"); 	 
	   alert(e.description);
	  }		
  });
   //���������л�
   $("#SwitchLanguage").click(function(){
		try
		{	 
			nClick++;
			if ( 1 == (nClick%4))
			{
				iWebPDF2018.Options.Lcid = 2052;
				 
			}
			else if ( 2 == (nClick%4))
			{
				iWebPDF2018.Options.Lcid = 1028;
				
			}else if ( 3 == (nClick%4))
			{
				iWebPDF2018.Options.Lcid = 3076;
				 
			}else if ( 0 == (nClick%4))
			{
				iWebPDF2018.Options.Lcid = 1033;
				 
			}
			 addState("������ʾ�����л��ɹ���");
	  }catch(e){
	   addState("������ʾ�����л�ʧ�ܡ�"); 	 
	   alert(e.description);
	  }		
  });
  //����/��ʾ����������
   $("#HideShowTabCommandBar").click(function(){
		try
		{
			if ( iWebPDF2018.Documents.Count > 0 ){
			alert("�ر����д��ĵ����ò���������Ч��");
			return;
		}	
        nClick++;
		if ( 0 == (nClick%2))
		{
			iWebPDF2018.Options.TabCommandBarVisible = false;
		}
		else
		{
			iWebPDF2018.Options.TabCommandBarVisible = true;
		}
		addState("����/��ʾ����ǩ���ɹ���"); 
	  }catch(e){
	   addState("����/��ʾ����ǩ��ʧ�ܡ�"); 	 
	   alert(e.description);
	  }		
  });
  //����/��ʾ��ӡ��ť
  $("#HideShowPrint").click(function(){
	 try{
		   if ( 0 == iWebPDF2018.Documents.Count ){
				alert("û���Ѵ��ĵ�");
				return;
		}		 
        //�õ�CommandBar������
		nClick++;
		var nCBCount = iWebPDF2018.CommandBars.Count;
		for(var i = 0; i< nCBCount; i++)
		{
			if ( "File" == iWebPDF2018.CommandBars.Item(i).Name )
			{
				var nCtlsCount = iWebPDF2018.CommandBars.Item(i).Controls.Count;
				for (var j=0; j<nCtlsCount; j++)
				{
					var Ctrls = iWebPDF2018.CommandBars.Item(i).Controls;
					if (3 == Ctrls.Item(j).Index)
					{
						if (nClick%2)
						{
							Ctrls.Item(j).Visible = true;
						}
						else
						{
							Ctrls.Item(j).Visible = false;
						}
					}
				}	
			}
		}
		addState("����/��ʾ��ӡ��ť�ɹ���"); 
	  }catch(e){
	   addState("����/��ʾ��ӡ��ťʧ�ܡ�"); 	 
	   alert(e.description);
	  }		
  });
  
  //���ع�����
  $("#HideShowBar").click(function(){
	 try{
		   if ( 0 == iWebPDF2018.Documents.Count ){
				alert("û���Ѵ��ĵ�");
				return;
		}		 
        var nCount = iWebPDF2018.CommandBars.Count;
		nClick++;
		for (var i=0; i< nCount; i++)
		{
			if ( 0 == (nClick%2))
			{
				iWebPDF2018.CommandBars.Item(i).Visible = false;
			}
			else
			{
				iWebPDF2018.CommandBars.Item(i).Visible = true;
			}
		}
		addState("���ع������ɹ���"); 
	  }catch(e){
	   addState("���ع�����ʧ�ܡ�"); 	 
	   alert(e.description);
	  }		
  }); 
  //����/��ʾ������
  $("#HideShowNavigation").click(function(){
	 try{
		   if ( 0 == iWebPDF2018.Documents.Count ){
				alert("û���Ѵ��ĵ�");
				return;
		}		 
		nClick++;
		var bVisible = true;
		if ( 0 == (nClick%2))
		{
			bVisible = false;
		}
		else
		{
			bVisible = true;
		}
		iWebPDF2018.Documents.ActiveDocument.Window.DisplayLayout = bVisible;
		iWebPDF2018.Documents.ActiveDocument.Window.DisplayNavigation = bVisible;
		addState("���ص������ɹ���"); 
	  }catch(e){
	   addState("���ص�����ʧ�ܡ�"); 	 
	   alert(e.description);
	  }		
  }); 

  
/*function InsertImage()
	{
		if ( 0 == iWebPDF2018.Documents.Count )
		{
			alert("û���Ѵ��ĵ�");
			retrun;
		}
		    Var annot = iWebPDF2018.Documents.ActiveDocument.Pages(0).Annots.Add(12);
		annot.FromDeviceRect(100,100,200,200);
		annot.BlendMode = "Multiply";
		annot.Title = "Admin";
		annot.Color = 255;
		annot.ImageAppearance("c:\\2.png");
		iWebPDF2018.Documents.ActiveDocument.Views.ActiveView.Refresh();
	}
*/

  //���ˮӡ
  $("#Watermark").click(function(){
		 try{
		   if ( 0 == iWebPDF2018.Documents.Count ){
					alert("û���Ѵ��ĵ�");
					return;
		   }
			 
			var Watermark = iWebPDF2018.Documents.ActiveDocument.Watermark;
			Watermark.FontColor= "001";
			Watermark.FontSize = 80;
			Watermark.Opacity = 0.3;
			Watermark.Rotation = 30;
			Watermark.Text = "WaterMark";
			Watermark.Execute(0, 50, 400);
			Watermark.Execute(0, 50, 600);
			iWebPDF2018.Documents.ActiveDocument.Pages.Item(0).Refresh();
			iWebPDF2018.Documents.ActiveDocument.Views.ActiveView.Refresh();
			addState("���ˮӡ�ɹ�"); 	 
		  }catch(e){
		   addState("���ˮӡʧ�ܡ�"); 	 
		   alert(e.description);
		  }		
	  });
//ͼƬˮӡ
	$("#WatermarkPic").click(function(){
		 try{
		   if ( 0 == iWebPDF2018.Documents.Count ){
					alert("û���Ѵ��ĵ�");
					return;
		   }
			
			var annot = iWebPDF2018.Documents.ActiveDocument.Pages(0).Annots.Add(25);
			if (annot)
			{   
				annot.FromUserRect(200,600,500,750);
				annot.BlendMode = "Multiply";
				annot.Rotation = 15;
				annot.Transparency = 0.3;
				annot.ImageAppearance("http://www.kinggrid.com/img/logo.jpg");
				annot.UpdateAppearance();
			}
			iWebPDF2018.Documents.ActiveDocument.Pages.Item(0).Refresh();
			iWebPDF2018.Documents.ActiveDocument.Views.ActiveView.Refresh();
			addState("���ˮӡ�ɹ�"); 	 
		  }catch(e){
		   addState("���ˮӡʧ�ܡ�"); 	 
		   alert(e.description);
		  }		
	  });
  //��ȡ�ĵ�����
  $("#getContext").click(function(){
		 try{
		   if ( 0 == iWebPDF2018.Documents.Count ){
					alert("û���Ѵ��ĵ�");
					return;
		   } 
		  alert(iWebPDF2018.Documents.ActiveDocument.Pages(0).Text);
		  }catch(e){
		   addState("��ȡʧ�ܡ�"); 	 
		   alert(e.description);
		  }		
	  }); 
  
/** �ĵ���ע����**/	

  //���ͼƬ��ע
  $("#addPictureAnnot").click(function(){
	 try{							  
		if ( 0 == iWebPDF2018.Documents.Count )
		{
			alert("û���Ѵ��ĵ�");
			return;
		}
		var annot = iWebPDF2018.Documents.ActiveDocument.Pages(0).Annots.Add(12);
		annot.FromUserRect(300,700,400+93*72/96,700+74*72/96);
		annot.BlendMode = "Multiply";
		annot.Title = "TK";
		annot.Color = 255;
		annot.ImageAppearance("http://www.kinggrid.com/img/logo.jpg");
		//�Զ�����ע��Ϣ
		annot.SetCustomEntry("AnnotInfo","\"type\":\"Stamp\",\"filename\":\"Pic\",\"author\":\"TK\"");
		iWebPDF2018.Documents.ActiveDocument.Views.ActiveView.Refresh();
		addState("���ͼƬ��ע�ɹ�"); 	 
	  }catch(e){
	   addState("���ͼƬ��עʧ�ܡ�"); 	 
	   alert(e.description);
	  }		
  }); 


  //��ȡ��ע����
  $("#getAnnotCount").click(function(){
	 try{							  
		if ( 0 == iWebPDF2018.Documents.Count ){
			alert("û���Ѵ��ĵ�");
			return;
		}
		var nAnnot = iWebPDF2018.Documents.ActiveDocument.Pages.Item(0).Annots.Count;
		alert("�ĵ��й�����ע"+nAnnot); 
	  }catch(e){
	   addState("��ȡʧ�ܡ�"); 	 
	   alert(e.description);
	  }		
  }); 
//��ͨ��ӡ
  $("#PrintNormal").click(function(){
	 try{							  
		if ( 0 == iWebPDF2018.Documents.Count )
		{
			alert("û���Ѵ��ĵ�");
			return;
		}
	//����1 ��ӡ������ string
	//����2 ��ӡҳ�淶Χ ����ҳ�淶Χ "1-9"���� string
	//����3 ��ӡ����ѡ����漸��ֵ�Ļ�ֵ 1���ĵ����� 2����ע 4��ͼ�� 8���� 256���Ҷ� int
	//����4 ��ӡ���� int
	//����5 ��̨��ӡ boolean
		var Missing;
		iWebPDF2018.Documents.ActiveDocument.PrintOut(Missing, Missing, 15, 1, false);
		addState("��ӡ�ɹ���"); 	 
	  }catch(e){
	   addState("��ӡʧ�ܡ�"); 	 
	   alert(e.description);
	  }		
	 
  });   
//�Ҷȴ�ӡ
  $("#PrintGray").click(function(){
	 try{							  
		if ( 0 == iWebPDF2018.Documents.Count )
		{
			alert("û���Ѵ��ĵ�");
			return;
		}
	//����1 ��ӡ������ string
	//����2 ��ӡҳ�淶Χ ����ҳ�淶Χ "1-9"���� string
	//����3 ��ӡ����ѡ����漸��ֵ�Ļ�ֵ 1���ĵ����� 2����ע 4��ͼ�� 8���� 256���Ҷ� int
	//����4 ��ӡ���� int
	//����5 ��̨��ӡ boolean
		var Missing;
		iWebPDF2018.Documents.ActiveDocument.PrintOut(Missing, Missing, 271, 1, false);
		addState("��ӡ�ɹ���"); 	 
	  }catch(e){
	   addState("��ӡʧ�ܡ�"); 	 
	   alert(e.description);
	  }		
	 
  });    
  //ֻ��ӡ����
  $("#PrintContent").click(function(){
	 try{							  
		if ( 0 == iWebPDF2018.Documents.Count )
		{
			alert("û���Ѵ��ĵ�");
			return;
		}
	//����1 ��ӡ������ string
	//����2 ��ӡҳ�淶Χ ����ҳ�淶Χ "1-9"���� string
	//����3 ��ӡ����ѡ����漸��ֵ�Ļ�ֵ 1���ĵ����� 2����ע 4��ͼ�� 8���� 256���Ҷ� int
	//����4 ��ӡ���� int
	//����5 ��̨��ӡ boolean
		var Missing;
		iWebPDF2018.Documents.ActiveDocument.PrintOut(Missing, Missing, 1, 1, false);
		addState("��ӡ�ɹ���"); 	 
	  }catch(e){
	   addState("��ӡʧ�ܡ�"); 	 
	   alert(e.description);
	  }		
	 
  });
  //ֻ����ע
  $("#PrintAnnot").click(function(){
	 try{							  
		if ( 0 == iWebPDF2018.Documents.Count )
		{
			alert("û���Ѵ��ĵ�");
			return;
		}
	//����1 ��ӡ������ string
	//����2 ��ӡҳ�淶Χ ����ҳ�淶Χ "1-9"���� string
	//����3 ��ӡ����ѡ����漸��ֵ�Ļ�ֵ 1���ĵ����� 2����ע 4��ͼ�� 8���� 256���Ҷ� int
	//����4 ��ӡ���� int
	//����5 ��̨��ӡ boolean
		var Missing;
		iWebPDF2018.Documents.ActiveDocument.PrintOut(Missing, Missing, 2, 1, false);
		addState("��ӡ�ɹ���"); 	 
	  }catch(e){
	   addState("��ӡʧ�ܡ�"); 	 
	   alert(e.description);
	  }		
	 
  });
  
  //ֻ��ͼ��
  $("#PrintStamp").click(function(){
	 try{							  
		if ( 0 == iWebPDF2018.Documents.Count )
		{
			alert("û���Ѵ��ĵ�");
			return;
		}
	//����1 ��ӡ������ string
	//����2 ��ӡҳ�淶Χ ����ҳ�淶Χ "1-9"���� string
	//����3 ��ӡ����ѡ����漸��ֵ�Ļ�ֵ 1���ĵ����� 2����ע 4��ͼ�� 8���� 256���Ҷ� int
	//����4 ��ӡ���� int
	//����5 ��̨��ӡ boolean
		var Missing;
		iWebPDF2018.Documents.ActiveDocument.PrintOut(Missing, Missing, 4, 1, false);
		addState("��ӡ�ɹ���"); 	 
	  }catch(e){
	   addState("��ӡʧ�ܡ�"); 	 
	   alert(e.description);
	  }		
	 
  });
  
  //ֻ����
  $("#PrintField").click(function(){
	 try{							  
		if ( 0 == iWebPDF2018.Documents.Count )
		{
			alert("û���Ѵ��ĵ�");
			return;
		}
	//����1 ��ӡ������ string
	//����2 ��ӡҳ�淶Χ ����ҳ�淶Χ "1-9"���� string
	//����3 ��ӡ����ѡ����漸��ֵ�Ļ�ֵ 1���ĵ����� 2����ע 4��ͼ�� 8���� 256���Ҷ� int
	//����4 ��ӡ���� int
	//����5 ��̨��ӡ boolean
		var Missing;
		iWebPDF2018.Documents.ActiveDocument.PrintOut(Missing, Missing, 8, 1, false);
		addState("��ӡ�ɹ���"); 	 
	  }catch(e){
	   addState("��ӡʧ�ܡ�"); 	 
	   alert(e.description);
	  }		
	 
  });
  //�ָ��ļ�
  $("#SplitFile").click(function(){
	 try{
			if ( 0 == iWebPDF2018.Documents.Count )
			{
				alert("û���Ѵ��ĵ�");
				return;
			}
			if (iWebPDF2018.Documents.ActiveDocument.Pages.Count <= 1)
			{
				alert("ֻ��һҳ�ĵ����޷��ָ");
				return;
			}
		var strFile = "c:\\split.pdf";
		var res = iWebPDF2018.Documents.ActiveDocument.Pages.Extract(strFile, "2");
		if (!res)
		{
			alert("�ָ��ļ��ɹ�,�ļ���:"+strFile);
			iWebPDF2018.Documents.ActiveDocument.Close();
			iWebPDF2018.Documents.Open(strFile);
		}
		
		addState("�ָ��ļ��ɹ�,�ļ���:"+strFile);
	 }catch(e){
	   addState("�ָ��ļ�ʧ�ܣ�"); 	 
	   alert(e.description);
	 }								 
  });
  //�����ļ�
  $("#ImportFile").click(function(){
	 try{
			if ( 0 == iWebPDF2018.Documents.Count )
			{
				alert("û���Ѵ��ĵ�");
				return;
			}
			
			var FilePath = iWebPDF2018.Documents.ActiveDocument.FileInformation.FileLocation;
			var FileName = iWebPDF2018.Documents.ActiveDocument.FileInformation.FileName;
			var FullPath = FilePath + FileName;
			
			iWebPDF2018.Documents.ActiveDocument.Pages.AddPageFromFile(FullPath, 0,"1");
			addState("�����ļ��ɹ���");
	 }catch(e){
	   addState("�����ļ�ʧ�ܣ�"); 	 
	   alert(e.description);
	 }								 
  });
  //�ϲ��ļ�
  $("#MergFile").click(function(){
	 try{
			if ( 0 == iWebPDF2018.Documents.Count )
			{
				alert("û���Ѵ��ĵ�");
				return;
			}
			
			var FilePath = iWebPDF2018.Documents.ActiveDocument.FileInformation.FileLocation;
			var FileName = iWebPDF2018.Documents.ActiveDocument.FileInformation.FileName;
			var FullPath = FilePath + FileName;
			var Missing;
			var MergFile = "c:\\MergFile.pdf";
			var result = iWebPDF2018.Documents.Merge(MergFile, FullPath, Missing, FullPath, Missing);
			if (!result)
			{
				iWebPDF2018.Documents.Open(MergFile);
			}
			addState("�ϲ��ļ��ɹ���");
	 }catch(e){
	   addState("�ϲ��ļ�ʧ�ܣ�"); 	 
	   alert(e.description);
	 }								 
  });
  //�ĵ�תͼƬ
  $("#FileToPic").click(function(){
	 try{
			var picPath = "c:\\p1.png";
			var res = iWebPDF2018.Documents.ActiveDocument.Pages.Item(0).ExportPNG(picPath);
			if (!res)
			{
				alert("��ҳͼƬ����Ϊ��"+picPath);
			}
			addState("ͼƬת�ĵ��ɹ���");
	 }catch(e){
	   addState("ͼƬת�ĵ�ʧ�ܣ�"); 	 
	   alert(e.description);
	 }								 
  });
  //���ͼƬ��
  $("#addPicSigfield").click(function(){
	 try{							  
		if ( 0 == iWebPDF2018.Documents.Count )
		{
			alert("û���Ѵ��ĵ�");
			return;
		}

		var fields = iWebPDF2018.Documents.ActiveDocument.Fields;
		var field = fields.Add(6);
		field.Name = "Signature100";
		var widget = field.AddToPage(0);;
		widget.FromDeviceRect(100, 100, 200, 200);
		widget.ImageAppearance("C:\\aa.jpg");//����ͼƬ���
		iWebPDF2018.Documents.ActiveDocument.Save();
		addState("���ͼƬ�ɹ���"); 	 
	  }catch(e){
	   addState("���ͼƬʧ�ܡ�"); 	 
	   alert(e.description);
	  }		
	 
  });   
  
  //��ת��ָ����
  $("#gotoFields").click(function(){
	 try{							  
		if ( 0 == iWebPDF2018.Documents.Count ){
			alert("û���Ѵ��ĵ�");
			return;
		}
		var fields = iWebPDF2018.Documents.ActiveDocument.Fields;
		if(fields.Count != 0){
			fields(0).Goto();
		}else{
			alert("�ĵ��в�������");
		}	
		addState("���ͼƬ��עʧ�ܡ�"); 	
	  }catch(e){
	   addState("���ͼƬ��עʧ�ܡ�"); 	 
	   alert(e.description);
	  }		
  }); 
  
    //��Ӹ���
  $("#addAttchments").click(function(){
	 try{
			if ( 0 == iWebPDF2018.Documents.Count )
			{
				alert("û���Ѵ��ĵ�");
				return;
			}		 
        iWebPDF2018.COMAddins("KingGrid.iWebPDF2018").Object.AddAttachments("C://test.pdf","test.pdf")
		addState("��Ӹ����ɹ���"); 	
	  }catch(e){
	   addState("��Ӹ���ʧ�ܡ�"); 	 
	   alert(e.description);
	  }		
  }); 
  
  //ͼƬǩ��
  $("#Signature").click(function(){
		 try{	
				if ( 0 == iWebPDF2018.Documents.Count )
				{
					alert("û��Ҫǩ�����ĵ�");
					return;
				}
				
				var addin = iWebPDF2018.COMAddins("KingGrid.iWebPDF2018").Object;
				addin.SignaturePages = "1-2";  
				//0 �������� 1 ������� 2 �ı���λ 3 ��λ 4δǩ���������ǩ��
				
				addin.SignaturePosMode = 1;
				addin.SignaturePos = "50*50";
				
				addin.SignatureWidth = 4;
				addin.SignatureHeight = 4;
				//ָ����ǩ������
				addin.SignatureImage = 1;
				//ָ��ǩ��ͼƬ·��
				addin.SignatureImage = "C:/aa.jpg";
				//addin.SignatureImage ="http://www.kinggrid.com/images/logo.jpg";
				//addin.SignatureCSP = "EnterSafe ePass3003 CSP v1.0";
				//addin.SignaturePIN = "123456";
				//addin.SignatureCert = "���Ӣ_����";
				addin.CreateSignature();
			    addState("ǩ���ɹ���"); 	
		  }catch(e){
		       addState("ǩ��ʧ��  ��"); 	 
		       alert(e.description);
		  }		
	  });
//���ɾ������
  $("#AddDelAttchments").click(function(){
		 try{	
				if ( 0 == iWebPDF2018.Documents.Count ){
					alert("û��Ҫǩ�����ĵ�");
					return;
				}
				var res = false;
				nClick++;
				if (nClick%2)
				{
					res = iWebPDF2018.Documents.ActiveDocument.Attachments.Add("c:\\Windows\\win.ini","win.ini");
					if (!res) alert("������ӳɹ���");
				}
				else
				{
					res = iWebPDF2018.Documents.ActiveDocument.Attachments.Delete(0);
					if (!res) alert("����ɾ���ɹ���");
				}	
			    if (!res) addState("���ɾ�������ɹ���"); 	
		  }catch(e){
		       addState("���ɾ������ʧ��  ��"); 	 
		       alert(e.description);
		  }		
	  }); 
  //ɾ�����и���
  $("#delAttchments").click(function(){
		 try{	
				if ( 0 == iWebPDF2018.Documents.Count ){
					alert("û��Ҫǩ�����ĵ�");
					return;
				}
				iWebPDF2018.COMAddins("KingGrid.iWebPDF2018").Object.DelAttachments("");
			    addState("ɾ�������ɹ���"); 	
		  }catch(e){
		       addState("ɾ������ʧ��  ��"); 	 
		       alert(e.description);
		  }		
	  }); 
  //ɾ�����е�ǩ��
  $("#delFields").click(function(){
		 try{	
				if ( 0 == iWebPDF2018.Documents.Count )
				{
					alert("û���Ѵ��ĵ�");
					return;
				}
				var fields = iWebPDF2018.Documents.ActiveDocument.Fields;
				var count = fields.SignatureCount;
				
				for(var i=0; i<count; i++)
				{
					var sigfield = fields.SignatureField(0);
					sigfield.ClearSignature();
					sigfield.Delete();
				}
				var nDle = count - fields.SignatureCount;
				//iWebPDF2018.Documents.ActiveDocument.Save();
			    addState("ɾ���ɹ�����ɾ����ǩ����"+nDle+"��"); 	
		  }catch(e){
		       addState("ɾ��ʧ��  ��"); 	 
		       alert(e.description);
		  }		
	  }); 

})

	
	
	