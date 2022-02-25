<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
       자바스크립트의 핵심 : function
       - 자바 
          = 변수 
            ** 종류 (지역,멤버(인스턴스,공유(static))), 스코프(사용범위) 
          = 연산자 
            단항연산자(++,-- , ! , (type)
            이항연산자(산술(+,-,*,/,%),비교(==,!=,<,>,<=,>=),논리(&&,||),대입(=,+=,-=)
          = 제어문 
            조건문(단일,선택,다중) , 반복문(for(forEach),while) , 반복제어문(break)
          = 배열(1차) 
          = 클래스 
            구성요소 (변수,메소드,생성자) 
                       ------ 제작하는 방법
          = 객체지향 : 캡슐화(getter/setter) , 재사용(상속,포함) , 수정(오버라이딩), 추가(오버로딩)
          = 클래스 종류
            = 데이터관리(~VO)
            = 데이터활용(~DAO, Manager)
            = 인터페이스 
          = 예외처리 ==> 목적,정의
            = 예외복구(try~catch)
            = 예외회피(throws) 
          -------------------------- 1권
          = 라이브러리 
            = java.lang : Object , String , StringBuffer , Wrapper, Math
            = java.util : StringTokenizer , Random , Date , Calendar
          = 컬렉션 / 제네릭스 
            = List(ArrayList,Vector) , Map(HashMap) , Set(HashSet)
          = IO (파일 입출력)
            = File , FileInputStream , FileOutputStream 
                     FileReader      , FileWriter
       - 오라클 
          = DML 
            SELECT(JOIN,SUBQUERY)
            INSERT
            UPDATE
            DELETE
          = DDL
            CREATE 
            DROP
            ALTER
            TRUNCATE 
          = TCL
            COMMIT 
            ROLLBACK
       - HTML/CSS => 태그 , 속성 , CSS(변경) => 내부CSS,인라인CSS
       - JSP
         = 지시자(page , taglib , include)
         = JSP사용법 (<% %> ,<%! %> ,<%= %>)
         = 내장객체(request,resposne,session,pageContext,application)
            => cookie
         = jsp 액션 태그 (<jsp:include>)
         = EL  => ${}
                  => request.setAttribute()
               => ${requestScope.id} => <%= request.getAttribute("id") %>
                  => session.setAttribute()
               => ${sessionScope.id} => <%= session.getAttribute("id") %>
               ** requestScope,sessionScope는 생략 할수 있다 
               => 연산자 
         = JSTL => core , fmt , fn 
                   <c:if> , <c:set> , <c:forEach> , <c:redirect>
                   <c:choose>
                   <fmt:formatDate> <fmt:formatNumber>
                   fn => ${fn:substring()} => String메소드
       - MVC
          => Model : 조립 => 요청을 받아서 요청처리후에 데이터 전송 (request.setAttribute())
             View : EL/JSTL ==> 데이터를 받아서 출력 
             Controller : Model/View를 연결 시켜주는 역할 
             ---------- 
               1. 클래스로 찾기(조건문,Map)
               2. 메소드 찾기(어노테이션) => 찾기
       - JDBC 
          => Connection => PrepraredStatement => ResultSet
          => JDBC => DBCP => ORM(MyBatis=>Spring)
       ------------------------------- 주말 , 공휴일 ------------------------
       자바스크립트 => 라이브러리 (Jquery(Ajax), VueJS ,ReactJS , NodeJS(서버)...)
                    -----------------      --------------- 기본 Ajax 
                    Front (자바스크립트)
       => 위치 (자바스크립트 등록 위치) 
          파일에 설정 : 한개의 파일에서만 사용 (내부 스크립트)
          <head>
            <script type="text/javascript"> => ES5 , ES6 type="text/babel"
             변수선언 : 전역변수 
             함수선언(매개변수) : 사용자 요청(Front) , 에러방지 , 이벤트 
             {
                지역변수 
             }
             변수 => 자동지정변수 : var , let , const (상수형변수 => function)
                               -----------
                               사용 범위를 명확하게 한다 (let) 
            </script>
          </head>
          파일을 만든후 설정 : 여러개 파일에서 사용이 가능 (외부 스크립트)
            <script src="파일"></script> => import
            <script>
              활용
            </script>
        1. 변수 설정  ==> Jquery(Ajax), VueJS , ReactJS , NodeJS(서버)...
           => 라이브러리 (변수,연산자,제어문 , 메소드)
           let , var , const 
           let a=10; => int
           let a=10.5 => double 
           ---------------------- number (typeof a)
           let a='aaa'
           let a="aaa"  
           ---------------------- string 
           let a=[] => Array
               =>[] => 데이터형 혼합이 가능 (여러개 데이터형을 설정 할 수 있다)
                 [10,10.5,"",function(){}]
           let a={} => Object
           ---------------------- Object
           let a=function(){}
           ---------------------- function (함수형)
        2. 연산자 / 제어문 => 함수 => 이벤트에서 주로 처리 (HTML => 태그이용)
           연산자 
            단항 : ++, -- , !
                  형변환 => Number , String , Boolean
            이항 : 산술(+(산술,문자열), - , * , / (정수/정수=실수, %)
                  비교(===(==),!=, < , > , <= ,>=)
                  논리(&&,||)
                  대입(= , +=,-=)
            삼항 : (조건)?값1:값2
           제어문 
            for => for in , for of , forEach , map(for)
                   ------   ------ 배열안에 데이터를 읽어 올때 
                   배열의 index번호
        3. 함수 : 316page 
           익명의 함수 , 선언적 함수 
           --------   --------- function func_name(){}
           function(){}
           
           예) 
              function calc(매개변수) => 매개변수는 변수명만 설정 calc(no)
              {
                 return 값
              }
              function calc(매개변수)
              {
                 // 자체 처리  => HTML로 전송 
                 HTML로 전송 
                 태그읽기 => CSS를 이용하는 프로그램 
                           querySelector(css로 태그를 찾아서 데이터를 첨부)
              }
              let calc=function(){}
              let calc=()=>{} ---------- => function,return을 제외할때 
              *** 호출 시점 (사용자 정의는 자동으로 호출하지 않는다)
                           ------------------------------
                           자동 호출 : 자바스크립트에서 지원하는 함수 
                                     window.onload => main (callback)
                                     callback => 시스템에 의해서 자동 호출 
                                     servlet => doGet/doPost/service
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
  margin-top: 50px
}
.row{
  margin: 0px auto;
  width:350px;
}
h1{
  text-align: center;
}
</style>
<script type="text/javascript">
 // 함수의 첫번째 유형 (매개변수(X),리턴형(X))
 function calc()
 {
	 // 사용자가 입력한 값을 읽는다 
	 let kor=document.querySelector("#kor").value; // id=# , class=.
	 let eng=document.querySelector("#eng").value;
	 let math=document.querySelector("#math").value;
	 // 태그의 값을 읽어 올때 => 문자열 => 정수형 변환 
	 let total=Number(kor)+Number(eng)+Number(math);
	 document.querySelector("#total").value=total;
	 let avg=total/3
	 document.querySelector("#avg").value=Math.round(avg);
 }
</script>
</head>
<body>
  <div class="container">
   <h1>성적 계산</h1>
   <%--
         태그 구분자 
         id , class => 자바스크립트 , CSS (Front)
         name => 자바에서 데이터를 받을 때 (Back)
    --%>
   <div class="row">
     <table class="table">
      <tr>
       <td class="text-center" width=30%>국어</td>
       <td width=70%>
         <input type=text id=kor size=15 class="input-sm">
       </td>
      </tr>
      <tr>
       <td class="text-center" width=30%>영어</td>
       <td width=70%>
         <input type=text id=eng size=15 class="input-sm">
       </td>
      </tr>
      <tr>
       <td class="text-center" width=30%>수학</td>
       <td width=70%>
         <input type=text id=math size=15 class="input-sm">
       </td>
      </tr>
      <tr>
       <td class="text-center" width=30%>총점</td>
       <td width=70%>
         <input type=text id=total size=15 class="input-sm" readonly>
       </td>
      </tr>
      <tr>
       <td class="text-center" width=30%>평균</td>
       <td width=70%>
         <input type=text id=avg size=15 class="input-sm" readonly>
       </td>
      </tr>
      <tr>
       <td colspan=2 class="text-center">
         <input type=button value="계산" class="btn btn-sm btn-primary"
          onclick="calc()"
         >
         <!--  자바스크립트의 함수 호출 => 이벤트 
               ---------
               <select> : onchange="처리 함수 호출"
               <button><img><a> : onclick="처리 함수 호출"
               -------- 유효성 검사 
               모든 태그에 적용 : onmouseover , onmouseout 
               입력창 => onkeyup ,onkeydown 
          -->
       </td>
      </tr>
     </table>
   </div>
  </div>
</body>
</html>
       





