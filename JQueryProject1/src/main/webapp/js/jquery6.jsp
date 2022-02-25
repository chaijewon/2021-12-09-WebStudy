<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 
     이벤트 처리 
     ---------
     $(선택자).click(function(){ ==> onclick
        처리 
     })
     $('선택자').hover(function(){
         // mouseover
     },function(){
         // mouseout
     })
     $('선택자').change(function(){
        // <select>
     })
     $('선택자').keyup(function(){
        검색어 작업
        자바스크립트 문법 
     })
     $('선택자').keydown(function(){
        검색어 작업
     })
     $('선택자').mouseover(function(){
     })
     --------------------------
     1. 선택자 
     2. 이벤트 
     3. 자바스크립트 처리 
     --------------------------
     4. Ajax 
     5. UI (라이브러리 => 변경) => Modal 
     -------------------------
     
     => 태그에서 값을 읽어 오는 연습 
        => val() => getter,setter
           <input type=text , password> <select> <textarea>
           <input type=text id="a">
           =>  값 읽기 => getter => $('#a').val()
           =>  값 첨부 => setter => $('#a').val(데이터)
        => text() => <태그>(데이터)</태그> $().text() , $().text(첨부값)
        => attr() => 속성값 읽기 , 속성값 첨부 
                     => 동영상 처리 , 이미지 변경
           ajax용으로 주로 사용 
        ***=> html() => html을 첨부 => innerHTML
           => 일회성 
        ***=> append() => 계속 추가 (파일 첨부)
           => 계속성 
        => string => substring(), trim(), length() , indexOf : 자바외 동일 
                     contains
                     
     
 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
  margin-top: 50px;
}
.row {
   margin: 0px auto;
   width:500px;
}
h1{
    text-align: center;
}
</style> 
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	// input => 값을 설정 
	$('#id').val("admin"); // value에 값을 채워준다 
	$('#pwd').val("1234");
	$('input[type=button]').click(function(){
		// 이벤트 처리 
		let id=$('#id').val();
		// let id=document.querySelector("#id").value
		let pwd=$('#pwd').val();
		
		alert("id:"+id+"\npassword:"+pwd)
	})
	// => 1. 태그선택 => 이벤트 => 입력값 읽기 => 애니메이션 => UI => 외부연결 
})
</script>
</head>
<body>
   <div class="container">
     <h1>Jquery 입출력(val())</h1>
     <div class="row">
      <table class="table">
       <tr>
        <th class="text-center" width=20%>ID</th>
        <td width=80%>
          <input type=text id="id" class="input-sm" size=15>
        </td>
       </tr>
       <tr>
        <th class="text-center" width=20%>PW</th>
        <td width=80%>
          <input type=password id="pwd" class="input-sm" size=15>
        </td>
       </tr>
       <tr>
         <td colspan="2" class="text-center">
          <input type=button value="확인" class="btn btn-sm btn-danger">
         </td>
       </tr>
      </table>
     </div>
   </div>
</body>
</html>








