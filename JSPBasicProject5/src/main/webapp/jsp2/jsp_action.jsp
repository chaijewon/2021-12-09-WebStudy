<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      JSP의 베이직 => 실무에서 거의 사용빈도가 없다 
        <%= %> (X) ==> ${} EL
        제어문       ==> JSTL 
        아주 오래전에 개발된 프로그램의 유지보수 (MVC(X) , 일반 JSP)
         => Spring , Struts , JSF , 마이플랫폼 , 제우스 ...
            (60%) 
         => jsp , php , asp , aspx(c#) , dango(python)
         => 의뢰처 : 가능자 (스프링 가능자, 파이썬 가능자..)
      <jsp:useBean id="" class="" scope=""> : 객체를 생성할때 사용되는 태그
         id = 객체명 
         class = 클래스명 (패키명.클래스명) => Class.forName()
         scope = 사용범위
                 page(default) : 한 JSP안에서 사용 가능 *****
                 request : 사용자 요청시마다 
                 session : 프로그램 종료시까지 사용이 가능 
                 ------- 프로그램 실행시까지 유지 
                 application : 전역 (모든 JSP에서 사용) 
      <jsp:setProperty name="id명" property="" value="">
         name = 객체명 (<jsp:useBean id="">
         property="변수명" => setter
         property="name" => setName()
         property="*" ==>  객체가 가지고 있는 모든 setter
           => 사용자가 값을 전송할때 
              변수 : id,pwd,name,sex,age
              전송 : id,name,sex,age ==> pwd=null으로 초기화
                    클래스 : 클래스 : null (String) , 정수:0,0L,실수:0.0F,0.0
                           boolean : false
         value=직접값을 주입
         예)
           <jsp:setProperty name="m" property="name" value="홍길동">
              m.setName("홍길동")
      <jsp:getProperty name="객체" property="*이 존재하지 않는다"> 
         예)
            <jsp:getProperty name="m" property="addr">
              m.getAddr() 
              
      읽기/쓰기를 할때 <%%> => 태그를 이용해서 사용 (jsp액션태그)
      
      ==> MVC,JSP사용 :
          <jsp:include page="첨부할 페이지"> : 조립식      
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