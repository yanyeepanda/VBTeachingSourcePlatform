<%@ page contentType="text/html; charset=GBK" language="java" buffer="32kb"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.util.*"%>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/bodystyle.css" rel="stylesheet" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
function check()
{
   var name=form1.SPicClassName.value;
   if(name=="")
   {
        alert("������С�����ƣ�");
	    form1.SPicClassName.focus();
		return false;
   }
}
</SCRIPT>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br><br>

    <table width="90%" border="1" align="center" cellpadding="3" cellspacing="0" bordercolor="#FFFFFF" class="unnamed4" id="AutoNumber1" style="border-collapse: collapse">
      <tr>
    <td width="100%" height="27" background="images/bg.gif"><p align="center" class="title"><strong>�������</strong></td>
  </tr>
  <tr>
  <form name="form1" action="doUpdateSmallClass.jsp" method="post">
	<TABLE width="90%" border="1" align="center" cellpadding="3" cellspacing="0" bordercolor="#FFFFFF" class="unnamed4" id="AutoNumber1" style="border-collapse: collapse">
	<TR>
		<TD width="40%" align="left">&nbsp;</TD>
		<TD>&nbsp;</TD>
	</TR>
	<TR class="chinese">
		<TD width="40%" align="right">ѡ������б�</TD>
		<TD>
	    <select name="BigClassID" size="1" class="chinese" id="BigClassID">
		<%
            request.setCharacterEncoding("iso-8859-1");
		    String id=request.getParameter("id");//��ȡС��id
            String Sname=request.getParameter("name");//��ȡС������
			String Bigid=request.getParameter("Bid");//��ȡ����id

            ResultSet rs = null;
			String sql="select * from PicBigClass";
			String Bname;
			int Bid;
            try
            {
                Connection con=DataBaseConnection.getConnection();
	            Statement stmt=con.createStatement();
                rs=stmt.executeQuery(sql);
				int i=0;
	            while(rs.next())
	            {
					 i++;
	                 Bid=rs.getInt(1);
					 Bname=rs.getString(2);
					 if(Bid==Integer.parseInt(Bigid))
					 {
					     out.println("<option value='"+Bid+"' selected>"+Bname+"</option>");
					 }
					 else
					     out.println("<option value='"+Bid+"' >"+Bname+"</option>");
	            }
				rs.close();
				stmt.close();
				con.close();
			}
			catch(Exception e)
			{
			    e.printStackTrace();
			}

		%>
        </select>
		
		<FONT  COLOR="#FF0000">* ��ѡ</FONT></TD>
	</TR>
	<input type="hidden" name="Sid" value="<%=id%>">
	<TR class="chinese">
		<TD width="40%" align="right">С�����ƣ�</TD>
		<TD><input type=text name="SPicClassName" value="<%=new String(Sname.getBytes("iso-8859-1"))%>"></TD>
	</TR>
	<TR>
		<TD width="40%">&nbsp;</TD>
		<TD><input name="submit" type="Submit" value=" �ύ " onClick="return check();"> <input name="goback" type="button" value=" ���� " onClick="javascript:history.back();"></TD>
	</TR>
	</TABLE>
</form>
  </tr>
</table>
<br><br>
</body>
</html>
