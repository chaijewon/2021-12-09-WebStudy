<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
// 전역변수 
let fileIndex=0
$(function(){
	$('#addBtn').click(function(){
		$('.user-table > tbody').append('<tr id="m'+(fileIndex)+'">'
				+'<td width=20%>File:'+(fileIndex+1)+'</td>'
				+'<td width=80%><input type=file size=20></td>'
				+'</tr>')
		fileIndex++;
	})
	$('#removeBtn').click(function(){
		   //alert("qqq")
		  if(fileIndex>0)
		  {
		   $("#m"+(fileIndex-1)).remove();
		   fileIndex--;
		  }
		
	})
	let bCheck=true;
	$('.btn-success').click(function(){
		if(bCheck==true)
		{
		   $('#ck').prop('checked',true);
		   bCheck=false;
		   $('.btn-success').val("취소");
		}
		else
		{
			$('#ck').prop('checked',false);
			bCheck=true;
			$('.btn-success').val("체크");
		}
	})
})
</script>
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
</head>
<body>
  <div class="container">
   <h1>파일 업로드</h1>
   <div class="row">
    <table class="table">
     <tr>
      <td class="text-right">
       <input type=button value="추가" class="btn btn-xs btn-danger" id="addBtn">
       <input type=button value="삭제" class="btn btn-xs btn-primary" id="removeBtn">
      </td>
     </tr>
    </table>
    <table class="table user-table">
     <tbody>
     
     </tbody>
    </table>
    <table class=table>
      <tr>
       <td>
        <input type=button value="체크" class="btn btn-sm btn-success">
       </td>
      </tr>
      <tr>
       <td>
        <input type=checkbox value="OK" id=ck>OK
       </td>
      </tr>
    </table>
   </div>
  </div>
</body>
</html>






