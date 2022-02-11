<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      JSP
      ---
                 request(요청 정보 전송)
      브라우저(클라이언트)  =========>  웹서버  ======> 웹 컨테이너(톰캣)
        서버로 요청(주소란)                              |
                                                 JSP를 Java로 변경
                                                 컴파일,인터프리터 실행
                                                 -----------------
                                                       |
                                                     결과값 : 메모리에 저장 
                                                     ----- (HTML)|
                       <==========  웹서버 <=======             버퍼(out)
                         response(결과값::HTML을 전송) 
                         --------
                          서버에서 화면 변경 
                            로그인 => 메인으로 이동 
                            회원가입 => 축하화면 이동 
                            글쓰기  => 게시판 목록 
                            수정하기 => 상세보기 
                            
      response : HttpServletResponse => 내장객체 (미리 선언)
       => 응답 정보 (contentType=> html,xml,json) => 브라우저에 알려준다 
       => 리다이렉트 : 화면 이동
       => 데이터 보내기전에 먼저 보내는 데이터 : header
          header : 다운로드창
          
       => setHeader() , sendRedirect("이동할 파일"): 화면 이동 
                        
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
     <h1>내장 객체(response)</h1>
     <div class="row">
      <table class="table">
        <tr>
         <td width=15%>클래스</td>
         <td width=85%>HttpServletResponse</td>
        </tr>
        <tr>
          <td width=15%>기능/역할</td>
          <td width=85%>
            <ul>
             <li>응답 정보: contentType:HTML(text/html)/XML(text/xml)/JSON(text/plain)</li>
             <li>헤더 정보: 실제데이터를 보내기전에 먼저보내는 데이터가 있는 경우(다운로드창)</li>
             <li>서버 파일 이동:리다이렉트</li> 
            </ul>
          </td>
        </tr>
        <tr>
          <td width=15%>주요메소드</td>
          <td width=85%>
            <ul>
             <li>응답정보:setContentType("text/html;charset=UTF-8")</li>
             <li>헤더정보:setHeader("Content-Disposition","attachment;filename=..")</li>
             <li>***이동정보:sendRedirect("파일이동")</li>
             <li>sendRedirect:GET방식,request를 초기화</li>
             <li>파일을 이동할때마다 request는 초기화가 된다</li>
             <li>179page</li>
            </ul>
          </td>
        </tr>
      </table>
     </div>
    </div>
</body>
</html>









