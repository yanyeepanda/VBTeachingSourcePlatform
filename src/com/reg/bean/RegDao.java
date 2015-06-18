package com.reg.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;
import com.reg.bean.DBCon;
import com.reg.bean.RegDB;

 
public class RegDao {
	private   static  Date startday;         
	private   static  RegBean r;
	private String day="9/7/2009";            
	                                   /* 这里默认设定学年起始时间为：2009年9月7日 */
	private static ArrayList<RegBean> list;
	private String name;
	private String password;
	private String status="notexist";
	private String regnotice;
	private boolean workornot=false;
	private int Id=0;
	 
  
	public RegDao(String name,String password) 
	                                   /* 构造函数输入用户名和密码，签到的时候调用这个构造函数 */
	{
		this.name=name;
		this.password=password;
			
	}
	
	
	public RegDao()                    /*不带参数的构造函数 ，查看的时候调用这个构造函数 */
	{
		
	}
	
	
	public static ArrayList getList()  /*返回查询得到的某个人的签到结果集            */
	{
		return list;                   /*这里的list是从getOnesInfo函数得到的       */
	}
	
	
	public String getstatus()          /*得到某次输入的用户名密码是否合法（是否存在）*/
	{
		this.getName();                /*这里其实是判断是否存在这样一个用户。->     */
		System.out.println(status);    /*->如果存在顺便从member表中查出其ID       */
		return status;                 /*返回状态                                    */
	}
	
	
	public int getdate()               /*新建一个服务器端的Date量，得到当前第几周-> */
	                                   /*（为默认页的显示）服务*/
	{
		 Date date=new Date();
		 int week=this.getwhichweek(date);
		 return week;
	}
	
	
	public boolean getWorkorNot(){    /* 返回现在是不是有效签到时间的标志 */
		
		System.out.println("************"+workornot);
		return workornot;
	}
	
	
	public String getRegNotice()      /* 返回签到成功的信息:上午，下午or晚上 */
	{
		return regnotice;
	}
	 
