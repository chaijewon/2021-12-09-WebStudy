<%@page import="com.sist.dao.FoodDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
    //1. search.jsp에서 전송된 검색어 받기 
    request.setCharacterEncoding("UTF-8");
    String addr=request.getParameter("addr");
    FoodDAO dao=new FoodDAO();
    List<FoodVO> list=dao.foodSerachData(addr);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%
     for(FoodVO vo:list)
     {
  %>
         <%-- 데이터 출력 위치 --%>
         <div class="col-md-3">
		    <div class="thumbnail">
		      <a href="#">
		        <img src="<%= vo.getPoster() %>" alt="Lights" style="width:100%">
		        <div class="caption">
		          <p><%=vo.getName() %></p>
		        </div>
		      </a>
		    </div>
		  </div>
  <%
     }
  %>
</body>
</html>