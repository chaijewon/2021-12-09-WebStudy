package com.sist.model;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
/*
 *    로그인 
 *    회원가입 
 *      = 가입
 *      = 아이디 중복체크
 *      = 우편번호 검색 
 *    회원수정 
 *      = 수정
 *      = 우편번호 검색 
 *    회원탈퇴 
 *    아이디 찾기 / 비밀번호 찾기 
 */
import com.sist.dao.*;
public class MemberModel {
   @RequestMapping("member/login.do")
   public String memberLogin(HttpServletRequest request,HttpServletResponse
		   response)
   {
	   String id=request.getParameter("id");
	   String pwd=request.getParameter("pwd");
	   MemberDAO dao=new MemberDAO();
	   String result=dao.isLogin(id, pwd);
	   request.setAttribute("result", result);//id,pwd,ok
	   if(!(result.equals("NOID")||result.equals("NOPWD")))
	   {
		   HttpSession session=request.getSession();
		   StringTokenizer st=new StringTokenizer(result,"|");
		   session.setAttribute("id", id);
		   session.setAttribute("name", st.nextToken());
		   session.setAttribute("admin", Integer.parseInt(st.nextToken()));
	   }
	   return "../member/login.jsp";
   }
   @RequestMapping("member/logout.do")
   public String memberLogout(HttpServletRequest request,HttpServletResponse
		   response)
   {
	   HttpSession session=request.getSession();
	   session.invalidate(); //session해제
	   return "redirect:../main/main.do";
   }
}















