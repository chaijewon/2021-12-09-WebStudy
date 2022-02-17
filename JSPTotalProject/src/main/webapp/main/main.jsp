<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
       MVC (View=>JSP) => VueJS,ReactJS (스프링 연결) , Ajax,NodeJS
       JSP 
       1. 지시자 (page,taglib) 
          page => contentType="" (브라우저에 전송시에 형식)
                             ----
                              text/html(HTML) , text/xml(XML) , text/plain(JSON)
               => errorPage => forward사용 (URL은 변경없이 => 화면 내용만 변경)
               => import : 외부 라이브러리 첨부 
                  -------- java.lang,javax.servlet
          taglib => core / fmt / fn 
                   ------ 제어문 , redirect , set 
                   ------ formatDate,formatNumber 
                   ------ fn(String관련)
                   ------ jstl-1.2
       2. jsp액션태그
          => <jsp:include>
       3. 내장 객체 
          = request : 요청 정보 (사용자가 보낸 요청데이터를 가지고 있다) 
                      => JSP마다 가지고 있다 
          = response : 응답 정보 
          = session : 사용자 정보를 서버에 저장후 모든 JSP에서 공유  
          = application : getRealPath() => 서버,자원 정보 
                                               --- 파일 
          = cookie : 클라이언트 브라우저에 저장 
       --------------------------------------------------------
       4. Database 연결 
          드라이버 등록 => 연결 => SQL처리 => 결과읽기 => 해제 
          Class.forName() 
          getConnection()'
          ps=conn.preparedStatemenet()
          ResultSet 
          disConnection()
          ==> SQL문장 ==> autoCommit()
       5. JSTL/EL
          EL: 화면 출력 
              ${requestScope},${sessionScope} => request,session등록된 값 
              => request.setAttribute()
              => session.setAttribute()
              => 연산자 => 산술연산자 (null+10) null=>0취급 
                 정수/정수=실수 
          JSTL: 자바 라이브러리 
              <c:forEach> , <c:if> , <c:choose> , <c:set>
              <c:forTokens> , <c:redirect>
              --------------------------------------------
              <fmt:formatDate> , <fmt:formatNumber>
          프로젝트 => Spring프로젝트 (JSP는 동일) => 실무
          <% %> <%= %> <%! %>
          
          ==> MVC (Controller) => 서버제작 완료 => 프로젝트 
             ------------------ 서버제작 (15~20)
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>