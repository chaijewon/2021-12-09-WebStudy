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
     <a href="../main/main.do" class="btn btn-lg btn-danger">HOME</a>
     <a href="../food/list.do" class="btn btn-lg btn-success">맛집(Food)</a>
     <a href="../book/list.do" class="btn btn-lg btn-info">책(Books)</a>
     <a href="../music/list.do" class="btn btn-lg btn-primary">음악(Music)</a>
    </div>
    <div style="height: 30px"></div>
    <div class="row">
      <jsp:include page="${main_jsp }"></jsp:include>
    </div>
  </div>
</body>
</html>