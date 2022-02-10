<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
     MainDAO dao=new MainDAO();
     List<BookVO> list=dao.bookListData();
     for(BookVO vo:list)
     {
    	 String title=vo.getTitle();
    	 if(title.length()>16)
    	 {
    		 title=title.substring(0,16)+"...";
    	 }
    	 vo.setTitle(title);
     }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%
      for(BookVO vo:list)
      {
  %>
           <div class="col-md-3">
		    <div class="thumbnail">
		      <a href="#">
		        <img src="<%=vo.getPoster() %>" alt="Lights" 
		         style="width:220px;height:200px;"
		        >
		        <div class="caption">
		          <p style="font-size:8pt"><%=vo.getTitle() %></p>
		        </div>
		      </a>
		    </div>
		  </div>
  <%
      }
  %>
</body>
</html>