<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      비교연산자 (문자열도 포함), 논리연산자 , 대입연산자 
      // 제어문 , 함수 , 이벤트 처리 (태그 제어) , 내장 객체 
                                            ------- window , document
                                                    form , location ,
                                                    history 
      // 화면 제어 => DOMScript (라이브러리 : Jquery(Ajax))
      // 자바 , 오라클 , HTML , CSS , JSP(MVC) => Spring 
      // Spring-Boot , Jquery(Vue,react) , JSON => 스웨거 
      //               Vue => vuex(MVVM) , react => redux(MVC)
      
      비교연산자 ( ==(===) 같다 ,  != , < , > , <= , >= ) 결과(true/false)
                --------
                  | ==을 사용하면 경고 
                 실제 Front편집기 (vscode, 아톰 , 웹스톰, 웹clipse:유료)
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 내부 스크립트 : 한개의 파일안에서만 처리 -->
<script type="text/javascript">
// 자바스크립트는 오류를 브라우저나 도스창에 출력하지 않는다 (단 브라우저에 흰색으로 출력)
// 디거깅을 사용한다 : console.log
window.onload=function(){
	let a=10;
	let b=5;
	console.log("a===b"+(a===b)) // false
	console.log("a!=b"+(a!=b)) // true
	console.log("a<b"+(a<b)) // false
	console.log("a>b"+(a>b)) // true
	console.log("a<=b"+(a<=b)) // false
	console.log("a>=b"+(a>=b)) // true
	
	let c="Hello"
	let d="JavaScript"
	console.log("c===d"+(c===d)) // false
	console.log("c!=d"+(c!=d)) // true
	console.log("c<d"+(c<d)) // true
	console.log("c>d"+(c>d)) // false
	console.log("c<=d"+(c<=d)) // true
	console.log("c>=d"+(c>=d)) // false
	
	/*
	    유효성 검사 
	    if(name=="")
	*/
	/*
	     논리 연산자 ( && , || )
	     (조건) && (조건) => 범위, 기간 포함 
	     -----    -----
	     결과      결과
	     ------------
	          |
	        최종 결과 
	        
	     (조건) || (조건) => 범위밖, 기간 미포함 
		 -----    -----
		  결과      결과
		  ------------
		       |
		     최종 결과 
		     
		  && : 직렬연산자 (조건 2개가 true일때 true)
		  || : 병렬연산자 (조건 2개중에 한개이상 true면 true)
		  
		  --------------------------------------
		                    &&         ||
		  --------------------------------------
		   true true       true       true
		  --------------------------------------
		   true false      false      true
		  --------------------------------------
		   false true      false      true
		  --------------------------------------
		   false false     false      false
		  --------------------------------------
	*/
	let i=(6>7) && (6===7)
	console.log("i="+i)
	i=(6<7) || (6===7)
	console.log("i="+i)
	
	// 대입연산자 = , += , -=
    i=10;
	console.log("i="+i)
	i+=20; // i=i+20 => i=30
	console.log("i="+i)
	i-=20; // i=i-20 => i=10
	console.log("i="+i)
	
}
</script>
</head>
<body>

</body>
</html>





