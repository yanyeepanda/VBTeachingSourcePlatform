<%@ page contentType="text/html;charset=gb2312" language="java" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<html>
<head>
<title>.::JSP Hi-Notepad::..::www.jsphi.com::.</title>
<style type="text/css">
<!--
table.tableborder{
border:1px dotted #999;
width:696;

filter:progid:DXImageTransform.Microsoft.Shadow(Color=#A5D8FF,Direction=120,strength=4)
}
table.tablebottomborder{

border:1px dotted #999;
width:696;
text-align:left;
}
b.rtop, b.rbottom{
display:block;background: #B0DCFD;
}
b.rtop2, b.rbottom2{
display:block;background: #ffffff;
}
b.rtop b, b.rbottom b{
display:block;height: 1px;overflow: hidden;filter:progid:DXImageTransform.Microsoft.Gradient
(startColorStr='#C3D82A', endColorStr='#9AB42A', gradientType='1');
}
b.rtop2 b, b.rbottom2 b{
display:block;height: 1px;overflow: hidden;filter:progid:DXImageTransform.Microsoft.Gradient
(startColorStr='#C3D82A', endColorStr='#9AB42A', gradientType='1');
}
b.r1{margin: 0 5px;}
b.r2{margin: 0 3px;}
b.r3{margin: 0 2px;}
b.rtop b.r4, b.rbottom b.r4{margin: 0 1px;height: 2px;}
b.rtop2 b.r4, b.rbottom2 b.r4{margin: 0 1px;height: 2px;}

b.middle{
	font-family:Arial Bold;
	font-size: 25px;
	height:88;
	font-weight: 900;
	color: #FFFFFF;
	}
body,td,th {
	font-size: 12px;
}
a:link {
	color: #0076CE;
}
a:visited {
	color: #0076CE;
}
a:hover{
color:#FF8F29;
}
-->
</style>
</head>
<body style="filter:progid:DXImageTransform.Microsoft.Gradient
(startColorStr='#ACDAFD', endColorStr='#FFFFFF', gradientType='0');" bgcolor="ACDAFD">
<center>
<div style="filter:progid:DXImageTransform.Microsoft.Gradient
(startColorStr='#C3D82A', endColorStr='#9AB42A', gradientType='1');height:88;width:710;border:0;
">
<b class="rtop"><b class="r1"></b><b class="r2"></b><b class="r3"></b><b class="r4"></b></b>
   <b class="middle"><br>.::  JSP Hi-Notepad  ::.</b>
<b class="rbottom"><b class="r4"></b><b class="r3"></b><b class="r2"></b><b class="r1"></b></b>
</div></center>
<p>
<%!String filePath;
String ThisFileName;
%>
<%filePath=request.getServletPath();
ThisFileName=filePath.replace("/","");
%>
<%!
	int k=0;
	File filedata,fileListCreator;
	boolean is_floder;
        String website_path;
        String data_path;
        boolean html_flag;
        %>
        <%
        website_path=application.getRealPath("");//��ȡ��ǰ�ļ����ڵ�·�����Ӷ�������ͬһ�ļ����´��������ļ�
        website_path=website_path.replace("\\","\\\\");
         data_path=website_path+"\\JSPHI_data";/*ע�����·��Ŀ¼��ϵͳ���� user.dir ָ����ͨ���� Java������ĵ���Ŀ¼�� */
         %>
        <%!
	File filerecord;
	FileReader recordReader;
	BufferedReader bufferedReader;
	String thisPageName=ThisFileName;
	String ID,changeTime,power,createTime,fileName,message,isHtml;
	/*��ʼ���ж�[�����ļ���]�Ƿ���ڣ��������򴴽�*/
	public void setDataFolder(String data_path)
	{
		filedata=new File(data_path);
		is_floder=filedata.exists();//�ж��ļ����Ƿ����
		if(!filedata.exists())
		{
			is_floder=filedata.mkdir();//����������򴴽�
		}
	}
        public void setFileList()
	{
          try{
            fileListCreator=new File(data_path+"\\fileList.txt");
              is_floder=fileListCreator.createNewFile();//����������򴴽�
          }catch(Exception e){System.out.println(e);}
	}
	/*�������ж������ļ���data�Ƿ���ڣ��������򴴽�*/
        /*��ʼ��ת�벿��*/
	public String translate(String str)
	{
		try{
			byte b[]=str.getBytes("ISO-8859-1");
			str=new String(b);
		}catch(Exception e){System.out.println(e);}
		return str;
	}
	/*����:ת�벿��*/
	/*��ʼ��ת�벿��*/
        public String translate_html(String str)
        {
          html_flag=false;
          if(str.contains("<")&&(str.contains(">")))
          {
            html_flag=true;
          }
          if(str.contains("<"))
          {
            str=str.replaceAll("<","&lt;");
          }
          if(str.contains(">"))
          {
            str=str.replaceAll("<","&rt;");
          }
          if(str.contains("\n"))
          {
            str=str.replaceAll("\n","<br>");
          }
          if(str.contains(" "))
          {
            str=str.replaceAll(" ","&nbsp;");
          }
          try{
		byte b[]=str.getBytes("ISO-8859-1");
                str=new String(b);
              }catch(Exception e){System.out.println(e);}
              return str;
	}
	/*����:ת�벿��*/
	/*��ʼ�������ļ���ȡ����*/
	public void setFile(String recordName)
	{
	try{
		filerecord=new File(data_path+"\\"+recordName);
		recordReader=new FileReader(filerecord);
		bufferedReader=new BufferedReader(recordReader);
		String str=new String();
			while(bufferedReader.ready())
			{
				str+=bufferedReader.readLine();
			}
		int power_index=str.lastIndexOf("<power>")+7;//��ȡpowerͷ�±�
		int power_lastindex=str.lastIndexOf("</power>");//��ȡpowerβ�±�
		int createTime_index=str.lastIndexOf("<createTime>")+12;//��ȡchangeTimeͷ�±�
		int createTime_lastindex=str.lastIndexOf("</createTime>");//��ȡchangeTimeβ�±�
		int fileName_index=str.lastIndexOf("<fileName>")+10;//��ȡfileNameͷ�±�
		int fileName_lastindex=str.lastIndexOf("</fileName>");//��ȡfileNameβ�±�
		int message_index=str.lastIndexOf("<message>")+9;//��ȡmessageͷ�±�
		int message_lastindex=str.lastIndexOf("</message>");//��ȡmessageβ�±�
		power=str.substring(power_index,power_lastindex) ;//��ȡ�ַ�������ֵ
		createTime=str.substring(createTime_index,createTime_lastindex) ;
		String[] newCreateTime=createTime.split("-");
		String[] newCreateTime2=newCreateTime[2].split("_");
		createTime=newCreateTime[0]+"-"+newCreateTime[1]+"-"+newCreateTime2[0]+" "+newCreateTime2[1]+":"+newCreateTime[3]+":"+newCreateTime[4];       
		fileName=str.substring(fileName_index,fileName_lastindex) ;
		message=str.substring(message_index,message_lastindex) ;/*�ò���buffered��*/
                recordReader.close();
		bufferedReader.close();
		}catch(Exception e){System.out.print(e);}
	}
	/*�����������ļ���ȡ����*/
	/*��ʼ�������¼�¼*/
	public void createNewFile(String newFileName,String newFileTitle,String newFileMessage,String newPower)
	{
		try{
			File newFile=new File(data_path+"\\"+newFileName+".txt");
			newFile.createNewFile();
			FileWriter newFileWriter=new FileWriter(newFile);
			BufferedWriter newFileBWriter=new BufferedWriter(newFileWriter);
			newFileBWriter.write("<createTime>"+newFileName.trim()+"</createTime>");
			newFileBWriter.write("<power>"+newPower.trim()+"</power>");
			newFileBWriter.write("<isHtml>"+html_flag+"</isHtml>");
			newFileBWriter.write("<fileName>"+translate(newFileTitle.trim())+"</fileName>");
			newFileBWriter.write("<message>"+translate_html(newFileMessage.trim())+"</message>");
			newFileBWriter.close();
			File newfileList=new File(data_path+"\\fileList.txt");
			FileWriter newFileListWriter=new FileWriter(newfileList,true);
			BufferedWriter newFileListBWriter=new BufferedWriter(newFileListWriter);
			newFileListBWriter.write(newFileName+".txt");
			newFileListBWriter.newLine();
			newFileListBWriter.close();
		}catch(Exception e){System.out.println(e);}
	}
	/*�����������¼�¼*/
	/*��ʼ����ȡ��ǰʱ��*/
	public String getNowTime()
	{
		Calendar rightNow = Calendar.getInstance();
		java.text.SimpleDateFormat instance = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
		String date = instance.format(rightNow.getTime());
		return date;
	}
	/*��������ȡ��ǰʱ��*/
%>
  <%
	setDataFolder(data_path);/*���� �ж������ļ���data�Ƿ���ڣ��������򴴽�*/
        setFileList();
	File newFile=new File(data_path+"\\fileList.txt");
	FileReader newFiler=new FileReader(newFile);
	BufferedReader newFileB=new BufferedReader(newFiler);
        boolean flag=false;
	String line;
	int o=0;
		while((line=newFileB.readLine())!=null)
		{
			o++;
		}
		newFileB.close();
		int j=o-1;
		File newFileC=new File(data_path+"\\fileList.txt");
		FileReader newFilerC=new FileReader(newFileC);
		BufferedReader newFileD=new BufferedReader(newFilerC);
		String file[]=new String[o];
		while((line=newFileD.readLine())!=null)
		{
			file[j]=line;
			j--;
			flag=true;
		}
	/*��ʼ����ҳ����*/
	int totalNum=o;//�����ܹ�ҳ��
	int currentPage=1;//���õ�ǰҳ
	int pageSize=5;//����ÿҳ��ʾ��¼��
	String num=request.getParameter("page");
	if(num!=null)
	{
		currentPage=Integer.parseInt(num);
	}
	if(currentPage<1)
	{
		currentPage=1;
	}
	int totalPage=totalNum/pageSize;
	if(totalNum%pageSize!=0)
	{
		totalPage++;
	}
	if(currentPage>totalPage)
	{
		currentPage=totalPage;
	}
	int startNum=(currentPage-1)*pageSize;
	int endNum=currentPage*pageSize-1;
	//��֤��������Ƿ񳬳���Χ
	if(endNum>=o)
	{
		endNum=o-1;
	}
//ѭ������ÿҳ�ļ�¼
%><center>
<table class="tableborder" bgColor="#FFFFFF">
<%
	 if(flag)//���fileList.txt�еļ�¼��Ϊ��
	 {
	for(int i=startNum;i<=endNum;i++)
	{
%>
<%
setFile(file[i]);
%>
		<tr><td>
<%
/*��ʼ:�����¼*/
  out.println("<table class=tablebottomborder>");
  out.println("<tr><td width=640 height=40 ><font size=4 color="+power+"><b>��"+fileName+"</b></font></td>");
  out.println("<td width=50 align=right><a href="+ThisFileName+"?delFileName="+file[i]+">ɾ��</a></td></tr>");
  out.println("<tr><td clospan=2 width=670 ><center><table width=640><tr><td><font color=#666666 size=\"2\">"+message+"</font></td></tr></table></center></td></tr>");
  out.println("<tr><td clospan=2 width=690 align=right><font color=#666666 style=margin-left:14>ʱ�䣺"+createTime+"</font></td></tr></table>");
/*����:�����¼*/
	%>
		</td></tr>
<%
newFileD.close();
	}}
%>
</table>
<br>
<table>
<tr><td>
<a href=<%=ThisFileName%>?page=1>��ҳ</a>
<a href="<%=ThisFileName%>?page=<%=currentPage-1%>">��һҳ</a>
<a href="<%=ThisFileName%>?page=<%=currentPage+1%>">��һҳ</a>
<a href="<%=ThisFileName%>?page=<%=totalPage%>">βҳ</a>
</td>
<td>
<font color="1A9DFC">[��ǰ��<%=currentPage%>ҳ/�ܹ�<%=totalPage%>ҳ]</font>

</td>
</tr>

</table>
<%	/*��������ҳ����*/ %>
<%
		String fileTitle=request.getParameter("fileTitle");
		String fileMessage=request.getParameter("fileMessage");
		String power=request.getParameter("power");
                /*��ʼ��ɾ������*/
                String delFileName=request.getParameter("delFileName");
                if(delFileName!=null)
                {
                  File delFile=new File(data_path+"\\"+delFileName);//ɾ���ļ�
                  delFile.delete();
                  File delFileList_F2=new File(data_path+"\\\\fileList.txt");
                  FileReader delFileList_FR2=new FileReader(delFileList_F2);
                  BufferedReader delFileList_BR2=new BufferedReader(delFileList_FR2);//����fileList.txt�е�����
                  int i=0;
                  String newLine="";
                  while((newLine=delFileList_BR2.readLine())!=null)//ͳ��fileList.txt�е�����
                  {
                    i++;
                  }
                  delFileList_BR2.close();
                  String delFileList_s[]=new String[i];
                  int k=0;
                  File delFileList_F=new File(data_path+"\\\\fileList.txt");
                  FileReader delFileList_FR=new FileReader(delFileList_F);
                  BufferedReader delFileList_BR=new BufferedReader(delFileList_FR);
                  while(delFileList_BR.ready())
                  {
                    delFileList_s[k]=delFileList_BR.readLine();
                    k++;
                  }
                  for(int l=0;l<delFileList_s.length;l++)
                  {
                    if(delFileList_s[l].equals(delFileName))
                    {
                      for(int b=l;b<delFileList_s.length-1;b++)
                      {
                        delFileList_s[b]=delFileList_s[b+1];//ɾ����Ҫɾ�����ļ�Ϊ���ļ�¼
                      }
                    }
                  }
                  File fftemp=new File(data_path+"\\\\fileList.txt");
                  FileWriter ff_temp_fw=new FileWriter(fftemp);
                  BufferedWriter ff_temp_bw=new BufferedWriter(ff_temp_fw);//д��fileList.txt
                  for(int l=0;l<delFileList_s.length-1;l++)
                  {
                    ff_temp_bw.write(delFileList_s[l]);//����ɾ����¼������д��fileList.txt
                    ff_temp_bw.newLine();
                  }
                  delFileList_BR.close();
                  ff_temp_bw.close();
                  response.sendRedirect(ThisFileName);
                  return;
                }
                /*������ɾ������*/
              /*������������ݲ�Ϊ�� �򴴽��Դ���ʱ��Ϊ�ļ������ı��ļ���������ҳ��*/
              if((fileTitle!=null)&&(fileMessage!=null))
              {
                createNewFile(getNowTime(),fileTitle,fileMessage,power);
                response.sendRedirect(ThisFileName);
                return;
              }
%>
<br>
<div>
  <form name="form1" method="post" action="<%=ThisFileName%>">
  <table class="tableborder" bgColor="#FFFFFF">
    <tr><td>
      <table>
        <tr>
          <td width="50" height="35px" align="right" >����:</td>
          <td width="440">
            <input name="fileTitle" type="text"  id="fileTitle" size="50" maxlength="40">
          </td>
          <td width="200">���������ɫ:
            <select name="power">
              <option value="#79A200">��ɫ</option>
              <option value="#FF68B4">��ɫ</option>
              <option value="#2859A4">��ɫ</option>
              <option value="#E6910C">��ɫ</option>
              <option value="red">��ɫ</option>
            </select>
          </td>
        </tr>
        <tr><td width="50" valign="top" align="right">����:</td>
          <td colspan="2" width="640">
            <textarea name="fileMessage" id="fileMessage" cols="80" rows="6"></textarea>
          </td>
    </tr>
    <tr>
      <td colspan="3">
        <table border="0" width="690px">
          <tr>
               <td width="450"> </td>
            <td width="140" align="center">
              <input type="submit" name="Submit" value="�ύ">
            </td>

            <td width="100" align="left">
              <input type="reset" name="reset" value="����">
            </td>
          </tr>
        </table>
      </td>
        </td>
    </tr>
      </table>
</td>
                </tr>
  </table>
  </form>
</div></center>
<center>
<br>
  <div style="filter:progid:DXImageTransform.Microsoft.Gradient
(startColorStr='#C3D82A', endColorStr='#9AB42A', gradientType='1');height:20;width:720;border:0;
"> <b class="rtop2"><b class="r1"></b><b class="r2"></b><b class="r3"></b><b class="r4"></b></b> <b>  JSP Hi-Notepad  V1.0 <b>&copy;</b> 2008.10 <a href="http://www.jsphi.com">www.jsphi.com</a></b><b class="rbottom2"><b class="r4"></b><b class="r3"></b><b class="r2"></b><b class="r1"></b></b> </div>
</center>
</body>
</html>
