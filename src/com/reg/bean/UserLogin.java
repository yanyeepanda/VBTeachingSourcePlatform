package com.reg.bean;
import java.sql.*;

import com.reg.bean.Function;
import com.reg.bean.DBCon;

import com.reg.bean.MD5;

public class UserLogin
{

    DBCon DBConn = new DBCon();
    Function Fun = new Function(); 
    MD5 md5 = new MD5();
	public String UserName,UserPwd,UserSex,UserClasses;
	public String UserEmail;
	public String AddTime;
	
    
    public boolean ReadUser(int UserID)
    {
    try{	
    	Connection Conn = DBConn.getConnection(); 
    	Statement stmt = Conn.createStatement(1004,1007);
    	ResultSet rs = null;
    	String Sql = "select * from ClassUser where UserID=" + UserID;
    	rs = stmt.executeQuery(Sql);
    	rs.next();
    	UserName = rs.getString("UserName");
    	UserPwd = rs.getString("UserPwd");
    	UserSex = rs.getString("UserSex");
    	AddTime = rs.getString("AddTime");
    	UserEmail = rs.getString("UserEmail");
    	UserClasses = rs.getString("UserClasses");
    	
    	rs.close();
    	stmt.close();
    	Conn.close();
    	return true;
    	}catch(Exception e){ return false;}
    }
    
    public String ReadUserName(String s0)
    {
    	try{	
	    	Connection Conn = DBConn.getConnection(); 
        	Statement stmt = Conn.createStatement(1004,1007);
        	ResultSet rs = null;
        	int UserID = Fun.StrToInt(s0);
        	String Sql = "select UserName from ClassUser where UserID=" + UserID;
        	rs = stmt.executeQuery(Sql);
        	rs.next();
        	UserName = rs.getString("UserName");
        	rs.close();
        	stmt.close();
        	Conn.close();
        	return UserName;
        	}catch(Exception e){ return null;}
	}

