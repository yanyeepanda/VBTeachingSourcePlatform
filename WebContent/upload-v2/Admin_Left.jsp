<%@ page contentType="text/html; charset=GBK" language="java" buffer="32kb"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
BODY {
	BACKGROUND:#799AE1; MARGIN: 0px; FONT: 9pt ����;
	SCROLLBAR-HIGHLIGHT-COLOR: ;
	SCROLLBAR-ARROW-COLOR:#215dc6;
	SCROLLBAR-TRACK-COLOR:#d6dff7;
	SCROLLBAR-BASE-COLOR:#AEC6F0;
}
TD { FONT: 12px ����}
A { FONT: 12px ����; COLOR: #000000; TEXT-DECORATION: none }
A:hover { COLOR: #428eff; TEXT-DECORATION: underline}

.sec_menu 
{
	BORDER-RIGHT: white 1px solid; BACKGROUND: #d6dff7; 
	OVERFLOW: hidden; BORDER-LEFT: white 1px solid; BORDER-BOTTOM: white 1px solid 
}

.menu_title SPAN { FONT-WEIGHT: bold; LEFT: 8px; COLOR: #215dc6; POSITION: relative; TOP: 2px }

.menu_title2 SPAN { FONT-WEIGHT: bold; LEFT: 8px; COLOR: #428eff; POSITION: relative; TOP: 2px }
</style>
</head>

<table cellspacing="0" cellpadding="0" width="158" align="center">
<tr><td valign="bottom" height="42"><img height="38" src="images/title4.jpg" width="158" border="0"></td></tr>
<tr><td class="menu_title" onmouseover="this.className='menu_title2';" onmouseout="this.className='menu_title';" background="images/title_bg_quit.gif" height="25">
<span><a target="rightFrame" title="���ع�����ҳ" href="Index_Face.html"><b><font color="215DC6">������ҳ</font></b></a>|<a target="_parent" title="��ȫ�˳�����ϵͳ" href="Logout.jsp"><b><font color="215DC6">��ȫ�˳�</font></b></a></span>
<tr>
  <td class="menu_title2" onmouseover="this.className='menu_title2';" onmouseout="this.className='menu_title';" background="images/title_bg_quit.gif" height="25">
  <span class="menu_title"><b><font color="215DC6">��¼�û���<%=session.getAttribute("AdminName")%></font></b></span> <br>
<tr><td>&nbsp;<br><br></td></tr>
</table>
<table cellspacing="0" cellpadding="0" width="158" align="center">
  <tr>
    <td class="menu_title" id="menuTitle6" onmouseover="this.className='menu_title2';" onclick="showsubmenu(6)" onmouseout="this.className='menu_title';" style="cursor:hand" background="images/title_bg_show.gif" height="25"><span>��Ʒ����</span></td>
  </tr>
  <tr>
    <td id="submenu6" style="DISPLAY: none">
      <div class="sec_menu" style="WIDTH: 158px">
        <table cellspacing="0" cellpadding="0" width="135" align="center">
          <tr>
            <td height="22"><a href="Admin_PicClass.jsp" target="rightFrame">��Ʒ����</a></td>
          </tr>
          <tr>
            <td height="22"><a href="upload.jsp" target="rightFrame">�ϴ�ͼƬ</a></td>
          </tr>
        </table>
      </div>
      <div style="WIDTH: 158px">
        <table cellspacing="0" cellpadding="0" width="135" align="center">
          <tr>
            <td height="22"></td>
          </tr>
        </table>
    </div></td>
  </tr>
</table>



<table cellspacing="0" cellpadding="0" width="158" align="center">
  <tr>
    <td class="menu_title" id="menuTitle8" onmouseover="this.className='menu_title2';" onclick="showsubmenu(8)" onmouseout="this.className='menu_title';" style="cursor:hand" background="images/title_bg_show.gif" height="25"><span>����ϵͳ</span></td>
  </tr>
  <tr>
    <td id="submenu8" style="DISPLAY: none">
      <div class="sec_menu" style="WIDTH: 158px">
        <table cellspacing="0" cellpadding="0" width="135" align="center">
          <tr>
            <td height="22">���ܼ��</td>
          </tr>
          <tr>
            <td height="22">��Ȩ˵��</td>
          </tr>
        </table>
      </div>
      <div style="WIDTH: 158px">
        <table cellspacing="0" cellpadding="0" width="135" align="center">
          <tr>
            <td height="22"></td>
          </tr>
        </table>
    </div></td>
  </tr>
</table>
<br>
<br>
<table cellspacing="0" cellpadding="0" width="158" align="center">
<tr>
  <td class="menu_title" id="menuTitle9" onmouseover="this.className='menu_title2';" onmouseout="this.className='menu_title';" background="images/admin_left_9.gif" height="25">
<span>��Ϣ</span> </td>
</tr><tr><td><div class="sec_menu" style="WIDTH: 158px"><table cellspacing="0" cellpadding="0" width="135" align="center">
<tr><td height="22"><br>    
    <br>��Ȩ���У�������������<br>
	<br>����֧�֣�������������<br>
<br></td></tr></table>
</div></td></tr></table></tr></tbody></table>
</div>

<table cellspacing="0" cellpadding="0" width="158" align="center">
<tr><td>&nbsp;<br><br></td></td></tr>
</table>

<script>
function showsubmenu(sid)
{
	whichEl = eval("submenu" + sid);
	menuTitle = eval("menuTitle" + sid);
	if (whichEl.style.display == "none")
	{
	eval("submenu" + sid + ".style.display=\"\";");
	menuTitle.background="images/title_bg_hide.gif";
	}
	else
	{
	eval("submenu" + sid + ".style.display=\"none\";");
	menuTitle.background="images/title_bg_show.gif";
	}
}
</script>