<%@page import="com.sist.dao.CategoryVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
    FoodDAO dao=new FoodDAO();
    List<CategoryVO> list=dao.categoryListData();
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
  /* 크기 결정 */
  margin: 0px auto; 
  width:1024px;
}
h1{
  text-align: center;
}
p{
   font-size: 9pt;
}
</style>
</head>
<body>
   <div class="container">
     <h1>믿고 보는 맛집 리스트</h1>
     <hr>
     <div class="row">
       <%
          for(int i=0;i<12;i++)
          {
        	 CategoryVO vo=list.get(i);
       %>
             <div class="col-md-3">
			    <div class="thumbnail">
			      <a href="category_food.jsp?cno=<%=vo.getCno()%>">
			        <img src="<%=vo.getPoster() %>" alt="Lights" 
			                 style="width:100%;">
			        <div class="caption">
			          <p><%=vo.getTitle() %></p>
			        </div>
			      </a>
			    </div>
			  </div>
       <%
          }
       %>
     </div>
     <h1>지역별 인기 맛집</h1>
     <hr>
     <div class="row">
     <%
          for(int i=12;i<18;i++)
          {
        	 CategoryVO vo=list.get(i);
       %>
             <div class="col-md-4">
			    <div class="thumbnail">
			      <a href="category_food.jsp?cno=<%=vo.getCno()%>">
			        <img src="<%=vo.getPoster() %>" alt="Lights" 
			                 style="width:100%;">
			        <div class="caption">
			          <p><%=vo.getTitle() %></p>
			        </div>
			      </a>
			    </div>
			  </div>
       <%
          }
       %>
     </div>
     <h1>메뉴별 인기 맛집</h1>
     <hr>
     <div class="row">
     <%
          for(int i=18;i<30;i++)
          {
        	 CategoryVO vo=list.get(i);
       %>
             <div class="col-md-3">
			    <div class="thumbnail">
			      <a href="category_food.jsp?cno=<%=vo.getCno()%>">
			        <img src="<%=vo.getPoster() %>" alt="Lights" 
			                 style="width:100%;">
			        <div class="caption">
			          <p><%=vo.getTitle() %></p>
			        </div>
			      </a>
			    </div>
			  </div>
       <%
          }
       %>
     </div>
   </div>
</body>
</html>





