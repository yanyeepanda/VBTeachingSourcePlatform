<%@ page contentType="text/html; charset=GBK" language="java" buffer="32kb"%>
<%
	session.setAttribute("Login","");
	session.setAttribute("AdminID","");
	session.setAttribute("AdminType","");
	session.setAttribute("AdminName","");
	out.println("<SCRIPT LANGUAGE='JavaScript'>alert('�ɹ��˳�ϵͳ!');location.href='index.jsp';</SCRIPT>");
	//response.sendRedirect("index.jsp");
%>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">