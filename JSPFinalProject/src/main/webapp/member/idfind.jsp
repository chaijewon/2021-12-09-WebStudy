<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="http://code.jquery.com/jquery.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script>
 $(function(){
    $("#tabs").tabs();
    
    $('#telBtn').on('click',function(){
    	let tel=$('#tel').val(); // 사용자 입력값을 얻어 온다 
    	if(tel.trim()=="")
    	{
    		$('#tel').focus();
    		$('#tel_find').text("전화번호를 입력하세요")
    		return;
    	}
    	// idfind.jsp에서 요청/응답을 동시에 처리 
    	$.ajax({
    		type:'post',
    		url:'../member/idfind_result.do',
    		data:{"tel":tel},
    		success:function(res) // res가 정상수행시 데이터 읽기 
    		{
    			let t=res.trim();
    			if(t=='no')
    			{
    				$('#tel_find').text('전화번호가 존재하지 않습니다!!')
    				// 전화 번호가 없는 상태
    			}
    			else
    			{
    				$('#tel_find').text(t);
    				// 전화번호로 아이디를 찾은 경우 
    			}
    			
    		}
    	})
    })
    $('#emailBtn').click(function(){
    	let email=$('#email').val();
    	if(email.trim()=="")
    	{
    		$('#email').focus();
    		$('#email_find').text("이메일을 입력하세요!!");
    		return;
    	}
    	/*
    	     HttpRequest request=생성 => 브라우저에 존재 
    	     request.open("POST","URL","Param",true);
    	     request.onradystatechange=callback
    	     resuest.send()
    	     ---------------------------------------
    	     function callback(res)
    	     {
    	    	 if(request.readyState==4)
    	    	 {
    	    		 if(request.status==200) success
    	    		 {
    	    			 처리 
    	    		 }
    	    	 }
    	     }
    	*/
    	$.ajax({
    		type:'post',
    		url:'../member/email_result.do',
    		data:{"email":email},
    		success:function(res)
    		{
    			let r=res.trim();
    			if(r=="no")
    			{
    				$('#email_find').text("이메일이 존재하지 않습니다!!");
    			}
    			else
    			{
    				$('#email_find').text(r);
    			}
    		}
    	})
    })
 });
  </script>
</head>
<body>
  <div class="wrapper row3">
  <div id="breadcrumb" class="clear"> 
    <!-- ################################################################################################ -->
    <ul>
      <li>맛집 상세보기</li>
    </ul>
    <!-- ################################################################################################ --> 
   </div>
  </div>
  <div class="wrapper row3">
   <div style="height:650px">
	   <main class="container clear">
	    <h2 class="sectiontitle">아이디 찾기</h2>
	    <div id="tabs">
		  <ul>
		    <li><a href="#tabs-1">전화번호</a></li>
		    <li><a href="#tabs-2">이메일</a></li>
		  </ul>
		  <div id="tabs-1">
		    <p class="inline">
		      <input type=text id="tel" size=20 class="input-sm">
		      <input type=button value="검색" class="btn btn-sm btn-danger"
		       id="telBtn">
		    </p>
		    <p id="tel_find" style="font-size: 15pt;color:red"></p>
		  </div>
		  <div id="tabs-2">
		    <p class="inline">
		      <input type=text id="email" size=35 class="input-sm">
		      <input type=button value="검색" class="btn btn-sm btn-danger"
		       id="emailBtn">
		    </p>
		    <p id="email_find" style="font-size: 15pt;color:red"></p>
		</div>
	   </main>
   </div>
  </div>
</body>
</html>