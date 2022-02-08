<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 1. 전송된 데이터를 받는다 
    // 보내는 JSP / 받는 JSP
    // form (action), a (href) , javascript(location.href="")
    // 2. 한글 포함여부 확인
    request.setCharacterEncoding("UTF-8"); // encoding(byte[])=>decoding
    // 3. 보낸 데이터를 받는다 
    String name=request.getParameter("name");
    String sex=request.getParameter("sex");
    String loc=request.getParameter("loc");
    String content=request.getParameter("content");
    String[] hobby=request.getParameterValues("hobby");
    // 4. 출력 / 오라클 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h1>요청한 값 출력</h1>
 ***접속자의 IP:<%= request.getRemoteAddr() %><br>
 서버 주소:<%= request.getServerName() %><br>
 서버 PORT:<%=request.getServerPort() %><br>
 접속자가 보낸 메소드방식 :<%= request.getMethod() %><br>
 ***요청 URL:<%= request.getRequestURL() %><br>
 ***요청 URI:<%= request.getRequestURI() %><br>
 ***URL주소의 루트:<%= request.getContextPath() %><br>
 이름:<%= name %><br>
 성별:<%= sex %><br>
 지역:<%= loc %><br>
 소개:<%= content %><br>
 취미:<%-- checkbox로 전송시에는 반드시 오류처리 --%>
 <%
    try
    {
  %>
        <ul>
         <%
            for(String h:hobby)
            {
         %>
               <li><%= h %></li>
         <%
            }
         %>
        </ul>     
  <%
    }catch(Exception ex)
    {
  %>
       <span style="color:red">취미가 없습니다</span> 
  <%
    }
  %>
</body>
</html>









