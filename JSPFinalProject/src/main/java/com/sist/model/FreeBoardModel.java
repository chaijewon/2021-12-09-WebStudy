package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.board.dao.*;
import com.sist.controller.RequestMapping;
public class FreeBoardModel {
  @RequestMapping("freeboard/list.do")
  public String freeboard_list(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String page=request.getParameter("page");
	  if(page==null)
		  page="1";
	  int curpage=Integer.parseInt(page);
	  // 목록 읽기 
	  int rowSize=10;
	  int start=(rowSize*curpage)-(rowSize-1);
	  int end=rowSize*curpage;
	  
	  Map map=new HashMap();
	  map.put("start", start);
	  map.put("end", end);
	  // WHERE num BETWEEN #{start} AND #{end}
	  List<BoardVO> list=BoardDAO.boardListData(map);
	  int totalpage=BoardDAO.boardTotalPage();
	  
	  //JSP에서 출력에 필요한 데이터 전송 => setAttribute()
	  request.setAttribute("curpage", curpage);
	  request.setAttribute("totalpage", totalpage);
	  request.setAttribute("list", list);
	  request.setAttribute("main_jsp", "../freeboard/list.jsp");
	  return "../main/main.jsp";
  }
  @RequestMapping("freeboard/insert.do")
  public String freeboard_insert(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  request.setAttribute("main_jsp", "../freeboard/insert.jsp");
	  return "../main/main.jsp";
  }
  @RequestMapping("freeboard/insert_ok.do")
  public String freeboard_insert_ok(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  // 1. 사용자 입력값 받기 
	  try
	  {
		  request.setCharacterEncoding("UTF-8");
	  }catch(Exception ex) {}
	  String name=request.getParameter("name");// insert.do?name=""
	  String subject=request.getParameter("subject");//<input type=text name=subject>
	  String content=request.getParameter("content");
	  String pwd=request.getParameter("pwd");
	  
	  BoardVO vo=new BoardVO();
	  vo.setName(name);
	  vo.setSubject(subject);
	  vo.setContent(content);
	  vo.setPwd(pwd);
	  
	  // DAO호출 : 오라클 연결 => 처리 
	  BoardDAO.boardInsert(vo);
	  // Model : JSP연결 
	  // JSP : 브라우저 출력 
	  /*
	   *   JSP  =======>    Model  =======>  DAO  ======> Model  =====> JSP
	   *   요청  request전송  request를 받는다  요청처리        요청 결과  request
	   *                                                  request에 값을 담는다
	   *                                                  setAttribute()
	   *                    매개변수이용       오라클에 데이터 읽기
	   *   Spring => Model만 달라진다 (나머지는 동일)
	   *             ------ 상당히 편리 
	   *             public String freeboard_insert_ok(BoardVO vo)
	   *             JSTL/EL 
	   *             MyBatis (동적 쿼리)
	   *             == XML
	   *             == Annotataion (O) 
	   *             == RestFul
	   */
	  
	  return "redirect:../freeboard/list.do";//재전송 (sendRedirect())
  }
  // 상세보기 
  @RequestMapping("freeboard/detail.do")
  public String freeboard_detail(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  // 조회수 (UPDATE) , 실제 상세볼 내용(SELECT) => MyBatis는 단점 => 태그한개에 한개의 SQL만 사용한다  
	  request.setAttribute("main_jsp", "../freeboard/detail.jsp");
	  return "../main/main.jsp";
  }
}







