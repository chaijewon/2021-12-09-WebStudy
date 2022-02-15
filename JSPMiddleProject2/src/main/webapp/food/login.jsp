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
.row {
  /* 크기 결정 */
  margin: 0px auto; 
  width:350px;
}
h1{
  text-align: center;
}
</style>
</head>
<body>
  <div class="container">
    <h1>LOGIN</h1>
    <div class="row">
     <form method=post action="login_ok.jsp">
	     <table class="table">
	       <tr>
	         <td class="text-right" width=30%>ID</td>
	         <td width=70%>
	           <input type=text name=id size=15 class="input-sm">
	         </td>
	       </tr>
	       <tr>
	         <td class="text-right" width=30%>Password</td>
	         <td width=70%>
	           <input type=password name=pwd size=15 class="input-sm">
	         </td>
	       </tr>
	       <tr>
	        <td colspan="2" class="text-center">
	          <input type=submit value="로그인" class="btn btn-sm btn-primary">
	        </td>
	       </tr>
	     </table>
     </form>
    </div>
  </div>
</body>
</html>






