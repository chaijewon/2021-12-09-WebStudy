<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
   다중 조건문 : 조건에 맞는 문장만 실행 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	let kor=90;
	let eng=85;
	let math=78;
	
	let total=kor+eng+math;
	let avg=total/3.0;
	
	console.log("국어점수:"+kor)
	console.log("영어점수:"+eng)
	console.log("수학점수:"+math)
	console.log("총점:"+total)
	console.log("평균:"+Math.round(avg))// Math.round() 반올림 
	
	let score='A'
	// 단일 조건문 모든 if을 수행한다 
	if(avg>=90 && avg<=100)
		score='A';
	if(avg>=80 && avg<90)
		score='B';
	if(avg>=70 && avg<80)
		score='C';
	if(avg>=60 && avg<70)
		score='D';
	if(avg<60)
		score='F';
	/*if(avg>=90)
		score='A';
	else if(avg>=80)
		score='B';
	else if(avg>=70)
		score='C';
	else if(avg>=60)
		score='D';
	else
		score='F';*/
	
	console.log("학점:"+score)
	
}
</script>
</head>
<body>

</body>
</html>