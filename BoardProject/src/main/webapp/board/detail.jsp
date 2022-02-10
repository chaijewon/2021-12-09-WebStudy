<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
    // 사용자가 보내준 데이터 받기 
    // detail.jsp?no=1
    String no=request.getParameter("no");
    // 오라클로부터 데이터 읽기
    BoardDAO dao=new BoardDAO();
    BoardVO vo=dao.boardDetailData(Integer.parseInt(no));
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
    <h1>내용보기</h1>
    <div class="row">
     <table class="table">
       <tr>
        <th width="20%" class="text-center warning">번호</th>
        <td width="30%" class="text-center"><%=vo.getNo() %></td>
        <th width="20%" class="text-center warning">작성일</th>
        <td width="30%" class="text-center"><%=vo.getRegdate().toString() %></td>
       </tr>
       <tr>
        <th width="20%" class="text-center warning">작성자</th>
        <td width="30%" class="text-center"><%=vo.getName() %></td>
        <th width="20%" class="text-center warning">조회수</th>
        <td width="30%" class="text-center"><%=vo.getHit() %></td>
       </tr>
       <tr>
        <th width="20%" class="text-center warning">제목</th>
        <td colspan="3"><%=vo.getSubject() %></td>
       </tr>
       <tr>
         <td colspan="4" class="text-left" valign="top" height="200">
          <pre style="white-space: pre-wrap;border:none;background-color:white"><%=vo.getContent() %></pre>
         </td>
       </tr>
       <tr>
         <%-- 게시물번호 (수정,삭제) , 페이지 --%>
         <td colspan="4" class="text-right">
          <a href="update.jsp?no=<%=vo.getNo() %>" class="btn btn-xs btn-success">수정</a>
          <a href="delete.jsp?no=<%=vo.getNo() %>" class="btn btn-xs btn-info">삭제</a>
          <a href="list.jsp" class="btn btn-xs btn-danger">목록</a>
         </td>
       </tr>
     </table>
    </div>
   </div>
</body>
</html>








