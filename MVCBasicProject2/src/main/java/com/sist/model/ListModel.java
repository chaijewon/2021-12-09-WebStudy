package com.sist.model;

import javax.servlet.http.HttpServletRequest;

public class ListModel implements Model{
  public String handlerRequest(HttpServletRequest request)
  {
	  request.setAttribute("msg", "자유게시판");
	  return "list.jsp";
  }
}
