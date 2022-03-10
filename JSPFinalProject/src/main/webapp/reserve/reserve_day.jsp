<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- Jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.rdays').css("cursor","pointer")
	$('.rdays').click(function(){
		let year=$(this).attr("data-year");
		let month=$(this).attr("data-month");
		let day=$(this).text();
		$('#reserve_day').text(year+"년도 "+month+"월 "+day+"일")
		$('#day_data').val(year+"-"+month+"-"+day);
		$.ajax({
			type:'post',
			url:'../reserve/reserve_time.do',
			data:{"day":day},
			success:function(res)
			{
				$('#food_time').html(res)
			}
		})
	})
})
</script>
</head>
<body>
  <table class="table">
    <caption class="text-center">${year }년 ${month }월</caption>
    <tr height="50">
     <c:forEach var="w" items="${strWeek }">
      <th class="text-center">${w }</th>
     </c:forEach>
    </tr>
    <c:set var="week" value="${week }"/>
    <c:forEach var="i" begin="1" end="${lastday }">
      <c:if test="${i==1 }">
        <tr height="50">
        <c:forEach var="j" begin="1" end="${week }">
          <td class="text-center">&nbsp;</td>
          <%-- 빈칸 (요일까지) --%>
        </c:forEach>
      </c:if>
      <c:if test="${i==rdays[i]}">
        
         <td class="text-center danger rdays" data-year="${year }" data-month="${month }">${i }</td>
        
      </c:if>
      <c:if test="${i!=rdays[i] }">
        <td class="text-center">${i }</td>
      </c:if>
      <c:set var="week" value="${week+1 }"/>
      <c:if test="${week>6 }">
       <c:set var="week" value="0"/>
       </tr>
       <tr height="50">
      </c:if>
    </c:forEach>
    </tr>
  </table>
</body>
</html>









