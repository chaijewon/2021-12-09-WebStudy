package com.sist.model;

import com.sist.controller.RequestMapping;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.*;
import com.sist.vo.*;
public class FoodModel {
  @RequestMapping("food/category_list.do")
  public String food_category_list(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  // ../food/category_list.do?cno=10
	  String cno=request.getParameter("cno");
	  // 출력할 데이터 => DAO
	  FoodDAO dao=new FoodDAO();
	  // 카테고리별 맛집 리스트
	  List<FoodVO> list=dao.categoryFoodListData(Integer.parseInt(cno));
	  // 카테고리 정보 
	  CategoryVO vo=dao.categoryInfoData(Integer.parseInt(cno));
	  // 화면에 출력할 데이터 전송 
	  request.setAttribute("list", list);
	  request.setAttribute("vo", vo);
	  // category_list.jsp에 출력할 데이터 
	  request.setAttribute("main_jsp", "../food/category_list.jsp");
	  // main_jsp => main.jsp에서 include
	  return "../main/main.jsp";
  }
  @RequestMapping("food/food_detail_before.do")
  public String food_detail_before(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  // 화면 include가 없다 => detail로 화면을 변경 => sendRedirect
	  // 쿠키만 저장 => 사용자에게 쿠키 전송
	  String no=request.getParameter("no");
	  // 1. 쿠키생성 
	  Cookie cookie=new Cookie("f"+no, no);
	  // 2. 저장 기간 설정 
	  cookie.setMaxAge(60*60*24); // 24시간 => 초단위로 저장 
	  // 3. 클라이언트 브라우저로 전송 
	  response.addCookie(cookie);
	  // sendRedirect ==> 링크없이 바로 화면이동 
	  return "redirect:../food/food_detail.do?no="+no;
	  		
  }
  @RequestMapping("food/food_detail.do")
  // DispatcherServlet ==> invoke(obj,request,response) => Cookie
  public String food_detail(HttpServletRequest request, 
		    HttpServletResponse response)
  {
	  // 화면 변경 ==> main_jsp 
	  //1.  사용자가 보내준 데이터 출력 
	  String no=request.getParameter("no");
	  //2. 처리 => 오라클 => 데이터 얻기 ==> View(JSP)로 전송 => request에 있는 내용 출력 
	  FoodDAO dao=new FoodDAO();
	  FoodVO vo=dao.foodDetailData(Integer.parseInt(no));
	  String address=vo.getAddress();
	  String addr1=address.substring(0,address.lastIndexOf("지"));
	  vo.setAddr1(addr1.trim());
	  String addr2=address.substring(address.lastIndexOf("지"));
	  vo.setAddr2(addr2);
	  // food_detail.jsp로 vo를 전송 
	  request.setAttribute("vo", vo);
	  // 댓글 (X)
	  //3. 자바/JSP분리해서 사용 = 확장성 , 재사용이 편리하다 
	  request.setAttribute("main_jsp", "../food/food_detail.jsp");
	  return "../main/main.jsp";
  }
  
  
}








