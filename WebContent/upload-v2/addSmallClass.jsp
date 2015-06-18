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
   var name=form1.PicSClassName.value;
   if(name=="")
   {
        alert("请输入小类名称！");
	    form1.PicSClassName.focus();
		return false;
   }
}

</SCRIPT>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br><br>

    <table width="90%" border="1" align="center" cellpadding="3" cellspacing="0" bordercolor="#FFFFFF" class="unnamed4" id="AutoNumber1" style="border-collapse: collapse">
      <tr>
    <td width="100%" height="27" background="images/bg.gif"><p align="center" class="title"><strong>添加子类</strong></td>
  </tr>
  <tr>
  <form name="form1" action="doAddSmallClass.jsp" method="post">
	<TABLE width="90%" border="1" align="center" cellpadding="3" cellspacing="0" bordercolor="#FFFFFF" class="unnamed4" id="AutoNumber1" style="border-collapse: collapse">
	<TR>
		<TD width="40%" align="left">&nbsp;</TD>
		<TD>&nbsp;</TD>
	</TR>
	<TR class="chinese">
		<TD width="40%" align="right">选择大类列表：</TD>
		<TD>
	    <select name="PicBClassID" size="1" class="chinese" id="BigClassID">
		<%
            request.setCharacterEncoding("iso-8859-1");
		    String id=request.getParameter("id");
            String Tname=request.getParameter("name");
            ResultSet rs = null;
			String sql="select * from PicBigClass";
			String Bid,Bname;
            try
            {
                Connection con=DataBaseConnection.getConnection();
	            Statement stmt=con.createStatement();
                rs=stmt.executeQuery(sql);
				int i=0;
	            while(rs.next())
	            {
					 i++;
	                 Bid=String.valueOf(rs.getInt(1));
					 Bname=rs.getString(2);
					 if(Bid.equals(id))
					 {
					     out.println("<option value='"+Bid+"' selected>"+new String(Tname.getBytes("iso-8859-1"))+"</option>");
					 }
					 else
					     out.println("<option value='"+Bid+"' >"+Bname+"</option>");
	            }
				con.close();
				rs.close();
			}
			catch(Exception e)
			{
			    e.printStackTrace();
			}

		%>
        </select>
		
		<FONT  COLOR="#FF0000">* 必选</FONT></TD>
	</TR>
	<TR class="chinese">
		<TD width="40%" align="right">小类名称：</TD>
		<TD><input type=text name="PicSClassName" value=""></TD>
	</TR>
	<TR>
		<TD width="40%">&nbsp;</TD>
		<TD><input name="submit" type="Submit" value=" 提交 " onClick="return check();"> <input name="goback" type="button" value=" 返回 " onClick="javascript:history.back();"></TD>
	</TR>
	</TABLE>
</form>
  </tr>
</table>
<br><br>
</body>
</html>
