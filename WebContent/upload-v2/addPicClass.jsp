<%@ page contentType="text/html; charset=gb2312" language="java" buffer="32kb"%>

<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/bodystyle.css" rel="stylesheet" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
function check()
{
   var id=form1.PicBClassID.value;
   var name=form1.PicBClassName.value;
   if(id=="")
   {
       alert("�������������");
	   form1.PicBClassID.focus();
	   return false;
   }
   else if(!check_num(id) ||id==0)
   {
       alert("ֻ���������0��������");
	   form1.PicBClassID.value="";
	   form1.PicBClassID.focus();
	   return false;
   }
   else if(name=="")
   {
        alert("������������ƣ�");
	    form1.PicBClassName.focus();
		return false;
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

</SCRIPT>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br><br>

    <table width="90%" border="1" align="center" cellpadding="3" cellspacing="0" bordercolor="#FFFFFF" class="unnamed4" id="AutoNumber1" style="border-collapse: collapse">
      <tr>
    <td width="100%" height="27" background="images/bg.gif"><p align="center" class="title"><strong>��Ӳ�Ʒ����</strong></td>
  </tr>
  <tr>
  <form name="form1" action="doAddPicClass.jsp" method="post">
	<TABLE width="90%" border="1" align="center" cellpadding="3" cellspacing="0" bordercolor="#FFFFFF" class="unnamed4" id="AutoNumber1" style="border-collapse: collapse">
	<TR>
		<TD width="40%" align="left">&nbsp;</TD>
		<TD>&nbsp;</TD>
	</TR>
	<TR class="chinese">
		<TD width="40%" align="right">��������</TD>
		<TD><input type=text name="PicBClassID" value=""> <FONT  COLOR="#FF0000">* �����Ǵ��� 0 ������</FONT></TD>
	</TR>
	<TR class="chinese">
		<TD width="40%" align="right">�������ƣ�</TD>
		<TD><input type=text name="PicBClassName" value=""></TD>
	</TR>
	<TR>
		<TD width="40%">&nbsp;</TD>
		<TD><input name="submit" type="Submit" value=" �ύ " onClick="return check();"> <input name="goback" type="button" value=" ���� " onClick="window.location='Admin_PicClass.jsp';"></TD>
	</TR>
	</TABLE>
</form>
  </tr>
</table>
<br><br>
</body>
</html>
