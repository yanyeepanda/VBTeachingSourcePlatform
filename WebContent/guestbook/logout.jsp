<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"  %>
<%
		session.invalidate();
		response.sendRedirect("index.jsp");
%>