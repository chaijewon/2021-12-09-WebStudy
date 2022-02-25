<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
img {
  width:150px;
  height:300px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('img').css('opacity','.2') // 투명 => 0.0~1.0 
	$('img').hover(function(){
		$(this).css('opacity','1.0')
	},function(){
		$(this).css('opacity','0.2')
	})
})
</script>
</head>
<body>
  <img src="m1.jpg">
  <img src="m2.jpg">
  <img src="m3.jpg">
  <img src="m4.jpg">
  <img src="m5.jpg">
  <img src="m6.jpg">
  <img src="m7.jpg">
</body>
</html>