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
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let i=0;
$(function(){
	// $('#showBtn').on('click', function(){})
	/*
	     click , change , keyup , keydown , hover 
	*/
	$('#showBtn').click(function(){
		if(i==0)
		{
			$('#trp').show();
			$('#showBtn').val("취소");
			i=1;
		}
		else
		{
			$('#trp').hide();
			$('#showBtn').val("삭제");
			i=0;
		}
	})
})
</script>
</head>
<body>
  <div class="container">
    <h1>hide(),show()</h1>
    <div class="row">
     <table class="table">
      <tr>
        <td class="text-right">
         <input type=button id="showBtn" value="삭제" class="btn btn-sm btn-danger">
        </td>
      </tr>
      <tr style="display:none" id="trp">
        <td class="text-right">
         비밀번호:<input type=password id="pwd" class="input-sm">
        </td>
      </tr>
     </table>
    </div>
  </div>
</body>
</html>









