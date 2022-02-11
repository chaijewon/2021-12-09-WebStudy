<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // request에 있는 값을 공유 : include , forward , session , cookie 
    /*
         include / forward 
         ==> pageContext : include() , forward() 
         ==> 사용빈도가 많다 => 태그형으로 제작 
             <jsp:include page=""> => pageContext.include()
             <jsp:forward page=""> => pageContext.forward()
    */
    // 요청 데이터 받기 
    String id=request.getParameter("id");
    String mode=request.getParameter("mode");
    if(Integer.parseInt(mode)==1)
    {
    	response.sendRedirect("output.jsp"); // request가 초기화 
    	// request는 URL에 있는 파일명이 가지고 있다 
    }
    else
    {
%>
        <jsp:forward page="output.jsp"/><%-- request가 유지(URL주소 변경이 없다 --%>
<%
    }
%>