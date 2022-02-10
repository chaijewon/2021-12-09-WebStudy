<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%--
     JSP : 요청 / 요청처리 => 동시에 처리가 어렵다 (거의 대부분 : 요청 / 요청처리)
--%>
<%
    //1. 요청 데이터를 받는다 (한글여부?)
    request.setCharacterEncoding("UTF-8"); //412
    String no=request.getParameter("no");
    String name=request.getParameter("name");
    String subject=request.getParameter("subject");
    String content=request.getParameter("content");
    String pwd=request.getParameter("pwd");
    // 오라클로 전송 => UPDATE를 실행할 수 있게 만든다 => DAO
    BoardVO vo=new BoardVO();
    vo.setNo(Integer.parseInt(no));
    vo.setName(name);
    vo.setSubject(subject);
    vo.setContent(content);
    vo.setPwd(pwd);
    
    BoardDAO dao=new BoardDAO();
    boolean bCheck=dao.boardUpdate(vo);
    // DAO => 수정여부 확인 (비밀번호(O):detail.jsp , 비밀번호(X):history.back())
    if(bCheck==true)
    {
    	response.sendRedirect("detail.jsp?no="+no);
    }
    else
    {
%>
       <script>
       alert("비밀번호가 틀립니다!!");
       history.back();// 이전 페이지로 이동 
       </script>
<%
    }
%>





