<%@ page contentType="text/html; charset=GBK" language="java" buffer="32kb"%>
<%@ page import="com.util.*"%>
<html>
<head>
<title>����JSP�ϴ�ϵͳ V2��</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
  
<SCRIPT src="js/post.js"></SCRIPT> 
<link href="css/bodystyle.css" rel="stylesheet" type="text/css">
</head>
<%

	request.setCharacterEncoding("GBK");						     //���ñ��뷽ʽΪgb2312
	//��������������쳣����
	String Action = request.getParameter("Action");
	if(Action!=null && Action.equals("Login"))
	{

		try{
				String User = request.getParameter("User").trim();     //�õ���¼�û���
				String Pwd = request.getParameter("Pwd").trim();       //�õ���¼����
				if (User.length()!=0 && Pwd.length()!=0)
				{
					session.setAttribute("AdminName",User);
					out.println("<SCRIPT LANGUAGE='JavaScript'>alert('��¼�ɹ�!');location.href='Admin_Main.jsp';</SCRIPT>");
					return;
				}else{
					session.setAttribute("error","<li>�û������������");
					response.sendRedirect("index.jsp");
					return;
				}
			}catch(Exception e){
					response.sendRedirect("index.jsp");
					return;
			}
	}
	
%>
<body>
<form name="form" action="index.jsp" method="POST" onSubmit="">
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <table width="413" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#EEEAD6">

    <tr>
      <td width="3"></td>
      <td>
	  <table width="100%" border="1" align="center" cellpadding="0" cellspacing="0">
	  </table>
			</td>
          </tr>
          <tr>
            <td>
			<table width="95%" border="0" align="center">
	      <tr>
		    <td>
	  <fieldset style="padding: 2; width:400; height:180; " align=center>
                <legend align="left" class="title" accesskey="F">
				<strong>����JSP�ϴ�ϵͳ</strong></legend><BR>
                <table width="100%" border="0" cellspacing="2" cellpadding="2">
                <tr> 
				  <td width="8%">&nbsp;</td>
                        <td width="10%" class="chinese">�û�����</td>
                  <td><input name="User" type="text" class="chinese" id="User" style="font-size: 12px" size="16" maxlength="16">
				  </td>
                </tr>
                <tr> 
				<td width="8%">&nbsp;</td>
                        <td width="10%" class="chinese">�ܡ��룺</td>
                  <td><input name="Pwd" type="password" class="chinese" id="Pwd" style="font-size: 12px" size="16" maxlength="16">
                  </td>
                </tr>
                <tr> 
			      <td width="8%">&nbsp;</td>
                  <td width="17%" class="chinese"></td>
                  <td colspan="3"  align="left"  height="30">
				    <input type="submit" name="submit" value=" �� ¼ " class="button"> 
                    <input type="reset" name="submit2" value=" �� �� " class="button">
                    <input name="Action" type="hidden" id="Action" value="Login">
					</td></tr>
              </table>
	  </fieldset> 
	  &nbsp;</td></tr>
	  </table></td>
          </tr>
        </table></td>
      <td width="3" background="images/link.gif"></td>
    </tr>
	<tr><td height="3" background="images/linkbom.gif" colspan="3"></td></tr>
</table>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</form>
</body>
</html>
<script language="JavaScript" type="text/javascript">
    document.forms["form"].elements["User"].focus();
</script>
