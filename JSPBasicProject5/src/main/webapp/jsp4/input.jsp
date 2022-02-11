<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%--
      insert.jsp ==> insert_ok.jsp ==> list.jsp
      login.jsp  ==> login_ok.jsp  ==> main.jsp
      입력폼            오라클 연동        결과 확인 
      
      ==> 두가지를 동시에 처리 할 수 없다 
          오라클 연동과 동시에 입력이 불가능
          => 자바를 먼저 실행하고 나중에 입력폼을 화면에 보여준다  
          => 회원가입 => 오라클에 insert를 먼저하고 나중에 입력폼을 보여준다 
          => 폼 => 자바를 이용해서 오라클에 추가 => 화면 이동 (3개)
          => 화면 출력용 / 요청 처리용 (_ok)
          
      ==> request가 필요없는 경우 : sendRedirect()
      ==> request가 필요한 경우 : forward()
          <jsp:forward page="파일명">
          *** 차이점 
              request를 공유 ,  URL주소가 변경 (sendRedirect)
                              URL주소가 변경되지 않는 경우 (forward)
 --%>
<body>
  <a href="forward.jsp?id=admin&mode=1">sendRedirect</a><br>
  <a href="forward.jsp?id=admin&mode=2">forward</a>
</body>
</html>