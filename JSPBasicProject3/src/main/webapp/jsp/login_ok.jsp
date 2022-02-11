<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    //login_ok.jsp?id=admin&pwd=1234
    //login_ok.jsp? id = admin & pwd = 1234 
    String id=request.getParameter("id");
    String pwd=request.getParameter("pwd"); //웹 (데이터형이 없다 , 무조건 문자열)
    System.out.println("login_ok:id="+id);
    System.out.println("login_ok:pwd="+pwd);
    /*
       System.out.println("login_ok:id="+id); => 도스창에 출력
       out.println("login_ok:id="+id); => 브라우저에 출력 
    */
    // 파일 이동 
    response.sendRedirect("main.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>