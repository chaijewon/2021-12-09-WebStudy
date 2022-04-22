<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container-fluid{
   margin-top: 70px;
}
</style>
</head>
<body>
  <div class="container-fluid">
   <div class="row">
    <c:forEach var="vo" items="${list }">
	     <div class="col-md-4">
		    <div class="thumbnail">
		      <a href="#">
		        <%--
		           ${vo.product_poster}
		         --%>
		        <img src="${vo.getProduct_poster()}" style="width:100%">
		        <div class="caption">
		          <p style="font-size: 8px">${vo.getProduct_name()}</p>
		        </div>
		      </a>
		    </div>
		  </div>
	 </c:forEach>
	 <%--
	       <%=  => ${
	       %>       }
	  --%>
   </div>
   <div class="row">
     <div class="text-center">
       <a href="list.do?page=${curpage>1?curpage-1:curpage}" class="btn btn-sm btn-primary">이전</a>
        ${ curpage} page / ${totalpage } pages
       <a href="list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-primary">다음</a>
     </div>
   </div>
  </div>
</body>
</html>
