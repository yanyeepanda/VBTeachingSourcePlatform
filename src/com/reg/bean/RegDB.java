package com.reg.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
 

import com.reg.bean.DBCon;

public class RegDB {
	private  RegBean r;

	public RegDB()
	{
		
	}
	public RegDB(RegBean r)
	{
		this.r=r;
	}
	
	
	public boolean checkIfReged()     /* 检查某个用户是否已经注册了*/
	{
		DBCon db=new DBCon();
		Connection con=db.getConnection();
		String sql="select * from reg where ID=? and Period=? and WeekDay=? and WhichWeek=?";
		boolean flag=false;
		ResultSet rs=null;
		
		try{
			
			PreparedStatement pstmt=con.prepareStatement(sql);
			System.out.println(r.getPeriod()+"=**********");
			System.out.println(r.getWeekday());
			System.out.println(r.getId());
			System.out.println("**********************aa");
			pstmt.setInt(1,r.getId());
			pstmt.setString(2,r.getPeriod());
			pstmt.setString(3,r.getWeekday());
			pstmt.setInt(4,r.getWhichweek());
			
			rs=pstmt.executeQuery();
			System.out.println("===========");
			if(rs.next())
			{ 
				System.out.println( "+++++++++++++");
				System.out.println(rs.getString("Sname"));
				flag=true; 
			}
			 
		}catch(Exception e){
			e.printStackTrace();
		}
		System.out.println(flag);
		return flag;
	}
	
	
	public String  addRegInfo()
	{
	   if(!checkIfReged()){
		   DBCon db=new DBCon();
			Connection con=db.getConnection();
		
			try
			{
			    String sql="insert into reg(ID,Sname,WeekDay,PresentTime,Period,WhichWeek,WhichMonth)values(?,?,?,?,?,?,?)";
				 
				PreparedStatement pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1,r.getId());
				pstmt.setString(2,r.getSname());
	 		    pstmt.setString(3,r.getWeekday());
	 		    pstmt.setString(4,r.getPresentTime());
	 		    pstmt.setString(5,r.getPeriod());
	 		    pstmt.setInt(6,r.getWhichweek());
	 		    pstmt.setInt(7,r.getWhichmonth());
	 	
	 		 
	 		    pstmt.execute(); 
	 		
	 	        pstmt.close();
	 	        db.conn.close();   
	 	        return("yes");
				
			}catch(Exception e)
			{
				e.printStackTrace();
			}
			
		   
	   }
	   else{
		   return ("no");
	   }
		
	   return null;
		 
	}
	
	public  ArrayList getOnesInfoInAWeek(int id,int week){
		
		DBCon db=new DBCon();
		String sql="select * from reg where ID=? and WhichWeek=? ";
		ResultSet rs=null;
		ArrayList<RegBean> list = new ArrayList<RegBean>();
		
		try
		{
			PreparedStatement ps=db.getConnection().prepareStatement(sql);
			ps.setInt(1,id);
			ps.setInt(2,week);
			
	        rs=ps.executeQuery();
	         
			while(rs.next())
			{
				System.out.println();
				RegBean reg=new RegBean();
				reg.setSname(rs.getString(3));
				reg.setWeekday(rs.getString(4));
				reg.setPresentTime(rs.getString(5));
				reg.setPeriod(rs.getString(6));
				reg.setWhichweek(rs.getInt(7));
				reg.setWhichmonth(rs.getInt(8));
				list.add(reg);
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return list;
	}	
 
	
	public ArrayList getAllInfoInAMonth(int month)
	{
		DBCon db=new DBCon();
		String sql="select * from reg where WhichMonth=? order by Sname";
		ResultSet rs=null;
		ArrayList<RegBean> list = new ArrayList<RegBean>();
		try
		{
			PreparedStatement ps=db.getConnection().prepareStatement(sql);
		 
			ps.setInt(1,month);
			
	        rs=ps.executeQuery();
		   
			while(rs.next())
			{
				RegBean reg=new RegBean();
				reg.setId(rs.getInt(1));
				reg.setSname(rs.getString(2));
				reg.setWeekday(rs.getString(3));
				reg.setPresentTime(rs.getString(4));
				reg.setPeriod(rs.getString(5));
				reg.setWhichweek(rs.getInt(6));
				reg.setWhichmonth(rs.getInt(7));
				list.add(reg);
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return list;
	}	
	
	public ResultSet getCount(int week)
	{
		DBCon db=new DBCon();
		String sql="select ID, count(*)as a,Sname,WhichWeek  from reg  where WhichWeek=? group by ID";
		ResultSet rs=null;
		 
		try
		{
			PreparedStatement ps=db.getConnection().prepareStatement(sql);
			ps.setInt(1,week);
	        rs =ps.executeQuery();
	        
	    /*    while(rs.next())
	        	{
	        	System.out.print(rs.getString("Sname")+":");
	        	System.out.println(rs.getInt("a"));
	       
	        	}*/
		}catch(Exception e){
			e.printStackTrace();
		}
		return rs;
		   
	}
	
}
