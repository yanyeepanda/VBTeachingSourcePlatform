<%@ page contentType="text/html; charset=GBK" language="java" buffer="32kb"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.util.*"%>

<html>
<head>
<title></title>
<style type="text/css">
	body,td,th {color: #000000;font: 12px Tahoma, "����";}
	body{margin:0px; background-color:{$UpLoadBackGroundColor};}
	form{margin:0px;}
	input{Border: 1px solid #999900;BackGround-Color: buttonface;Color: #000000;height:17px;font: 12px Tahoma, "����";}
	.red{color:#FF0000;}
</style>


<%
	  int count_small=0;
      try
      {
         Connection con=DataBaseConnection.getConnection();
		 String sql="select * from PicSmallClass";
	     Statement stmt=con.createStatement();
         ResultSet rs=stmt.executeQuery(sql);
%>
<script language = "JavaScript">
var count;
subcat_small=new Array(); 
<%
		 while(rs.next()) 
		 {
%>

           subcat_small[<%=count_small%>] = new Array("<%=rs.getInt(1)%>","<%=rs.getString(2)%>","<%=rs.getInt(3)%>"); 
<% 
           count_small++; 
         } 
%>
count=<%=count_small%>;
function xianchange(bigId) 
{   //����С����ʾ�ĺ��� 
    document.form1.SmallClassID.length = 0; 
    for (var i=0;i < count; i++) 
        { 
            if (subcat_small[i][2] == bigId) 
            { 
              document.form1.SmallClassID.options[document.form1.SmallClassID.length] = new Option(subcat_small[i][1], subcat_small[i][0]); 
            }
        } 
}
</script>

<%
		 rs.close();
		 stmt.close();
		 con.close();
	  }
	  catch(Exception e)
	  {
	 	  e.printStackTrace();
	  }
%>

<SCRIPT LANGUAGE="JavaScript">
function check()
{
    var files=document.all.file;
	var n=0;
   if(files.length!=undefined)
   {
	for(var i=0;i<files.length;i++)
	{
	      if(files[i].value!="")
		  {
		     n++;
		  }
	}
	if(n==0)
	{
	   alert("������ѡ��һ���ļ��ϴ���");
	   return false;
	}
   }
   else
   {
	  if(form1.file.value=="")
	  {
	   alert("��ѡ��Ҫ�ϴ����ļ�!");
       return false;
	  }
   }
}

function check_num(val_num)//�ж��Ƿ�Ϊint������
{
  var checkOK = "0123456789";
  var checkStr = val_num;
  var allValid = true;
  var decPoints = 0;
  var allNum = "";
  var n=0;
  for (i = 0;  i < checkStr.length;  i++)
  {
    ch = checkStr.charAt(i);
	   if(ch==checkOK.charAt(10))
	   {
	      n++;//�жϸ��ַ������м�����
	   }
    for (j = 0;  j < checkOK.length;  j++)
	  if (ch == checkOK.charAt(j))
        break;

    if (j == checkOK.length)
    {
      allValid = false;
      break;
    }
	if(n>1)//����ַ����е�ĸ���>1��,����
	{
		allValid=false;
		break;
	}
  }
  if (!allValid)
  {
    return (false);
  }
  return (true);
} 

function goto()
{
   var ss=document.form2.sum.value;
   if(!check_num(ss)){
      alert("��������ֵ�����ݣ�");
	  form2.sum.value="1";
	  form2.sum.focus();
      return false;
   }
}
</SCRIPT>
<script language="javascript">
function del()
{
  var isok=true;
  isok=confirm("ȷ��Ҫɾ����?");
  return isok;
}
</script>

<link href="css/bodystyle.css" rel="stylesheet" type="text/css">

</head> 
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<br><BR>
<div align=center>
 ��ѡ����Ҫ�ϴ����ļ�,�ļ���С�������4MB����,֧��gif,jpg,jpeg,bmp��ʽͼƬ!
</div>
<BR>
<fieldset style="padding: 2; width:450; height:120; " align=center>
<legend>�ϴ�ͼƬ</legend>
<form action="upload.jsp" method="post" name="form2">
<TABLE width="304" align="center">
	<TR>
		<TD width="115" height="33"><input type="text" name="sum" size=5 value="1">��
      <input type="Submit" name="go" value="�趨" id="go" onclick="return goto();">          <div align="right">      </TD>
		<TD width="177"><div align="left">(����ϴ���Ϊ10)</div></TD>
	</TR>
</TABLE>
</form>
<!-- ================================================ -->
	<form action="uploadimage.jsp" method="post" enctype="multipart/form-data" name="form1">
	<TABLE width="301" height="33" align="center">
	<TR>
		 <TD>&nbsp;</TD>
		<TD colspan="2">
		<!-- ��ʾ���������б� -->
        <select name="BigClassID" size="1" onchange="xianchange(document.form1.BigClassID.options[document.form1.BigClassID.selectedIndex].value)" class="chinese" id="BigClassID" >
           <option value="0" selected>��ѡ�����</option>
<%
            try
            {
			    ResultSet rs = null;
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
				stmt.close();
				rs.close();
			}
			catch(Exception e)
			{
			   e.printStackTrace();
			}
%>
        </select>
<!-- ���� -->
		<!-- ��ʾС�������б� -->
          <select name="SmallClassID" size="1" onchange="xiangchange(document.form1.SmallClassID.options[document.form1.SmallClassID.selectedIndex].value)" class="chinese" id="SmallClassID" >
            <option value="0" selected>��ѡ��С��</option>
		  </select>
		  <!-- ��ʾС�������б� -->
		</TD>
	  </TR>
	<TR>
		<TD width="55">�ļ�1��</TD>
		<TD width="242"><input type="file" name="file" size="31"></TD>
	</TR>
<%

    String str=request.getParameter("sum");
    int sums=0;
	try
	{
        sums=Integer.parseInt(str);
    }
	catch(Exception e)
	{
        sums = 1;
    }
    if(sums==0 || sums<0 )
	{}
	else
	{
		if( sums>10 ||sums==10)
			sums=10;
		for(int i=1;i<sums;i++)
		{
%>
	<TR>
		<TD width="55">�ļ�<%=i+1%>��</TD>
		<TD width="242"><input type="file" name="file" size="30"></TD>
	</TR>
<%
		}
	}
%>
    <TR>
		<TD></TD>
		<TD><input type="Submit" name="Submit" value=" ����ϴ� " onClick="return check();" id="submit"> <input type="reset" name="reset" value=" ��� "  id="submit"></TD>
	</TR>
	</TABLE>
    </form>
</fieldset>
<BR><BR>
	<!-- ��ʾ�����ϴ���Ϣ -->
			  

<%
	   int ipage=15;//ÿҳ��ʾ������
	   int allpage=0;//��ҳ��
	   int pages;//����ҳ�����
	   int cpage=1;//��ǰҳ
	   int spage;//��ʼҳ
	   int sum=0;//������
		   //Connection con;
		   //DBConnection DBConn = new DBConnection();
        try
	    {

           Connection con=DataBaseConnection.getConnection();
           Statement stmt=con.createStatement();
           String sql1="select count(*) from up_imges";

           ResultSet rs=stmt.executeQuery(sql1);
           rs.next();
           sum=rs.getInt(1);//��ȡ������

           rs.close();
		   stmt.close();
		   con.close();
		}
		catch(Exception e)
		{
		  e.printStackTrace();
		}
	if(sum>=1)
	{
%>
<table border="1" align="center" cellpadding="2" cellspacing="1" bordercolordark="#FFFFFF" width="98%" align="center">
	<tr align=center>
		<td  background="images/bg.gif">���</td>
		<td background="images/bg.gif">��չ��</td>
		<td background="images/bg.gif">�ļ���ַ</td>
		<td background="images/bg.gif">����ͼ��ַ</td>
		<td background="images/bg.gif">��С</td>
		<td background="images/bg.gif">�ϴ�ʱ��</td>
		<td background="images/bg.gif">�ϴ���IP</td>
		<td background="images/bg.gif">����</td>
		<td background="images/bg.gif">С��</td>
		<td background="images/bg.gif">����</td>
	</tr>
<%
		   //����������������ҳ��
		   if(sum%ipage==0)
		   {
              allpage=sum/ipage;
		   }else{
		      allpage=sum/ipage+1;
		   }
            //�жϲ���pages�Ƿ�Ϊ��
			if(request.getParameter("jumppages")==null){
			  pages=1;
			}
			else{
              pages=Integer.parseInt(request.getParameter("jumppages"));
			}
            //�жϵ�ǰҳ
			if(pages>allpage || pages==0){
			   cpage=1;
			}else{
			   cpage=pages;
			}
			spage=cpage*ipage;//�ж�Ҫ��ѯ��������
           int n=0,m=0;
        try
		{

           Connection con=DataBaseConnection.getConnection();
           Statement stmt=con.createStatement();

           String sql2="select top "+spage+" * from up_imges";
		   ResultSet rs2=stmt.executeQuery(sql2);

		   while(rs2.next())
		   {
			   if(n>(cpage-1)*ipage-1)
			  {
				   m++;
			      int id=rs2.getInt(1);
			      String wid_name=rs2.getString(2);
			      String path=rs2.getString(3);
			      String min_path=rs2.getString(4);
			      int size=rs2.getInt(5);
		          String time=rs2.getString(6);
				  String ip=rs2.getString(7);
				  String bigId=rs2.getString(8);
				  String smallId=rs2.getString(9);

%>
    <tr align=center  style="font-size:14px" height=25> 
      <td>
	  <%=m%>
	  </td>
      <td>
	  <%if(wid_name==""){%>
	  &nbsp;
	  <%}else{%>
	  <%=wid_name%>
	  <%}%>
	  </td>
      <td>
	  <%if(path==""){%>
	  &nbsp;
	  <%}else{
		%>
	  <a href="./<%=path%>" target="_blank"><%=path%></a>
	  <%}%>
	  </td>
      <td>
	  <%if(min_path==""){%>
	  &nbsp;
	  <%}else{%>
	  <a href="./<%=min_path%>" target="_blank"><%=min_path%></a>
	  <%}%>
	  </td>
      <td>
	  <%if(String.valueOf(size)==""){%>
	  &nbsp;
	  <%}else{%>
	  <%=size/1024%>K
	  <%}%>
	  </td>
      <td>
	  <%if(time==""){%>
	  &nbsp;
	  <%}else{%>
	  <%=time%>
	  <%}%>
	  </td>
	  <td>
	  <%if(ip==""){%>
	  &nbsp;
	  <%}else{%>
	  <%=ip%>
	  <%}%>
	  </td>
	  <td>
	  <%if(bigId==""){%>
	  &nbsp;
	  <%}else{%>
	  <%=bigId%>
	  <%}%>
	  </td>
	  <td>
	  <%if(smallId==""){%>
	  &nbsp;
	  <%}else{%>
	  <%=smallId%>
	  <%}%>
	  </td>	  <td><a href="delimg.jsp?id=<%=id%>&name=<%=path%>&min_name=<%=min_path%>" onclick="return del();">ɾ��</a></td>
    </tr>
<% 
			   }
	       n++;
	  }	  
	}
	catch(Exception e)
	{
		   e.printStackTrace();
	}
%>
  </table>
<%if(allpage!=1 && sum!=0)
	{
%>
<div align=center>
<form name="PageForm" action="upload.jsp" method="get">
ÿҳ<%=ipage%>��
 ��<%=sum%>��
 ��<%=cpage%>ҳ
 ��<%=allpage%>ҳ
������
<%if(cpage==1){ out.print(" ��ҳ ��һҳ");   }else{  %>   
<A HREF="upload.jsp?jumppages=<%=1%>">��ҳ</A>
<A HREF="upload.jsp?jumppages=<%=cpage-1%>">��һҳ</A>
<%}%>
<%if(cpage==allpage){ out.print("��һҳ βҳ");   }else{  %>   
<A HREF="upload.jsp?jumppages=<%=cpage+1%>">��һҳ</A>
<A HREF="upload.jsp?jumppages=<%=allpage%>">βҳ</A>
<%
	}
}
}
%>

</form>
</div>
<BR><BR>
</body>
</html>