<%@ page contentType="text/html; charset=GBK" language="java" buffer="32kb"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.util.*"%>

<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/bodystyle.css" rel="stylesheet" type="text/css">
<script language="javascript">
function del()
{
  var isok=true;
  isok=confirm("确信要删除吗?");
  return isok;
}
</script>

</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br><br>
    <table width="90%" border="1" align="center" cellpadding="3" cellspacing="0" bordercolor="#FFFFFF" class="unnamed4" id="AutoNumber1" style="border-collapse: collapse">
    <tr>
    <td width="100%" height="27" background="images/bg.gif"><p align="center" class="title"><strong>产品分类</strong></td>
  </tr>
  <tr>
    <td width="100%">　
    <A HREF="addPicClass.jsp"><font color="#FF3300"><strong>[添加大类]</strong></font></A><br>
    </td>
  </tr>
  <tr><td>
    <table width="100%" border="1"  cellpadding="3" cellspacing="0" bordercolor="#FFFFFF" class="unnamed4" id="AutoNumber1" style="border-collapse: collapse">
    <tr align=center  class="chinese"><td><B>类别名称</B></td><td><B>操作</B></td></tr>
  <%
		Statement stmt,stmt2;
        ResultSet rs,rs2;
        try
		{
           Connection con=DataBaseConnection.getConnection();
           stmt=con.createStatement();
           String sql="select * from PicBigClass";
		   rs=stmt.executeQuery(sql);
		   while(rs.next())
		   {
		       int Bid=rs.getInt(1);
			   String Bname=rs.getString(2);
			   out.println("<tr  class='chinese'><td><IMG SRC='images/+.gif' WIDTH='15' HEIGHT='15' BORDER=0><b>"+Bname+" </b>["+Bid+"]</td><td align=right >[<A HREF='addSmallClass.jsp?id="+Bid+"&name="+Bname+"'>添加子类</A>][<A HREF='updateBigClass.jsp?id="+Bid+"&name="+Bname+"'>修改</A>][<A HREF='delBigClass.jsp?id="+Bid+"' onclick='return del();'>删除</A>]</td></tr>");

			   //查询是否有小类存在
			   String sql2="select * from PicSmallClass where PicBClassID="+Bid;
			   stmt2=con.createStatement();
			   rs2=stmt2.executeQuery(sql2);
			   while(rs2.next())
			   {
			      int Sid=rs2.getInt(1);
				  String Sname=rs2.getString(2);
			      out.println("<tr  class='chinese'><td>&nbsp;&nbsp;<IMG SRC='images/-.gif' WIDTH='15' HEIGHT='15' BORDER=0>"+Sname+" ["+Sid+"]</td><td align=right >[<A HREF='updateSmallClass.jsp?id="+Sid+"&name="+Sname+"&Bid="+Bid+"'>修改</A>][<A HREF='delSmallClass.jsp?id="+Sid+"' onclick='return del();'>删除</A>]</td></tr>");
			   }
		       stmt2.close();
		       rs2.close();
		   }
		   con.close();
		   stmt.close();
		   rs.close();
		}
		catch(Exception e)
		{e.printStackTrace();}
  
  %>
  <tr><td>  </td></tr>
  </table>
  </td></tr>
</table>
<br><br>
</body>
</html> 
