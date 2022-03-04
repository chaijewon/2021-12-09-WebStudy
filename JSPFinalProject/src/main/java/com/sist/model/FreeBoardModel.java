package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.board.dao.*;
import com.sist.controller.RequestMapping;
import com.sist.dao.ReplyDAO;
import com.sist.vo.ReplyVO;
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
  /*
   *   Spring MVC (JSP/DAO) => Model , MVC
   *   1. JSP에서 요청값을 보낸다
   *      ../freeboard/detail.do?no=1
   *      <a href="요청정보 보내기">
   *      자바스크립트 : Ajax , location.href=""
   *      <form action="">
   *      ------------------------ 화면 변경 요청 
   *   2. 요청데이터를 받아서 요청처리 
   *      --------------------- Model(메소드 매개변수)
   *      String no=request.getParameter("no");
   *      = 요청처리 => DAO
   *      BoardVO vo=BoardDAO.boardDetailData(Integer.parseInt(no));
   *      = 결과값을 JSP로 전송 
   *      request.setAttribute("vo", vo);
   *   3. 어떤 JSP에서 출력 (결과값)
   *      request.setAttribute("main_jsp", "../freeboard/detail.jsp");
   *   
   *   *** 예외 사항 : 폼만 보여라 
   *       (글쓰기,회원가입폼)
   */
  @RequestMapping("freeboard/detail.do")
  public String freeboard_detail(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  // ../freeboard/detail.do?no=
	  String no=request.getParameter("no");
	  // 조회수 (UPDATE) , 실제 상세볼 내용(SELECT) => MyBatis는 단점 => 태그한개에 한개의 SQL만 사용한다  
	  BoardVO vo=BoardDAO.boardDetailData(Integer.parseInt(no));
	  
	  request.setAttribute("vo", vo);
	  request.setAttribute("main_jsp", "../freeboard/detail.jsp");
	  
	  ReplyDAO rDao=new ReplyDAO();
	  List<ReplyVO> list=rDao.replyListData(Integer.parseInt(no), 5);
	  request.setAttribute("rList",list);
	  return "../main/main.jsp";
  }
  
  //수정 (수정 내용을 보여라)
  @RequestMapping("freeboard/update.do")
  public String freeboard_update(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  // 이전에 입력된 데이터를 출력 요청 
	  // ../freeboard/update.do?no=${vo.no }
	  String no=request.getParameter("no");
	  BoardVO vo=BoardDAO.boardUpdateData(Integer.parseInt(no));
	  
	  request.setAttribute("vo", vo);
	  request.setAttribute("main_jsp", "../freeboard/update.jsp");
	  return "../main/main.jsp";
  }
  // 실제로 수정을 요청 
  @RequestMapping("freeboard/update_ok.do")
  public String freeboard_update_ok(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  // 사용자가 보내준 데이터를 받는다 
	  try
	  {
		  request.setCharacterEncoding("UTF-8");
	  }catch(Exception ex) {}
	  String no=request.getParameter("no");
	  String name=request.getParameter("name");
	  String subject=request.getParameter("subject");
	  String content=request.getParameter("content");
	  String pwd=request.getParameter("pwd");
	  // 5개 데이터를 묶어서 한번에 DAO에 전송 
	  BoardVO vo=new BoardVO();
	  vo.setName(name);
	  vo.setSubject(subject);
	  vo.setContent(content);
	  vo.setPwd(pwd);
	  vo.setNo(Integer.parseInt(no));
	  
	  boolean bCheck=BoardDAO.boardUpdate(vo);
	  
	  request.setAttribute("bCheck", bCheck);// false(javascript:history.back),true(sendRedirect)
	  // 자바 => 자바스크립트 연동 (RestFul)
	  request.setAttribute("no", no);
	  return "../freeboard/update_ok.jsp";
  }
  //삭제 
  @RequestMapping("freeboard/delete.do")
  public String freeboard_delete(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  //1. 사용자 보내준 데이터 받기 
	  String no=request.getParameter("no");
	  String pwd=request.getParameter("pwd");
	  //2. DAO연결 
	  boolean bCheck=BoardDAO.boardDelete(Integer.parseInt(no), pwd);
	  String temp="";
	  if(bCheck==true)
	  {
		  temp="yes";
	  }
	  else
	  {
		  temp="no";
	  }
	  request.setAttribute("result", temp);
	  return "../freeboard/delete.jsp";
  }
}







