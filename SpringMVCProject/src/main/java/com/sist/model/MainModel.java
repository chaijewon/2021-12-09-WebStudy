package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;

public class MainModel {
  @RequestMapping("main/main.do")
  public String main_main(HttpServletRequest request,
		       HttpServletResponse response)
  {
	  request.setAttribute("msg", "Main Page");
	  return "../main/main.jsp";
  }
}
