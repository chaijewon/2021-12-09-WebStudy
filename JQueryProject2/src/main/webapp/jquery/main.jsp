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
<!-- Jquery 라이브러리 추가  -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){ // window.onload=function(){} , $(document).ready(function(){})
	$('#movieBtn').click(function(){
		// 영화 버튼을 클릭시에 처리하는 영역 
		$.ajax({ // 장점은 현재 파일에서 => 서버로 요청 , 요청 결과값을 바로 받는다  
			     // 파일을 계속 유지 => 70%이상 Ajax
			 type:'post', // 메소드 방식지정 (type)
		     url:'movie.jsp',// 실행 결과값 읽기  data: 보내는 데이터가 있는 경우에 사용
		     success:function(result)
		     {
		    	 //success => 200 , => 404,405,403,500 => error에서 처리 
		    	 $('.print').html(result);
		     }
			 
		     
		})
	})
	$('#musicBtn').click(function(){
	    // 뮤직 버튼을 클릭시에 처리하는 영역 
	    // 영화 버튼을 클릭시에 처리하는 영역 
		$.ajax({ // 장점은 현재 파일에서 => 서버로 요청 , 요청 결과값을 바로 받는다  
			     // 파일을 계속 유지 => 70%이상 Ajax
			 type:'post', // 메소드 방식지정 (type)
		     url:'music.jsp',// 실행 결과값 읽기  data: 보내는 데이터가 있는 경우에 사용
		     success:function(result)
		     {
		    	 alert(result);
		    	 //success => 200 , => 404,405,403,500 => error에서 처리 
		    	 $('.print').html(result);
		     }
			 
		     
		})
    })
    $('#foodBtn').click(function(){
	    // 맛집 버튼을 클릭시에 처리하는 영역 
	    // 영화 버튼을 클릭시에 처리하는 영역 
		$.ajax({ // 장점은 현재 파일에서 => 서버로 요청 , 요청 결과값을 바로 받는다  
			     // 파일을 계속 유지 => 70%이상 Ajax
			 type:'post', // 메소드 방식지정 (type)
		     url:'food.jsp',// 실행 결과값 읽기  data: 보내는 데이터가 있는 경우에 사용
		     success:function(result)
		     {
		    	 //success => 200 , => 404,405,403,500 => error에서 처리 
		    	 $('.print').html(result);
		    	 /*
		    	      jquery에서 데이터 읽기/쓰기
		    	      text() 
		    	       <td>value</td>
		    	           -----
		    	      attr()
		    	       <img src="value">
		    	                 ----- 
		    	      html()
		    	        <tr>
		    	          <td>value</td>
		    	        </tr>
		    	        $('tr').text() ==> value
		    	        $('tr').html() ==> <td>value</td>
		    	      append() : html이나 데이터를 추가 
		    	      remove() : 태그를 지우는 경우 
		    	      show() : display:'' => 보여준다
		    	      hide() : display:none  => 감춘다 
		    	      prop() : 체크박스에 체크여부 확인 
		    	      ------------- 나머지는 javascript 라이브러리 사용 
		    	      
		    	      => type => get/post => method방식 지정 
		    	      => url => 전송 => 실행 결과를 읽어 온다 
		    	                => 일반 text(실행된 HTML을 읽어 온다)
		    	                => JSON ==> JSON.Parser()
		    	                => XML  ==> (X)
		    	      => data => 실행하기 위한 전송 데이터 (JSON)
		    	                 {"id":'admin',"pwd":'1234'} => 서버로 전송 
		    	                 => ?id=admin&pwd=1234
		    	      => success:function(res){} => 시스템에 의해 자동 호출되는 함수
		    	                                    -------------------------
		    	                                      callback
		    	         ------- 오류가 없는 경우에 처리 
		    	                 res => 실행 결과값을 읽어 온다 
		    	      => error:function(res){} => error확인시 res=>에러코드
		    	         404  / 500 
		    	 */
		     }
			 
		     
		})
    })
})

</script>
</head>
<body>
  <div class="container">
    <div class="row">
      <input type=button value="영화" class="btn btn-sm btn-danger"
       id="movieBtn"
      >
      <input type=button value="음악" class="btn btn-sm btn-success"
       id="musicBtn"
      >
      <input type=button value="맛집" class="btn btn-sm btn-primary"
       id="foodBtn"
      >
    </div>
    <div class="row print">
    
    </div>
  </div>
</body>
</html>




