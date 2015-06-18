package com.reg.bean;

import java.sql.ResultSet;


public class GetCount 
{ 
	   ResultSet rs=null;
	   
	   public GetCount(int week){ 
	   RegDB reg=new RegDB();
	   rs=reg.getCount(week);                             
		 
		} 
	   
	   public ResultSet getResult(){  
		                       
		   return rs;
	   }
	   
 
}
