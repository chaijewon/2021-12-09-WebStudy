<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      선택자 : CSS/JavaScript/Jquery => 태그를 디자인 , 태그를 이용하는 프로그램 
             => 태그를 읽어 온다 
                태그 : 태그명 => tr => document.querySelector("tr")
                                    $("tr")
                아이디 : <a href="" id="aaa"> => document.querySelector("a#aaa")
                                                document.querySelector("#aaa")
                                     $("a#aaa")
                클래스 : <a href="" class="aaa"> => document.querySelector("a.aaa")
                                     $("a.aaa")
                --------------------------------------------------------------------
                <h1>aaa</h1>
                <h1>aaa</h1>
                <h1>aaa</h1>
                <h1>aaa</h1>
                <h1>aaa</h1>  ==> document.querySelectorAll() => []
                 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
// 337 
/*
 *   341 문서객체 => 태그 
     ---
      document.getElementById(아이디) <태그 id="">
 ----------------------------------- 한개의 태그만 읽어 온다 
            => document.querySelector()
      document.getElementByName(이름) <태그 name="">
      document.getElementByClassName(클래스명) <태그 class="">
      document.getElementByTagName(태그명)
      ------------------------------ 여러개 태그를 동시에 읽어 온다 
            => document.querySelectorAll()
 ------------------------------------------------------------ $() => 표준화 
    => 자바스크립트 함수 호출 
    
    => 이벤트 : 사용자가 브라우저 행위 
              ------------------ 키보드 / 마우스 => 처리 (자바스크립트)
 */
window.onload=function(){
	let h1=document.querySelector("#java")
	h1.style.color="red"
	// $('#java').css("color","red")
	//let h2=document.querySelector(".jsp")
	//h2.style.color="blue"
	let h2=document.querySelectorAll(".jsp")
	for(let h of h2)
	{
	    h.style.color="blue"	
	}
	
	let h3=document.querySelectorAll("h1")
	for(let h of h3)
	{
		h.style.backgroundColor="yellow"
	}
}
</script>
</head>
<body>
  <h1 id="java">자바</h1>
  <h1 id="oracle">오라클</h1>
  <h1 class="jsp">JSP</h1>
  <h1 class="spring">Spring/Spring-Boot</h1>
  <h1 class="ai">간단한 AI</h1>
  <h1 id="aws">AWS</h1>
  <h1 class="html">HTML/CSS</h1>
  <h1>자바스크립트</h1>
  <h1 class="jsp">JQuery(AJAX)</h1>
  <h1 class="jsp">VueJS</h1>
  <h1 class="spring">ReactJS</h1>
</body>
</html>









