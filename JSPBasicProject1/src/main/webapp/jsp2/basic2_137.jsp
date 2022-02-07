<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   // for-each로 출력할 데이터 생성 
   String[] names={"홍길동","심청이","춘향이","박문수","이순신","강감찬",
		           "을지문덕"};
   String[] sexs={"남자","여자","여자","남자","남자","남자","남자"};
   // 출력만 요청시에 for-each => 형식) for(받는데이터형 변수: 배열)
   //                                   실제 배열에 저장된 데이터를 받는다
   // 홍길동(남자)
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>이름 리스트</h1>
  <ul>
    <%
       for(String name:names)
       {
    %>
           <li><%=name %></li>
    <%
       }
    %>
  </ul>
  <h1>이름 - 성별 리스트</h1>
  <ul>
   <%
      for(int i=0;i<names.length;i++)
      {
   %>
         <li><%=names[i] %>(<%=sexs[i]%>)</li>
   <%
      }
   %>
   </ul>
   <h1>이름 - 성별 리스트</h1>
  <ul>
   <%
      int i=0;
      for(String name:names)
      {
   %>
         <li><%=name %>(<%=sexs[i]%>)</li>
   <%
         i++;
      }
   %>
  </ul>

</body>
</html>