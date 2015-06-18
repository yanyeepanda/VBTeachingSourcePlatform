package com.reg.bean;					//指定类所在的包

import java.sql.*;

import com.reg.bean.Function;
import com.reg.bean.DBCon;


public class Ping
{

	 DBCon DBConn = new DBCon();
	    Function Fun = new Function(); 
    
    public Ping()
    {
    	
    } 

    public String[] ReadPing(String s0)
    {
    	try
    	{	
    		Connection Conn = DBConn.getConnection(); 
		    Statement stmt = Conn.createStatement(1004,1007);
		    ResultSet rs = null;
		    String sql = null;
		    int PingID = Fun.StrToInt(s0);
		    String [] s = new String[5];
	    	if (PingID==0)
	    		return null;
	    	else
	    	{
		    	sql = "select * from Ping where PingID=" + PingID;
			    rs = stmt.executeQuery(sql);
			    rs.next();
			    for (int i=0;i<s.length;i++)
			    {
				    s[i] = rs.getString(i+2);
			    }
			 	rs.close();
			    stmt.close();
			    Conn.close();
			    return s;
			 }
		 }catch(Exception e){
		 	//e.printStackTrace();
		 	return null;
		 }
	}

    public String ListPing(String sPage,String strPage)
    {			
		try
    	{
	    	boolean OK = true;
	    	Connection Conn = DBConn.getConnection(); 
	    	Statement stmt = Conn.createStatement(1004,1007);
	    	ResultSet rs = null;
    		StringBuffer sb = new StringBuffer();
    		String [] s1 = null;
			int i;
			int intPage = 1; 			
			int intPageSize = 15;
			if (Fun.ReadConfig() && Fun.AdminNewsListNum>0) intPageSize = Fun.AdminNewsListNum;
			
	    	String sSql = "select * from Ping order by PingID desc";
	    	rs = stmt.executeQuery(sSql);
	    	
	    	//输出表单信息
    		sb.append("<br><br><table width=\"90%\"  border=\"1\" align=\"center\" cellpadding=\"1\" cellspacing=\"0\">\r\n");
			sb.append("<tr background=\"images/bg.gif\">\r\n");
			sb.append("<td height=\"27\" colspan=\"4\" background=\"images/bg.gif\"><div align=\"center\">");
			sb.append("<strong class=\"title\">新闻评论列表</strong></div></td></tr>\r\n");
			sb.append("<tr class=\"chinese\" height=\"25\">\r\n");
			sb.append("<td width=\"8%\" height=\"25\"><div align=\"center\" class=\"chinese\"><strong>ID</strong></div></td>\r\n");
			sb.append("<td width=\"50%\"><div align=\"center\" class=\"chinese\"><strong>评论标题</strong></div></td>\r\n");
			sb.append("<td width=\"26%\"><div align=\"center\" class=\"chinese\"><strong>发布时间</strong></div></td>\r\n");
			sb.append("<td width=\"16%\"><div align=\"center\" class=\"chinese\"><strong>操作</strong></div></td>\r\n");
			sb.append("</tr>\r\n");
			
	    	//如果表中没有任何记录，刚给出提示信息
			if (!rs.next())
			{ 
				sb.append("<tr height=\"25\" bgcolor=\"#d6dff7\"  class=\"info1\"><td colspan=\"4\">\r\n");
				sb.append("<div align=\"center\"><b>暂时还没有评论!</b></div></td></tr>\r\n");
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
				    int PingID = rs.getInt("PingID");	
					String PingTitle = rs.getString("PingTitle");
					String sTitle = PingTitle;
					
					if (PingTitle.length()>20) sTitle = PingTitle.substring(0,20) + "..";

					sb.append("<tr bgcolor=\"#d6dff7\" height=\"22\">\r\n");
					sb.append("<td bgcolor=\"#d6dff7\" height=\"22\"><div align=\"center\" class=\"chinese\">" + PingID + "</div></td>\r\n");
					sb.append("<td bgcolor=\"#d6dff7\"><div class=\"news\">&nbsp");
					sb.append("<a href=\"../ShowPing.jsp?PingID=" + PingID + "\"  Title=\"" + PingTitle + "\">" + sTitle + "</div></td>\r\n");
					sb.append("<td bgcolor=\"#d6dff7\"><div align=\"center\" class=\"chinese\">" + rs.getString("AddTime") + "</div></td>\r\n");
					sb.append("<td bgcolor=\"#d6dff7\"><div align=\"center\"  class=\"chinese\">");
					sb.append("<a href=\"ModifyPing.jsp?PingID=" + PingID + "\">[修改]</a>");
					sb.append("<a href=\"DelPing.jsp?PingID=" + PingID + "\">[删除]</a> </div></td>\r\n");
					sb.append("</tr>\r\n");
					rs.next(); 
					i++;
				}
				sb.append("</table>\r\n");
				sb.append(Fun.Page(sPage,rs,intPage,intPageSize));
			}
			rs.close();
    		stmt.close();
    		Conn.close();
    		return sb.toString();	
    	}catch(Exception e)
        {
            //e.printStackTrace();
            //System.out.print(e.getMessage());
            return "No";
        }
    }

    public String AddPing(String [] s,String s1)
    {			
		try
    	{
	    	boolean OK = true;
	    	Connection Conn = DBConn.getConnection(); 
	    	Statement stmt = Conn.createStatement(1004,1007);
	    	ResultSet rs = null;
    		String sError = "";
	    	for(int i=0;i<s.length;i++)
	    	{
	    		if(i!=1) s[i] = Fun.getStrCN(Fun.CheckReplace(s[i]));
	    		else s[i] = Fun.getStrCN(s[i]);
	    	}	

	    	if(OK)
	    	{	
		    	String NowTime = (new java.util.Date()).toLocaleString();
		    	String [] sLog = new String[5];
		    	String sql = "insert into Ping (PingTitle,PingContent,AddTime,UserID,NewsID) values (";
				sql += "'" + s[0] + "',";
				sql += "'" + s[1] + "',";
				sql += "'" + s[2] + "',";
				sql += Fun.StrToInt(s[3]) + ",";
				sql += Fun.StrToInt(s[4]) + ")";
				//out.println(sql);
				try{
					Conn.setAutoCommit(false);
					stmt.executeUpdate(sql);
					Conn.commit();
					Conn.setAutoCommit(true);
					stmt.close();
					Conn.close();
			    	sLog[0] = s1;
			    	sLog[1] = "发表评论[" + s[0] + "]";
			    	sLog[2] = NowTime;
			    	sLog[4] = "Yes";
			    	Fun.AddLog(sLog);
					stmt.close();
					Conn.close();
			    	return "Yes";
			    }catch (Exception e) {
						Conn.rollback();		//回滚JDBC事务
						e.printStackTrace();
						Conn.close();
						return "事务操作失败!";
						}  
		    }
		    else return sError;
	    }catch(Exception e)
        {
            e.printStackTrace();
            //System.out.print(e.getMessage());
            return "添加评论操作失败!";
        }
     }

    public String EditPing(String [] s,String s0)
    {			
		try
    	{
	    	boolean OK = true;
	    	Connection Conn = DBConn.getConnection(); 
	    	Statement stmt = Conn.createStatement(1004,1007);
	    	ResultSet rs = null;
    		String sError = "";
	    	for(int i=0;i<s.length;i++)
	    	{
	    		s[i] = Fun.getStrCN(Fun.CheckReplace(s[i]));
	    	}

	    	int PingID = Fun.StrToInt(s0);
	    	if (PingID==0)
	    	{
	    		OK = false;
	    		sError = "评论ID参数传递错误，请重试!"; 
	    	}
	    	
	    	if(OK)
	    	{	
		    	String NowTime = (new java.util.Date()).toLocaleString();
		    	String [] sLog = new String[5];
		    	String sql = "update Ping set ";
	    		sql += "PingTitle='"   + s[0] + "',";
	    		sql += "PingContent='" + s[1] + "',";
	    		sql += "AddTime='"    + s[2] + "'";
	    		sql += " where PingID="+ PingID;
				stmt.executeUpdate(sql);
				stmt.close();
				Conn.close();
		    	sLog[1] = "修改ID为[" + PingID + "]的评论";
		    	sLog[2] = NowTime;
		    	sLog[4] = "Yes";
		    	Fun.AddLog(sLog);
				stmt.close();
				Conn.close();
		    	return "Yes";
		    }
		    else return sError;
	    }catch(Exception e)
        {
            e.printStackTrace();
            System.out.print(e.getMessage());
            return "修改评论操作失败!";
        }
     }

	public boolean DelPing(String s0)
    {
    	String NowTime = (new java.util.Date()).toLocaleString();
		String [] sLog = new String[5];
		sLog[0] = NowTime;
    	try{
    		Connection Conn = DBConn.getConnection(); 
	    	Statement stmt = Conn.createStatement();
	    	int PingID = Fun.StrToInt(s0);
	    	if (PingID==0)
	    		return false;
	    	else
	    	{
			  try{
			    	String sql = "delete from Ping where PingID=" + PingID;
			    	Conn.setAutoCommit(false);
			    	stmt.executeUpdate(sql);
			    	Conn.commit();
			    	Conn.setAutoCommit(true);
			    	sLog[1] = "删除ID为[" + s0 + "]的评论";
			    	sLog[2] = "Yes";
			    	Fun.AddLog(sLog);
					stmt.close();
					Conn.close();
			    	return true;
		    	}catch (Exception e) {
						Conn.rollback();		//回滚JDBC事务
						////e.printStackTrace();
						Conn.close();
						return false;
						}  
		    }
    	}catch(Exception e){
    		//e.printStackTrace();
    		System.out.print(e.getMessage());
    		//System.out.print(sql);
    		sLog[1] = "删除评论[" + s0 + "]出错";
	    	sLog[2] = "No";
	    	Fun.AddLog(sLog);
    		return false;
    	}
	
	}

}
     