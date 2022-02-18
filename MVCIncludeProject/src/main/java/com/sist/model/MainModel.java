package com.sist.model;

import javax.servlet.http.HttpServletRequest;

import com.sist.controller.RequestMapping;

public class MainModel {
  // 메소드 찾기 
  @RequestMapping("main/main.do")
  public String main_main(HttpServletRequest request)
  {
	  // include할 파일을 전송 
	  request.setAttribute("main_jsp", "../main/home.jsp");
	  return "../main/main.jsp";
  }
}
