<%@ page contentType="text/html; charset=GBK" language="java" buffer="32kb"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.util.*"%>

<%
   request.setCharacterEncoding("gb2312");
   String id=request.getParameter("BigClassID");//��ȡ������
   String Sname=request.getParameter("SPicClassName");//��ȡС������
   String Sid=request.getParameter("Sid");//��ȡС����

   String update_sql="update PicSmallClass set PicSClassName='"+Sname+"',PicBClassID="+id+" where PicSClassID="+Sid+"";
   ResultSet rs = null;
   try
   {
           Connection con=DataBaseConnection.getConnection();
	       PreparedStatement pstmt=con.prepareStatement(update_sql);
	       pstmt.executeUpdate();
           out.println("<SCRIPT language=javascript>alert('�޸�С��ɹ���');window.location='Admin_PicClass.jsp';</script>");

		   pstmt.close();
		   con.close();
   }
   catch(Exception e)
   {
	   e.printStackTrace();
       out.println("<SCRIPT language=javascript>alert('�޸�ʧ�ܣ���鿴С�������Ƿ������');window.location='addSmallClass.jsp';</script>");
   }


%>