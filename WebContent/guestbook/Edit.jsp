<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*"  %>
<%@ include file="name.jsp" %>
<jsp:useBean id="DBConnection" scope="page" class="com.guestbook.DBConnection"/>
<jsp:useBean id="FaceFilter" scope="page" class="com.guestbook.FaceFilter"/>
<jsp:useBean id="HTMLFilter" scope="page" class="com.guestbook.HTMLFilter"/>
<jsp:useBean id="UbbCode" scope="page" class="com.guestbook.UbbCode"/>
<%
  Boolean a=(Boolean)session.getAttribute("a"); 
  Connection conn=DBConnection.getConnectionToAccess(application.getRealPath("data/guestbook.mdb"));
  Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY); 
if(a==null||a.booleanValue()==false)
{
%>
<script language=JavaScript>
	alert('��ҳ�����վ�����ţ�');
location.href="index.jsp"
</script>
<%
}else{
  String edit=request.getParameter("edit");
  if (edit==null)
{
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=name%>-�༭����</title>
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
	font-family: "����";
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
	font-family: "����";
	font-size: 12px;
	color: #333333;
	text-decoration: none;
}
a:visited {
	font-family: "����";
	font-size: 12px;
	color: #333333;
	text-decoration: none;
}
a:hover {
	font-family: "����";
	font-size: 12px;
	color: #333333;
	text-decoration: underline;
}
a:active {
	font-family: "����";
	font-size: 12px;
	color: #333333;
	text-decoration: none;
}
-->
</style>
<SCRIPT src="images/index.js"></SCRIPT>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form action="Edit.jsp?edit=edit&id=<%=java.lang.Integer.parseInt(request.getParameter("id"))%>" method="post" name="post" id="post"">
<%
  String id=request.getParameter("id");
  String sql="select * from Guestbook where id="+id; 
  ResultSet Rs=stmt.executeQuery(sql);
  while(Rs.next())
  {
%>
  <br>
  <table width="95%" align=center 
            cellpadding=3 cellspacing=1 bgcolor="#969696" class=f12 style="WORD-BREAK: break-all">
    <tbody>
      <TR bgcolor="#FFFFFF"> 
        <TD width="20%" height=19 align=right bgcolor="#f1f1f1" class=tablebody3>���⣺</TD>
        <TD width="80%" height=19 bgcolor="#e1ebba" class=tablebody2> <INPUT name=usertitle value="<%=Rs.getString("usertitle")%>" size=40 
                  maxLength=100> <B>&nbsp;<font color="#FF0000">����</font></B></TD>
      </TR>
      <TR bgcolor="#FFFFFF"> 
        <TD width="20%" 
                height=160 align=right vAlign=top bgcolor="#f1f1f1" class=tablebody3>���ģ�</TD>
        <TD width="80%" height=160 bgcolor="#e1ebba" class=tablebody2> <select name="selectFont" id="selectFont" onChange="setFont(this.options[this.selectedIndex].value)">
            <option selected>ѡ������</option>
            <option value="����">����</option>
            <option value="����">����</option>
            <option value="����">����</option>
            <option value="��Բ">��Բ</option>
            <option value="����_GB2312">����_GB2312</option>
            <option value="Arial">Arial</option>
            <option value="Times New Roman">Times New Roman</option>
          </select> <select name="selectSize" id="selectSize" onChange="setSize(this.options[this.selectedIndex].value)">
            <option selected>�����С</option>
            <option value="6">6</option>
            <option value="8">8</option>
            <option value="10">10</option>
            <option value="12">12</option>
            <option value="14">14</option>
            <option value="18">18</option>
            <option value="24">24</option>
            <option value="36">36</option>
          </select> <select name="selectColor" id="selectColor" onChange="setColor(this.options[this.selectedIndex].value)">
            <option value="" selected>ѡ����ɫ</option>
            <option value="red">��ɫ</option>
            <option value="blue">��ɫ</option>
            <option value="yellow">��ɫ</option>
            <option value="green">��ɫ</option>
          </select> <br> <a href="javascript:" onClick="addBold()"><img src="images/ubb/bold.gif" alt="����Ӵ�" width="20" height="20" border="0"></a> 
          <a href="javascript:" onClick="addEm()"><img src="images/ubb/italic.gif" alt="������б" width="20" height="20" border="0"></a> 
          <img src="images/ubb/separator.gif" width="6" height="20"> <a href="javascript:" onClick="addLeft()"> 
          <img src="images/ubb/left.gif" alt="���������" width="20" height="20" border="0"></a> 
          <a href="javascript:" onClick="addCenter()"> <img src="images/ubb/center.gif" alt="�������" width="20" height="20" border="0"></a> 
          <a href="javascript:" onClick="addRight()"> <img src="images/ubb/right.gif" alt="���忿��" width="20" height="20" border="0"></a> 
          <img src="images/ubb/separator.gif" width="6" height="20"> <a href="javascript:" onClick="addimages()"><img src="images/ubb/image.gif" alt="�����ⲿͼƬ" width="20" height="20" border="0"></a>&nbsp; 
          <img src="images/ubb/date.gif" alt="��������" width="20" height="20"> <img src="images/ubb/separator.gif" width="6" height="20"> 
          <a href="javascript:" onClick="addQuote()"><img src="images/ubb/quote.gif" alt="��������" width="20" height="20" border="0"></a>&nbsp; 
          <a href="javascript:" onClick="addURL()"><img src="images/ubb/link.gif" alt="���볬����" width="20" height="20" border="0"></a>&nbsp; 
          <a href="javascript:" onClick="addEmail()"><img src="images/ubb/email.gif" alt="����Email" width="20" height="20" border="0"></a>	
          <BR> 
          <textarea name="content" cols="60" rows="15" wrap="VIRTUAL" class="form" id="content" style="background-color:#E4E4E4"><%=Rs.getString("content")%></textarea> 
          <BR>
          ���������ſ��Խ���������ģ��������ݲ��ܴ���<B>600</B>���ַ�����<BR> <script type="text/javascript" language="javascript">
			for(var i=0;i<20;i++)
			{
				if(i<10)
				{
					document.write("<a href=\"javascript:\" onClick=\"addMood(\':em0"+i+"\')\"><img src='images/ubbface/0"+i+".gif' border=0></a>");
				}
				else
				{
					document.write("<a href=\"javascript:\" onClick=\"addMood(\':em"+i+"\')\"><img src='images/ubbface/"+i+".gif' border=0></a>");
				}
			}
			</script> <br> <div id="ch"> <br>
          </div></TD>
      </TR>
      <tr bgcolor="#FFFFFF"> 
        <td 
                height=21 colspan=2 align=middle valign=center class=tablebody1> 
          <input type=submit value="�� ��" name=Submit> &nbsp;&nbsp; <input type=reset value="�� ��" name=Submit2> 
          &nbsp;&nbsp; <input name="checkButton" type="button" id="checkButton" onClick="checkLength()" value="�鿴���³���"> 
        </td>
      </tr>
    </tbody>
  </table>
</form>
<% } %>
</body>
</html>
<%
}else{
      String usertitle=request.getParameter("usertitle");
	  byte c[]=usertitle.getBytes("ISO-8859-1");
      usertitle=new String(c);
      String content=request.getParameter("content");
      byte d[]=content.getBytes("ISO-8859-1");
      content=new String(d);
	  String id=request.getParameter("id");
	  
	  HTMLFilter.setSource(content);
      HTMLFilter.run();
      content=HTMLFilter.getResult();
					
      UbbCode.setSource(content);
      UbbCode.run();
      content=UbbCode.getResult();
					
      FaceFilter.setSource(content);
      FaceFilter.run();
      content=FaceFilter.getResult();
	  
      String  sql1="update Guestbook set usertitle='"+usertitle+"',content='"+content+"' where id="+id; 
	
	  try{
        stmt.executeUpdate(sql1);
	  }
	  catch(Exception e)
      {
	   response.sendRedirect("error.jsp?error=2");//���ݿ���³���
	  }
	if(conn!=null)
	{
		conn.close();
	}
	if(stmt!=null)
	{
		stmt.close();
}
%>
<script>self.opener.location.reload();</script>
<script>self.close();</script>
<%  	
}
}
%>
