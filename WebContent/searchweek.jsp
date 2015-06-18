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
  <center><font size=6 >启明星工作室本周签到表</font></center>
  <a href="searchall.jsp">返回</a>
  <table width=60% border=1 align="center">
  
   <tr>
   <td>&nbsp;姓名</td>
   <td>签到次数</td>
   <td>详细情况</td>
   </tr>

 <% while(rs.next()){ %>
 <tr>
 <td> <%=rs.getString("Sname") %> </td>
 <td> <%=rs.getInt("a") %> </td>
 <td> <a href=" detailview.jsp?ID=<%=rs.getInt("ID")%>&Week=<%=rs.getInt("WhichWeek")%>" >详细</a> </td>
 </tr>
 <%} %>
  </table>
 </body>
</html>