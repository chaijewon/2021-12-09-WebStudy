<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- EL(연산자) --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
  <h3>산술연산자(+ , - , * , / , %)</h3>
  2+3=${2+3 }<br>
  null+10=${null+10 } <sub>null은 EL에서 0으로 취급</sub><br>
  "10"+10=${"10"+10 } <sub>"10"는 문자열 결합이 아니고 정수형으로 변경후 연산</sub><br>
  " 10"+10=${" 10"+10 } 
  "admin"+10=${"admin"+=10 }<sub>문자열결합 연산자 +=이다</sub><br>
  10/3=${10/3 },${10 div 3}<br>
  10%3=${10%3 },${10 mod 3 }
  <h3>비교연산자(숫자,문자비교 가능=>true/false)</h3>
  10==20=${10==20 },${10 eq 20 }<br>
  10!=20=${10!=20 },${10 ne 20 }<br>
  10<20 = ${10 < 20 },${10 lt 20 }<br>
  10>20 = ${10 > 20 },${10 gt 20 }<br>
  <!-- 10<=20 = ${10 <= 20 },${10 le 20 }<br> -->
  10>=20 = ${10 ge 20 }<br>
  <h3>논리연산자 (&&(and) , ||(or), !(not))</h3>
  10==3 && 10==10 = ${10==3 and 10==10 },${10==3 && 10==10 }<br>
  10==3 || 10==10 = ${10==3 or 10==10 },${10==3 || 10==10 }<br>
  <h3>삼항연산자</h3>
  ${10<3?"false":"true" }
 --%>
</body>
</html>







