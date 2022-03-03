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
import com.sist.vo.MemberVO;
public class MemberModel {
   @RequestMapping("member/login.do")
   public String memberLogin(HttpServletRequest request,HttpServletResponse
		   response)
   {
	   String id=request.getParameter("id");
	   String pwd=request.getParameter("pwd");
	   MemberDAO dao=new MemberDAO();
	   MemberVO vo=dao.isLogin(id, pwd);
	   request.setAttribute("result", vo.getMsg());//id,pwd,ok
	   if(vo.getMsg().equals("OK"))
	   {
		   HttpSession session=request.getSession();
		   
		   session.setAttribute("id", id);
		   session.setAttribute("name", vo.getName());
		   session.setAttribute("admin", vo.getAdmin());
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
   @RequestMapping("member/join.do")
   public String memberJoin(HttpServletRequest request,HttpServletResponse response)
   {
	   request.setAttribute("main_jsp", "../member/join.jsp");
	   return "../main/main.jsp";
   }
   // ajax => include(X) => 단독 실행 
   @RequestMapping("member/idcheck.do")
   public String memberIdCheck(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   return "../member/idcheck.jsp";
   }
   @RequestMapping("member/idcheck_result.do")
   public String memberIdCheckResult(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   //1. ajax에서 넘어온 데이털,ㄹ 받는다 
	   String id=request.getParameter("id");
	   //2. 오라클 연동 
	   MemberDAO dao=new MemberDAO();
	   int count=dao.memberIdcheck(id);
	   //3. 결과값을 JSP로 전송 => 스프링의 80% 정리 
	   request.setAttribute("count", count);
	   return "../member/idcheck_result.jsp";// request를 받는 JSP
   }
   // 회원 가입 처리 ==> 요청 처리 => 화면 이동 
   @RequestMapping("member/join_ok.do")
   public String memberJoinOk(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   try
	   {
		   request.setCharacterEncoding("UTF-8");
	   }catch(Exception ex){}
	   // 입력값 받기 
	   String id=request.getParameter("id");
	   String pwd=request.getParameter("pwd");
	   String name=request.getParameter("name");
	   String sex=request.getParameter("sex");
	   String birthday=request.getParameter("birthday");
	   String email=request.getParameter("email");
	   String post=request.getParameter("post");
	   String addr1=request.getParameter("addr1");
	   String addr2=request.getParameter("addr2");
	   String tel1=request.getParameter("tel1");
	   String tel2=request.getParameter("tel2");
	   String content=request.getParameter("content");
	   // MemberDAO로 전송 ==> 오라클 Insert
	   MemberVO vo=new MemberVO();
	   vo.setId(id);
	   vo.setPost(post);
	   vo.setPwd(pwd);
	   vo.setName(name);
	   vo.setSex(sex);
	   vo.setBirthday(birthday);
	   vo.setEmail(email);
	   vo.setAddr1(addr1);
	   vo.setAddr2(addr2);
	   vo.setContent(content);
	   vo.setTel(tel1+"-"+tel2);
	   MemberDAO dao=new MemberDAO();
	   //메소드 (INSERT)
	   dao.memberJoin(vo);
	   return "redirect:../main/main.do";
   }
   /*
    *   어노테이션 : 구분자 => if문과 동일 (중복 허용하지 않는다)
    *                                -------- 폴더(파일은 중복이 없다)
    *   => 항상 찾는 대상 위에(옆에) 있다 (두개이상이 있는 경우도 있다)
    *   => 스프링 (Model) => 모든 클래스에 등록을 해야 된다 
    *      ------------- 클래스 관리자 
    */
   @RequestMapping("member/idfind.do")
   public String memberIdFind(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   request.setAttribute("main_jsp", "../member/idfind.jsp");
	   return "../main/main.jsp";
   }
   @RequestMapping("member/idfind_result.do")
   public String memberIdFindResult(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   // Ajax는 단독 실행 => 실행결과를 읽어 간다 
	   //1.전화번호 받기 
	   String tel=request.getParameter("tel");
	   tel=tel.replaceAll("[^0-9]", "");//[^0-9] => 숫자를 제외 
	   // ^[0-9] => 숫자로 시작 
	   // DAO로 전송 => 01011111111 01011111111
	   MemberDAO dao=new MemberDAO();
	   String result=dao.idfind_tel(tel);
	   request.setAttribute("result", result);// no , h***
	   return "../member/idfind_result.jsp";
   }
   @RequestMapping("member/email_result.do")
   public String memberEmailResult(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String email=request.getParameter("email");
	   // DataBase연동
	   MemberDAO dao=new MemberDAO();
	   String result=dao.idfind_email(email);
	   request.setAttribute("result", result);
	   return "../member/idfind_result.jsp";
   }
   @RequestMapping("member/join_update.do")
   public String joinUpdate(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   // 정보를 출력해 준다
	   HttpSession session=request.getSession();
	   // id,name가 저장 
	   String id=(String)session.getAttribute("id");
	   // DAO연동 => id에 해당되는 데이터를 읽어 온다 
	   MemberDAO dao=new MemberDAO();
	   MemberVO vo=dao.memberUpdateData(id);
	   
	   request.setAttribute("vo", vo); //DTO 
	   // vo=> JSP에서 출력에 필요한 데이터를 전송하는 목적으로 모아서 처리 
	   request.setAttribute("main_jsp", "../member/join_update.jsp");
	   return "../main/main.jsp";
   }
   // 실제 수정 
   @RequestMapping("member/join_update_ok.do")
   public String memberJoinUpdateOk(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   try
	   {
		   request.setCharacterEncoding("UTF-8");
	   }catch(Exception ex){}
	   // 입력값 받기 
	   String id=request.getParameter("id");
	   String pwd=request.getParameter("pwd");
	   String name=request.getParameter("name");
	   String sex=request.getParameter("sex");
	   String birthday=request.getParameter("birthday");
	   String email=request.getParameter("email");
	   String post=request.getParameter("post");
	   String addr1=request.getParameter("addr1");
	   String addr2=request.getParameter("addr2");
	   String tel1=request.getParameter("tel1");
	   String tel2=request.getParameter("tel2");
	   String content=request.getParameter("content");
	   // MemberDAO로 전송 ==> 오라클 Insert
	   MemberVO vo=new MemberVO();
	   vo.setId(id);
	   vo.setPost(post);
	   vo.setPwd(pwd);
	   vo.setName(name);
	   vo.setSex(sex);
	   vo.setBirthday(birthday);
	   vo.setEmail(email);
	   vo.setAddr1(addr1);
	   vo.setAddr2(addr2);
	   vo.setContent(content);
	   vo.setTel(tel1+"-"+tel2);
	   MemberDAO dao=new MemberDAO();
	   boolean bCheck=dao.memberUpdateOk(vo);
	   if(bCheck==true)
	   {
		   HttpSession session=request.getSession();
		   session.setAttribute("name", name);
	   }
	   request.setAttribute("bCheck", bCheck);
	   return "../member/join_update_ok.jsp";
   }
   @RequestMapping("member/join_delete.do")
   public String memberjoinDelete(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   
	   request.setAttribute("main_jsp", "../member/join_delete.jsp");
	   return "../main/main.jsp";
   }
   
   @RequestMapping("member/join_delete_ok.do")
   public String memberJoinDeleteOk(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String pwd=request.getParameter("pwd");
	   HttpSession session=request.getSession(); // id,name,admin
	   String id=(String)session.getAttribute("id");
	   MemberDAO dao=new MemberDAO();
	   // 결과값 
	   String result=dao.memberJoinDelete(pwd, id);
	   if(result.equals("yes"))
	   {
		   session.invalidate(); // 세션 해제 
	   }
	   request.setAttribute("result", result);
	   return "../member/join_delete_ok.jsp";//ajax => _ok
   }
}















