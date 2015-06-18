<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*"  %>
<%@ include file="name.jsp" %>
<jsp:useBean id="DBConnection" scope="page" class="com.guestbook.DBConnection"/>
<jsp:useBean id="loginMD5" scope="page" class="com.guestbook.MD5" />
<%
Boolean a=(Boolean)session.getAttribute("a"); 
Connection conn=DBConnection.getConnectionToAccess(application.getRealPath("data/guestbook.mdb"));
Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY); 
if(a==null||a.booleanValue()==false)
{
%>
<script language=JavaScript>
	alert('此页面仅对站长开放！');
location.href="index.jsp"
</script>
<%
}else{
String admin=request.getParameter("admin");
if (admin==null)
{
%>
<HTML><HEAD><TITLE><%=name%></TITLE>
<META content=all name=robots>
<META content=qipeng119@126.com,齐鹏 name=author>
<META content="qipeng CopyRight 2007" name=Copyright>
<META content=齐鹏,网络安全,java,asp,黑客,木马,SEO name=keywords>
<META content="有朝一日虎归山，我要血染半边天—齐鹏 - 有朝一日龙得水●我要长江水倒流●有朝一日虎归山●我要血染半边天" 
name=description><LINK rev=stylesheet media=all href="images/qipeng/global.css" 
type=text/css rel=stylesheet><!--全局样式表--><LINK rev=stylesheet media=all 
href="images/qipeng/layout.css" type=text/css rel=stylesheet><!--层次样式表--><LINK 
rev=stylesheet media=all href="images/qipeng/typography.css" type=text/css 
rel=stylesheet><!--局部样式表--><LINK rev=stylesheet media=all 
href="images/qipeng/link.css" type=text/css rel=stylesheet><!--超链接样式表--><LINK 
rev=stylesheet media=all href="images/qipeng/editor.css" type=text/css 
rel=stylesheet><!--UBB编辑器代码-->
<style type="text/css">
<!--
.STYLE1 {color: #33FF00}
-->
</style>
<script language="javascript">
function check(){
	if(post.admins.value==""){
		alert("请输入管理员名称");
		return false;
	}
	if(post.admins.value.length>50){
		alert("管理员名称位数不超过24");
		return false;
	}
	
	
	if(post.password.value==""){
		alert("请输入管理员密码");
		return false;
	}
	if(post.password.value.length>50){
		alert("管理员密码位数不超过24");
		return false;
	}
	
	
	
	if(post.password2.value==""){
		alert("请输入重复密码");
		return false;
	}
	if(post.password2.value.length>50){
		alert("重复密码位数不超过24");
		return false;
	}
	
	
	if(post.password.value!=post.password2.value){
		alert("输入的两次密码不一致");
		return false;
	}
return true;
}
</script>
</HEAD>
<BODY>
<DIV id=container><!--顶部-->
<DIV id=header>
<DIV id=blogname>有朝一日虎归山，我要血染半边天---齐鹏 
  <DIV id=blogTitle>有朝一日龙得水●我要长江水倒流●有朝一日虎归山●我要血染半边天</DIV></DIV>
<DIV id=menu>
<DIV id=Left></DIV>
<DIV id=Right></DIV>
</DIV>
</DIV><!--内容-->
<STYLE>.CFace:link {
	BORDER-RIGHT: #164283 1px solid; PADDING-RIGHT: 0px; BORDER-TOP: #164283 1px solid; PADDING-LEFT: 0px; BACKGROUND: #c9dbf5; PADDING-BOTTOM: 1px; BORDER-LEFT: #164283 1px solid; PADDING-TOP: 1px; BORDER-BOTTOM: #164283 3px solid
}
.CFace:visited {
	BORDER-RIGHT: #164283 1px solid; PADDING-RIGHT: 0px; BORDER-TOP: #164283 1px solid; PADDING-LEFT: 0px; BACKGROUND: #c9dbf5; PADDING-BOTTOM: 1px; BORDER-LEFT: #164283 1px solid; PADDING-TOP: 1px; BORDER-BOTTOM: #164283 3px solid
}
.CFace:hover {
	BORDER-RIGHT: #164283 1px solid; PADDING-RIGHT: 0px; BORDER-TOP: #164283 1px solid; PADDING-LEFT: 0px; BACKGROUND: #9bbbec; PADDING-BOTTOM: 1px; BORDER-LEFT: #164283 1px solid; PADDING-TOP: 1px; BORDER-BOTTOM: #164283 3px solid
}
.LFace:link {
	PADDING-RIGHT: 1px; PADDING-LEFT: 1px; PADDING-BOTTOM: 1px; PADDING-TOP: 1px
}
.LFace:visited {
	PADDING-RIGHT: 1px; PADDING-LEFT: 1px; PADDING-BOTTOM: 1px; PADDING-TOP: 1px
}
.LFace:hover {
	BORDER-RIGHT: #164283 1px solid; PADDING-RIGHT: 0px; BORDER-TOP: #164283 1px solid; PADDING-LEFT: 0px; BACKGROUND: #c9dbf5; BORDER-LEFT: #164283 1px solid; BORDER-BOTTOM: #164283 1px solid
}
</STYLE>
<DIV id=Tbody>
<DIV id=mainContent>
<DIV id=innermainContent>
<DIV id=mainContent-topimg></DIV>
<DIV class=content-width id=Content_Contentlist>
<DIV class=pageContent>
<DIV class=page style="FLOAT: right">
<UL>
  </UL></DIV></DIV>    
<DIV class=Content>
  <DIV class=comment style="MARGIN-BOTTOM: 20px">
<DIV class=commenttop></DIV>
  <div class=commentcontent>
    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr> 
                                  <td height="28"><table border="1" width="100%" cellspacing="0" cellpadding="0"  align="center" bgcolor="#339900"  bordercolordark="#FFFFFF" bordercolorlight="#666666">
                                <tr> 
                                          <td width="100%" height="24">
											<p align="center">
											<font color="#FFFFFF">...::修改管理信息::...</font></td>
                                    </tr>
                                    </table>
                                    <%
  										String sql="select * from admin where id=1"; 
  										ResultSet Rs=stmt.executeQuery(sql);
 									    while(Rs.next())
  										{
									%>
								  <form action="config.jsp?admin=admin" method="post" name="post" id="post" onSubmit="return check();">									
										<span class="f12"><font color="#333333">
											<p align="center"><br>
　</p>
										
											<table border="0" width="260" id="table1" align="center">
											<tr>
												<td>
												<p align="right">管理员帐号：</td>
												<td> &nbsp;<INPUT 
                  name=admins id="admins" value=<%=Rs.getString("admin")%> size=18></td>
											</tr>
											<tr>
												<td>
												<p align="right">管理员密码：</td>
												<td><span class="f12">
											&nbsp;</span><INPUT type=password size=18 
                   name="password"></td>
											</tr>
											<tr>
												<td>
											  <p align="right">重 复 密码：</td>
												<td>
												         &nbsp;<INPUT type=password size=18 
                   name="password2"></td>
											</tr>
											<tr>
												<td colspan="2">
												         <p align="center">
												         <INPUT type=submit value="确认修改" name=Submit> &nbsp;&nbsp; <INPUT type=reset value="清 除" name=Submit2>
												</td>
											</tr>
										</table>
									</form>
										<%  }  %>
									<p align="center">如果不想修改请点击<a href="index.jsp">返回</a><br>
　</p>
										<p align="center"><br>
　</p>					   
                </td>
              </tr>
               
            </table>
  </div>
  </DIV>
</DIV>
<DIV class=pageContent>
<DIV class=page style="FLOAT: right">
<UL>
  <LI class=pageNumber><STRONG>
  1
  </STRONG></LI></UL></DIV></DIV></DIV>
<DIV id=mainContent-bottomimg></DIV></DIV></DIV>
<%@ include file="sidebar.jsp" %>
<DIV style="CLEAR: both; DISPLAY: block; FONT: 0px/0px sans-serif"></DIV><!--底部-->
<DIV id=foot>
<P><span class="STYLE1">Powered By <A href="http://www.qipeng.net.cn/" 
target=_blank><STRONG>齐鹏网络</STRONG></A> CopyRight 2007, 
  <STRONG>有朝一日虎归山，我要血染半边天---齐鹏</STRONG> <A 
href="http://validator.w3.org/check/referer" target=_blank>xhtml</A> | <A 
href="http://jigsaw.w3.org/css-validator/validator-uri.html">css</A></span></P>
<P style="FONT-SIZE: 15px"><span class="STYLE1">欢迎大家来到我的IT博客，<a href="http://www.qipeng.net.cn">www.qipeng.net.cn</a></span><BR>
</P>
</DIV></DIV>
</BODY></HTML>
<%
}
else
{
  String admins=request.getParameter("admins");
  String password=request.getParameter("password");
  String password2=request.getParameter("password2");
  String passwords=loginMD5.getMD5ofStr(password2);
  /*out.println(passwords);*/
  String  sql1="update admin set admin='"+admins+"',password='"+passwords+"' where id=1"; 
	try{
        stmt.executeUpdate(sql1);
		session.invalidate();
%>
<script language=JavaScript>
	alert('修改成功，请使用新身份重新登陆系统进行管理！');
location.href="login.jsp"
</script>
<%
	}catch(Exception e)
     {
	   response.sendRedirect("error.jsp?error=2");//数据库更新出错！
	 }
	 
}
	if(conn!=null)
	{
		conn.close();
	}
	if(stmt!=null)
	{
		stmt.close();
	}
}
%>