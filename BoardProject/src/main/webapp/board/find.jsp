<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
    // 1. 사용자가 보내준 데이터 받기 (한글여부) 
    request.setCharacterEncoding("UTF-8");
    String fs=request.getParameter("fs");//컬럼명
    String ss=request.getParameter("ss");//검색어 
    // 2. DAO로 전송해서 오라클에서 찾은 데이터를 읽어온다 
    /*
        1. 사용자 요청값을 받는다 : request ==> jsp
        2. 요청값을 DAO로 전송 => 결과값 받기 ==> dao
        3. 브라우저에 화면 출력              ==> jsp
    */
    BoardDAO dao=new BoardDAO();
    List<BoardVO> list=dao.boardFind(fs, ss);
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
   width:900px;
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
   <h1>검색 결과</h1>
   <div class="row">
    <table class="table">
     <tr>
      <td class="text-right">검색결과:<%=list.size() %>건</td>
     </tr>
    </table>
    <%
      if(list.size()<1)
      {
    %>
    <table class="table">
      <tr>
       <td class="text-center">검색결과가 없습니다</td>
      </tr>
    </table>
    <%
      }
      else
      {
    %>
    <table class="table">
      <tr class="danger">
        <th class="text-center" width=10%>번호</th>
        <th class="text-center" width=45%>제목</th>
        <th class="text-center" width=15%>작성자</th>
        <th class="text-center" width=20%>작성일</th>
        <th class="text-center" width=10%>조회수</th>
      </tr>
      <%--  검색된 데이터 출력 위치 --%>
      <%
         for(BoardVO vo:list)
         {
      %>
             <tr>
		        <td class="text-center" width=10%><%=vo.getNo() %></td>
		        <td width=45%><%=vo.getSubject() %></td>
		        <td class="text-center" width=15%><%=vo.getName() %></td>
		        <td class="text-center" width=20%><%=vo.getRegdate().toString() %></td>
		        <td class="text-center" width=10%><%=vo.getHit() %></td>
		      </tr>
      <% 
         }
      %>
    </table>
    <%
      }
    %>
   </div>
  </div>
</body>
</html>






