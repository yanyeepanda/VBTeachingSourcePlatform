<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<jsp:directive.page import="com.reg.bean.RegDao"/>
<jsp:directive.page import="com.reg.bean.RegBean"/>
<%@page import="com.reg.bean.RegDao" %>
<%@page import="com.reg.bean.RegBean" %>
<%
     int id=Integer.parseInt(request.getParameter("ID"));
     int week=Integer.parseInt(request.getParameter("Week"));
     
     RegDao reg=new RegDao();
     reg.getOnesInfo(id,week);
     %>
     
     
  <html>
 <body background="./pic/3.jpg">
 <style type="text/css">
body {
	margin-left: 20px;
	margin-right: 20px;
}
</style>


 <br>
 <a href="searchall.jsp">返回</a>
 <table width="600" border="1" align="center">
<tr>
<td>签到人</td>
<td>签到时间</td>
<td>星期几</td>
<td>时辰</td>
<td>第几周</td>
<td>第几月</td>
</tr>
<%   
    
    ArrayList list=RegDao.getList();
  
    RegBean regi=new RegBean();
    for(int i=0;i<list.size();i++)
    {
       regi=(RegBean)list.get(i);
  %>
    
      <tr> 
      <td><%=regi.getSname() %></td>
      <td><%=regi.getPresentTime()%></td>
      <td><%=regi.getWeekday()%></td>
      <td><%if(regi.getPeriod().endsWith("AM")){   out.print("上午");}
            if(regi.getPeriod().endsWith("PM")){   out.print("下午");}
            if(regi.getPeriod().endsWith("NIGHT")){out.print("晚上");}
           %></td>
      <td align="center"><%=regi.getWhichweek()%></td>
      <td align="center"><%=regi.getWhichmonth()%></td>
      </tr>
   <%} %> 
    
</table>
</body>
</html>