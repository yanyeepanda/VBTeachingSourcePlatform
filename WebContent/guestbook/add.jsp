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
 String action=request.getParameter("action");
if (action==null)
{
%>
<SCRIPT language="javascript">
<!--
  function mOvr(src,clrOver) {
    if (!src.contains(event.fromElement)) {
	  src.bgColor = clrOver;
	}
  }
  function mOut(src,clrIn) {
	if (!src.contains(event.toElement)) {
	  src.bgColor = clrIn;
	}
  }
function datacheck()
{  
  	if (post.username.value==""){
	alert("你好像还忘了填昵称哦！");
	post.username.focus();
	return false;
	}
	
  	if (post.usermail.value==""){
	alert("电子邮件一定要填写哦！");
	post.usermail.focus();
	return false;
	}
	
	haha=post.usermail.value
    if(haha.length>0)
	{
        i=haha.indexOf("@");
        if(i==-1)
		{
			alert("哇！您输入的电子邮件有错误哦！")
			post.usermail.focus();
		    return false;
        }
       ii=haha.indexOf(".")
        if(ii==-1)
		{
			alert("哇！您输入的电子邮件有错误哦！")
			post.usermail.focus();
			return false;
        }
    }
	if (checktext(haha))
	{
		alert("能告诉我您的有效电子邮件吗？");
		post.usermail.focus();
		return false;
	}
	
  	if (post.content.value==""){
	alert("留言还没写呢，这样可不行哦！！");
	post.content.focus();
	return false;
	}

}
function checktext(text)
{
		allValid = true;
		for (i = 0;  i < text.length;  i++)
		{
			if (text.charAt(i) != " ")
			{
				allValid = false;
				break;
			}
		}
return allValid;
}
-->
</script>
<SCRIPT src="images/index.js"></SCRIPT>
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
.STYLE2 {
	color: #33CC00;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-weight: bold;
}
.STYLE3 {
	color: #339900;
	font-weight: bold;
}
.STYLE4 {color: #33CC00}
-->
</style>
<script language="javascript">
function checks(){
	if(post1.admin.value==""){
		alert("请输入管理员帐号！");
		return false;
	}
	if(post1.admin.value.length>20){
		alert("管理员帐号不超过20位！");
		return false
	}
	if(post1.password.value==""){
		alert("请输入管理员密码！");
		return false;
	}
	if(post1.password.value.length>20){
		alert("管理员密码不超过20位！");
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
    <table width="540" border="0" cellspacing="0" cellpadding="0" align="center" height="100%">
				  <form action="add.jsp?action=add" method="post" name="post" onSubmit="return datacheck();">
                    <tr> 
                      <td valign="top"> 
                        <table width="450" border="0" cellspacing="0" cellpadding="0" align="center" class="font">
                                  <tr> 
                                    <td colspan="3"> <div align="center" class="STYLE2">输入个人信息</div></td>
                                  </tr>
                                  <tr> 
                                    <td width="76" height="25" > <div align="center">昵 
                                    称 ：</div></td>
                                    <td height="25" colspan="2" > <input name="username" maxlength="15" class=button1 size="25" > 
                                      <font color="#FF0000">*</font></td>
                                  </tr>
                                  <tr> 
                                    <td width="76" height="25" > <div align="center">信 
                                    箱 ：</div></td>
                                    <td height="25" colspan="2" > <input name="usermail" size="25" maxlength="50" class=button1 > 
                                      <font color="#FF0000">*</font></td>
                                  </tr>
                                  <tr> 
                                    <td width="76" height="25" > <div align="center">主 
                                    页 ：</div></td>
                                    <td height="25" colspan="2" > <input name="userurl" size="25" maxlength="50" value="http://www.qipeng.net.cn" class=button1 > 
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td width="76" height="25" > <div align="center"><span class="EFONT">QQ</span> 
                                    ：</div></td>
                                    <td height="25"  width="221"> <input name="userqq" maxlength="10" class=button1 size="25" > 
                                    </td>
                                    <td height="25" width="153" valign="baseline" >&nbsp;</td>
                                  </tr>
                                  <tr> 
                                    <td height="25" align="center" >主 题 ：</td>
                                    <td height="25"><input name="usertitle" maxlength="20" class=button1 size="25" > 
                                      <font color="#FF0000">*</font></td>
                                    <td height="25" valign="baseline" >打<font color="#FF0000">*</font>号的为必填项</td>
                                  </tr>
                        </table>
                                <table width="450" border="1" align="center" cellpadding="1" cellspacing="1" bordercolor="#33FF00" >
                                  <tr> 
                                    <td colspan="10" class="font"> <div align="center" class="STYLE3">选 择 头 像 </div></td>
                                  </tr>
                                  <tr align="center" valign="middle"> 
                                    <td height="35"> 
                                      <div align="center"> 
                                        <input type="radio" name="userface" value="1" checked>
                                      </div></td>
                                    <td  height="35"> 
                                      <div align="center"><img src="images/1.gif" width="70" height="70"></div></td>
                                    <td height="35"> 
                                      <div align="center"> 
                                        <input type="radio" name="userface" value="2">
                                      </div></td>
                                    <td  height="35"> 
                                      <div align="center"><img src="images/2.gif" width="70" height="70"></div></td>
                                    <td height="35"> 
                                      <div align="center"> 
                                        <input type="radio" name="userface" value="3">
                                      </div></td>
                                    <td  height="35"> 
                                      <div align="center"><img src="images/3.gif" width="70" height="70"></div></td>
                                    <td height="35"> 
                                      <div align="center"> 
                                        <input name="userface" type="radio" value="4">
                                      </div></td>
                                    <td  height="35"> 
                                      <div align="center"><img src="images/4.gif" width="70" height="70"></div></td>

                                  </tr>
                                  <tr align="center" valign="middle"> 
                                    <td height="35"> 
                                      <div align="center"> 
                                        <input type="radio" name="userface" value="5">
                                      </div></td>
                                    <td height="35" > 
                                      <div align="center"><img src="images/5.gif" width="70" height="70"></div></td>
                                    <td height="35"> 
                                      <div align="center"> 
                                        <input type="radio" name="userface" value="6">
                                      </div></td>
                                    <td height="35" > 
                                      <div align="center"><img src="images/6.gif" width="70" height="70"></div></td>
                                    <td height="35"> 
                                      <div align="center"> 
                                        <input type="radio" name="userface" value="7">
                                      </div></td>
                                    <td height="35" > 
                                      <div align="center"><img src="images/7.gif" width="70" height="70"></div></td>
                                    <td height="35"> 
                                      <div align="center">
                                        <input type="radio" name="userface" value="8">
                                      </div></td>
                                    <td height="35" > 
                                      <div align="center"><img src="images/8.gif" width="70" height="70"></div></td>

                                  </tr>
                                  <tr align="center" valign="middle"> 
                                    <td height="35"> 
                                      <div align="center"> 
                                        <input type="radio" name="userface" value="9">
                                      </div></td>
                                    <td height="35" > 
                                      <div align="center"><img src="images/9.gif" width="70" height="70"></div></td>
                                    <td height="35"> 
                                      <div align="center"> 
                                        <input type="radio" name="userface" value="10">
                                      </div></td>
                                    <td height="35" > 
                                      <div align="center"><img src="images/10.gif" width="70" height="70"></div></td>
                                    <td height="35"> 
                                      <div align="center"> 
                                        <input type="radio" name="userface" value="11">
                                      </div></td>
                                    <td height="35" > 
                                      <div align="center"><img src="images/11.gif" width="70" height="70"></div></td>
                                    <td height="35"> 
                                      <div align="center"> 
                                        <input type="radio" name="userface" value="12">
                                      </div></td>
                                    <td height="35" > 
                                      <div align="center"><img src="images/12.gif" width="70" height="70"></div></td>
  
                                  </tr>
                                  <tr align="center" valign="middle"> 
                                    <td height="35"> 
                                      <input type="radio" name="userface" value="13"></td>
                                    <td height="35" ><img src="images/13.gif" width="70" height="70"></td>
                                    <td height="35"> 
                                      <input type="radio" name="userface" value="14"></td>
                                    <td height="35" ><img src="images/14.gif" width="70" height="70"></td>
                                    <td height="35"> 
                                      <input type="radio" name="userface" value="15"></td>
                                    <td height="35" ><img src="images/15.gif" width="70" height="70"></td>
                                    <td height="35"> 
                                      <input type="radio" name="userface" value="16"></td>
                                    <td height="35" ><img src="images/16.gif" width="70" height="70"></td>

                                  </tr>
                                  <tr align="center" valign="middle"> 
                                    <td height="35"> 
                                      <input type="radio" name="userface" value="17"></td>
                                    <td height="35" ><img src="images/17.gif" width="70" height="70"></td>
                                    <td height="35"> 
                                      <input type="radio" name="userface" value="18"></td>
                                    <td height="35" ><img src="images/18.gif" width="70" height="70"></td>
                                    <td height="35"> 
                                      <input type="radio" name="userface" value="19"></td>
                                    <td height="35" ><img src="images/19.gif" width="70" height="70"></td>
                                    <td height="35"> 
                                      <input type="radio" name="userface" value="20"></td>
                                    <td height="35" ><img src="images/20.gif" width="70" height="70"></td>

                                  </tr>
                        </table>
                        <div align="center"></div>
                        <div align="center"><hr align="center" class="high1">
                        </div>
                        <table border="0" cellspacing="0" cellpadding="0" align="center"  width="450" class="font">
                          <tr> 
                            <td> 
                              <div align="center" class="STYLE3">留 言 内 容 </div>                            </td>
                          </tr>
              <TR bgcolor="#FFFFFF"> 
                <TD width="80%" height=160 bgcolor="#ECE9D8" class=tablebody2> 
                  
                    <div align="left">
                      <select name="selectFont" id="selectFont" onChange="setFont(this.options[this.selectedIndex].value)">
                        <option selected>选择字体</option>
                        <option value="宋体">宋体</option>
                        <option value="黑体">黑体</option>
                        <option value="隶书">隶书</option>
                        <option value="幼圆">幼圆</option>
                        <option value="仿宋_GB2312">仿宋_GB2312</option>
                        <option value="Arial">Arial</option>
                        <option value="Times New Roman">Times New Roman</option>
                      </select> 
                      <select name="selectSize" id="selectSize" onChange="setSize(this.options[this.selectedIndex].value)">
                        <option selected>字体大小</option>
                        <option value="6">6</option>
                        <option value="8">8</option>
                        <option value="10">10</option>
                        <option value="12">12</option>
                        <option value="14">14</option>
                        <option value="18">18</option>
                        <option value="24">24</option>
                        <option value="36">36</option>
                      </select> 
                      <select name="selectColor" id="selectColor" onChange="setColor(this.options[this.selectedIndex].value)">
                        <option value="" selected>选择颜色</option>
                        <option value="red">红色</option>
                        <option value="blue">蓝色</option>
                        <option value="yellow">黄色</option>
                        <option value="green">绿色</option>
                      </select> 
                      <br>
                      <a href="javascript:" onClick="addBold()"><img src="images/ubb/bold.gif" alt="字体加粗" width="20" height="20" border="0"></a> 
                      <a href="javascript:" onClick="addEm()"><img src="images/ubb/italic.gif" alt="字体倾斜" width="20" height="20" border="0"></a> 
                      <img src="images/ubb/separator.gif" width="6" height="20"> <a href="javascript:" onClick="addLeft()"> 
                        <img src="images/ubb/left.gif" alt="字体左对齐" width="20" height="20" border="0"></a> 
                      <a href="javascript:" onClick="addCenter()"> <img src="images/ubb/center.gif" alt="字体居中" width="20" height="20" border="0"></a> 
                      <a href="javascript:" onClick="addRight()"> <img src="images/ubb/right.gif" alt="字体靠右" width="20" height="20" border="0"></a> 
                      <img src="images/ubb/separator.gif" width="6" height="20"> <a href="javascript:" onClick="addimages()"><img src="images/ubb/image.gif" alt="引用外部图片" width="20" height="20" border="0"></a>&nbsp; 
                      <img src="images/ubb/date.gif" alt="插入日期" width="20" height="20"> 
                      <img src="images/ubb/separator.gif" width="6" height="20"> <a href="javascript:" onClick="addQuote()"><img src="images/ubb/quote.gif" alt="插入引用" width="20" height="20" border="0"></a>&nbsp; 
                      <a href="javascript:" onClick="addURL()"><img src="images/ubb/link.gif" alt="加入超链接" width="20" height="20" border="0"></a>&nbsp; 
                      <a href="javascript:" onClick="addEmail()"><img src="images/ubb/email.gif" alt="插入Email" width="20" height="20" border="0"></a>	
                      <BR>
                      <textarea name="content" cols="70" rows="15" wrap="VIRTUAL" class="form" id="content" style="background-color:#E4E4E4"></textarea> 
                      <BR>
                      <span class="STYLE4">点击表情符号可以将其加入正文（正文内容不能大于<B>600</B>个字符）。</span><BR>
                      <script type="text/javascript" language="javascript">
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
			        </script> 
                      <br>
                      </div>
                    <div id="ch"> <br>
                  </div>
                  </TD>
              </TR>
                        </table>
                        <div align="center"></div>
                        <table border="0" cellspacing="0" cellpadding="0" width="450" height="40" align="center" >
                          <tr> 
                            <td align="center" class="font"> <span > 
                                <input type="submit" class=button2 value="写好了" name="Submit">
                              </span> <span > </span></td>
                            <td align="center" class="font"> <span > 
                              <input type="button" value="不写了" name="cmdExit" class=button2 onClick=" history.back()">
                              </span></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
					</form>
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
  String username=request.getParameter("username");
  byte b[]=username.getBytes("ISO-8859-1");
  username=new String(b);
  String userface=request.getParameter("userface");
  String userurl=request.getParameter("userurl");
  String usermail=request.getParameter("usermail");
  String userqq=request.getParameter("userqq");
  String usertitle=request.getParameter("usertitle");
  byte c[]=usertitle.getBytes("ISO-8859-1");
  usertitle=new String(c);
  String content=request.getParameter("content");
  byte d[]=content.getBytes("ISO-8859-1");
  content=new String(d);
  String ip=request.getRemoteAddr();
  java.util.Date date=new java.util.Date();
  String datetime=new Timestamp(date.getTime()).toString();
  
  HTMLFilter.setSource(content);
  HTMLFilter.run();
  content=HTMLFilter.getResult();
					
  UbbCode.setSource(content);
  UbbCode.run();
  content=UbbCode.getResult();
					
  FaceFilter.setSource(content);
  FaceFilter.run();
  content=FaceFilter.getResult();

  String sql="insert into Guestbook(username,userface,userurl,usermail,userqq,usertitle,content,ip,mydate) values('"+username+"','"+userface+"','"+userurl+"','"+usermail+"','"+userqq+"','"+usertitle+"','"+content+"','"+ip+"','"+datetime+"')";
	try{
        stmt.executeUpdate(sql);
	    response.sendRedirect("index.jsp");
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
%>