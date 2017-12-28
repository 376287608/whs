<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.io.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="DBstep.iMsgServer2000.*" %>
<%!
public class iWebOffice {
  private int mFileSize;
  private byte[] mFileBody;
  private String mFileName;
  private String mFileType;
  private String mFileDate;
  private String mFileID;

  private String mRecordID;
  private String mTemplate;
  private String mDateTime;
  private String mOption;
  private String mMarkName;
  private String mPassword;
  private String mMarkList;
  private String mBookmark;
  private String mDescript;
  private String mHostName;
  private String mMarkGuid;
  private String mCommand;
  private String mContent;
  private String mHtmlName;
  private String mDirectory;
  private String mFilePath;

  private String mUserName;
  private int mColumns;
  private int mCells;
  private String mMyDefine1;
  private String mLocalFile;
  private String mRemoteFile;
  private String mLabelName;
  private String mImageName;
  private String mTableContent;

  private String Sql;

  //��ӡ����
  private String mOfficePrints;
  private int mCopies;

  //�Զ�����Ϣ����
  private String mInfo;

  private DBstep.iMsgServer2000 MsgObj;
  public void ExecuteRun(HttpServletRequest request,
                         HttpServletResponse response) {
    MsgObj = new DBstep.iMsgServer2000(); //������Ϣ������

    mOption = "";
    mRecordID = "";
    mTemplate = "";
    mFileBody = null;
    mFileName = "";
    mFileType = "";
    mFileSize = 0;
    mFileID = "";
    mDateTime = "";
    mMarkName = "";
    mPassword = "";
    mMarkList = "";
    mBookmark = "";
    mMarkGuid = "";
    mDescript = "";
    mCommand = "";
    mContent = "";
    mLabelName = "";
    mImageName = "";
    mTableContent = "";
    mMyDefine1 = "";

    mFilePath = request.getSession().getServletContext().getRealPath("");	//ȡ�÷�����·��
    System.out.println(mFilePath);
	
    System.out.println("ReadPackage");

    try {
      if (request.getMethod().equalsIgnoreCase("POST")) {
        //MsgObj.MsgVariant(ReadPackage(request));                              //�ϰ汾��̨��������ݰ���ʽ���°�ؼ�Ҳ���ݣ�
        MsgObj.Load(request);                                                   //8.1.0.2���̨�����������ӿڣ�Ч�ʸ���

        System.out.println("DBstep:"+MsgObj.GetMsgByName("DBSTEP"));
        if (MsgObj.GetMsgByName("DBSTEP").equalsIgnoreCase("DBSTEP")) {		//����ǺϷ�����Ϣ��
          mOption = MsgObj.GetMsgByName("OPTION");				//ȡ�ò�����Ϣ
          mUserName = MsgObj.GetMsgByName("USERNAME");				//ȡ��ϵͳ�û�
          mInfo = MsgObj.GetMsgByName("INFO");
          System.out.println("mOption:"+mOption);						//��ӡ��������Ϣ

          if (mOption.equalsIgnoreCase("LOADFILE")) {				//����Ĵ���Ϊ�򿪷��������ݿ�����ļ�
            mRecordID = MsgObj.GetMsgByName("RECORDID");			//ȡ���ĵ����
            System.out.println("mRecordID: " + mRecordID);
            mFileName = MsgObj.GetMsgByName("FILENAME");			//ȡ���ĵ�����
            mFileType = MsgObj.GetMsgByName("FILETYPE");			//ȡ���ĵ�����
            MsgObj.MsgTextClear();						//����ı���Ϣ
            System.out.println("filePath: " + mFilePath+mInfo+mFileName);
            System.out.println("mFilePath: " + mFilePath);
            System.out.println("mInfo: " + mInfo);
            System.out.println("mFileName: " + mFileName);
            if (MsgObj.MsgFileLoad(mFilePath+mInfo+mFileName)){			//���ļ��е����ĵ�
            	System.out.println("mUserName: " + mUserName);
              MsgObj.SetMsgByName("STATUS", "�򿪳ɹ�!");			//����״̬��Ϣ
              MsgObj.MsgError("");						//���������Ϣ
            } else {
              MsgObj.MsgError("��ʧ��!");					//���ô�����Ϣ
            }
          } else if (mOption.equalsIgnoreCase("SAVEFILE")) {			//����Ĵ���Ϊ�����ļ��ڷ����������ݿ���
            mRecordID = MsgObj.GetMsgByName("RECORDID");			//ȡ���ĵ����
            mFileName = MsgObj.GetMsgByName("FILENAME");			//ȡ���ĵ�����
            mFileType = MsgObj.GetMsgByName("FILETYPE");			//ȡ���ĵ�����
            //mMyDefine1=MsgObj.GetMsgByName("MyDefine1");			//ȡ�ÿͻ��˴��ݱ���ֵ MyDefine1="�Զ������ֵ1"
            mFileSize = MsgObj.MsgFileSize();					//ȡ���ĵ���С
            mFileBody = MsgObj.MsgFileBody();					//ȡ���ĵ�����
           
            MsgObj.MsgTextClear();      //����ı���Ϣ
            if (MsgObj.MsgFileSave(mFilePath+mInfo+mFileName)){			//�����ĵ����ݵ��ļ�����
            System.out.println(mFileBody.length);
          
            MsgObj.SetMsgByName("STATUS", "����ɹ�!");			//����״̬��Ϣ
              MsgObj.MsgError("");						//���������Ϣ
            }
            else {
              MsgObj.MsgError("����ʧ��!");					//���ô�����Ϣ
            }
            MsgObj.MsgFileClear();						//����ĵ�����
          }
        }
        else {
          System.out.println("�ͻ��˷������ݰ�����!");
          MsgObj.MsgError("�ͻ��˷������ݰ�����!");
          MsgObj.MsgTextClear();
          MsgObj.MsgFileClear();
        }
      }
      else {
        MsgObj.MsgError("��ʹ��Post����");
        MsgObj.MsgTextClear();
        MsgObj.MsgFileClear();
      }
      System.out.println("SendPackage");
      System.out.println("");
      //SendPackage(response);                                                  //�ϰ��̨�෵����Ϣ�����ݷ������°�ؼ�Ҳ���ݣ�
      MsgObj.Send(response);                                                    //8.1.0.2�°��̨�������Ĺ��ܽӿڣ�Ч�ʸ���
    }
    catch (Exception e) {
      System.out.println(e.toString());
    }
  }
}
%>
<%
iWebOffice officeServer = new iWebOffice();
officeServer.ExecuteRun(request,response);
out.clear();
out = pageContext.pushBody();
%>