	public String getName()           /* 判断某用户是不是合法用户，如果是就查出对应的ID */
	{
		String Name="";
		ResultSet rs=null;
		DBCon db=new DBCon();
		Connection conn=db.getConnection();
		String sql="select * from member where UserName=? and PassWord=?";
		
		try{
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1,name);
		ps.setString(2,password);
	    rs=ps.executeQuery();
	     
		if(rs.next())                  /* 以输入的信息为查询条件，如果有记录说明用户合法 */
		{
			Name=rs.getString("Name"); 
			Id=rs.getInt("ID");        /*用户合法，就将此用户的ID提取出来    */
			System.out.println(Name);	
			status="exist";            /* 向外发出信号：此用户存在 */
			 
	    }	
		else
		{
			 System.out.println("我这儿什么也没有!"); 
			
			}
		
		}catch(Exception e){
			e.printStackTrace();
		}
	
		
		return Name;   
	}
	
	@SuppressWarnings("unchecked")
	public void setReg()   /**/
	{
	  
		  String myname=this.getName();   /* 这里 status 就出来了。*/
		
		  Date date=new Date();            
	    
		  r=new RegBean();
		                                  /* 将各个值放入到Bean对像中去*/
		  r.setId(Id);                   
		  r.setSname(myname);             
		  r.setPresentTime(this.getPresenttime(date));
		  r.setWeekday(this.getWeekday(date));
		  r.setWhichweek(this.getwhichweek(date));
		  r.setPeriod(this.getPeroid(date));
		                                  /* 这里workornot(是不否是有效签到时间)出来了*/
		  r.setWhichmonth(this.getWhichMonth());
		  
	   
	      /* 这里已经将新的,签到信息添加进去了，但是还没有添加到数据库中。添加前还要判断
	       * 是否是合法用户，是否是有效签到时间。如果是，才调用addRegInfo函数正式添加对
	       * 象
	       *  */ 
	   
	}
	
	public String addRegInfo()           /* 添加签到对象到数据库中 */
	{
		 RegDB regDB=new RegDB(r);
		 // regDB.AA(); 私有方法，变量不能被对象访问，但能被类中的成员访问。
		 String feedback=regDB.addRegInfo();
		 return feedback;                /* 调试用。返回添加是否成功的信息*/
	}
	
	
	@SuppressWarnings("unchecked")
	public void getOnesInfo(int id,int week)
	                                     /* 以ID，WEEk为参数，查询得到某个人一周的签到记录 */
	{
		 
		RegDB regDB=new RegDB();
		
	    list=regDB.getOnesInfoInAWeek(id,week);
	    
	}
	
 
   public static String getCurrentYYYYMMDDHHMMSS(){   
	                                     /* 规格化函数，得到规格化的时间 年：月：日 时-分-秒*/
	     
	     SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.CHINA);   
	     formatter.setTimeZone(TimeZone.getTimeZone("GMT+8"));   
	     Date currTime = new Date();   
	     String thisTime = new String(formatter.format(currTime));   
	     return thisTime;   
	}   
	 
   
	 public String getPresenttime(Date testDate)
	                                    /* 调用规格化函数，得到时间 */
	 {
		  String presenttime=RegDao.getCurrentYYYYMMDDHHMMSS();
		  System.out.println("现在是:"+presenttime);   
		 
		  return presenttime;	 
		   
	 }
	 
	 
	                                   
	 public int getWhichMonth(){
		                                /* 得到现在是第几个月 */
		 int month=new Date().getMonth()+1;
		 System.out.println("现在是第"+month+"月");
		 return month;
	 }
	 
	 public String getPeroid(Date testDate)
	                                    /* 得到现在是哪个时段，北京时间 */
	 {
 /*
		 java.util.Locale locale=java.util.Locale.CHINA;
		  String pattern = "kk";
		  java.text.SimpleDateFormat df = new java.text.SimpleDateFormat(pattern,locale);
		  java.util.Date date = new java.util.Date();
		  String Hour = df.format(date);
		  int hour=Integer.parseInt(Hour);
		  */
		  
		 int hour=testDate.getHours();
         //int hour=(testDate.getHours()+8)%24;        
		                                /* 北京时间与GSM时间相差8个小时 */
 	     System.out.println("现在时间是"+hour+"*********");
		 String period="";
		  if(hour>=7&&hour<=8)
		  {
			  System.out.printf("好的，你上午已经签到了！！");
			  regnotice="好的，你上午已经签到了!!!";
			  workornot=true;
			  period="AM"; 
		  }
		  if(hour>=13&&hour<=14)
		  {
			  System.out.println("好的，你下午已经签到了！！");
			  regnotice="好的，你下午已经签到了!!!";
			  workornot=true;
			  period="PM";
		  }
		   if(hour>=18&&hour<=19)
		  {
			  System.out.printf("好的，你晚上已经签到了!!!");
			  regnotice="好的，你晚上已经签到了!!!";
			  workornot=true;
			  period="NIGHT";
		  }
		   
		  return period;
	 }
	 
	 
	 
	 public String getWeekday(Date testDate)
	                                    /* 利用规格化函数得到汉化的当天是星期几的信息 */
	 {
		  SimpleDateFormat format2=new SimpleDateFormat("E"); 
		  String weekday=format2.format(testDate);
		  System.out.println(weekday);
		  return weekday; 
		 
		  
		  
	 }
	 
	 
	 public  int getwhichweek(Date present)
	                                    /* 设置一个起始时间，从那个时候开始计时
	                                     * 判断现在是第多少周*/
	 {
		 
		 setStartDay(day);              /* 设定起始时间，默认的day是:9/7/2009 */
		 long s1=startday.getTime();    /* util.date.getTime得到的时间是以毫秒为单位的*/
		 long s2=present.getTime();
		 long s3=s2-s1;                  
		                                /* 将现在时间与起始时间相差毫秒数，转化为周数*/
		 int week=(int)(s3/(1000*60*60*24*7)+1);
		 System.out.println("这是第:"+week+"周");
		 
		 return week;
	 }
	 
	 
	  public void setStartDay(String day) 
	                                    /* 设定起始时间的函数 */
	 {
		 
		                                /*利用规格化函数设定格式： “月/日/年” */
		 java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("M/dd/yyyy"); //注意，这里规定了输入的格式。一定要按这个来
		 try{ 
			  startday= sdf.parse(day);
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 } 
	 }

}
