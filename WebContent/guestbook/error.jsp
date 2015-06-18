<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" isErrorPage="true"%>
<%@ include file="name.jsp" %>
<%
String errorCode=request.getParameter("code");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=name%>-错误</title>
<style type="text/css">
<!--
body {
	border: 1px 1 #CCCCCC;
}
.bian {
	border-top-width: 1px;
	border-top-style: solid;
	border-top-color: #969696;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: #999999;
}
.f12 {
	font-family: "宋体";
	font-size: 12px;
	color: #000000;
	text-decoration: none;
	line-height: 23px;
}
.bian1 {
	border-right-width: 1px;
	border-left-width: 1px;
	border-right-style: solid;
	border-left-style: solid;
	border-right-color: #969696;
	border-left-color: #969696;
}
a:link {
	font-family: "宋体";
	font-size: 12px;
	color: #333333;
	text-decoration: none;
}
a:visited {
	font-family: "宋体";
	font-size: 12px;
	color: #333333;
	text-decoration: none;
}
a:hover {
	font-family: "宋体";
	font-size: 12px;
	color: #333333;
	text-decoration: underline;
}
a:active {
	font-family: "宋体";
	font-size: 12px;
	color: #333333;
	text-decoration: none;
}
-->
</style>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="60%" height="70%" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#111111" class="f12" style="border-collapse: collapse">
  <tr> 
    <td width="100%" height="210"> <table class="f12" border="0" cellpadding="0" cellspacing="1" style="border-collapse: collapse" bordercolor="#111111" width="100%" height="187">
        <tr> 
          <td width="100%" class="tablebody1" height="16"> <p align="center"><img src="images/error.gif" width="122" height="50" border="0">  
            <p align="center"><br>
              <br>
              <br>
<%
		out.print("出错了!");

%>
              <br>
              <br>
              <a href="javascript:history.back(1)"><b>返回重新填写</b></a></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
