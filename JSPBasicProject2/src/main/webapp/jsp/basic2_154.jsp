<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
     <%@ incude file="파일지정"%>
     => 정적 페이지 (고정)
     => 동적 페이지 
        <jsp:include page="파일지정(파일을 필요시마다 변경이 가능)">
         => jsp 액션태그 
     => 화면을 분할해서 필요한 위치에 다른 JSP을 조립해서 사용 
     
     => <%@ include%> => JSP를 묶어서 => 컴파일 
     => ***<jsp:include page=""> => JSP를 컴파일한 후에 => HTML을 묶어준다 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
   width:960px;
   height:700px;
   border:1px solid black;
}
.row{
   width:960px;
   height:100px;
   border:1px solid red;
   clear: both;
  
}
.col-sm-3{
  width:150px;
  height:500px;
  border:1px solid green;
}
.col-sm-9{
  width:760px;
  height:500px;
  border:1px solid blue;
}
h1{
    text-align: center;
}
</style>
</head>
<body>
  <div class="container">
   <div class="row">
     <%@ include file="header.jsp" %>
   </div>
   <div class="col-sm-3"><%@ include file="aside.jsp" %></div>
   <div class="col-sm-9"><%@ include file="section.jsp" %></div>
   
   <div class="row">
     <%@ include file="footer.jsp" %>
   </div>
  </div>
</body>
</html>