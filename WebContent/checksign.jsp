<%@ page language="java"  import="java.util.*"pageEncoding="gbk" %>
<%@page import="com.reg.bean.RegDao" %>
<%@page import="com.reg.bean.RegBean" %>
<html> 
<body background="./pic/2.jpg">

<%
   String name=request.getParameter("name");
   String truename=new String(name.getBytes("ISO8859-1"));
   String pwd=request.getParameter("pwd");
   //���ط�Ҫ�� String myname=

   RegDao reg=new RegDao(truename,pwd);
   
   reg.setReg();
   String status=reg.getstatus();
   boolean workornot=reg.getWorkorNot();
    if(workornot){       //���Ȳ鿴�ǲ�����Чʱ��ǩ����
       if(status.equals("exist")) //����Ƿ񲻴�������û���
        {  
           String feedback=reg.addRegInfo();
           
           System.out.println(feedback);
           if(feedback.equals("yes")){
              out.println("<font color=pink>");
              out.println(" ^_^ ǩ���ɹ�!");
              out.println("</fton>");
           }
           if(feedback.equals("no")){
             out.println("�Բ���,�����ظ�ǩ��!");
           }
         }
         else{
         out.println("<font color=pink>");
         out.println("�û������������!");
         out.println("</fton>");
         }
   }
   else{
   out.println("<font color=pink>");
   out.println("�Բ������ڲ�����Чǩ��ʱ��!");
   out.println("</fton>");
   }
  
   %>
  <a href="index.jsp">����</a> 
 
 </body>
  </html>