    public String UserList(String sPage,String strPage)
    {
    	try
    	{
	    	Connection Conn = DBConn.getConnection(); 
	    	Statement stmt = Conn.createStatement(1004,1007);
	    	ResultSet rs = null;
	    	String sSql = null;
	    	StringBuffer sb = new StringBuffer();
			int i;
			int intPage = 1; 			
			int intPageSize = 10;
			if (Fun.ReadConfig() && Fun.AdminUserListNum>0) intPageSize = Fun.AdminUserListNum;
	    	sSql = "select * from ClassUser order by UserID desc";
	    	rs = stmt.executeQuery(sSql);	    	
	    	 
	    	sb.append("<br><br><table width=\"90%\"  border=\"1\" align=\"center\" cellpadding=\"2\" cellspacing=\"\">\r\n");
			sb.append("<tr background=\"images/bg.gif\">\r\n");
			sb.append("<td height=\"27\" colspan=\"7\" background=\"images/bg.gif\"><div align=\"center\" class=\"title\">");
			sb.append("<strong>所有普通用户列表</strong></div></td>\r\n");
			sb.append("</tr>\r\n");
			sb.append("<tr height=\"25\" class=\"chinese\">\r\n");
			sb.append("<td width=\"5%\"><div align=\"center\"><b>ID</b></div></td>\r\n");
			sb.append("<td width=\"12%\"><div align=\"center\"><b>用户名</b></div></td>\r\n");
			sb.append("<td width=\"13%\"><div align=\"center\"><b>用户性别</b></div></td>\r\n");
			sb.append("<td width=\"12%\"><div align=\"center\"><b>用户班级</div></td>\r\n");
			sb.append("<td width=\"26%\"><div align=\"center\"><b>用户Email</b></div></td>\r\n");
			sb.append("<td width=\"8%\"><div align=\"center\"><b>添加日期</b></div></td>\r\n");
			sb.append("<td width=\"24%\">\r\n");
			sb.append("<div align=\"center\">操作 </div></td>\r\n");
			sb.append("</tr>\r\n");
		
			//如果表中没有任何记录，刚给出提示信息
			if (!rs.next())
			{ 
				sb.append("<tr height=\"25\" bgcolor=\"#d6dff7\"  class=\"info1\"><td colspan=\"7\">\r\n");
				sb.append("<div align=\"center\">暂时没有管理用户!</div></td></tr>\r\n");
			}
			else 
			{
				//取得待显示页码 
				intPage = Fun.StrToInt(strPage);
				sPage = Fun.CheckReplace(sPage);
				if (intPage==0) intPage=1;
				
				
				//将记录指针定位到待显示页的第一条记录上 
				rs.absolute((intPage-1) * intPageSize+1);
				i = 0; 
				while(i < intPageSize && !rs.isAfterLast())
				{
					int UserID = rs.getInt("UserID");
					sb.append("<tr height=\"25\" bgcolor=\"#d6dff7\" class=\"chinese\">\r\n");
					sb.append("<td><div align=\"center\" class=\"chinese\">" + UserID + "</div></td>\r\n");
					sb.append("<td><div align=\"center\" class=\"chinese\">" + rs.getString("UserName") + "</div></td>\r\n");
					sb.append("<td><div align=\"center\" class=\"chinese\">" + rs.getString("UserSex") + "</div></td>\r\n");
					sb.append("<td><div align=\"center\" class=\"chinese\">" + rs.getString("UserClasses") + "</div></td>\r\n");
					sb.append("<td><div align=\"center\" class=\"chinese\">" + rs.getString("UserEmail") + "</div></td>\r\n");
					sb.append("<td><div align=\"center\" class=\"chinese\">" + rs.getString("AddTime") + "</div></td>\r\n");
					sb.append("<td><div align=\"center\" class=\"chinese\">[<a href=\"User_User.jsp?Action=View&UserID=" + UserID + "\">浏览</a>]");
					sb.append("[<a href=\"User_User.jsp?Action=Edit&UserID=" + UserID + "\">修改</a>]");
					sb.append("[<a href=\"User_User.jsp?Action=Del&UserID="+ UserID + "\">删除</a>]</div></td>\r\n");
					sb.append("</tr>\r\n");
					rs.next(); 
					i++;
				}
				sb.append("</table>\r\n");
				sb.append(Fun.Page(sPage,rs,intPage,intPageSize));
				sb.append("<br><br>");
			}
			rs.close();
    		stmt.close();
    		Conn.close();
			return sb.toString();
		}catch(Exception e)
		{
			//e.printStackTrace();
			return "No";
			//return e.getMessage().toString(); 
		}
    }
 
