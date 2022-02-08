<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      JSP => 자바 코딩 위치 <% %> , <%= %>
             지시자 (page)
             내장 객체 
             JSP액션 태그
             자바빈즈 
             ------------
             데이터베이스 연결 : JDBC => DBCP => ORM 
             에러 처리 
             Session / Cookie 
             ------------------------------------ Basic (model1)
             middle 
             ------ MVC (실제 실무) => model2
                    XML / Annotation
                    ----------------------- 라이브러리 (스프링)
                                            ORM (마이바티스)
             => AWS
             => Spring-Boot : JPA (옵션) => VueJS / ReactJS
                -----------------
              요청 (request)    요청처리
     브라우저 ==========> 자바 <==========> 오라클 
            <==========
              응답 (response) => HTML로 응답 (브라우저에서 실행)
     ------             ----------------------
     클라이언트                   서버 
     
     JSP에서 제공하는 내장객체 : 미리 생성후에 사용이 가능하게 만든다 
     --------------------
       ***request : 사용자 정보(브라우저 정보) => 접속자의 IP , 서버주소 
                    사용자의 요청 정보를 가지고 있다 
                    사용자가 데이터를 전송 => request를 이용해서 데이터를 받는다 
                    추가해서 재전송이 가능 
       ***response : 응답 정보 (HTML , Cookie)
                     화면 변경이 가능 (서버) => redirect()
       ***session
       out 
       ***pageContext
       page => this
       ***application
       config => web.xml
       exception => try~catch
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
     <h1>내장객체 (request)</h1>
     <div class="row">
       <table class="table">
         <tr>
          <th class="text-center success">클래스</th>
          <td>HttpServletRequest</td>
         </tr>
         <tr>
           <th class="text-center success">기능</th>
           <td>
             <h3>브라우저 정보(클라이언트 정보 포함)</h3>
             <ul>
              <li>서버 정보(URL,URI,ContextPath)</li>
              <li>클라이언트 정보(IP,PORT,METHOD(GET/POST))</li>
              <li>요청 정보(단일,다중)</li>
              <li>한글 처리</li>
              <li>추가해서 재전송</li>
             </ul>
             <sup style="color:red">※데이터를 다른 파일로 전송(URL=> ?변수=값)</sup>
           </td>
         </tr>
         <tr>
          <th class="text-center success">주요 메소드</th>
          <td>
            <ul>
             <li>***getRemoteAddr():접속자의 IP</li>
             <li>getServerInfo():서버정보</li>
             <li>getPort():사용자 접속시 연결선</li>
             <li>getMethod():데이터 전송방식(GET/POST)</li>
             <li>***getRequestURL():URL</li>
             <li>***getRequestURI():URI</li>
             <li>***getContextPath():루트</li>
             <li>*********getParameter():요청시에 요청값을 받는다</li>
             <li>getParameterValues():요청이값이 다중으로 : CheckBox</li>
             <li>*********setAttribute(),getAttribute():데이터 추가 재전송:MVC</li>
             <li>*********setCharterEncoding(): 한글변환 
                 전송 (1byte) => 받을 경우 (2byte)
             </li>
            </ul>
            http://localhost /JSPBasicProject2/jsp2/basic1_171.jsp<br>
            ---------------- -------------------------------------<br>
               서버정보            사용자 요청한 부분 (URI)<br>
                             -----------------
                                ContextPath
          </td>
         </tr>
       </table>
     </div>
   </div>
</body>
</html>









