<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 쿠키 저장 --%>
<%
    // 쿠키는 클라이언트에 저장 / 세션은 서버에 저장 
    // 단점 : 문자열만 저장이 가능 , 세션은 Object로 저장 
    // 쿠키 => 최신 본 책, 자동 로그인 
    //1. 쿠키 생성 Coolie cookie=new Cookie(쿠키명,값);
    //1-1. 저장기간 setMaxAge(60*60*24)  => setMaxAge(0)
    //2. response를 이용해서 전송 => 서버에서 클라이언트로 전송 
    //  addCookie()
    //3. detail화면으로 이동 sendRedirect() 
%>