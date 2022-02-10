<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="16kb"%>
<%--
     out/application/pageContext/exception 
     config/page => (X)
     내장객체 
     ------
       out : JspWriter
             출력버퍼를 관리 
             ------ 자바에서 출력한 HTML/CSS
       => 버퍼에 출력 기능 
          print() ==> <%= %>
            복잡한 과정이 있는 경우 
           <%
            if()
            {
               out.println("<HTML>") => 권장(X) => 서블릿형식 
            }
            else if()
            {
            
            }
            
            else if()
            {
               HTML
            }
            else
            {
               HTML
            }
           %>
            
          println()
       => 버퍼 관리 기능 (메모리 크기) => 확인 (8kb)
          총크기 / 남아 있는 메모리
          getBufferSize() , getRemaining() 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <center>
    HTML을 출력하는 메모리 공간(출력버퍼) 크기:<%= out.getBufferSize() %><br>
    HTML을 출력하고 남아 있는 버퍼의 크기 : <%= out.getRemaining() %><br>
    사용중인 버퍼 :<%=out.getBufferSize()-out.getRemaining() %>
    <br>
    <h1>Hello JspWriter(out)</h1>
    <h1>출력버퍼(JSP의 실행결과를 출력하는 메모리:HTML)</h1>
    <%
       String s="Hello 내장객체(out)";
    %>
    <%=s %><br>
    <%
       String s1="Hello 내장객체(out)";
       out.println(s1);
    %><br>
    <%
       String s2="Hello 내장객체(out)";
    %>
    <h1><%=s2 %></h1>
    <%
       String s3="Hello 내장객체(out)";
       out.println("<h1>"+s3+"</h1>");
    %>
    <input type="text" name="name" class="input-sm">
    <br>
    <%
       out.println("<input type=\"text\" name=\"name\" class=\"input-sm\">");
    %>
   </center>
</body>
</html>







