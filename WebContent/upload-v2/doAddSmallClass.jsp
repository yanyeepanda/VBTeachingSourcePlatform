<%@ page contentType="text/html; charset=GBK" language="java" buffer="32kb"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.util.*"%>

<%
   request.setCharacterEncoding("gb2312");
   String id=request.getParameter("PicBClassID");//��ȡ������
   String name=request.getParameter("PicSClassName").trim();//��ȡС������

   String insert_sql="insert into PicSmallClass (PicSClassName,PicBClassID) values(?,?)";
   ResultSet rs = null;
   try
   {
           Connection con=DataBaseConnection.getConnection();
	       PreparedStatement pstmt=con.prepareStatement(insert_sql);
		   pstmt.setString(1,name);
		   pstmt.setInt(2,Integer.parseInt(id));
	       pstmt.executeUpdate();
           out.println("<SCRIPT language=javascript>alert('���С��ɹ���');window.location='Admin_PicClass.jsp';</script>");

		   pstmt.close();
		   con.close();
   }
   catch(Exception e)
   {
	   e.printStackTrace();
       out.println("<SCRIPT language=javascript>alert('���ʧ�ܣ���鿴С�������Ƿ������');window.location='addSmallClass.jsp';</script>");
   }


%>