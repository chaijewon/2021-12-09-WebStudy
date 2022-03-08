package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;

import java.text.SimpleDateFormat;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
import com.sist.data.input.*;
public class ReserveModel {
  @RequestMapping("reserve/reserve.do")
  public String reserve_page(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  request.setAttribute("main_jsp", "../reserve/reserve.jsp");
	  return "../main/main.jsp";
  }
  
  @RequestMapping("reserve/food_house.do")
  public String reserve_food_house(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  List<FoodVO> list=ReserveDAO.foodListData();
	  for(FoodVO vo:list)
	  {
		  String poster=vo.getPoster();
		  poster=poster.substring(0,poster.indexOf("^"));
		  vo.setPoster(poster);
	  }
	  request.setAttribute("list", list);
	  return "../reserve/reserve_food.jsp";
  }
  @RequestMapping("reserve/reserve_day.do")
  public String reserve_reserve_day(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String days=request.getParameter("days");
	  Date date=new Date();
	  SimpleDateFormat sdf=new SimpleDateFormat("yyyy-M-d");
	  String today=sdf.format(date);
	  StringTokenizer st=new StringTokenizer(today,"-");
	  int year=Integer.parseInt(st.nextToken());
	  int month=Integer.parseInt(st.nextToken());
	  int day=Integer.parseInt(st.nextToken());
	  
	  Calendar cal=Calendar.getInstance();
	  cal.set(Calendar.YEAR, year);
	  cal.set(Calendar.MONTH, month-1);
	  cal.set(Calendar.DATE, 1);
	  int week=cal.get(Calendar.DAY_OF_WEEK);
	  int lastday=cal.getActualMaximum(Calendar.DATE);
	  
	  request.setAttribute("year", year);
	  request.setAttribute("month", month);
	  request.setAttribute("day", day);
	  request.setAttribute("week", week-1);
	  request.setAttribute("lastday", lastday);
	  String[] strWeek= {"일","월","화","수","목","금","토"};
	  request.setAttribute("strWeek", strWeek);
	  
	  // 예약 가능한 날짜 처리 
	  int[] rdays=new int[32];
	  st=new StringTokenizer(days,",");
	  
	  while(st.hasMoreTokens())
	  {
		  DaysVO vo=ReserveDAO.reserveDays(Integer.parseInt(st.nextToken()));
		  if(vo.getRday()>=day)
		  {
		    rdays[vo.getRno()]=vo.getRday();
		  }
	  }
	  
	  request.setAttribute("rdays", rdays);
	  return "../reserve/reserve_day.jsp";
  }
}