    public String AddUser()
    {
	try{	
		StringBuffer sb = new StringBuffer();
      	sb.append("<br><br><form  name=\"User\" method=\"POST\" action=\"User_User.jsp\" onSubmit=\"return CheckUser();\">\r\n");
		sb.append("<table width=\"90%\"  border=\"1\" align=\"center\" cellpadding=\"2\" cellspacing=\"0\">\r\n");
		sb.append("<tr background=\"images/bg.gif\">\r\n");
		sb.append("<td height=\"25\" colspan=\"2\" class=\"chinese\" background=\"images/bg.gif\"><div align=\"center\"><span class=\"title\">");
		sb.append("<strong>添加新的管理用户</strong></span><span class=\"info1\">  (打 * 为必填项)</span></div></td>\r\n");
		sb.append("</tr>\r\n");
		sb.append("<tr bgcolor=\"#d6dff7\">\r\n");
		sb.append("<td width=\"35%\" height=\"25\" class=\"chinese\"><div align=\"right\">用户名：</div></td>\r\n");
		sb.append("<td width=\"65%\"><input name=\"UserName\" type=\"text\" class=\"chinese\" id=\"UserName\" size=\"20\" maxlength=\"16\">");
		sb.append("<span class=\"info1\"> * </span></td></tr>\r\n");
		sb.append("<tr bgcolor=\"#d6dff7\">\r\n");
		sb.append("<td height=\"25\" class=\"chinese\"><div align=\"right\">密码：</div></td>\r\n");
		sb.append("<td><input name=\"UserPwd\" type=\"password\" class=\"chinese\" id=\"UserPwd\" size=\"20\" maxlength=\"16\">");
		sb.append("<span class=\"info1\"> * (4-16位)</span></td></tr>\r\n");
		sb.append("<tr bgcolor=\"#d6dff7\">\r\n");
		sb.append("<td height=\"25\" class=\"chinese\"><div align=\"right\">确认密码：</div></td>\r\n");
		sb.append("<td><input name=\"UserPwd2\" type=\"password\" class=\"chinese\" id=\"UserPwd2\" size=\"20\" maxlength=\"16\">");
		sb.append("<span class=\"info1\"> * </span></td></tr>\r\n");
		sb.append("<tr bgcolor=\"#d6dff7\">\r\n");
		sb.append("<td height=\"25\" class=\"chinese\"><div align=\"right\">权限设置：</div></td>\r\n");
		sb.append("<td><select name=\"UserType\" class=\"chinese\" id=\"UserType\">\r\n");
		sb.append("<option value=\"1\" selected>普通管理员</option>\r\n");
		sb.append("<option value=\"2\">系统管理员</option>\r\n");
		sb.append("<option value=\"3\">超级管理员</option>\r\n");
		sb.append("</select></td>\r\n");
		sb.append("</tr>\r\n");
		sb.append("<tr bgcolor=\"#d6dff7\">\r\n");
		sb.append("<td height=\"25\" class=\"chinese\"><div align=\"right\">真实姓名：</div></td>\r\n");
		sb.append("<td><input name=\"UserName\" type=\"text\" class=\"chinese\" id=\"UserName\" size=\"20\" maxlength=\"16\">");
		sb.append("<span class=\"info1\"> * </span></td></tr>\r\n");
		sb.append("<tr bgcolor=\"#d6dff7\">\r\n");
		sb.append("<td height=\"25\" class=\"chinese\"><div align=\"right\">性别：</div></td>\r\n");
		sb.append("<td class=\"chinese\"><input name=\"UserSex\" type=\"radio\" value=\"男\" checked>男\r\n");
		sb.append("<input name=\"UserSex\" type=\"radio\" value=\"女\">女</td>\r\n");
		sb.append("</tr>\r\n");
		sb.append("<tr bgcolor=\"#d6dff7\">\r\n");
		sb.append("<td height=\"25\" class=\"chinese\"><div align=\"right\">出生日期：</div></td>\r\n");
		sb.append("<td class=\"chinese\"><select name=\"Year\" class=\"chinese\" id=\"Year\">\r\n");
		for(int Year=1900;Year<=2000;Year++)
		{
			sb.append("<option value=\"" + Year + "\">" + Year + "</option>");
		}
		
		sb.append("\r\n");
		sb.append("</select>年\r\n");
		sb.append("<select name=\"Month\" class=\"chinese\" id=\"Month\">\r\n");
			
		for(int Month=1;Month<=12;Month++)
		{
			sb.append("<option value=\"" + Month + "\">" + Month + "</option>");
		}
		
		sb.append("\r\n");
		sb.append("</select>月\r\n");
		sb.append("<select name=\"Day\" class=\"chinese\" id=\"Day\">\r\n");
		
		for(int Day=1;Day<=31;Day++)
		{
			sb.append("<option value=\"" + Day + "\">" + Day + "</option>");
		}
		
		sb.append("\r\n");
		sb.append("</select>日</td>\r\n");
		sb.append("</tr>\r\n");
		sb.append("<tr bgcolor=\"#d6dff7\">\r\n");
		sb.append("<td height=\"25\" class=\"chinese\"><div align=\"right\">电子邮件：</div></td>\r\n");
		sb.append("<td><input name=\"UserEmail\" type=\"text\" class=\"chinese\" id=\"UserEmail\" size=\"20\" maxlength=\"50\">");
		sb.append("<span class=\"info1\"> * </span></td></tr>\r\n");
		sb.append("<tr bgcolor=\"#d6dff7\">\r\n");
		sb.append("<td height=\"25\" class=\"chinese\"><div align=\"right\">联系电话：</div></td>\r\n");
		sb.append("<td><input name=\"UserTel\" type=\"text\" class=\"chinese\" id=\"UserTel\" size=\"20\" maxlength=\"11\"></td>\r\n");
		sb.append("</tr>\r\n");
		sb.append("<tr bgcolor=\"#d6dff7\">\r\n");
		sb.append("<td height=\"25\" class=\"chinese\"><div align=\"right\">QQ：</div></td>\r\n");
		sb.append("<td><input name=\"UserQQ\" type=\"text\" class=\"chinese\" id=\"UserQQ\" size=\"20\" maxlength=\"10\"></td>\r\n");
		sb.append("</tr>\r\n");
		sb.append("<tr bgcolor=\"#d6dff7\">\r\n");
		sb.append("<td height=\"25\" class=\"chinese\"><div align=\"right\">通讯地址：</div></td>\r\n");
		sb.append("<td><input name=\"UserAddress\" type=\"text\" class=\"chinese\" id=\"UserAddress\" size=\"40\" maxlength=\"80\"></td>\r\n");
		sb.append("</tr>\r\n");
		sb.append("<tr bgcolor=\"#d6dff7\">\r\n");
		sb.append("<td height=\"25\" class=\"chinese\"><div align=\"right\">邮编：</div></td>\r\n");
		sb.append("<td><input name=\"UserZip\" type=\"text\" class=\"chinese\" id=\"UserZip\" size=\"20\" maxlength=\"6\"></td>\r\n");
		sb.append("</tr>\r\n");
		sb.append("<tr bgcolor=\"#d6dff7\">\r\n");
		sb.append("<td height=\"25\" class=\"chinese\"><div align=\"right\">个人简介：</div></td>\r\n");
		sb.append("<td><textarea name=\"UserInfo\" cols=\"40\" rows=\"4\" class=\"chinese\" id=\"UserInfo\"></textarea></td>\r\n");
		sb.append("</tr>\r\n");
		sb.append("<tr>\r\n");
		sb.append("<td height=\"25\" colspan=\"2\"><div align=\"center\">\r\n");
		sb.append("<input name=\"Submit\" type=\"submit\" class=\"button\" value=\" 确 定 \">&nbsp;\r\n");
		sb.append("<input name=\"Action\" type=\"hidden\" id=\"Action\" value=\"SaveAdd\">");
		sb.append("<input name=\"Reset\" type=\"reset\" class=\"button\" id=\"Reset\" value=\" 重 填 \">\r\n");
		sb.append("<input name=\"Return\" type=\"button\" class=\"button\" id=\"Return\"");
		sb.append("onClick=\"javascript:location.href='User_User.jsp'\" value=\"返回用户列表\">\r\n");
		sb.append("</div></td>\r\n");
		sb.append("</tr>\r\n");
		sb.append("</table>\r\n");
		sb.append("</form><br><br>\r\n");
		return sb.toString();
		}catch(Exception e){
			////e.printStackTrace();
			//System.out.print(e.getMessage());
    		return "No";
    	}	
    }

