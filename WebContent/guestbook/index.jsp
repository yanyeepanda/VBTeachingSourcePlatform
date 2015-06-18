<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*"  %>
<%@ include file="name.jsp" %>
<jsp:useBean id="DBConnection" scope="page" class="com.guestbook.DBConnection"/>
<%
  Boolean a=(Boolean)session.getAttribute("a"); 
  Connection conn=DBConnection.getConnectionToAccess(application.getRealPath("data/guestbook.mdb"));
  Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY); 
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
href="images/qipeng/link.css" type=text/css rel=stylesheet><!--超链接样式表-->
<SCRIPT language=JavaScript>
<!--
function go(src,q)
{
var ret;
ret = confirm(q);
if(ret!=false)window.location=src;
}

function openwin(url, width, height)
{
var Win = window.open(url,"openScript",'width=' + width + ',height=' + height + ',resizable=0,scrollbars=1,menubar=0,status=1');
}

function openreply()
{
document.viewreply.replycodes.value=document.replyform.replycode.value;
var popupWin = window.open('Viewreply.asp', 'viewreply_page', 'scrollbars=yes,width=700,height=450');
document.viewreply.submit()
}
-->
</script>
<style type="text/css">
<!--
.STYLE1 {color: #588526}
-->
</style>
</HEAD>
<BODY>
<DIV id=container><!--顶部-->
<DIV id=header>
<DIV id=blogname>有朝一日虎归山，我要血染半边天---齐鹏 
  <DIV id=blogTitle>有朝一日龙得水●我要长江水倒流●有朝一日虎归山●我要血染半边天</DIV></DIV>
<DIV id=menu>
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
<%
  String sql="select * from Guestbook order by id DESC";
  ResultSet Rs=stmt.executeQuery(sql);
  int intPageSize; //一页显示的记录数 
  int intRowCount; //记录总数 
  int intPageCount; //总页数 
  int intPage; //待显示页码 
  String  strPage; 
  int i; 
  
//设置一页显示的记录数 
 intPageSize = 2; 

//取得待显示页码 
strPage = request.getParameter("page"); 
if(strPage==null){//表明在QueryString中没有page这一个参数，此时显示第一页数据 
  intPage = 1; 
  } else{//将字符串转换成整型 
intPage = java.lang.Integer.parseInt(strPage); 
if(intPage< 1) intPage = 1; 
} 
//获取记录总数 
Rs.last(); 
intRowCount = Rs.getRow(); 
//记算总页数 
intPageCount = (intRowCount+intPageSize-1) / intPageSize; 
//调整待显示的页码 
if(intPage >intPageCount) intPage = intPageCount; 
if(intPageCount >0){ 
//将记录指针定位到待显示页的第一条记录上 
Rs.absolute((intPage-1) * intPageSize+1); 
//显示数据 
%>
<DIV id=Tbody>
<DIV id=mainContent>
<DIV id=innermainContent>
<DIV id=mainContent-topimg></DIV>
<DIV class=content-width id=Content_Contentlist>
<DIV class=pageContent>
<DIV class=page style="FLOAT: right">
<UL>
  </UL></DIV></DIV>
<%
i = 0; 
while(i< intPageSize && !Rs.isAfterLast()){ 
//读留言信息
int id=Rs.getInt("id");
String username=Rs.getString("username");
String userface=Rs.getString("userface");
String userurl=Rs.getString("userurl");
String usermail=Rs.getString("usermail");
String userqq=Rs.getString("userqq");
String usertitle=Rs.getString("usertitle");
String content=Rs.getString("content");
String mydate=Rs.getString("mydate");
String remydate=Rs.getString("remydate");
String recontent=Rs.getString("recontent");
String ip=Rs.getString("ip");
%>       
<DIV class=Content>
  <DIV class=comment style="MARGIN-BOTTOM: 20px">
<DIV class=commenttop><IMG style="MARGIN: 0px 1px -3px 0px" 
alt=公开 src="images/qipeng/icon_quote.gif" border=0> <B><%=username%></B>
</DIV>
  <div class=commentcontent>
    <table width="99%" border="1" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="140" align="center" valign="top" bgcolor="#CCCCCC" ><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height=20></td>
            </tr>
          </table>
            <img src="images/<%=userface%>.gif" width="72" height="72"><br>
            <br>
            <%=username%>&nbsp;</td>
        <td valign="top"><table width="100%" border="0" align="center" cellpadding="1" cellspacing="3">
            <tr>
              <td bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#999999">
                  <tr>
                    <td bgcolor="#FFFFFF"><table width="100%" height="24" border="0" cellpadding="0" cellspacing="0" bgcolor="#f5f5f5">
                        <tr>
                          <td width="50%" bgcolor="#CCCCCC">&nbsp;标题：<%=usertitle%>&nbsp;</td>
                          <td width="50%" bgcolor="#CCCCCC"><div align="right"> <a href="<%=userurl%>" target="_blank"><img src="images/home.gif" width="16" height="16" border="0" align="absmiddle" alt="主页:[ <%=userurl%> ]"></a> | <a href="mailto:<%=usermail%>" target="_blank"><img src="images/email.gif" width="18" height="18" border="0" align="absmiddle" alt="电子邮件:[ <%=usermail%> ]"></a> | <a href="#"><img src="images/qq-gray.gif" width="16" height="16" border="0" align="absmiddle" alt="QQ号码:<%=userqq%>"></a> | <a href="#"><img src="images/ip.gif" width="16" height="16" border="0" align="absmiddle" alt="来自：[ <%=ip%> ]"></a> &nbsp; </div></td>
                        </tr>
                    </table></td>
                  </tr>
              </table></td>
            </tr>
          </table>
            <table width="100%" height="100%" border="0" cellpadding="1" cellspacing="5">
              <tr>
                <td bgcolor="#999999"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td bgcolor="#CCCCCC"><fieldset style="width:100%;" align="center;">
                        <legend> &nbsp;<strong>留言内容： </strong></legend>
                        <table width="100%" border="0" cellspacing="4" cellpadding="0">
                          <tr>
                            <td height="60"><%=content%></td>
                          </tr>
                        </table>
                      </fieldset></td>
                    </tr>
                  </table>
                    <div align="right">发表时间： <%=mydate%> &nbsp; </div></td>
              </tr>
          </table></td>
      </tr>
      <%
if(recontent!=null)
{
//站长回复
%>
      <tr>
        <td height="30" align="center" bgcolor="#cccccc" ><font color=red>齐鹏回复：</font></td>
        <td bgcolor="f5f5f5"><table width="100%" border="0" cellpadding="0" cellspacing="4" bgcolor="#cccccc">
            <tr>
              <td bgcolor="#CCCCCC"><font color=red><%=recontent%></font></td>
            </tr>
        </table></td>
      </tr>
      <%
	}
   if(a==null||a.booleanValue()==false)
   {}else{
%>
      <tr bgcolor="#cccccc">
        <td colspan="2"><div align="right"><a href="javascript:go('del.jsp?id=<%=id%>','您确定要删除?')">删除</a> <a href="JavaScript:openwin('Reply.jsp?id=<%=id%>',600,500)">回复/编辑回复</a> <a href="JavaScript:openwin('Edit.jsp?id=<%=id%>',600,500)">编辑</a> </div></td>
      </tr>
      <%
	}
%>
    </table>
  </div>
  </DIV>
</DIV>
<% 
  Rs.next(); 
   i++; 
//读流言信息结束
  } 
%>
<DIV class=pageContent>
<DIV class=page style="FLOAT: right">
<UL>
  <LI class=pageNumber><STRONG>
  第<%=intPage%>页 共<%=intRowCount%>条记录/共<%=intPageCount%>页 
 <%
 if(intPage<2){
 out.print("首页 | 上一页");
 }else{%>
              <a href="index.jsp?page=1">首页 </a> | <a href="index.jsp?page=<%=intPage-1%>">上一页</a>
<%}%>| 
<%
 if((intPageCount-intPage)<1)
{
  out.print("下一页 | 尾页");
 }else{%>
<a href="index.jsp?page=<%=intPage+1%>">下一页</a> | <a href="index.jsp?page=<%=intPageCount%>">尾页</a> 
<%}
}
else{
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
