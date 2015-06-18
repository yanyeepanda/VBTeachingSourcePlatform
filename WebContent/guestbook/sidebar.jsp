<%@ page contentType="text/html; charset=gbk"%>
<DIV id=sidebar>
<DIV id=innersidebar>
<DIV id=sidebar-topimg><!--工具条顶部图象--></DIV>
<DIV class=sidepanel id=Side_GuestBookForPJBlogSubItem1>
<H4 class=Ptitle>留言操作</H4>
<DIV class=Pcontent><A class=sideA  
href="index.jsp">查看留言</A><A 
class=sideA 
href="add.jsp">签写留言</A>
<%
	if(a==null||a.booleanValue()==false)
	{
	%>
<A 
class=sideA  
href="login.jsp">管理留言</A>
<%
	}
else{
%>
<A 
class=sideA 
href="config.jsp">
修改管理员信息</A>
<A class=sideA 
href="logout.jsp">退出管理</A>
<% 
	}  
%>
</DIV>
<DIV class=Pfoot></DIV></DIV>
<DIV class=sidepanel id=Side_User>
<H4 class=Ptitle>鸣谢和声明</H4>
<DIV class=Pcontent><A class=sideA 
href="logout.jsp">退出管理</A></DIV></DIV>
<DIV class=Pcontent></DIV>
<DIV class=Pfoot></DIV></DIV>
<DIV class=sidpanel id=Side_Support>

<DIV class=Pfoot></DIV></DIV>
<DIV id=sidebar-bottomimg></DIV></DIV></DIV></DIV>