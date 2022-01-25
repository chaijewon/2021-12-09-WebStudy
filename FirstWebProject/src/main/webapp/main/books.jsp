<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%-- 데이터 읽기 --%>
<%
   // 자바 코딩 
   String strPage=request.getParameter("page");
   System.out.println("page="+strPage);
   if(strPage==null)
	   strPage="1";
   int curpage=Integer.parseInt(strPage);
   BooksDAO dao=new BooksDAO();
   List<BooksVO> list=dao.booksListData(curpage);
   int totalpage=dao.booksTotalPage();
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
.row{
   margin: 0px auto; 
   width:960px;
}
</style>
</head>
<body>
  <div class="container">
    <div class="row">
     <%
        for(BooksVO vo:list)
        {
     %>
            <div class="col-md-4">
		      <div class="thumbnail">
		        <a href="#" target="_blank">
		          <img src="<%=vo.getPoster() %>" alt="Lights" style="width:320px;height:350px">
		          <div class="caption">
		            <p><%=vo.getTitle().length()>20
		                 ?vo.getTitle().substring(0,20):vo.getTitle() %></p>
		          </div>
		        </a>
		      </div>
		    </div>
     <%
        }
     %>
    </div>
    <div class="row">
      <div class="text-center">
        <a class="btn btn-sm btn-danger" 
        href="books.jsp?page=<%=curpage>1?curpage-1:curpage%>">이전</a>
         <%=curpage %> page / <%=totalpage %> pages
        <a class="btn btn-sm btn-success" 
          href="books.jsp?page=<%=curpage<totalpage?curpage+1:curpage%>"
        >다음</a>
      </div>
    </div>
  </div>
</body>
</html>







