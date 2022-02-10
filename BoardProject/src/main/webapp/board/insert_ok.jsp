<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
    // 화면 출력 부분이 아니라 => 사용자 요청 처리
    // 처리 (글쓰기)
    // 1. 한글 처리
    request.setCharacterEncoding("UTF-8");
    // 2. 사용자가 보내준 데이터를 받는다 
    String name=request.getParameter("name");
    // 사용자가 보내준 모든 데이터는 request에 담아서 전송(톰캣)
    // => php , asp , aspx , nodejs , dango , jsp (request,response)
    String subject=request.getParameter("subject");
    String content=request.getParameter("content");
    String pwd=request.getParameter("pwd");
    
    // 입력받은 데이터를 묶어서 => 오라클로 전송 => insert
    BoardVO vo=new BoardVO();
    vo.setName(name);
    vo.setSubject(subject);
    vo.setContent(content);
    vo.setPwd(pwd);
    
    BoardDAO dao=new BoardDAO();
    // => insert하는 메소드 호출 
    dao.boardInsert(vo);
    // 처리된 내용을 보여준다 => 목록으로 이동 
    response.sendRedirect("list.jsp");
%>
