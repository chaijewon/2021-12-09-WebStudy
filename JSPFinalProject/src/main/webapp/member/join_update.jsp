<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
//shadowbox초기화 
Shadowbox.init({
	players:['iframe']
})
$(function(){
	
	$('#postBtn').click(function(){
		// 우편번호 검색 처리 
		new daum.Postcode({
			oncomplete:function(data)
			{
				$('#post').val(data.zonecode)
				$('#addr1').val(data.address)
			}
		}).open()
	})
	$('#joinBtn').click(function(){
		// 회원 가입 처리 (유효성 검사) => NOT NULL , PRIMARY KEY , UNIQUE
		// id 
		let id=$('#join_id').val();
		if(id.trim()=="")
		{
			alert("중복체크 버튼을 클릭하세요!!")
			return;
		}
		// pwd
		let pwd=$('#join_pwd').val()
		if(pwd.trim()=="")
		{
			$('#join_pwd').focus();
			return;
		}
		
		// name
		let name=$('#name').val()
		if(name.trim()=="")
		{
			$('#name').focus();
			return;
		}
		// birthday
		let day=$('#day').val()
		if(day.trim()=="")
		{
			alert("생년월일을 입력하세요!!") //
			return;
		}
		// post 
		let post=$('#post').val()
		if(post.trim()=="")
		{
			alert("우편번호를 검색하세요")
			return;
		}
		// tel
		let tel2=$('#tel2').val()
		if(tel2.trim()=="")
		{
			$('#tel2').focus()
			return;
		}
		// content
		let cont=$('#content').val()
		if(cont.trim()=="")
		{
			$('#content').focus()
			return;
		}
		
		$('#join_frm').submit()
		
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
   <main class="container clear">
   <h2 class="sectiontitle">회원 수정</h2>
   <form method="post" action="../member/join_update_ok.do" name="join_frm" id="join_frm">
    <table class="table">
      <tr>
       <td class="text-right" width=15%>아이디</td>
       <td width=85% class="inline">
         <input type=text name=id id="join_id" size=15 class="input-sm" readonly
           value="${vo.id }"
         >
       </td>
      </tr>
      <tr>
       <td class="text-right" width=15%>비밀번호</td>
       <td width=85% class="inline">
         <input type=password name=pwd id=join_pwd size=15 class="input-sm">
       </td>
      </tr>
      <tr>
       <td class="text-right" width=15%>이름</td>
       <td width=85%>
         <input type=text name=name id=name size=15 class="input-sm"
          value="${vo.name }"
         >
       </td>
      </tr>
      <tr>
       <td class="text-right" width=15%>성별</td>
       <td width=85% class="inline">
         <input type=radio value="남자" name=sex ${vo.sex=="남자"?"checked":"" }>남자
         <input type=radio value="여자" name=sex ${vo.sex=="여자"?"checked":"" }>여자
       </td>
      </tr>
      <tr>
       <td class="text-right" width=15%>생년월일</td>
       <td width=85%>
         <input type=date size=20 name=birthday class="input-sm" id="day"
          value="${vo.birthday }"
         >
       </td>
      </tr>
      <tr>
       <td class="text-right" width=15%>이메일</td>
       <td width=85%>
         <input type=text name=email id=email size=50 class="input-sm"
          value="${vo.email }"
         >
       </td>
      </tr>
      <tr>
       <td class="text-right" width=15%>우편번호</td>
       <td width=85% class='inline'>
         <input type=text name=post id=post size=10 class="input-sm" readonly
           value="${vo.post }"
         >
         <input type=button id="postBtn" value="우편번호찾기"
          class="btn btn-sm btn-danger">
       </td>
      </tr>
      <tr>
       <td class="text-right" width=15%>주소</td>
       <td width=85%>
         <input type=text name=addr1 id=addr1 size=50 class="input-sm" readonly
          value="${vo.addr1 }"
         >
       </td>
      </tr>
      <tr>
       <td class="text-right" width=15%>상세주소</td>
       <td width=85%>
         <input type=text name=addr2 id=addr2 size=50 class="input-sm"
          value="${vo.addr2 }"
         >
       </td>
      </tr>
      <tr>
       <td class="text-right" width=15%>전화번호</td>
       <td width=85% class="inline">
         <input type=text name=tel1 id=tel1 size=7 class="input-sm" value="010">
         <input type=text name=tel2 id=tel2 size=20 class="input-sm"
          value="${fn:substring(vo.tel,4,13) }"
         >
       </td>
      </tr>
      <tr>
       <td class="text-right" width=15%>소개</td>
       <td width=85%>
         <textarea rows="8" cols="55" id="content" name="content">${vo.content }</textarea>
       </td>
      </tr>
      <tr>
        <td colspan="2" class="text-center">
         <input type=button class="btn btn-sm btn-primary" value="회원수정"
           id="joinBtn"
         >
         <input type=button class="btn btn-sm btn-danger" value="취소"
          onclick="javascript:history.back()"
         >
        </td>
      </tr>
    </table>
    </form>
   </main>
  </div>
</body>
</html>

