<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,java.text.*"%>
<%-- <%@ page import="java.util.*" %>
<%@ page import="java.text.*" %> --%>
<%--
      선언문 : 멤버변수 , 메소드를 선언 할때 쓰는 영역 
      형식) <%! %> 
      
      <% %>
      <%= %>
      ------- _jspService() 메소드안에 들어가는 코딩
      <%! %>
      ------- 클래스 영역에 들어가는 코딩 
      
      class className
      {
         -------------------
          <%! %> : 멤버변수 , 메소드 ==> 직접 클래스 제작후 메소드 호출 
         -------------------
         public void _jspService()
         {
           ----------------------
            <% %>
            <%= %> : 지역변수 , 제어문 ...
           ----------------------
         }
      }
      
 --%>
<%!
    // 선언부 (사용빈도가 거의 없다)
    String name="홍길동"; // 멤버변수 
    public String getName()
    {
    	return name;
    }
    public void setName(String name)
    {
    	this.name=name;
    }
    // 라이브러리 => import를 사용 
    public String today()
    {
    	Date date=new Date();
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
    	return sdf.format(date);
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>선언식에 선언한 메소드 호출</h1>
   <%--
      getter => <%= %> => 리턴형이 있는 메소드
      setter => <% %>  => 리턴형이 없는 메소드
    --%>
   <%= getName() %><br>
   <%
       setName("심청이");
   %>
   <%= getName() %><br>
   오늘 날짜:<%= today()%> <!-- 리턴값을 출력할 수 있다 -->
</body>
</html>





