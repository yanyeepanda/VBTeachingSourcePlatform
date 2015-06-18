<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.reg.bean.GetCount" %>
<jsp:directive.page import="java.sql.ResultSet"/>
<jsp:directive.page import="com.reg.bean.RegDao"/>

<%
   RegDao r=new RegDao();
   int Week=r.getdate();                   /* 得到当前是第几周，默认显示的是当前一周 */
   String week=Integer.toString(Week); 

   GetCount count=new GetCount(Week);      /* 调用GetCount类得到当前一周各人的签到次数 */
   ResultSet rs=count.getResult();         /* 得到结果集，没有将其转化成对象型 */
  
 %>
 
<html>
 <body background="./pic/3.jpg">
 
  <center><font size=6 >启明星工作室本周签到表</font></center>
  <table width=60% border=1 align="center">
   <form  action="searchweek.jsp">  
  <select name="week">                   
     <option  value="1">第一周</option>
     <option  value="2">第二周</option>
     <option  value="3">第三周</option>
     <option  value="4">第四周</option>
     <option  value="5">第五周</option>
     <option  value="6">第六周</option>
     <option  value="7">第七周</option>
     <option  value="8">第八周</option>
     <option  value="9">第九周</option>
     <option  value="10">第十周</option>
     <option  value="11">第十一周</option>
     <option  value="12">第十二周</option>
     <option  value="13">第十三周</option>
     <option  value="14">第十四周</option>
     <option  value="15">第十五周</option>
     <option  value="16">第十六周</option>
     <option  value="17">第十七周</option>
     <option  value="18">第十八周</option>
     <option  value="19">第十九周</option>
     <option  value="20">第二十周</option>
     <option  value="21">第二十一周</option>
     
  </select>
  <input type="submit" value="查询">
  <input type="button" value="返回到登录页" onclick="javascript:window.location.href='index.jsp'">
  </form>
   <tr>
   <td>姓名</td>
   <td>签到次数</td>
   <td>详细情况</td>
   </tr>

 <% while(rs.next()){ %>
 <tr>
 <td> <%=rs.getString("Sname") %> </td>
 <td> <%=rs.getInt("a") %> </td>
 <td> <a href="detailview.jsp?ID=<%=rs.getInt("ID")%>&Week=<%=week %>">详细</a></td>
 </tr>
 <%} %>
  </table>
 </body>
</html>