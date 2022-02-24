<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      조건문 => 값 입력여부 , 라디오버튼 , 체크박스 ...
              이미지 변경 => 소인 / 대인 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	let a=9;
	if(a%2==0)
	{
		// true => 실행
		console.log(a+"는(은) 짝수다")
	}
	else
	{
	    // false => 실행 	
	    console.log(a+"는(은) 홀수다")
	}
}
</script>
</head>
<body>

</body>
</html>