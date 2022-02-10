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
   width:800px;
   margin: 0px auto; /*가운데 정렬*/
}
h1{
    text-align: center;
}
</style>
</head>
<body>
   <div class="container">
     <h1>글쓰기</h1>
     <div class="row">
     <!-- 데이터 전송 : POST 
          전송할 데이터를 모아서 한번에 전송 => <form>
          데이터를 감추고 insert_ok.jsp로 전송 
          
          JSP => 자바에서 읽어온 데이터를 출력 (출력담당)
              => 사용자 입력값을 받아서 처리 ( _ok.jsp )
                 --------------------- 서버에서 변경된 화면으로 이동  
                         => 리다이렉트 => response.sendRedirect()
              => 사용자 입력 
                 --------
                 insert ==> insert_ok ==> list
                 update ==> update_ok ==> detail
                 delete ==> delete_ok ==> list
                 --------------------------------
                   사용자 입력 ==> list,detail
                   
                 join ==> join_ok ==> main
                          -------
                 회원가입 입력창 ===> 입력데이터를 받아서 처리 ===> 화면 이동 
                 login ==> login_ok ==> main
              => 한개의 JSP에서 처리 방법 
                 => 한개를 입력하는 경우 (우편번호 검색 , 아이디 중복체크)
                 => 입력창(jsp) : 입력데이터를 받아서 처리 (jsp)
                    insert.jsp   insert_ok.jsp(서버에서 화면 이동)
                                 ------------- HTML을 구현하지 않는다
                    insert.jsp에서 동시에 처리 (Ajax)
                     1. 입력요청 
                     2. 데이터 전송
                     3. 화면이동 
              => 프로젝트 
                 1차 : MVC , DAO (SQL) , Ajax : 화면 UI
                 2차 : Spring (Open Api) : 기능
                 3차 : 최신 기술 
                 
     -->
     <form method=post action="insert_ok.jsp">
      <table class="table">
        <tr>
         <th width=15% class="text-right">이름</th>
         <td width=85%><input type=text name=name size=15 class="input-sm"></td>
        </tr>
        <tr>
         <th width=15% class="text-right">제목</th>
         <td width=85%><input type=text name=subject size=45 class="input-sm"></td>
        </tr>
        <tr>
         <th width=15% class="text-right">내용</th>
         <td width=85%>
          <textarea rows="8" cols="55" name="content"></textarea>
         </td>
        </tr>
        <tr>
         <th width=15% class="text-right">비밀번호</th>
         <td width=85%><input type=password name=pwd size=10 class="input-sm"></td>
        </tr>
        <tr>
          <td colspan="2" class="text-center">
           <input type=submit value="글쓰기" class="btn btn-sm btn-primary">
           <input type=button value="취소" class="btn btn-sm btn-danger"
             onclick="javascript:history.back()">
          </td>
        </tr>
      </table>
      </form>
     </div>
   </div>
</body>
</html>






