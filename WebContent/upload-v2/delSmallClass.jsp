<%@ page contentType="text/html; charset=GBK" language="java" buffer="32kb"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.util.*"%>
<%
   request.setCharacterEncoding("gb2312");
   String id=request.getParameter("id");//��ȡС��ID

   String del_sql="delete PicSmallClass where PicSClassID="+id;
   ResultSet rs = null;
   try
   {
           Connection con=DataBaseConnection.getConnection();
	       PreparedStatement pstmt=con.prepareStatement(del_sql);
	       pstmt.executeUpdate();
           out.println("<SCRIPT language=javascript>alert('ɾ��С��ɹ���');window.location='Admin_PicClass.jsp';</script>");

		   pstmt.close();
		   con.close();
   }
   catch(Exception e)
   {
	   e.printStackTrace();
       out.println("<SCRIPT language=javascript>alert('ɾ��ʧ�ܣ�');window.location='addPicClass.jsp';</script>");
   }


%>