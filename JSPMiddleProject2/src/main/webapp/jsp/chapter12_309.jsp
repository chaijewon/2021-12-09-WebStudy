<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      1. 내장 객체 : 미리 생성된 객체 (JSP)
         1) request : 사용자가 보내준 데이터 읽어온다 
         2) response : 요청처리후 HTML/Cookie , 화면 이동 
                      => 한개의 파일안에서 사용이 가능 (지역변수)
                      => _jspService(HttpServletRequest request,
                                     HttpServletResponse response)
                         => 매개변수 => 한번만 사용한다 
         3) session : 사용자의 일부정보를 저장 => 프로그램 종료,로그아웃해제
                      프로젝트에서 사용중인 모든 JSP에서 사용이 가능 (전역변수)
                      서버에 저장이 된다 
                      예) 장바구니 , 댓글 , 예매 (공통으로 id)
                         => 로그인 저장 (id,name...)
                         => 로그아웃시에 해제 
                         *** Cookie는 클라이언트 브라우저에 저장 
                             Session은 서버에 저장 
         4) pageContext : include() , forward()
                          ---------------------- 여러개의 JSP가 request공유
         5) application : getRealPath() : 실제 JSP파일,이미지파일 실제 경로명을 가지고 온다 
         -------------------------- Spring까지 사용이 된다 
     2. 지시자 : page , taglib (MVC,Spring=>사용)
     3. jsp액션 태그 : <jsp:include> => 조립식 프로그램 , 분업이 가능 
     ---------------------------------------------------------------------------- 
     <% %> , <%= %> , <%! %> => MVC,Spring(화면출력=JSP) (사용하지 않는다)
     -----   ------   ------
      |         |        |
     JSTL      EL       클래스를 만들어서 사용(JavaBean)
              ${}
     웹 프로그램의 패턴 
     model1 => (JSP => JSP) : 사용하기 쉽다 , 간단한 Java사용만 하면된다 
               제어문 , 연산자 , 변수선언 , 데이터베이스 연동 
               => 확장성(X) , 재사용(X)
               => 분업이 불가능 (혼자 전체 사이트를 제작)
                  HTML/CSS/Java/JavaScript  
       mv  => Model(자바) => VO,DAO,요청처리  
              View => 순수하게 태그형으로 출력 
              =>JSP에서 클래스 메소드를 호출해서 사용 (완전하게 Java/HTML를 
                          분리하지 못했다)
     model2 => (MVC) => 복잡하다 , 유자보수가 좋다 
               Model : 자바 ==> Back => 확장성 , 재사용 , 수정 
               View : HTML/CSS ==> Front
               Controller : 연결
               
      1. 로그인 처리 => 사용자 정보 (session)
      2. 로그아웃 처리 => 사용자 정보 지우기 
      3. 댓글형 게시판 
         ---------- 파일업로드/파일다운로드 
      --------------------------------- model 1종료
         JSTL/EL (***)
     ================================================================= 
      4. MV 
         JSP ===> Model  ===> JSP
      5. MVC
            request         request(요청처리)   request에 결과값을 담아서 전송 
         JSP ==> Controller ==> Model ==> Controller ==> JSP
     ===============================================================
                   
         
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











