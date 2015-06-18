package com.reg.bean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class Logon {
	DBCon DBConn = new DBCon();
    Function Fun = new Function(); 
    MD5 md5 = new MD5();
    public String username,usrlogn,usrpsd;
    
    public boolean ReadUser()
    {
    try{	
    	Connection Conn = DBConn.getConnection(); 
    	Statement stmt = Conn.createStatement(1004,1007);
    	ResultSet rs = null;
    	String Sql = "select * from userlogonmessageinformation where Usrlogn="+username;
    	rs = stmt.executeQuery(Sql);
    	if(rs.next())
    	{
    	usrlogn=rs.getString("Usrlogn");
    	usrpsd=rs.getString("Usrpsd");
    	rs.close();
    	stmt.close();
    	Conn.close();
    	return true;
    	}
    	else
    	{rs.close();
    	stmt.close();
    	Conn.close();
    	return false;
    	}
    	}
    catch(Exception e){ return false;}
    }
}
