package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
  @RequestMapping("reserve/reserve_time.do")
  public String reserve_time(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  
	  String day=request.getParameter("day");
	  //DAO연동 
	  String rtime=ReserveDAO.reserveDaysGetTime(Integer.parseInt(day));
	  // rtime="2,5,6,7,8,11,14"
	  List<String> list=new ArrayList<String>();
	  StringTokenizer st=new StringTokenizer(rtime,",");
	  while(st.hasMoreTokens())
	  {
		  String time=ReserveDAO.reserveTimeData(Integer.parseInt(st.nextToken()));
		  // 10:30
		  list.add(time);
	  }
	  request.setAttribute("list", list);
	  return "../reserve/reserve_time.jsp";
  }
  @RequestMapping("reserve/reserve_inwon.do")
  public String reserve_inwon(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  return "../reserve/reserve_inwon.jsp";
  }
  @RequestMapping("reserve/reserve_ok.do")
  public String reserve_reserve_ok(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  /*
	   *     <input type=hidden name="fno" value="" id="fno_data">
             <input type=hidden name="day" value="" id="day_data">
             <input type=hidden name="time" value="" id="time_data">
             <input type=hidden name="inwon" value="" id="inwon_data">
             NO (자동 증가)
            ID (session)
            FNO  =
            DAY  =
            TIME =
            INWON =
            REGDATE (SYSDATE) 
            OK = 0
	   */
	  try
	  {
		  request.setCharacterEncoding("UTF-8");
	  }catch(Exception ex) {}
	  String fno=request.getParameter("fno");
	  String day=request.getParameter("day");
	  String time=request.getParameter("time");
	  String inwon=request.getParameter("inwon");
	  HttpSession session=request.getSession();
	  String id=(String)session.getAttribute("id");
	  
	  ReserveVO vo=new ReserveVO();
	  vo.setFno(Integer.parseInt(fno));
	  vo.setId(id);
	  vo.setDay(day);
	  vo.setTime(time);
	  vo.setInwon(inwon);
	  //DAO => insert 요청 
	  ReserveDAO.reserveInsert(vo);
	  return "redirect:../main/mypage.do";
  }
  @RequestMapping("reserve/adminok.do")
  public String reserve_admin_ok(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String no=request.getParameter("no");
	  //DAO연결 
	  ReserveDAO.reserveAdminOk(Integer.parseInt(no));
	  return "redirect:../main/adminpage.do";
  }
  
}








