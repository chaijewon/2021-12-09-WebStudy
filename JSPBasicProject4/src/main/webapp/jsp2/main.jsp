<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String mode=request.getParameter("mode");
    if(mode==null)
    	mode="0";
    int index=Integer.parseInt(mode);
    String jsp="";
    switch(index)
    {
      case 0:
    	  jsp="content.jsp";
    	  break;
      case 1:
    	  jsp="movie.jsp";
    	  break;
      case 2:
    	  jsp="food.jsp";
    	  break;
      case 3:
    	  jsp="music.jsp";
    	  break;
    }
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
   width:960px;
}
.row {
   margin: 0px auto; /*가운데 정렬*/
}
h1{
    text-align: center;
}

</style>
</head>
<body>
   <%
      pageContext.include("header.jsp");
   %>
   <div class="container">
     <div class="row">
       <% pageContext.include(jsp); %>
     </div>
     
   </div>
</body>
</html>







