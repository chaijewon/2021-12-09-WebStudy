<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%-- 
       GET => URL뒤에 데이터 첨부해서 전송 
              HTML : <a>:GET,<form>:GET,POST
              JavaScript : location.href="파일" => GET
              Java : sendRedirect() => GET
       login_ok.jsp?id=admin&pwd=1234
       ------------ id,pwd로 보낸다 (login_ok.jsp에서 값을 받는다)
       <form> => action에 등록된 파일
       JSP : _jspService()안에 들어가는 코딩
       JSP ==> Java변경 
       
       a.jsp ==> a_jsp.java (톰캣에 의해서 변경)
       public class a_jsp extends HttpServlet
       {
          -----------------------
            <%! %> : 메소드 , 멤버변수 
          -----------------------
          public void _jspInit()
          {
             => web.xml : 등록된 내용을 읽어 온다 
          }
          public void _jspDestory()
          {
             => gc()에 의해서 메모리 즉시 해제
                파일 이동 / 새로고침 
          }
          public void _jspService()
          {
             <% %>
             <%= %>
             HTML ==> out.write가 생략이되어 있다 => 출력 out.write에 있는 내용만 출력
             out.write("<html>");
          }
       } 
              
   --%>
  <a href="login_ok.jsp?id=admin&pwd=1234">로그인</a>
</body>
</html>





