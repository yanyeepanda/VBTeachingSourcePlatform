<%@ page contentType="text/html; charset=GBK" language="java" buffer="32kb"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.util.*"%>

<link href="css/bodystyle.css" rel="stylesheet" type="text/css">
<script>   
  function  changeme(obj)   
  {   
     form1.txt.value=obj.options[obj.selectedIndex].value;  
  }   
</script>  
<form name="form1">
	 <!-- 大类 -->
	 <table><tr><td>
        <select name="BigClassID" size="1" class="chinese" id="BigClassIDs"  onchange="changeme(BigClassID);">
           <option value="" selected>请选择大类</option>
		   <%
               ResultSet rs = null;
            try
            {
                Connection con=DataBaseConnection.getConnection();
			    String sql="select * from PicBigClass";
			    int Bid; String Bname;
	            Statement stmt=con.createStatement();
                rs=stmt.executeQuery(sql);
				while(rs.next())
				{
				    Bid=rs.getInt(1);
				    Bname=rs.getString(2);
					out.println("<option value='"+Bid+"'>"+Bname+"</option>");
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
        </select></td>

    <td>
	 <!-- 小类 -->
        <select name="SmallClassID" size="1" class="chinese" id="SmallClassID">
           <option value="" selected>请选择小类</option>
		   <%
		      String BigId=request.getParameter("BigClassID");
            try
            {
                Connection con=DataBaseConnection.getConnection();
			    String sql="select * from PicSmallClass where PicBigClassID="+BigId;
				int Sid; String Sname;
	            Statement stmt=con.createStatement();
                rs=stmt.executeQuery(sql);
				while(rs.next())
				{
				    Sid=rs.getInt(1);
				    Sname=rs.getString(2);
					out.println("<option value='"+Sid+"'>"+Sname+"</option>");
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
	
	</td></tr></table>
</form>
