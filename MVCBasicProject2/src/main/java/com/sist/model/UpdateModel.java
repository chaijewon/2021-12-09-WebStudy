package com.sist.model;

import javax.servlet.http.HttpServletRequest;

public class UpdateModel implements Model{
	  public String handlerRequest(HttpServletRequest request)
	  {
		  request.setAttribute("msg", "게시판 수정");
		  return "update.jsp";
	  }
}
