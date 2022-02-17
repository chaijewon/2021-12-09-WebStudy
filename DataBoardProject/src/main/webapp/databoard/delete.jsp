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
   width:300px;
   margin: 0px auto; /*가운데 정렬*/
}
h1{
    text-align: center;
}
.table td{
  font-size: 9pt;
}
</style>
</head>
<body>
   <div class="container">
     <h1>삭제하기</h1>
     <div class="row">
      <form method=post action="delete_ok.jsp">
      <table class="table">
       <tr>
         <td class="text-center">
         비밀번호:<input type=password name=pwd size=15 class="input-sm">
           <input type=hidden name=no value="${param.no }">
           <%-- ${param.no} request.getParameter("no"); --%>
           <input type=hidden name=page value="${param.page }">
           <%-- ${param.page} request.getParameter("page") --%>
         </td>
       </tr>
       <tr>
         <td class="text-center">
           <button class="btn btn-sm btn-danger">삭제</button>
           <input type=button value="취소" class="btn btn-sm btn-primary"
            onclick="javascript:history.back()">
         </td>
       </tr>
      </table>
      </form>
     </div>
   </div>
</body>
</html>





