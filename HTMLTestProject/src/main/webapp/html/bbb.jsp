<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String[] hobby=request.getParameterValues("hobby");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <ul>
  <%
      for(int i=0;i<hobby.length;i++)
      {
  %>
         <li><%=hobby[i] %></li>
  <%
      }
  %>
  </ul>
</body>
</html>