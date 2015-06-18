package com.reg.bean;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBCon {
	
	public Connection conn=null;
	
	public Connection  getConnection()
	{
		
		String Driver="com.mysql.jdbc.Driver";
		String Url="jdbc:mysql://localhost:3306/test?characterEncoding=utf-8";
		
		try{
			Class.forName(Driver);        
			                             
			conn=DriverManager.getConnection( Url,"root","root");
			System.out.println("success");
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return conn;
	    
		
	}
	
	public static void main(String args[])
	{
		DBCon con=new DBCon();
		
		con.getConnection();
	}

}
