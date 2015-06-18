<%@ page language="java"  import="java.util.*"pageEncoding="gbk" %>
<%@page import="com.reg.bean.RegDao" %>
<%@page import="com.reg.bean.RegBean" %>
<html> 
<body background="./pic/2.jpg">

<%
   String name=request.getParameter("name");
   String truename=new String(name.getBytes("ISO8859-1"));
   String pwd=request.getParameter("pwd");
   //个地方要改 String myname=

   RegDao reg=new RegDao(truename,pwd);
   
   reg.setReg();
   String status=reg.getstatus();
   boolean workornot=reg.getWorkorNot();
    if(workornot){       //首先查看是不是有效时间签到。
       if(status.equals("exist")) //检查是否不存在这个用户。
        {  
           String feedback=reg.addRegInfo();
           
           System.out.println(feedback);
           if(feedback.equals("yes")){
              out.println("<font color=pink>");
              out.println(" ^_^ 签到成功!");
              out.println("</fton>");
           }
           if(feedback.equals("no")){
             out.println("对不起,不能重复签到!");
           }
         }
         else{
         out.println("<font color=pink>");
         out.println("用户名或密码错误!");
         out.println("</fton>");
         }
   }
   else{
   out.println("<font color=pink>");
   out.println("对不起，现在不是有效签到时间!");
   out.println("</fton>");
   }
  
   %>
  <a href="index.jsp">返回</a> 
 
 </body>
  </html>