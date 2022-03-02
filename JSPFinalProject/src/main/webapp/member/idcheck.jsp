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
<!-- 
     Shadow는 서버를 거쳐서 데이터 읽고 실행 => 종료 
 -->
<script type="text/javascript">
$(function(){
	$('#idBtn').click(function(){
		// id읽기
		let id=$('#check_id').val();
		if(id.trim()=="")
		{
			$('#check_id').focus();
			return;
		}
		// 서버로 요청 => 결과값을 읽기 
		$.ajax({
			type:'POST',
			url:'../member/idcheck_result.do',// 요청
			data:{"id":id},
			success:function(result) //결과값 받기
			{
				let count=result.trim();//0,1
				if(count==0)
				{
					$('#print').html('<font color=blue>'+id+"는(은) 사용가능합니다</font>")
					$('#ok').show();
				}
				else
				{
					$('#print').html('<font color=red>'+id+"는(은) 사용중입니다</font>")
				}
				
			}
		})
	})
	$('#okBtn').click(function(){
		parent.join_frm.id.value=$('#check_id').val()
		parent.Shadowbox.close()
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
       ID:<input type=text name=id id="check_id" class="input-sm" size=15>
       <input type=button value="아이디체크" class="btn btn-sm btn-danger"
         id="idBtn"> 
       </td>
     </tr>
     <tr>
       <td class="text-center" id="print"></td>
     </tr>
     <tr id="ok" style="display:none">
       <td class="text-center">
        <input type=button value="확인" id="okBtn"
          class="btn btn-sm btn-success">
       </td>
     </tr>
    </table>
   </div>
  </div>
</body>
</html>






