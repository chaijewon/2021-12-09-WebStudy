package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.StringTokenizer;

public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		  Date date=new Date();
		  SimpleDateFormat sdf=new SimpleDateFormat("yyyy-M-d");
		  String today=sdf.format(date);
		  StringTokenizer st=new StringTokenizer(today,"-");
		  int year=Integer.parseInt(st.nextToken());
		  int month=Integer.parseInt(st.nextToken());
		  int day=Integer.parseInt(st.nextToken());
		  
		  Calendar cal=Calendar.getInstance();
		  cal.set(Calendar.YEAR, year);
		  cal.set(Calendar.MONTH, month-1);//0부터
		  cal.set(Calendar.DATE, 1);
		  int week=cal.get(Calendar.DAY_OF_WEEK);
		  int lastday=cal.getActualMaximum(Calendar.DATE);
		  System.out.println(today);
		  String[] strWeek= {"일","월","화","수","목","금","토"};
		  System.out.println(strWeek[week-1]);//1
		  System.out.println(lastday);
	}

}
