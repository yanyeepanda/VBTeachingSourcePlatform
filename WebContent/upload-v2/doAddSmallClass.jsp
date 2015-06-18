<%@ page contentType="text/html; charset=GBK" language="java" buffer="32kb"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.util.*"%>

<%
   request.setCharacterEncoding("gb2312");
   String id=request.getParameter("PicBClassID");//获取大类编号
   String name=request.getParameter("PicSClassName").trim();//获取小类名称

   String insert_sql="insert into PicSmallClass (PicSClassName,PicBClassID) values(?,?)";
   ResultSet rs = null;
   try
   {
           Connection con=DataBaseConnection.getConnection();
	       PreparedStatement pstmt=con.prepareStatement(insert_sql);
		   pstmt.setString(1,name);
		   pstmt.setInt(2,Integer.parseInt(id));
	       pstmt.executeUpdate();
           out.println("<SCRIPT language=javascript>alert('添加小类成功！');window.location='Admin_PicClass.jsp';</script>");

		   pstmt.close();
		   con.close();
   }
   catch(Exception e)
   {
	   e.printStackTrace();
       out.println("<SCRIPT language=javascript>alert('添加失败，请查看小类名称是否过长！');window.location='addSmallClass.jsp';</script>");
   }


%>