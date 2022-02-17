<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 메모리 할당 --%>
<jsp:useBean id="model" class="com.sist.model.DataBoardModel"/>
<%
    model.databoardDetailData(request);
    // model에 request를 보내주고 결과값을 request에 담아 달라 
    // 클래스,배열 => Call By Reference : 자체에 처리 
%>
<%--
      JSP에서 자바코딩을 하는 것이 아니라 
             ------ 일반 자바파일로 만들어서 처리 (Model)
                    => 1. 목적 : 보안 (jsp=>jsp , java=>class)
                           *** JSP파일은 _jspService()메소드안에 첨부하는 코딩
                                       --------------
                    => 2. 자바파일 : 확장성 (상속,포함) , 재사용 
                    => 3. 역할 : 사용자로부터 요청값을 받는다 
                                ---------------------
                                  JSP =====> Model
                                     request
                                요청에 해당되는 처리 => 결과값을 
                                request에 첨부해서 JSP로 다시 전송 
                                  request.setAttribute()
                                  JSP: 처리 결과만 출력하는 역할 (View)
                                       ------------- EL ${}
                                                     JSTL : 제어문 이용
      public void _jspService()
      {
         // 제작하는 사이트 맞게 코딩을 한다 
      }
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
.table td{
  font-size: 9pt;
}
</style>
</head>
<body>
  <div class="container">
    <h1>내용보기(파일 다운로드)</h1>
    <div class="row">
     <table class="table">
       <tr>
        <th width=20% class="text-center success">번호</th>
        <td width=30% class="text-center">${vo.no }</td>
        <th width=20% class="text-center success">작성일</th>
        <td width=30% class="text-center">${vo.regdate }</td>
       </tr>
       <tr>
        <th width=20% class="text-center success">이름</th>
        <td width=30% class="text-center">${vo.name }</td>
        <th width=20% class="text-center success">조회수</th>
        <td width=30% class="text-center">${vo.hit }</td>
       </tr>
       <tr>
        <th width=20% class="text-center success">제목</th>
        <td colspan="3">${vo.subject }</td>
       </tr>
       <c:if test="${vo.filesize!=0 }">
	       <tr>
	        <th width=20% class="text-center success">첨부파일</th>
	        <td colspan="3">
	          <a href="download.jsp?fn=${vo.filename }">${ vo.filename }</a>(${vo.filesize }Bytes)
	        </td>
	       </tr>
       </c:if>
       <tr>
         <td class="text-left" valign="top" height="200"
           colspan="4">
           ${vo.content }
         </td>
       </tr>
       <tr>
         <td class="text-right" colspan="4">
           <%--
                 detail.jsp ==> Model ==> reply.jsp 
                   답변하기       (reply.jsp에 필요한 데이터를 전송)
                 웹 => JSP 
                       먼저 실행 => 자바 
                       HTML에 데이터 출력 
                       
                 사용자 요청 ===> Controller ===== Model ==== Controller
                                       HandlerMapping          ViewResolver
                          ===> View(JSP)
                 사용자 중심의 프로그램 
                 -----------------
                  결재 => 버튼 ...
            --%>
           <a href="reply.jsp?no=${vo.no }&page=${page}" class="btn btn-xs btn-danger">답변</a>
           <a href="update.jsp?no=${vo.no }&page=${page}" class="btn btn-xs btn-warning">수정</a>
           <a href="delete.jsp?no=${vo.no}&page=${page}" class="btn btn-xs btn-info">삭제</a>
           <a href="list.jsp?page=${page }" class="btn btn-xs btn-success">목록</a>
         </td>
       </tr>
     </table>
    </div>
  </div>
</body>
</html>





