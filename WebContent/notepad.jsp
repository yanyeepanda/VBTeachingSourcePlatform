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
        website_path=application.getRealPath("");//获取当前文件所在的路径，从而方便在同一文件夹下创建数据文件
        website_path=website_path.replace("\\","\\\\");
         data_path=website_path+"\\JSPHI_data";/*注意相对路径目录由系统属性 user.dir 指定，通常是 Java虚拟机的调用目录。 */
         %>
        <%!
	File filerecord;
	FileReader recordReader;
	BufferedReader bufferedReader;
	String thisPageName=ThisFileName;
	String ID,changeTime,power,createTime,fileName,message,isHtml;
	/*开始：判断[数据文件夹]是否存在，不存在则创建*/
	public void setDataFolder(String data_path)
	{
		filedata=new File(data_path);
		is_floder=filedata.exists();//判断文件夹是否存在
		if(!filedata.exists())
		{
			is_floder=filedata.mkdir();//如果不存在则创建
		}
	}
        public void setFileList()
	{
          try{
            fileListCreator=new File(data_path+"\\fileList.txt");
              is_floder=fileListCreator.createNewFile();//如果不存在则创建
          }catch(Exception e){System.out.println(e);}
	}
	/*结束：判断数据文件夹data是否存在，不存在则创建*/
        /*开始：转码部分*/
	public String translate(String str)
	{
		try{
			byte b[]=str.getBytes("ISO-8859-1");
			str=new String(b);
		}catch(Exception e){System.out.println(e);}
		return str;
	}
	/*结束:转码部分*/
	/*开始：转码部分*/
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
	/*结束:转码部分*/
	/*开始：单个文件读取数据*/
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
		int power_index=str.lastIndexOf("<power>")+7;//获取power头下标
		int power_lastindex=str.lastIndexOf("</power>");//获取power尾下标
		int createTime_index=str.lastIndexOf("<createTime>")+12;//获取changeTime头下标
		int createTime_lastindex=str.lastIndexOf("</createTime>");//获取changeTime尾下标
		int fileName_index=str.lastIndexOf("<fileName>")+10;//获取fileName头下标
		int fileName_lastindex=str.lastIndexOf("</fileName>");//获取fileName尾下标
		int message_index=str.lastIndexOf("<message>")+9;//获取message头下标
		int message_lastindex=str.lastIndexOf("</message>");//获取message尾下标
		power=str.substring(power_index,power_lastindex) ;//截取字符串并赋值
		createTime=str.substring(createTime_index,createTime_lastindex) ;
		String[] newCreateTime=createTime.split("-");
		String[] newCreateTime2=newCreateTime[2].split("_");
		createTime=newCreateTime[0]+"-"+newCreateTime[1]+"-"+newCreateTime2[0]+" "+newCreateTime2[1]+":"+newCreateTime[3]+":"+newCreateTime[4];       
		fileName=str.substring(fileName_index,fileName_lastindex) ;
		message=str.substring(message_index,message_lastindex) ;/*用不用buffered？*/
                recordReader.close();
		bufferedReader.close();
		}catch(Exception e){System.out.print(e);}
	}
	/*结束：单个文件读取数据*/
	/*开始：创建新记录*/
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
	/*结束：创建新记录*/
	/*开始：获取当前时间*/
	public String getNowTime()
	{
		Calendar rightNow = Calendar.getInstance();
		java.text.SimpleDateFormat instance = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
		String date = instance.format(rightNow.getTime());
		return date;
	}
	/*结束：获取当前时间*/
%>
  <%
	setDataFolder(data_path);/*调用 判断数据文件夹data是否存在，不存在则创建*/
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
	/*开始：分页技术*/
	int totalNum=o;//设置总共页数
	int currentPage=1;//设置当前页
	int pageSize=5;//设置每页显示记录数
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
	//验证结束编号是否超出范围
	if(endNum>=o)
	{
		endNum=o-1;
	}
