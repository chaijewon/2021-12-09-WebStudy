<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
  margin-top: 50px;
}
.row {
   margin: 0px auto;
   width:500px;
}
h1{
    text-align: center;
}
</style>
<script type="text/javascript">
$(function(){
	$('#tabs').tabs()
})
</script>
</head>
<body>
 <div id="tabs">
  <ul>
    <li><a href="#tabs-1">전화번호</a></li>
    <li><a href="#tabs-2">이메일</a></li>
  </ul>
  <div id="tabs-1">
    <p>
      <input type=text size=20 class="input-sm">
      <input type=button value="검색" class="btn btn-sm btn-danger">
    </p>
  </div>
  <div id="tabs-2">
    <p>
      <input type=text size=40 class="input-sm">
      <input type=button value="검색" class="btn btn-sm btn-success">
    </p>
  </div>
</div>
</body>
</html>