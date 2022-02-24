<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
       역할 
       브라우저에서 기능 처리 (동적) : 자바스크립트 
                 => Front 개발자 
       ---------------------------
       브라우저에 화면 출력 (정적) => HTML/CSS : 퍼블러셔 
       
       데이터를 관리 => 자바 (Model)
       데이터를 저장 => 오라클
                 => Back 개발자  
       ---------------------------
       
       브라우저 <===> 오라클
             연결이 불가능 ==== 예외(NodeJS=서버측 프로그램 : 스프링)
       ------ HTML/CSS/JavaScript
       브라우저 <====> 자바
             연결이 가능 (JSP) 
       자바 <====> 오라클 
             연결이 가능 
             
       -----------------------------------------------------
                VO,LIST          sql
       브라우저  <======>  자바  <=======> 오라클 
        데이터를 받아서 출력 (데이터를 읽어 온다:dao) 데이터 저장 
       
       태그 , CSS를 제어하는 프로그램 , 유효성검사 (사용자입력) => 자바스크립트 
       자바스크립트 (종류가 많다 : typescript,coffeescript...)
         => 라이브러리 (표준화) : JQuery , VueJS , AJAX , ReactJS , ANGULARJS
                              ------          ------
       자바스크립트 
         => 1. 사용법 
            = 내부 스크립트 (한개 파일에서만 사용)
              <script> => <head> 주로 사용 , 지정이 되어 있지 않다 
              </script>
            = 외부 스크립트 (여러개 파일에 적용)
              => .js파일을 만들어서 처리 
              => import를 사용한다 
                 <script src="파일명|원격(http)">
            = 인라인 스크립트 (태그한개만 제어)
              <a href="javascript:함수호출(라이브러리함수,사용자 정의 함수)">
         => 버전 
            ES5.0 => var(자동지정변수) 
                     ---- 단점 : 스코프(사용범위)가 명확하지 않다
                     예) 
                         if(조건문)
                         {
                            var i=1; => int i=1
                            var i=10.5 => double i=10.5
                         }
                         i변수 사용이 가능   
                                 
            **ES6.0 => let (스코프가 명확하다=> {}을 벗어나면 사용이 불가능)
                     const : 상수형 변수 => final
                     람다식 : => (함수포인터)
                     function display()
                     {
                     }
                     
                     let display=function(){}
                     let display=()=>{}
                     =>는 생략 (function,return)
                     같다 ( == , === 권장)
                     = 문장이 종료 => ; (최근에는 ;을 생략)
                         코틀린, 파이썬(들여쓰기)
                         
            ** 로직이 없다 (프로그램 형식) => 쓰레드 , 저장 , 소켓 (채팅,게임)
        => 자바스크립트의 문법 
           = 변수 선언(데이터를 사용하는 것이 아니고 , 자동 지정 변수 사용(var,let)) 
             let i=0 ======> i:int
             let i=10.5 ===> i:double
             let i='A'  ===> i:String
             let i="ABC" ==> i:String
             let i=[]   ===> i:Array
                             => ["aaa",10,"bbb",10.5] (다른 데이터형을 모아서 처리)
             let i={}   ===> i:Object ==> 자바스크립트의 객체 표현법 (JSON)
             let i=function() => i:function
           = 연산자 처리
             단항연산자 (++,--,!) => 형변환(X)
                     함수를 이용해서 형변환 
                     = Number("10.5") => 10.5 , Number("10") => 10
                                                => parseInt("10") => 10
                     = String(10) => "10"
                     = Boolean(1) => true , Boolean(0) => false
                       => true/false => 0,0.0(false)
             산술연산자( + , - , / , * , % )
                     = "10"+"10" ==> 1010 (문자열 결합)
                     = "10"*"10" ==> 100 
                       ---- 정수 변환 
             비교연산자( === , != , < , > , <= , >=) 결과는 boolean
             논리연산자 ( && , || )
             대입연산자 ( = , += , -= ) 
             
           = 제어문 처리 
             조건문 
              = 단일 조건문 (if)
              = 선택 조건문 (if~else)
              = 다중 조건문 (if~else if ~ else if ~ else)
             선택문 
              = switch ~ case 
             반복문 
              = while 
              = do~while
              ***= for ===> for of  , for in 
              ***= forEach
              ***= map
             반복 제어문 
              break , continue   
           = 함수 : 프로시저 형식 (리턴형을 사용하지 않는다)
             function func_name()
             {
                
             } 
             function func_name()
             {
                return 값
             } 
           = 클래스 (객체지향언어)
             class Sawon
             {
               
             }
           = 화면 출력 
             alert()
             doucment.write() 
             태그.innerHTML
             console.log()
             ----------------
      1. 변수 선언
         = 지역변수 
           function func_name()
           {
              let i=10;
           }// 함수안에서만 사용이 가능 
         = 전역변수 
           let i=10;
           function func_name()
           {
              // i변수
           }
           function func_name()
           {
              // i변수 
           }
         = 데이터형 
           let i=10
           let i=10.5
           let i='A' => let i='AAA' => let i="AAA" => String
           let i=[값,....] 배열 
           let i={키:값,키:값....} 객체 (JSON) => VO
                 === 멤버변수  
           let i=[{},{},{},{},{}...] => List
             => 자바 ,자바스크립트 호환 
                ~VO => {}
                List => [{},{},{}...]
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	// 자바의 main() 역할 ==> $(function(){}) , 
	// componentDidMount():react , mounted():vue
	let a=10;
	let b=10.5;
	let c='ABC';
	let d="ABC"
	let e=[1,2,3,4,5,"홍길동"];
	let f={name:"홍길동",sex:"남자"}
	// 자바스크립트(단순한 언어) => 대소문자를 구분한다 
	console.log(a);
	console.log(b)
	console.log(c)
	console.log(d)
	console.log(e)
	console.log(f)
	document.write("a="+a+"<br>")
	document.write("b="+b+"<br>")
	document.write("c="+c+"<br>")
	document.write("d="+d+"<br>")
	document.write("e="+e+"<br>")
	document.write("f="+f+"<br>")
	document.write("<hr>");
	// typeof => 변수의 데이터형 
	/*
	    1. number : 정수,실수 
	    2. string : 문자 (''), 문자열 ("")
	    3. object : 배열([]) , 객체({})
	    4. boolean : true/false
	    5. null
	    6. undefined 
	*/
	document.write("a="+typeof a+"<br>")
	document.write("b="+typeof b+"<br>")
	document.write("c="+typeof c+"<br>")
	document.write("d="+typeof d+"<br>")
	document.write("e="+typeof e+"<br>")
	document.write("f="+typeof f+"<br>")
	document.write("g="+typeof true+"<br>")
	let i
	document.write("i="+typeof i+"<br>")  
	document.write("j="+typeof j+"<br>")
	let k=''
	document.write("k="+typeof k+"<br>")    
}
</script>
</head>
<body>

</body>
</html>






