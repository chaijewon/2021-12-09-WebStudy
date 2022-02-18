package com.sist.model;

import javax.servlet.http.HttpServletRequest;

public class ListModel {
  public void handlerRequest(HttpServletRequest request)
  {
	  request.setAttribute("msg", "자유게시판");
  }
}
