package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;

public class FoodModel {
	  @RequestMapping("main/food.do")
	  public String main_main(HttpServletRequest request,
			       HttpServletResponse response)
	  {
		  request.setAttribute("msg", "Food Page");
		  return "../main/food.jsp";
	  }
}
