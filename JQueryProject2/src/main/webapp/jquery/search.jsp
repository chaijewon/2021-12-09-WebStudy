<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
   search.jsp=> 검색어 전송 ==> search_result.jsp
                             ------------------
                               FoodDAO를 통해서 실행 
   실행 결과를 읽어 온다 (화면에 출력)<==
 --%>
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
   width:960px;
}
h1{
    text-align: center;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
/*
 *   태그 읽기 
     $('css의 선택자')
     태그  ===> $('태그명') $("태그명") => document.getElementTagName("tr")
     아이디 ==> $('#아이디명')         => document.getElementById(아이디)
     클래스 ==> $('.클래스명')         => document.getElementClassName()
     복합  ==> $('태그명,태그명') $('#아이디명,#아이디명') => document.querySelector()
     자손  ==> $('태그명 > 태그명')
     후손  ==> $('태그명 태그명')
     속성  ==> $('input[type=button]')
                 href* => contains
                 href$ => endsWith
                 href^ => startsWith
     가상선택자 => $('태그명:nth-child(2n)')
                nth-child , odd , even , eq , contains 
     ===> 읽어온 태그를 제어하는 프로그램 (DOMScript) => 라이브러리화 (Jquery)
     ===> $.getJSON() , $.ajax
 */
$(function(){ //main
	$('#findBtn').click(function(){
		let ss=$('#ss').val(); // value값을 읽어 온다 
		if(ss.trim()=="") // 검색어 입력이 없는 경우
		{
			$('#ss').focus();
			return;
		} // 유효성 검사 ==> 사용자 입력 감시 
		// 정상적으로 입력 
		$.ajax({
			type:'post',
			url:'search_result.jsp',
			// search_result.jsp로 검색 요청 => 실행 결과를 읽어서 원하는 위치에 출력 
			// 현재 파일의 위치에서 요청 / 응답을 동시에 처리 
			data:{"addr":ss}, // search_result.jsp?addr=강남
			success:function(result)
			{
				// result => 결과값을 읽어 온다 (XML,HTML,JSON) => HTML
				$('.print').html(result);
			},
			error:function(err)
			{
				alert(err)
			}
			
		})
	})
})
</script>
</head>
<body>
  <div class="container">
    <div class="row">
      <input type=text size=20 id="ss" class="input-sm">
      <input type=button id="findBtn" class="btn btn-sm btn-primary"
       value="검색">
    </div>
    <div class="row print">
      
    </div>
  </div>
</body>
</html>





