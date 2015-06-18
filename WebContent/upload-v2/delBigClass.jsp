<%@ page contentType="text/html; charset=GBK" language="java" buffer="32kb"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.util.*"%>
<%
   request.setCharacterEncoding("gb2312");
   String id=request.getParameter("id");

   String del_sql="delete PicBigClass where PicBClassID="+Integer.parseInt(id);
   ResultSet rs = null;
   try
   {
           Connection con=DataBaseConnection.getConnection();
	       PreparedStatement pstmt=con.prepareStatement(del_sql);
	       pstmt.executeUpdate();
           out.println("<SCRIPT language=javascript>alert('删除大类成功！');window.location='Admin_PicClass.jsp';</script>");
   }
   catch(Exception e)
   {
	   e.printStackTrace();
       out.println("<SCRIPT language=javascript>alert('删除失败！');window.location='Admin_PicClass.jsp';</script>");
   }


%>