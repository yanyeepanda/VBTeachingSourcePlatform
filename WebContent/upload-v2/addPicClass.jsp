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
       alert("请输入大类排序！");
	   form1.PicBClassID.focus();
	   return false;
   }
   else if(!check_num(id) ||id==0)
   {
       alert("只能输入大于0的整数！");
	   form1.PicBClassID.value="";
	   form1.PicBClassID.focus();
	   return false;
   }
   else if(name=="")
   {
        alert("请输入大类名称！");
	    form1.PicBClassName.focus();
		return false;
   }

}
function check_num(val_num)//判断是否为int型数据
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
	      n++;//判断该字符串中有几个点
	   }
    for (j = 0;  j < checkOK.length;  j++)
	  if (ch == checkOK.charAt(j))
        break;

    if (j == checkOK.length)
    {
      allValid = false;
      break;
    }
	if(n>1)//如果字符串中点的个数>1的,错误
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
    <td width="100%" height="27" background="images/bg.gif"><p align="center" class="title"><strong>添加产品大类</strong></td>
  </tr>
  <tr>
  <form name="form1" action="doAddPicClass.jsp" method="post">
	<TABLE width="90%" border="1" align="center" cellpadding="3" cellspacing="0" bordercolor="#FFFFFF" class="unnamed4" id="AutoNumber1" style="border-collapse: collapse">
	<TR>
		<TD width="40%" align="left">&nbsp;</TD>
		<TD>&nbsp;</TD>
	</TR>
	<TR class="chinese">
		<TD width="40%" align="right">大类排序：</TD>
		<TD><input type=text name="PicBClassID" value=""> <FONT  COLOR="#FF0000">* 必须是大于 0 的整数</FONT></TD>
	</TR>
	<TR class="chinese">
		<TD width="40%" align="right">大类名称：</TD>
		<TD><input type=text name="PicBClassName" value=""></TD>
	</TR>
	<TR>
		<TD width="40%">&nbsp;</TD>
		<TD><input name="submit" type="Submit" value=" 提交 " onClick="return check();"> <input name="goback" type="button" value=" 返回 " onClick="window.location='Admin_PicClass.jsp';"></TD>
	</TR>
	</TABLE>
</form>
  </tr>
</table>
<br><br>
</body>
</html>
