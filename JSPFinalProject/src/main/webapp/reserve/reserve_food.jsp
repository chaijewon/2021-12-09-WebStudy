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
		let days=$(this).attr("data-day");
		let no=$(this).attr("data-no")
		$('#reserve_poster').attr("src",poster)
		$('#reserve_name').text(name)
		$('#fno_data').val(no);
		//alert("맛집번호:"+parseInt(no))
		$.ajax({
			type:'post',
			url:'../reserve/reserve_day.do',
			data:{"days":days},
			success:function(res)
			{
				$('#food_date').html(res);
				
			}
		})
	})
})
</script>
</head>
<body>
  <table class="table">
   <c:forEach var="vo" items="${list }">
    <tr class="links" data-no="${vo.no }" data-day="${vo.reserve_days }" data-poster="${vo.poster }" data-name="${vo.name }" data-no="${vo.no }">
      <td class="text-center"><img src="${vo.poster }" style="width:35px;height:35px"></td>
      <td>${vo.name }</td>
      <td>${vo.tel }</td>
    </tr>
   </c:forEach>
  </table>
</body>
</html>