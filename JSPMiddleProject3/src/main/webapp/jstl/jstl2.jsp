<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>Java를 이용한 반복문(1~10까지 출력)</h1>
  <%
      for(int i=1;i<=10;i++)
      {
  %>
         <%=i %>&nbsp;
  <%
      }
  %>
  <h1>JSTL를 이용한 반복문(1~10까지 출력)</h1>
  <%--
       단점 : end="10"  i<=10
             step="1"  생략이 가능 => step="2"
             ==> 음수는 사용이 불가능 (감소) => 증가만 가능하다 
   --%>
  <c:forEach var="i" begin="1" end="10" step="1">
     ${i }&nbsp;
  </c:forEach>
  <%
       List<String> list=new ArrayList<String>();
       list.add("홍길동");
       list.add("심청이");
       list.add("박문수");
       list.add("춘향이");
       list.add("이순신");
  %>
  
  <h1>Java에서 for-each구문 사용</h1>
  <%
      for(String name:list)
      {
  %>
          <%= name %>&nbsp;
  <%
      }
  %>
  <h1>JSTL에서 for-each구문 사용</h1>
  <c:set var="list" value="<%=list %>"/>
  <c:forEach var="name" items="${list }">
     ${name }&nbsp;
  </c:forEach>
  <h1>Java에서 데이터 분해(StringTokenizer)</h1>
  <%
      String color="red,blue,black,yellow,cyan";
      StringTokenizer st=new StringTokenizer(color,",");
      while(st.hasMoreTokens())
      {
  %>
         <%=st.nextToken() %>&nbsp;
  <%
      }
  %>
  <h1>JSTL에서 데이터 분해</h1>
  <c:forTokens var="color" items="red,blue,black,yellow,cyan" delims=",">
      ${color }&nbsp;
  </c:forTokens>
  <h1>자바로 구구단 출력</h1>
  <table border=1 bordercolor=black width=560>
    <tr>
      <%
         for(int i=2;i<=9;i++)
         {
      %>
            <td align=center><%=i+"단" %></td>
      <%
         }
      %>
    </tr>
    <%
       for(int i=1;i<=9;i++)
       {
    %>
           <tr>
    <%
    	   for(int j=2;j<=9;j++)
    	   {
    %>
               <td><%= j+"*"+i+"="+j*i %></td>
    <%
    	   }
    %>
           </tr>
    <%
       }
    %>
  </table>
  <h1>JSTL로 구구단 출력</h1>
  <table border=1 bordercolor=black width=560>
    <tr>
      <c:forEach var="i" begin="2" end="9">
        <td align=center>${i+="단" }</td>
      </c:forEach>
      <c:forEach var="i" begin="1" end="9">
        <tr>
          <c:forEach var="j" begin="2" end="9">
            <td>${j }*${i }=${i*j }</td>
          </c:forEach>
        </tr>
      </c:forEach>
    </tr>
  </table>
</body>
</html>