    public String EditUser(String s,boolean b)
    {
    try{
    	
		String sError = "";
		boolean OK = true;
		String sAction = "Person.jsp";
		String sModType = "修改个人资料";
		String sCheck = "onSubmit=\"return CheckPerson();\"";
		
		if(b) 
		{
			sAction = "User_User.jsp";
			sModType = "修改管理员用户资料";
			sCheck = "onSubmit=\"return CheckEditUser();\"";
		}
		int UserID = Fun.StrToInt(Fun.CheckReplace(s));
		if (UserID==0)
		{
			OK = false;
			sError = "No";
		}
		
		if(OK)
		{
			if(!ReadUser(UserID))
			{
				OK = false;
				sError = "No";
			}
		}
		if(OK)
		{	  	
	    	StringBuffer sb = new StringBuffer();		
			sb.append("<br><br>\r\n");
			sb.append("<form name=\"User\" method=\"POST\" action=\"");
			sb.append(sAction);
			sb.append("\" " + sCheck + ">\r\n");
			sb.append("<table width=\"90%\"  border=\"1\" align=\"center\" cellpadding=\"2\" cellspacing=\"0\">\r\n");
			sb.append("<tr background=\"images/bg.gif\">\r\n");
			sb.append("<td height=\"25\" colspan=\"2\" class=\"chinese\" background=\"images/bg.gif\"><div align=\"center\"><span class=\"title\">");
			sb.append("<strong>" + sModType + "</strong></span><span class=\"info1\">  (打 * 为必填项)</span></div></td>\r\n");
			sb.append("</tr>\r\n");
			sb.append("<tr bgcolor=\"#d6dff7\">\r\n");
			sb.append("<td width=\"34%\" height=\"25\" class=\"chinese\"><div align=\"right\">用户名：</div></td>\r\n");
			sb.append("<td width=\"66%\"><input name=\"UserName\" readonly type=\"text\" class=\"chinese\" id=\"UserName\" value=\"");
			sb.append(UserName);
			sb.append("\" size=\"20\" maxlength=\"16\"><input name=\"UserID\" type=\"hidden\" id=\"UserID\" value=\"");
			sb.append(UserID);
			sb.append("\"></td></tr>\r\n");
			if(b)
			{	
				sb.append("<tr bgcolor=\"#d6dff7\">\r\n");
				sb.append("<td height=\"25\" class=\"chinese\"><div align=\"right\">密码：</div></td>\r\n");
				sb.append("<td><input name=\"UserPwd\" type=\"password\" class=\"chinese\" id=\"UserPwd\" value=\"");
				//sb.append(UserPwd);
				sb.append("\" size=\"20\" maxlength=\"16\"><span class=\"info1\">  (留空则表示不修改密码)</span></td>\r\n");
				sb.append("</tr>\r\n");
				sb.append("<tr bgcolor=\"#d6dff7\">\r\n");
				sb.append("<td height=\"25\" class=\"chinese\"><div align=\"right\">确认密码：</div></td>\r\n");
				sb.append("<td class=\"chinese\"><input name=\"userrepwd\" type=\"password\" class=\"chinese\" id=\"UserPwd\" value=\"");
				//sb.append(UserPwd2);
				sb.append("\" size=\"20\" maxlength=\"16\"> </td>\r\n");
				sb.append("</tr>\r\n");
			}
			sb.append("<tr bgcolor=\"#d6dff7\">\r\n");
			sb.append("<td height=\"25\" class=\"chinese\"><div align=\"right\">用户班级：</div></td>\r\n");
			sb.append("<td><input name=\"UserClasses\" type=\"text\" class=\"chinese\" value=\"");
			sb.append(UserClasses);
			sb.append("\"  size=\"20\" maxlength=\"16\"></td>\r\n");
			sb.append("</tr>\r\n");
			sb.append("<tr bgcolor=\"#d6dff7\">\r\n");
			sb.append("<td height=\"25\" class=\"chinese\"><div align=\"right\">用户性别：</div></td>\r\n");
			sb.append("<td class=\"chinese\"><input ");
			sb.append((UserSex.equals("男"))?"CHECKED":"");
			sb.append(" name=\"UserSex\" type=\"radio\" value=\"男\" checked>\r\n");
			sb.append("男\r\n");
			sb.append("<input ");
			sb.append((UserSex.equals("女"))?"CHECKED":"");
			sb.append(" name=\"UserSex\" type=\"radio\" value=\"女\">\r\n");
			sb.append("女</td>\r\n");
			sb.append("</tr>\r\n");
			sb.append("<tr bgcolor=\"#d6dff7\">\r\n");
			sb.append("<td height=\"25\" class=\"chinese\"><div align=\"right\">电子邮件：</div></td>\r\n");
			sb.append("<td><input name=\"UserEmail\" type=\"text\" class=\"chinese\" id=\"UserEmail2\" value=\"");
			sb.append(UserEmail);
			sb.append("\" size=\"20\" maxlength=\"50\"></td>\r\n");
			sb.append("</tr>\r\n");
			sb.append("<tr>\r\n");
			sb.append("<td height=\"30\" colspan=\"2\"><div align=\"center\">\r\n");
			sb.append("<input name=\"Submit\" type=\"submit\" class=\"button\" value=\" 确 定 \">&nbsp;\r\n");
			sb.append("<input name=\"Action\" type=\"hidden\" id=\"Action\" value=\"SaveEdit\">\r\n");
			sb.append("<input name=\"Return\" type=\"button\" class=\"button\" id=\"Return\"");
			sb.append("onClick=\"javascript:history.go(-1)\" value=\"取消返回\">\r\n");
			sb.append("</div></td>\r\n");
			sb.append("</tr>\r\n");
			sb.append("</table>\r\n");
			sb.append("</form><br><br>\r\n");
			return sb.toString();
		}else return sError;
		
		}catch(Exception e){
			////e.printStackTrace();
			//System.out.print(e.getMessage());
    		return "No";
    	}	
		
	}

