<%@ page contentType="text/html; charset=GBK" language="java" buffer="32kb"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.util.*"%>

<%
   request.setCharacterEncoding("gb2312");
   String id=request.getParameter("BigClassID");//获取大类编号
   String Sname=request.getParameter("SPicClassName");//获取小类名称
   String Sid=request.getParameter("Sid");//获取小类编号

   String update_sql="update PicSmallClass set PicSClassName='"+Sname+"',PicBClassID="+id+" where PicSClassID="+Sid+"";
   ResultSet rs = null;
   try
   {
           Connection con=DataBaseConnection.getConnection();
	       PreparedStatement pstmt=con.prepareStatement(update_sql);
	       pstmt.executeUpdate();
           out.println("<SCRIPT language=javascript>alert('修改小类成功！');window.location='Admin_PicClass.jsp';</script>");

		   pstmt.close();
		   con.close();
   }
   catch(Exception e)
   {
	   e.printStackTrace();
       out.println("<SCRIPT language=javascript>alert('修改失败，请查看小类名称是否过长！');window.location='addSmallClass.jsp';</script>");
   }


%>