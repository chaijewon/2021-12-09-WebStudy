package com.sist.model;

import javax.servlet.http.HttpServletRequest;

import com.sist.controller.RequestMapping;

public class FoodModel {
  @RequestMapping("food/list.do")
  public String food_main(HttpServletRequest request)
  {
	  request.setAttribute("main_jsp", "../food/list.jsp");
	  return "../main/main.jsp";
  }
}