	public String ViewUser(String s)
    {
    try{	
		StringBuffer sb = new StringBuffer();
		String sError = "";
		boolean OK = true;
		int UserID = Fun.StrToInt(Fun.CheckReplace(s));
		if (UserID==0)
		{
			OK = false;
			//sError = "非法的参数传递";
			sError = "No";
			
		}
		
		if(OK)
		{
			if(!ReadUser(UserID))
			{
				OK = false;
				//sError = "数据库操作出错，请重试!";
				sError = "No";
			}
		}
		if(OK)
		{	
			sb.append("<br><br>\r\n");
			sb.append("<table width=\"90%\" border=\"1\" align=\"center\" cellpadding=\"4\" cellspacing=\"0\">\r\n");
			sb.append("<tr background=\"images/bg.gif\">\r\n");
			sb.append("<td class=\"chinese\" colspan=\"4\" background=\"images/bg.gif\"><div align=\"center\"><span class=\"title\">");
			sb.append("<strong>浏览用户详细信息</strong></span></div></td>\r\n");
			sb.append("</tr>\r\n");
			sb.append("<tr bgcolor=\"#d6dff7\">\r\n");
			sb.append("<td bgcolor=\"#d6dff7\" class=\"chinese\"><div align=\"right\">用户ID：</div></td>\r\n");
			sb.append("<td class=\"chinese\">&nbsp;");
			sb.append(UserID);
			sb.append("</td>\r\n");
			sb.append("<td bgcolor=\"#d6dff7\" class=\"chinese\"><div align=\"right\">添加时间：</div></td>\r\n");
			sb.append("<td class=\"chinese\">&nbsp;");
			sb.append(AddTime);
			sb.append("</td>\r\n");
			sb.append("</tr>\r\n");
			sb.append("<tr bgcolor=\"#d6dff7\">\r\n");
			sb.append("<td width=\"18%\" class=\"chinese\"><div align=\"right\">用户名： </div></td>\r\n");
			sb.append("<td width=\"30%\" class=\"chinese\">&nbsp;");
			sb.append(UserName);
			sb.append("</td>\r\n");
			sb.append("<td class=\"chinese\"><div align=\"right\">性别： </div></td>\r\n");
			sb.append("<td class=\"chinese\">&nbsp;");
			sb.append(UserSex);
			sb.append(" </td>\r\n");
			sb.append("</tr>\r\n");
			sb.append("<tr bgcolor=\"#d6dff7\">\r\n");
			sb.append("<td class=\"chinese\"><div align=\"right\">所在班级： </div></td>\r\n");
			sb.append("<td><span class=\"chinese\">&nbsp;");
			sb.append(UserClasses);
			sb.append(" </span></td>\r\n");
			sb.append("<td class=\"chinese\"><div align=\"right\">电子邮件： </div></td>\r\n");
			sb.append("<td><span class=\"chinese\">&nbsp;");
			sb.append(UserEmail);
			sb.append(" </span></td>\r\n");
			sb.append("</tr>\r\n");
			sb.append("<tr bgcolor=\"#d6dff7\">\r\n");
			sb.append("<td colspan=\"4\" class=\"chinese\"><div align=\"center\"><a href=\"#\"");
			sb.append("onClick=\"javascript:history.go(-1)\"><strong>返回</strong></a></div></td>\r\n");
			sb.append("</tr>\r\n");
			sb.append("</table>\r\n");
			sb.append("<br><br>\r\n");
			
			return sb.toString();
		}else return sError;
    	}catch(Exception e){return "No";}
    }

