<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
   //1. 사용자가 보내준 값을 받는다 (게시물번호 , 비밀번호)
   String no=request.getParameter("no");
   String pwd=request.getParameter("pwd");
   //2. 오라클로 전송 (BoardDAO)
   BoardDAO dao=new BoardDAO();
   //3. 결과값 처리 
   boolean bCheck=dao.boardDelete(Integer.parseInt(no), pwd);
   //4. 결과값에 따라서 보여줄 JSP를 선택 response.sendRedirect(), javascript
   // jsp => 두개 있다 (1. 비밀번호가 틀릴 경우:delete.jsp , 2. 비밀번호가 맞는 경우:list.jsp)
   if(bCheck==true)
   {
	   // 삭제가 된 상태 => list.jsp
	   response.sendRedirect("list.jsp");
   }
   else
   {
	  // 삭제가 안된 상태 => 이전화면으로 이동 
%>
      <script>
       alert("비밀번호가 틀립니다!!");
       history.back();
      </script>
<%
   }
%>
