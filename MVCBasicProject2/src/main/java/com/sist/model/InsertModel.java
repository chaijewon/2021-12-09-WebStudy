package com.sist.model;

import javax.servlet.http.HttpServletRequest;

public class InsertModel implements Model{
	  public String handlerRequest(HttpServletRequest request)
	  {
		  request.setAttribute("msg", "게시판 글쓰기");
		  return "insert.jsp";
	  }
}