	public String SaveAdd(String [] s)
    {
		String [] sLog = new String[5];
	    try{
	    	boolean OK = true;
	    	String sError = "";
	    	Connection Conn = DBConn.getConnection(); 
	    	Statement stmt = Conn.createStatement(1004,1007);
	    	for(int i=0;i<s.length;i++)
	    	{
	    		s[i] = Fun.getStrCN(Fun.CheckReplace(s[i]));
	    	}
	    	String [] sa1 = new String [3];
	    	String [] sa2 = new String [3];
	    	sa1[0] = s[0];
	    	sa1[1] = s[1];
	    	sa1[2] = s[5];
	    	sa2[0] = "用户名";
	    	sa2[1] = "用户密码";
	    	sa2[2] = "电子邮件";
	    	String sOK = Fun.CheckDate(sa1,sa2);
	    	if (!sOK.equals("Yes"))
	    	{
	    		OK = false;
	    		sError = sOK; 
	    	}
	    	String sql1 = "select * from ClassUser where UserName='" + s[0] + "'";
	    	ResultSet rs1 = stmt.executeQuery(sql1);
	    	if (rs1.next()) 
	    	{
	    		OK = false;
	    		sError = "该用户名已经存在，请重新输入!";
	    	}
	    	if(OK){
  		    	s[1] = md5.getMD5ofStr(md5.getMD5ofStr(s[1]));
  			    String sql = "insert into ClassUser (UserName,UserPwd,AddTime,UserSex,UserClasses,UserEmail) values (";
 				sql += "'" + s[0] + "',";
 				sql += "'" + s[1] + "',";
 				sql += "'" + s[2] + "',";
 				sql += "'" + s[3] + "',";
 				sql += "'" + s[4] + "',";
 				sql += "'" + s[5] + "')";
 				//out.println(sql);
 				Conn.setAutoCommit(false);
				stmt.executeUpdate(sql);
				Conn.commit();
				Conn.setAutoCommit(true);
 				stmt.close();
 				Conn.close();
 				sLog[1] = "用户["+s[0]+"]注册";
 				sLog[4] = "Yes";
 				Fun.AddLog(sLog);
 	    		return "Yes";
 		    }
	    	else return "Yes";
	    	
    	}catch(Exception e){
    		sLog[1] = "普通用户["+s[0]+"]注册失败";
    		sLog[4] = "No";
			Fun.AddLog(sLog);
    		////e.printStackTrace();
    		//System.out.print(e.getMessage());
    		//System.out.print(sql);
    		return "用户注册出错，请核对你的输入!";
    	}
	
	}

	
	public String SaveEdit(String [] s,String s1,boolean b)
    {
    	
		String [] sLog = new String[5];
		sLog[0] = s1;
		sLog[1] = "修改ID为 [" + s[0] + " ] 的用户资料";
		
    	try{
    		
    		boolean OK = true;
	    	String sError = "";
    		
    		for(int i=0;i<s.length;i++)
	    	{
	    		s[i] = Fun.getStrCN(Fun.CheckReplace(s[i]));
	    	}

			if(OK)
			{
		    	Connection Conn = DBConn.getConnection(); 
		    	Statement stmt = Conn.createStatement(1004,1007);
	    		String sql = "update ClassUser set ";
	    		sql += "UserSex='" + s[2] + "',";
	    		sql += "UserClasses='" + s[3] + "'";
	    		sql += "UserEmail='" + s[4] + "'";
	    		String sql1 = " where UserID=" + s[0];
		    	if(b)
			    {
			    	if (s[1]!=null && !s[1].equals("")) 
			    	{
			    		s[1] = md5.getMD5ofStr(md5.getMD5ofStr(s[1]));	
			    		sql += ",UserPwd='" + s[1] + "'";
			    		sLog[1] += "和密码!";
			    	}
			    }
		    	sql += sql1;
				stmt.executeUpdate(sql);
				stmt.close();
				Conn.close();
				sLog[4] = "Yes";
				Fun.AddLog(sLog);
		    	return "Yes";
		    } return sError;
    	}catch(Exception e){
    		sLog[4] = "No";
			Fun.AddLog(sLog);
    		////e.printStackTrace();
    		//System.out.print(e.getMessage());
    		//System.out.print(sql);
    		return "修改用户操作出错，请核对你的输入!";
    	}
    }

	
	public String SaveEditPwd(String [] s)
    {
    	
		String [] sLog = new String[5];
		sLog[0] = s[2];
		sLog[3] = s[3];
		String sql=null;
    	try{	
    		boolean OK = true;
	    	String sError = "";
    		
    		for(int i=0;i<s.length;i++)
	    	{
	    		s[i] = Fun.getStrCN(Fun.CheckReplace(s[i]));
	    	}
	    	
	    	String [] sa1 = new String [1];
	    	String [] sa2 = new String [1];
	    	sa1[0] = s[0];
	    	sa2[0] = "旧密码";
	    	int UserID = Fun.StrToInt(s[4]);
	    	
	    	String sOK = Fun.CheckDate(sa1,sa2);
	    	if (!sOK.equals("Yes"))
	    	{
	    		OK = false;
	    		sError = sOK; 
	    	}
	    	
			if (OK && UserID==0)
	    	{
	    		OK = false;
	    		sError = "错误的参数传递";
	    	}
			
			if(OK)
			{
		    	Connection Conn = DBConn.getConnection(); 
		    	Statement stmt = Conn.createStatement(1004,1007);
		    	ResultSet rs1 = null;
		    	s[0] = md5.getMD5ofStr(md5.getMD5ofStr(s[0]));
		    	s[1] = md5.getMD5ofStr(md5.getMD5ofStr(s[1]));
		    	String sql1 = "select UserPwd from ClassUser where UserID="+UserID;
		    	rs1 = stmt.executeQuery(sql1);
		    	rs1.next();
		    	if(s[0].equals(rs1.getString("UserPwd")))
		    	{
		    		sql = "update User set ";
		    		sql += "UserPwd='" + s[1] + "'";
		    		sql += " where UserID=" + UserID;
			    	
					stmt.executeUpdate(sql);
					stmt.close();
					Conn.close();
					sLog[1] = "用户[" + s[2] + "]修改密码!"; 
					sLog[4] = "Yes";
					Fun.AddLog(sLog);
			    	return "Yes";
			    }
			    else 
			    {
			    	sLog[1] = "用户 [ " + s[2] + " ] 修改密码失败，原密码错误!"; 
					sLog[4] = "Yes";
					Fun.AddLog(sLog);
			    	return "原密码错误";
			    }
		    } 
		    else return sError;
    	}catch(Exception e){
    		sLog[1] = "用户 [ " + s[2] + " ] 修改密码失败，程序异常!";
    		sLog[4] = "No";
			Fun.AddLog(sLog);
    		//e.printStackTrace();
    		//System.out.print();
    		System.out.print(sql);
    		return "修改密码出错!" + e.getMessage();
    	}
    }

	public boolean Del(String UserID)
    {
	   
		String [] sLog = new String[5];
		sLog[0] = "";
    	try{
	    	Connection Conn = DBConn.getConnection(); 
	    	Statement stmt = Conn.createStatement();
	    	String sql = "delete from ClassUser where UserID=" + Fun.StrToInt(UserID);
	    	//String sql1 = "delete from Ping where UserID=" + Fun.StrToInt(UserID);
	    	stmt.executeUpdate(sql);
	    	//stmt.executeUpdate(sql1);
	    	stmt.close();
	    	Conn.close();
	    	sLog[1] = "删除ID为[" + UserID + "]的用户!"; 
			sLog[2] = "Yes";
			Fun.AddLog(sLog);
	    	return true;
    	}catch(Exception e){
    		////e.printStackTrace();
    		//System.out.print(e.getMessage());
			sLog[1] = "删除ID为[" + UserID + "]的用户失败!"; 
			sLog[2] = "No";
			Fun.AddLog(sLog);
    		//return "添加用户操作出错，请重试！" + e.getMessage();
    		return false;
    	}
	
	}
}