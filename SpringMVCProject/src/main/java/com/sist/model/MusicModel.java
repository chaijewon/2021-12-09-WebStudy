package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;

public class MusicModel {
	  @RequestMapping("main/music.do")
	  public String main_music(HttpServletRequest request,
			       HttpServletResponse response)
	  {
		  request.setAttribute("msg", "Music Page");
		  return "../main/music.jsp";
	  }
}
