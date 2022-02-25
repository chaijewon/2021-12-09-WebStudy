<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 
   위치 : eq , odd, even , nth-child => 가상 선택자
 -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('table>thead>tr').css("backgroundColor","#CCCCFF")
	$('table>tbody>tr:nth-child(2n)').css("backgroundColor","rgb(255,255,200)")
    // nth-child(2n) => 0 , 2 , 4 , 6...
    // nth-child(2n+1) => 1 , 3 , 5
    //  2*0+1 , 2*1+1 , 2*2+1 
    // nth-child(2n+2) => 2,4,6,8...
    // nth-child(3n+1) => 1, 4 , 7 , 10....
})
</script>
</head>
<body>
  <h1>회원 목록</h1>
  <table border=1 bordercolor=black width=350>
    <thead>
     <tr>
       <th>번호</th>
       <th>이름</th>
       <th>성별</th>
     </tr>
    </thead>
    <tbody>
      <tr>
        <td>1</td>
        <td>홍길동</td>
        <td>남자</td>
      </tr>
      <tr>
        <td>1</td>
        <td>홍길동</td>
        <td>남자</td>
      </tr>
      <tr>
        <td>1</td>
        <td>홍길동</td>
        <td>남자</td>
      </tr>
      <tr>
        <td>1</td>
        <td>홍길동</td>
        <td>남자</td>
      </tr>
      <tr>
        <td>1</td>
        <td>홍길동</td>
        <td>남자</td>
      </tr>
      <tr>
        <td>1</td>
        <td>홍길동</td>
        <td>남자</td>
      </tr>
      <tr>
        <td>1</td>
        <td>홍길동</td>
        <td>남자</td>
      </tr>
      <tr>
        <td>1</td>
        <td>홍길동</td>
        <td>남자</td>
      </tr>
      <tr>
        <td>1</td>
        <td>홍길동</td>
        <td>남자</td>
      </tr>
      <tr>
        <td>1</td>
        <td>홍길동</td>
        <td>남자</td>
      </tr>
    </tbody>
  </table>
</body>
</html>