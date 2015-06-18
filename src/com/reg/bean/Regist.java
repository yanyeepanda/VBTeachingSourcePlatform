package com.reg.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

 /*
  * 
  *  这个类是专为实现用户注册功能写的
  * 
  * 
  */
public class Regist {
	

	String username;
	String name;
	String pwd;
	
	public Regist(String username,String name,String pwd)
	{
		this.username=username;
		this.name=name;
		this.pwd=pwd;
		
	}
	
	public String  addRegist()
	{

		 DBCon db=new DBCon();
		 Connection conn=db.getConnection();
	     PreparedStatement pstmt1,pstmt2;
	     
	     String sql="select * from member where Name=?";
	     String sql2="insert into member(Name,UserName,Password)values(?,?,?)";
	     ResultSet rs1;
	     boolean flag=false;
	     String notice="";
	     
	     try{
	    	 pstmt1=conn.prepareStatement(sql);
	    	 pstmt2=conn.prepareStatement(sql2);
	    	 pstmt1.setString(1,name);
	    	 
	    	 rs1=pstmt1.executeQuery();
	    	 
	    	 if(rs1.next()){
	    		 notice="你已经注册了，不能重复注册!";
	    	 }
	    	 
	    	 else{
	    		 pstmt2.setString(1,name);
	    		 pstmt2.setString(2,username);
	    		 pstmt2.setString(3,pwd);
	    		 
	    		 flag=pstmt2.execute();
	    		 if(flag=true){
	    		    notice="恭喜，你已经注册成功!";
	    		 }
	    	 }
	     }catch(Exception e){
	    	 e.printStackTrace();
	     }
	     
		 return notice;
	}

}
