<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#amount').change(function(){
		let price=$('#price').text();
		let amount=$(this).val();
		$('#total').text(parseInt(price)*parseInt(amount));
	});
	$('#btn').click(function(){
		let amount=$("#amount").val();
		let no=$('#btn').attr("data-no");
		$.ajax({
			type:'post',
			url:'../cart/cart_insert.do',
			data:{"amount":amount,"no":no},
			success:function(res)
			{
				alert("장바구니에 추가되었습니다!!");
			}
		});
	})
})
</script>
</head>
<body>
<div class="wrapper row3">
  <div id="breadcrumb" class="clear"> 
    <!-- ################################################################################################ -->
    <ul>
      <li>상품 상세보기</li>
    </ul>
    <!-- ################################################################################################ --> 
  </div>
</div>
<!-- ################################################################################################ --> 
<!-- ################################################################################################ --> 
<!-- ################################################################################################ -->
<div class="wrapper row3">
  <main class="container clear">
   <table class="table">
     <tr>
       <td width=30% class="text-center" rowspan="5">
        <img src="${vo.product_poster }" width=100%>
       </td>
       <td width=70%>${vo.product_name }</td>
     </tr>
     <tr>
       <td width=70%>가격:<span id="price">${vo.product_price }</span>원</td>
     </tr>
     <tr>
       <td width=70% class="inline">수량:<select class="input-sm" id="amount">
         <c:forEach var="i" begin="1" end="10">
          <option>${i }</option>
         </c:forEach>
       </select></td>
     </tr>
     <tr>
       <td width=70%>총금액:<span id="total"></span>원</td>
     </tr>
     <tr>
       <td width=70%>
        <input type=button value="장바구니" class="btn btn-lg btn-success" data-no="${vo.product_id }" id="btn">
       </td>
     </tr>
   </table>
  </main>
 </div>
</body>
</html>







