<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
    Jquery : 자바스크립트의 라이브러리 
             기본 , UI 
             Ajax 
             
    Jquery는 태그를 제어하는 프로그램 (이벤트포함) 
    -------------------------------------
      태그를 읽어 올때 : 
      태그:$('태그명')
      아이디:$('#아이디')
      클래스:$('.클래스')
      ---------------------------
      중복 :$('태그명,태그명')
      자손 :$("태그명 > 태그명") 
      후손 :$("태그명 태그명") 
             ------------ css의 선택자와 동일 
      ---------------------------태그명 대신 아이디,클래스명 
      
      1. 태그를 선택해서 CSS변경 
         ---------
      
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 라이브러리 추가 -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<!-- 라이브러리 사용 -->
<script type="text/javascript">
// window.onload=function(){}
// $(document).ready(function(){}) : 구버전
$(function(){
	$('h1').css("color","red")
	/*
	    let h1=document.querySelectorAll("h1")
	    for(let h of h1)
	    {
	    	h.style.color="red"
	    }
	*/
	$('.hong').css("backgroundColor","pink")
	$('#hong').css('backgroundColor',"green")
	///// 가상 선택자 
	$('h1:odd').css("color","black") // 홀수 (0번부터)
	$('h1:even').css("color","yellow") // 짝수
})
</script>
</head>
<body>
  <h1>홍길동1</h1>
  <h1>홍길동2</h1>
  <h1 class="hong">홍길동3</h1>
  <h1>홍길동4</h1>
  <h1 id="hong">홍길동5</h1>
  <h1>홍길동6</h1>
  <h1>홍길동7</h1>
  <h1 class="hong">홍길동8</h1>
  <h1>홍길동9</h1>
  <h1 class="hong">홍길동10</h1>
</body>
</html>






