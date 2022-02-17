<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<jsp:useBean id="model" class="com.sist.model.DataBoardModel"/>
<%
    // 분리 
    // JSP ============> View(HTML/CSS)
    // Model(자바) =====> 요청처리 (결과값만 넘겨준다)
    // JSP안에서 Model의 메소드 호출되는 부분이 제거 ==> 완전 분리(MVC)
    // JSP에서 기술면접 : Seeeion VS Cookie , GET VS POST , MVC구조
    model.databoardReplyOk(request, response);
    
%>
