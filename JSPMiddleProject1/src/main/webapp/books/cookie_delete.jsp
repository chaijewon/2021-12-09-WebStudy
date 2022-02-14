<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 쿠키를 가지고 온다 
    Cookie[] cookies=request.getCookies(); // session도 request를 이용해서 생성 
    if(cookies!=null)
    {
    	for(int i=0;i<cookies.length;i++)
    	{
    		if(cookies[i].getName().startsWith("m"))
    		{
	    		cookies[i].setMaxAge(0);// 삭제 
	    		response.addCookie(cookies[i]);
    		}
    	}
    }
    // 이동 
    response.sendRedirect("list.jsp");
%>