<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      page 23 ~ 24
      JSP (JavaServerPage) 
      ==> View기능만 사용 (HTML만 출력)
      ==> 자바 기반
      ==> HTML과 Java를 섞어서 사용 
      ==> 동적 파일 (파일한개로 여러개의 형태로 변경)
          상세보기 => 파일은 1개 이용 (데이터만 달라진다)
      ==> 객체지향적 , 네트워크 프로그램 (C/S) 
          client : 브라우저  
          server : JSP/Servlet/Spring
      ==> 보안성이 뛰어나다 
      ==> HTML안에서 자바를 코딩 할때 : <% %> , <%! %> , <%= %>
      Servlet => Server+let(가벼운 프로그램) ==> 변경(JSP) 
      ==> 순수하게 자바로만 코딩 (단점 : 일부만 수정시에 => 컴파일을 수행)
      ==> MVC(Controller) , 보안 요구 , Spring파일은 서블릿으로 제공)
      33page => 설치 (JDK,Tomcat,이클립스) => 일반자바 87page~117page 
                                           ---------------------
                                           
      JSP의 시작 => 119page 
      => 스크립트 (HTML안에 자바를 코딩)
                        ----------- HTML에서 안되는 역할 
                        1. 오라클로부터 데이터를 읽어 온다 
                        2. 제어문 
                        3. 변수선언 
                        4. 읽어온 데이터 출력
                        ==> 데이터 관리 (읽기/쓰기) 
         자바 코딩하는 영역 => 영역을 벗어나면 일반 텍스트 (구분)
         --------------
          <% 
             메소드안에 코딩  => _jspService() => 선언되는 모든 변수는 지역변수
          %>
          <%!
              클래스영역에 설정 => 메소드 선언 ==> (X)
          %>
          <%=
              브라우저에 출력할 내용 
          %>
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
h1{
    text-align: center /*가운데 정렬*/
}
.row{
   margin: 0px auto;/* 가운데 정렬 */
   width:700px;/* table의 크기 결정 => 700px */
}
</style>
</head>
<body>
  <cneter>
   <h1>스크립트릿 사용법(119) &lt;% 일반 자바 코드 생성 %&gt;</h1>
   <ul style="list-style-type: none">
     <li>변수 선언</li>
     <li>제어문</li>
     <li>화면 출력</li>
     <li>HTML에서는 변수,제어문... 불가능</li>
     <li>HTML에서는 자바코드를 인식하지 않는다(일반 텍스트 취급)</li>
     <li>HTML과 자바를 구분할때 사용</li>
   </ul>
   </center>
   <%--
     String name="홍길동";
     out.println(name);
   --%>
   <div class="container">
    <h1>구구단</h1>
    <div class="row">
     <table class="table">
       <tr class="warning">
        <!-- <th class="text-center">2단</th>
        <th class="text-center">3단</th>
        <th class="text-center">4단</th>
        <th class="text-center">5단</th>
        <th class="text-center">6단</th>
        <th class="text-center">7단</th>
        <th class="text-center">8단</th>
        <th class="text-center">9단</th> -->
        <%
           // 제어문 사용 
           for(int i=2;i<=9;i++)
           {
           // 자바 코딩
        %>
               <!-- out.println(출력할 값); -->
        	   <th class="text-center"><%= i+"단"%></th>
        <% 
           } // 자바 코딩 => taglib (제어문 태그형식 제작)
        %>
       </tr>
       <%
          /* 이중 for을 사용해서 구구단을 출력한다 (120page):자바문법 적용*/
          for(int i=1;i<=9;i++)
          {
       %>
        	  <tr>
       <%
        	  for(int j=2;j<=9;j++)
        	  {
        %>
        		  <td class="text-center"><%= j+"*"+i+"="+i*j%></td>
        <%
        	  }
        %>
        	  </tr>
        <%
          }
        %>
     </table>
    </div>
   </div>
</body>
</html>








