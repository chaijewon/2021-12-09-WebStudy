<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.links').css("cursor","pointer");
	$('.links').click(function(){
		let poster=$(this).attr("data-poster");
		let name=$(this).attr("data-name");
		$('#reserve_poster').attr("src",poster)
		$('#reserve_name').text(name)
	})
})
</script>
</head>
<body>
  <table class="table">
   <c:forEach var="vo" items="${list }">
    <tr class="links" data-poster="${vo.poster }" data-name="${vo.name }" data-no="${vo.no }">
      <td class="text-center"><img src="${vo.poster }" style="width:35px;height:35px"></td>
      <td>${vo.name }</td>
      <td>${vo.tel }</td>
    </tr>
   </c:forEach>
  </table>
</body>
</html>