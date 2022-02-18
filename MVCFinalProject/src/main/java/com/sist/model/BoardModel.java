package com.sist.model;

import javax.servlet.http.HttpServletRequest;

import com.sist.controller.RequestMapping;

public class BoardModel {
   @RequestMapping("board/list.do")
   public String boardList(HttpServletRequest request)
   {
	   request.setAttribute("msg", "게시판 목록");
	   return "../board/list.jsp";
   }
   @RequestMapping("board/detail.do")
   public String boardDetail(HttpServletRequest request)
   {
	   request.setAttribute("msg", "상세보기");
	   return "../board/detail.jsp";
   }
}
