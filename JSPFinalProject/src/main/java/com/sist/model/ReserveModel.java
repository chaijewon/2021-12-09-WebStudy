package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;

public class ReserveModel {
  @RequestMapping("reserve/reserve.do")
  public String reserve_page(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  request.setAttribute("main_jsp", "../reserve/reserve.jsp");
	  return "../main/main.jsp";
  }
}
