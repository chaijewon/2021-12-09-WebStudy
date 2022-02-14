<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%-- 상세보기 (HTML) --%>
<%
   // 사용자가 보내준 데이터를 받는다 
   // response.sendRedirect("detail.jsp?no="+no);
   String no=request.getParameter("no");
   // 데이터베이스에서 사용자가 보내준 번호에 대한 데이터를 읽어 온다 
   BooksDAO dao=new BooksDAO();
   // JSP / Spring => 흐름 (동작순서)=> 순서대로 코딩 
   // JSP(데이터 전송(<a><form>)) => DAO => JSP화면 출력 
   BooksVO vo=dao.booksDetailData(Integer.parseInt(no));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- 
    서블릿은 설정 => 실행순서(생명주기)
                  init() => service() => destory()
    => 1. 페이징기법 
       2. Cookie설정 
       3. Session설정 => 댓글 (로그인처리) id,name => 댓글 
 -->
<style type="text/css">
.container{
  margin-top: 50px;
}
.row {
  /* 크기 결정 */
  margin: 0px auto; 
  width:700px;
}
h1{
    text-align:center;
}
</style>
</head>
<body>
   <div class="container">
     <h1>&lt;<%= vo.getTitle() %>&gt; 상세보기</h1>
     <div class="row">
      <table class="table">
        <tr>
         <td width=30% class="text-center" rowspan="6">
           <img src="<%=vo.getPoster() %>" width=100%>
         </td>
         <td width=70%><%=vo.getTitle() %></td>
        </tr>
        <tr>
         <td width=70%>
           <%=vo.getContent() %>
         </td>
        </tr>
        <tr>
         <td width=70%>
           <%= vo.getTags() %>
         </td>
        </tr>
        <tr>
         <td width=70%>
           <%= vo.getAuthor() %>
         </td>
        </tr>
        <tr>
         <td width=70%>
           <%= vo.getPrice() %>
         </td>
        </tr>
        <tr>
         <td width=70%>
           <%= vo.getRegdate() %>
         </td>
        </tr>
        <tr>
          <td colspan="2" class="text-right">
           <a href="list.jsp" class="btn btn-xs btn-success">목록</a>
          </td>
        </tr>
      </table>
     </div>
   </div>
</body>
</html>








