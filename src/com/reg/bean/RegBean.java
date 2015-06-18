package com.reg.bean;

public class RegBean {

	private int id;                     
	private String sname;              
	private String weekday;             
	private String presentTime;       
	private String period;           
	private int whichweek;         
	private String startday;           
	private int whichmonth;           

	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getPresentTime() {
		return presentTime;
	}
	public void setPresentTime(String presentTime) {
		this.presentTime = presentTime;
	}
	public String getWeekday() {
		return weekday;
	}
	public void setWeekday(String weekday) {
		this.weekday = weekday;
	}
	public int getWhichweek() {
		return whichweek;
	}
	public void setWhichweek(int whichweek) {
		this.whichweek = whichweek;
	}
	public String getStartday() {
		return startday;
	}
	public void setStartday(String startday) {
		this.startday = startday;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public int getWhichmonth() {
		return whichmonth;
	}
	public void setWhichmonth(int whichmonth) {
		this.whichmonth = whichmonth;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
}