//循环遍历每页的纪录
%><center>
<table class="tableborder" bgColor="#FFFFFF">
<%
	 if(flag)//如果fileList.txt中的记录不为空
	 {
	for(int i=startNum;i<=endNum;i++)
	{
%>
<%
setFile(file[i]);
%>
		<tr><td>
<%
/*开始:输出记录*/
  out.println("<table class=tablebottomborder>");
  out.println("<tr><td width=640 height=40 ><font size=4 color="+power+"><b>★"+fileName+"</b></font></td>");
  out.println("<td width=50 align=right><a href="+ThisFileName+"?delFileName="+file[i]+">删除</a></td></tr>");
  out.println("<tr><td clospan=2 width=670 ><center><table width=640><tr><td><font color=#666666 size=\"2\">"+message+"</font></td></tr></table></center></td></tr>");
  out.println("<tr><td clospan=2 width=690 align=right><font color=#666666 style=margin-left:14>时间："+createTime+"</font></td></tr></table>");
/*结束:输出记录*/
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
<a href=<%=ThisFileName%>?page=1>首页</a>
<a href="<%=ThisFileName%>?page=<%=currentPage-1%>">上一页</a>
<a href="<%=ThisFileName%>?page=<%=currentPage+1%>">下一页</a>
<a href="<%=ThisFileName%>?page=<%=totalPage%>">尾页</a>
</td>
<td>
<font color="1A9DFC">[当前第<%=currentPage%>页/总共<%=totalPage%>页]</font>

</td>
</tr>

</table>
<%	/*结束：分页技术*/ %>
<%
		String fileTitle=request.getParameter("fileTitle");
		String fileMessage=request.getParameter("fileMessage");
		String power=request.getParameter("power");
                /*开始：删除操作*/
                String delFileName=request.getParameter("delFileName");
                if(delFileName!=null)
                {
                  File delFile=new File(data_path+"\\"+delFileName);//删除文件
                  delFile.delete();
                  File delFileList_F2=new File(data_path+"\\\\fileList.txt");
                  FileReader delFileList_FR2=new FileReader(delFileList_F2);
                  BufferedReader delFileList_BR2=new BufferedReader(delFileList_FR2);//读入fileList.txt中的内容
                  int i=0;
                  String newLine="";
                  while((newLine=delFileList_BR2.readLine())!=null)//统计fileList.txt中的行数
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
                        delFileList_s[b]=delFileList_s[b+1];//删除以要删除的文件为名的记录
                      }
                    }
                  }
                  File fftemp=new File(data_path+"\\\\fileList.txt");
                  FileWriter ff_temp_fw=new FileWriter(fftemp);
                  BufferedWriter ff_temp_bw=new BufferedWriter(ff_temp_fw);//写入fileList.txt
                  for(int l=0;l<delFileList_s.length-1;l++)
                  {
                    ff_temp_bw.write(delFileList_s[l]);//将已删除记录的数组写入fileList.txt
                    ff_temp_bw.newLine();
                  }
                  delFileList_BR.close();
                  ff_temp_bw.close();
                  response.sendRedirect(ThisFileName);
                  return;
                }
                /*结束：删除操作*/
              /*如果标题与内容不为空 则创建以创建时间为文件名的文本文件，并返回页面*/
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
          <td width="50" height="35px" align="right" >主题:</td>
          <td width="440">
            <input name="fileTitle" type="text"  id="fileTitle" size="50" maxlength="40">
          </td>
          <td width="200">标记主题颜色:
            <select name="power">
              <option value="#79A200">绿色</option>
              <option value="#FF68B4">粉色</option>
              <option value="#2859A4">蓝色</option>
              <option value="#E6910C">橙色</option>
              <option value="red">红色</option>
            </select>
          </td>
        </tr>
        <tr><td width="50" valign="top" align="right">内容:</td>
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
              <input type="submit" name="Submit" value="提交">
            </td>

            <td width="100" align="left">
              <input type="reset" name="reset" value="重置">
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
