<%@ page contentType="text/html; charset=gbk"%>
<DIV id=sidebar>
<DIV id=innersidebar>
<DIV id=sidebar-topimg><!--����������ͼ��--></DIV>
<DIV class=sidepanel id=Side_GuestBookForPJBlogSubItem1>
<H4 class=Ptitle>���Բ���</H4>
<DIV class=Pcontent><A class=sideA  
href="index.jsp">�鿴����</A><A 
class=sideA 
href="add.jsp">ǩд����</A>
<%
	if(a==null||a.booleanValue()==false)
	{
	%>
<A 
class=sideA  
href="login.jsp">��������</A>
<%
	}
else{
%>
<A 
class=sideA 
href="config.jsp">
�޸Ĺ���Ա��Ϣ</A>
<A class=sideA 
href="logout.jsp">�˳�����</A>
<% 
	}  
%>
</DIV>
<DIV class=Pfoot></DIV></DIV>
<DIV class=sidepanel id=Side_User>
<H4 class=Ptitle>��л������</H4>
<DIV class=Pcontent><A class=sideA 
href="logout.jsp">�˳�����</A></DIV></DIV>
<DIV class=Pcontent></DIV>
<DIV class=Pfoot></DIV></DIV>
<DIV class=sidpanel id=Side_Support>

<DIV class=Pfoot></DIV></DIV>
<DIV id=sidebar-bottomimg></DIV></DIV></DIV></DIV>