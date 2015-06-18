 <%@page contentType="text/html;charset=gbk" %>
 
 <%@page import="com.reg.bean.Regist"%>
 <body background="./pic/3.jpg">
 <%
  
    String username=request.getParameter("username");
    String myusername=new String(username.getBytes("ISO8859-1"));
   
    String name=request.getParameter("name");
    System.out.println(name);
    String myname=new String(name.getBytes("ISO8859-1"));
    System.out.println(myname);
    String pwd=request.getParameter("pwd");
    
    Regist regist=new Regist(myusername,myname,pwd);
    String notice=regist.addRegist();
    out.println(notice);
     
 %>
 <a href="index.jsp">·µ»Ø</a>
 </body>