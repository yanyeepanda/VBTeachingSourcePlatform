<%@ page contentType="text/html; charset=GBK" language="java" buffer="32kb"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.util.*"%>

<%
request.setCharacterEncoding("gb2312");
   String id=request.getParameter("PicBClassID");
   String name=request.getParameter("PicBClassName");

   String select_sql="select * from PicBigClass where PicBClassID="+id;
   String insert_sql="insert into PicBigClass values(?,?)";
   ResultSet rs = null;
   try
   {
       Connection con=DataBaseConnection.getConnection();
	   Statement stmt=con.createStatement();
       rs=stmt.executeQuery(select_sql);
	   int n=0;
	   while(rs.next())
	   {
	       n++;
	   }
	   if(n>0)
	   {
           out.println("<SCRIPT language=javascript>alert('�������Ѵ��ڣ������ظ���');window.location='addPicClass.jsp';</script>");	      
	   }
	   else
	   {
	       PreparedStatement pstmt=con.prepareStatement(insert_sql);
		   pstmt.setInt(1,Integer.parseInt(id));
		   pstmt.setString(2,name);
	       pstmt.executeUpdate();
           out.println("<SCRIPT language=javascript>alert('���Ӵ���ɹ���');window.location='Admin_PicClass.jsp';</script>");

		   pstmt.close();
		   con.close();
	   }


   }
   catch(Exception e)
   {
       out.println("<SCRIPT language=javascript>alert('����ʧ�ܣ���鿴���������Ƿ������');window.location='addPicClass.jsp';</script>");
   }


%>