package com.util;
import java.sql.*;
import java.util.*;

//连接数据库工具类
public class DataBaseConnection
{
	/**
	  *一个静态方法，返回一个数据库连接
	  *这样达到了对数据库统一控制的目的
	  */
	  

//#MySQL 数据库连接信息
//#MySQL 数据库驱动程序
//String MySQLDriver="org.gjt.mm.mysql.Driver"

//#MySQL数据库连接字符串。
//#upload 为数据库名，user为登录用户名,password为登录密码。请自行更改。
//String MySQLURL="jdbc:mysql://localhost:3306/upload?user=sa&password=&useUnicode=true&characterEncoding=GBK"

//#SQL Server 数据库连接信息
//#SQL Server 驱动程序
//String SQLDriver="net.sourceforge.jtds.jdbc.Driver";

//#SQL Server 数据库连接字符串
//#upload 为数据库名，user 为登录用户名，password 为登录密码。请自行更改。
//String SQLURL="jdbc:jtds:sqlserver://localhost:1433/upload;user=sa;password=";


	  
	  public static  Connection getConnection()
	  {
          Connection con=null;
          String SQLDriver="net.sourceforge.jtds.jdbc.Driver";
          String SQLURL="jdbc:jtds:sqlserver://localhost:1433/uploadSystem;user=sa;password=";
		  try
		  {
		  Class.forName(SQLDriver).newInstance();
		  con=DriverManager.getConnection(SQLURL);
		  }
		  catch(Exception e)
		  {
		     e.printStackTrace();
		  }
		  return con;
	}
};

//以后在其他文件里面就可以直接调用Connection con=DataBaseConnection.getConnection();来获得数据库的连接