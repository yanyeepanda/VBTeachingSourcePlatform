<%@ page contentType="text/html; charset=GBK" language="java" buffer="32kb"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.util.*"%>

<%
   request.setCharacterEncoding("gb2312");
   String id=request.getParameter("PicBClassID");
   String name=request.getParameter("PicBClassName");

   String update_sql="update PicBigClass  set PicBClassName='"+name+"' where PicBClassID="+id;
   ResultSet rs = null;
   try
   {
           Connection con=DataBaseConnection.getConnection();
	       PreparedStatement pstmt=con.prepareStatement(update_sql);
	       pstmt.executeUpdate();
           out.println("<SCRIPT language=javascript>alert('�޸Ĵ���ɹ���');window.location='Admin_PicClass.jsp';</script>");

		   pstmt.close();
		   con.close();

   }
   catch(Exception e)
   {
       out.println("<SCRIPT language=javascript>alert('�޸�ʧ�ܣ���鿴���������Ƿ������');window.location='addPicClass.jsp';</script>");
   }


%>