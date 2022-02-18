package com.sist.model;

import javax.servlet.http.HttpServletRequest;

import com.sist.controller.RequestMapping;

// emp
public class MusicModel {
  @RequestMapping("music/list.do")
  public String music_main(HttpServletRequest request)
  {
	  //DAO연결
	  request.setAttribute("main_jsp", "../music/list.jsp");
	  return "../main/main.jsp";
  }
}
