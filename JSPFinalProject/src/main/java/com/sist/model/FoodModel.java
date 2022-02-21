package com.sist.model;

import com.sist.controller.RequestMapping;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.*;
import com.sist.vo.*;
public class FoodModel {
  @RequestMapping("food/category_list.do")
  public String food_category_list(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  // 출력할 데이터 => DAO
	  request.setAttribute("main_jsp", "../food/category_list.jsp");
	  return "../main/main.jsp";
  }
}
