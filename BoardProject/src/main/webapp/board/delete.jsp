<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 1. 사용자 보낸준 요청 데이터 받기 
    // 삭제 => 중복이 안되는 값 (게시물 번호) => 한글변환은 한글데이터일 경우에만 처리 
    // 숫자 / 알파벳 => 처리하지 않는다 (ASC , Unicode)
    String no=request.getParameter("no");
%>
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
   width:350px;
   margin: 0px auto; /*가운데 정렬*/
}
h1{
    text-align: center;
}

</style>
</head>
<%--
      1. 사용자 요청 (요청 화면) => 글쓰기폼 , 수정폼 , 삭제폼
         => HTML / CSS / JavaScript (Front)
      2. 사용자가 요청한 데이터를 받는다 
         => _ok.jsp
      3. 받은 데이터를 오라클로 전송 => 오라클에서 SQL문장으로 처리 
         => ~DAO
      4. 어떤 화면을 보여 줄지 선택 
         => response.sendRedirect("보여줄 JSP")
         
      ** 목록 출력 (선택 => 페이지)
         ------- 상세보기 
         
      예) 
          회원가입 버튼 클릭 ==> 회원 가입 폼 가입/취소 ===> 처리 ==> 메인폼
                                                join_ok.jsp
          로그인 버튼 클릭 ==> 로그인 폼 ===> 처리 ==> 메인폼 
                                        --- login_ok.jsp 
          웹 => 흐름 (이동/처리) => 중심 데이터베이스 연결 
                  request      vo
          보여주는 JSP => 처리 JSP => DAO
                           <= 이동 화면 지정 
                          response 
 --%>
<body>
   <div class="container">
     <h1>삭제하기</h1>
     <div class="row">
     <form method="post" action="delete_ok.jsp">
      <table class="table">
        <tr>
          <td class="text-center">비밀번호:<input type=password name=pwd size=15 class="input-sm">
            <input type=hidden name=no value="<%=no%>">
            <%--
               hidden => 화면 출력은 없고 데이터는 전송
             --%>
          </td>
        </tr>
        <tr>
          <td class="text-center">
            <input type=submit value="삭제" class="btn btn-sm btn-danger">
            <input type=button value="취소" class="btn btn-sm btn-success"
             onclick="javascript:history.back()">
          </td>
        </tr>
       </table>
      </form>
     </div>
   </div>
</body>
</html>














