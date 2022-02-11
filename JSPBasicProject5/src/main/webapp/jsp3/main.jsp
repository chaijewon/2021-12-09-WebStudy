<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   height:760px;
   border:1px solid black;
}
.row {
   width:930px;
   margin: 0px auto; /*가운데 정렬*/
   height: 100px;
   border:1px solid red;
   clear: both;
}
h1{
    text-align: center;
}
.col-sm-2{
  width:180px;
  height:460px;
  border:1px solid blue;
}
.col-sm-10{
  width:720px;
  height:460px;
  border:1px solid blue;
}
</style>
</head>
<body>
   <div class="container">
    <div class="row">
      <jsp:include page="header.jsp"></jsp:include>
      <%--
           pageContext.include("header.jsp")
           => 주의점 
              요청 => main.jsp로 전송한다 
              => 포함하고 있는 모든 JSP가 request를 공유할 수 있다 
              => 포함되어 있는 JSP에서 단독으로 수행 => 해당 JSP만 화면에 보여 준다 
              => CSS/JavaScript => main에 설정 (충돌이 없게)
              => 경로명 
              *** header,nav,aside... => main안에 include => main.jsp
              => 분업 
       --%>
    </div>
    <div class="row">
      <jsp:include page="nav.jsp"></jsp:include>
    </div>
    <div class="col-sm-2">
      <jsp:include page="aside.jsp"></jsp:include>
    </div>
    <div class="col-sm-10">
      <jsp:include page="section.jsp"></jsp:include>
    </div>
    <div class="row">
      <jsp:include page="footer.jsp"></jsp:include>
    </div>
   </div>
</body>
</html>



