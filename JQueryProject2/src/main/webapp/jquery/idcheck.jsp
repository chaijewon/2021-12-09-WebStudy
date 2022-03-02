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
   width:380px;
}
h1{
    text-align: center;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#okBtn').on('click',function(){
		parent.join_frm.id.value=$('#id').val();
		parent.Shadowbox.close();
	})
})
</script>
</head>
<body>
   <div class="container">
     <div class="row">
      <table class="table">
        <tr>
         <td class="text-center">
          ID:<input type=text size=15 class="input-sm" id="id">
          <input type=button value="중복체크" class="btn btn-sm btn-danger">
         </td>
        </tr>
        <tr>
          <td class="text-center">
            사용 가능한 아이디입니다
          </td>
        </tr>
        <tr>
         <td class="text-center">
          <input type=button value="확인" class="btn btn-sm btn-success"
           id="okBtn"
          >
         </td>
        </tr>
      </table>
     </div>
   </div>
</body>
</html>









