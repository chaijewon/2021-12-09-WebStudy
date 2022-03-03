<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.row {
   margin: 0px auto;
   width:350px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#delBtn').on("click",function(){
		let pwd=$('#pwd').val();
		if(pwd.trim()=="")
		{
			$('#pwd').focus();
			return;
		}
		$.ajax({
			type:'post',
			url:'../member/join_delete_ok.do',
			data:{"pwd":pwd},
			success:function(res)
			{
				let r=res.trim();
				if(r=="no")
				{
					alert('비밀번호가 틀립니다!!');
					$('#pwd').val("");
					$('#pwd').focus();
				}
				else
				{
					alert("회원 탈퇴 완료했습니다");
					location.href="../main/main.do";
				}
			}
		})
	})
})
</script>
</head>
<body>
<div class="wrapper row3">
  <div id="breadcrumb" class="clear"> 
    <!-- ################################################################################################ -->
    <ul>
      <li>회원 가입</li>
    </ul>
    <!-- ################################################################################################ --> 
   </div>
  </div>
  <div class="wrapper row3">
   <div style="height: 650px">
    <main class="container clear">
    <h2 class="sectiontitle">회원 탈퇴</h2>
     <div class="row">
       <table class="table">
        <tr>
         <td class="inline">
          비밀번호:<input type=password id=pwd size=15 class="input-sm">
          <input type=button value="회원탈퇴" class="btn btn-sm btn-primary"
           id="delBtn">
         </td>
        </tr>
       </table>
     </div>
    </main>
   </div>
  </div>
</body>
</html>








