<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
   application : ServletContext
   => 외부 환경 설정 읽기 => web.xml
       ***getInitPrameter()
   => log 파일 => 서버에서 확인
       log() 
   => 서버에 대한 정보 => 서버이름 , 서버버전 
      getServerInfo()
      getMinorVersion() , getMajorVersion()
      
   => 자원에 대한 정보 => 파일 , 이미지 , 기타 
                      실제 저장위치 확인 
      ***getRealPath() => 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%
     String driver=application.getInitParameter("driver");
     String url=application.getInitParameter("url");
     String user=application.getInitParameter("username");
     String password=application.getInitParameter("password");
     out.println("<h1>driver:"+driver+"</h1>");
     out.println("<h1>url:"+url+"</h1>");
     out.println("<h1>username:"+user+"</h1>");
     out.println("<h1>password:"+password+"</h1>");
     application.log("driver:"+driver);
     application.log("url:"+url);
     application.log("username:"+user);
     application.log("password:"+password);
  %>
  <h1>서버이름:<%=application.getServerInfo() %></h1>
  <h1>버전:<%=application.getMajorVersion() %>.<%=application.getMinorVersion() %></h1>
  <h1>****실제 저장 경로:<%=application.getRealPath("/") %></h1>
</body>
</html>






