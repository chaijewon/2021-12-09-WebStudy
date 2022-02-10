<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*,java.util.*"%>
<%
    // 페이지 나누기 => 디폴트 페이지 설정 => (1page)
    // 사용자로부터 페이지를 받는다 
    String strPage=request.getParameter("page");
    if(strPage==null) // 첫페이지면
       strPage="1";
    // 현재페이지 지정 
    int curpage=Integer.parseInt(strPage);
    // 현재페이지에 해당되는 데이터 얻기
    BoardDAO dao=new BoardDAO();
    List<BoardVO> list=dao.boardListData(curpage);
    // 총페이지 얻기 
    int totalpage=dao.boardTotalPage();
    
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
   <h1>자유 게시판</h1>
   <div class="row">
    <table class="table">
     <tr>
      <td>
       <a href="insert.jsp" class="btn btn-sm btn-danger">새글</a>
      </td>
     </tr>
    </table>
    <div style="height: 450px">
    <table class="table">
      <tr class="warning">
       <th class="text-center" width=10%>번호</th>
       <th class="text-center" width=45%>제목</th>
       <th class="text-center" width=15%>작성자</th>
       <th class="text-center" width=20%>작성일</th>
       <th class="text-center" width=10%>조회수</th>
      </tr>
      <%
         for(BoardVO vo:list)
         {
      %>
             <tr>
		       <td class="text-center" width=10%><%=vo.getNo() %></td>
		       <td width=45%>
		        <a href="detail.jsp?no=<%=vo.getNo()%>">
		         <%=vo.getSubject() %>
		        </a>
		        &nbsp;
		        <%
		           String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		           if(today.equals(vo.getRegdate().toString()))
		           {
		        %>
		              <sup style="color:red">new</sup>
		        <%
		           }
		        %>
		       </td>
		       <td class="text-center" width=15%><%=vo.getName() %></td>
		       <td class="text-center" width=20%><%=vo.getRegdate().toString() %></td>
		       <td class="text-center" width=10%><%=vo.getHit() %></td>
		      </tr>
      <%
         }
      %>
    </table>
    </div>
    <table class="table">
      <tr>
       <td class="text-left">
        Search:
        <select name="fs" class="input-sm">
          <option value="name">이름</option>
          <option value="subject">제목</option>
          <option value="content">내용</option>
        </select>
        <input type=text size=15 class="input-sm">
        <input type=button class="btn btn-sm btn-primary" value="검색">
       </td>
       <td class="text-right">
         <a href="list.jsp?page=<%=curpage>1?curpage-1:curpage %>" class="btn btn-sm btn-danger">이전</a>
           <%=curpage %> page / <%=totalpage %> pages
         <a href="list.jsp?page=<%=curpage<totalpage?curpage+1:curpage %>" class="btn btn-sm btn-success">다음</a>
       </td>
      </tr>
    </table>
   </div>
  </div>
</body>
</html>








