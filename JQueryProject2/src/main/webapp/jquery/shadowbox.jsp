<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
  margin-top: 50px;
}
.row {
   margin: 0px auto;
   width:700px;
}
h1{
    text-align: center;
}
</style>
<link rel="stylesheet" href="shadow/css/shadowbox.css">
<script type="text/javascript" src="shadow/js/shadowbox.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
/*
 *     $('#btn1').click(function(){})
       $('#btn2').hover(function(){})
       $('#btn3').mouseenter(function(){})
       
       $('#btn1').on('click',function(){})
       $('#btn2').on('hover',function(){})
       $('#btn3').on('mouseenter',function(){})
       
       on({
    	   click:function(){},
    	   hover:function(){},
    	   mouseenter:function(){}
       })
 */
Shadowbox.init({
	players:['iframe']
})
$(function(){
	$('#idBtn').on('click',function(){
		//alert("aaa")
		Shadowbox.open({
			content:'idcheck.jsp',
			player:'iframe', 
			title:'아이디 중복체크',
			width:420,
			height:200
		})
	})
})
</script>
</head>
<body>
  <div class="container">
   <h1>회원 가입</h1>
   <div class="row">
    <form name="join_frm">
	    <table class="table">
	      <tr>
	       <td width="15%">ID</td>
	       <td width="85%">
	         <input type=text size=15 class="input-sm" id="join_id" name=id>
	         <input type=button value="아이디중복체크" 
	            class="btn btn-sm btn-primary" id="idBtn">
	       </td>
	      </tr>
	    </table>
    </form>
   </div>
  </div>
</body>
</html>





