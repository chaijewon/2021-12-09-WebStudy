package com.sist.model;

import javax.servlet.http.HttpServletRequest;

import com.sist.controller.RequestMapping;
// 구분자 => PRIMARY (중복하면 안된다)
/*
 *  스프링 => 어노테이션 (암기) => 200 => XML (태그와 속성 암기)
 *  마이바티스 => 어노테이션 (암기) 70 => XML (태그와 속성 암기)
 *  React , Vue => 암기 , ajax => 암기 
 */
public class MemberModel {
  @RequestMapping("member/join.do")
  public String memberJoin(HttpServletRequest request)
  {
	  request.setAttribute("msg", "회원가입");
	  return "../member/join.jsp";
  }
}
