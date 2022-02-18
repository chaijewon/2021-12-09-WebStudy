package com.sist.model;

import javax.servlet.http.HttpServletRequest;

import com.sist.controller.RequestMapping;
// 브라우저 (주소) ==> jsp(X) ==> Controller ===> Model ===> Controller ==JSP
// Controller => url-pattern => *.do  , / , /Controller?값
public class MainModel {
  @RequestMapping("main/main.do")
  public String mainPage(HttpServletRequest request)
  {
	  request.setAttribute("msg", "메인페이지");
	  return "../main/main.jsp";
  }
}
