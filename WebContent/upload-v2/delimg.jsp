<%@ page contentType="text/html; charset=GBK" language="java" buffer="32kb"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.util.*"%>
<HTML>
<HEAD>
<TITLE></TITLE>
</HEAD>

<BODY>
<%
   String ids=request.getParameter("id");
   String name1=request.getParameter("name");
   String name2=request.getParameter("min_name");

   int s1=name1.indexOf("\\");
   String n1=name1.substring(s1+1,name1.length()); //要删除的文件名
   String subPath=name1.substring(0,s1);   //获取文件夹名
   int s2=name2.indexOf("\\");
   String n2=name2.substring(s2+1,name2.length());//要删除的缩略文件名

   String FilePath=request.getRealPath("");
   String allPath=FilePath+"\\"+subPath+"\\"; //获取整个绝对路径
   java.io.File delFile=new java.io.File(allPath,n1);
   if(delFile.exists())
      delFile.delete(); //如果该文件存在，则删除
   java.io.File min_delFile=new java.io.File(allPath,n2);
   if(min_delFile.exists())
      min_delFile.delete(); //如果该文件存在，则删除
   try
   {
	   String sql="delete up_imges where id="+ids;
       Connection con=DataBaseConnection.getConnection();
	   PreparedStatement pstmt=con.prepareStatement(sql);
	   pstmt.executeUpdate();
       out.println("<SCRIPT language=javascript>alert('删除成功！');window.location='upload.jsp';</script>");

	   pstmt.close();
	   con.close();
   }
   catch(Exception e)
   {
      e.printStackTrace();
   }

%>
</BODY>
</HTML>
