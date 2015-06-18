<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<jsp:useBean id="DBConnection" scope="page" class="com.guestbook.DBConnection"/>
<%
   Boolean a=(Boolean)session.getAttribute("a");    
   Connection conn=conn=DBConnection.getConnectionToAccess(application.getRealPath("data/guestbook.mdb"));
   Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);  
if(a==null||a.booleanValue()==false)
{
%>
<script language=JavaScript>
	alert('此页面仅对站长开放！');
location.href="index.jsp"
</script>
<%
}else{
   String id=request.getParameter("id");
   String sqlr="delete  from Guestbook where id=" +id;  
    try{
//out.print(sql);
         stmt.executeUpdate(sqlr);
         response.sendRedirect("index.jsp");
      }
	  catch(Exception e){
        response.sendRedirect("error.jsp?error=2");//数据库更新出错！
     }
	if(conn!=null)
	{
		conn.close();
	}
	if(stmt!=null)
	{
		stmt.close();
	}
}
%>

