 <%@page   contentType="text/html;charset=gbk" %>
<%@page import="com.reg.bean.GetCount" %>
<jsp:directive.page import="java.sql.ResultSet"/>
<jsp:directive.page import="java.util.Date"/>

<%
   int week=Integer.parseInt(request.getParameter("week"));
   
   GetCount count=new GetCount(week);
   ResultSet rs=count.getResult();
  
 %>
 
 <style type="text/css">
body {
	margin-left: 20px;
	margin-right: 20px;
}
</style>
 <html>
 <body background="./pic/3.jpg">
  <center><font size=6 >�����ǹ����ұ���ǩ����</font></center>
  <a href="searchall.jsp">����</a>
  <table width=60% border=1 align="center">
  
   <tr>
   <td>&nbsp;����</td>
   <td>ǩ������</td>
   <td>��ϸ���</td>
   </tr>

 <% while(rs.next()){ %>
 <tr>
 <td> <%=rs.getString("Sname") %> </td>
 <td> <%=rs.getInt("a") %> </td>
 <td> <a href=" detailview.jsp?ID=<%=rs.getInt("ID")%>&Week=<%=rs.getInt("WhichWeek")%>" >��ϸ</a> </td>
 </tr>
 <%} %>
  </table>
 </body>
</html>