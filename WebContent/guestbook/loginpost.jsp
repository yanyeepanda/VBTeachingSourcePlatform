<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>
<jsp:useBean id="DBConnection" scope="page" class="com.guestbook.DBConnection"/>
<jsp:useBean id="loginMD5" scope="page" class="com.guestbook.MD5" />
<%
  
  
  String admin=request.getParameter("admin");
  String passwords=request.getParameter("password");
  passwords=loginMD5.getMD5ofStr(passwords);
  String rand = (String)session.getAttribute("rand");
  String CheckCode=request.getParameter("CheckCode");
  Connection conn=DBConnection.getConnectionToAccess(application.getRealPath("data/guestbook.mdb"));
  Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
  String sql = "select * from admin where password='"+ passwords + "' and admin='" + admin +"'";
  ResultSet rs=stmt.executeQuery(sql);
  
   if(rs.next()){
   if(rand.equals(CheckCode)){
   session.setAttribute("a",new Boolean("true"));
   response.sendRedirect("index.jsp");}
   else{%><script language=javascript> 
alert("验证码错误"); 
history.back();
</script><%}
    }else{
	/*out.println(rs);*/
	     out.print("<script>");
         out.print("alert('用户名或密码错误！');");
         out.print("history.back();");
         out.print("</script>");
   }
  
	//关闭数据库
	if(conn!=null)
	{
		conn.close();
	}
	if(stmt!=null)
	{
		stmt.close();
	}
%>