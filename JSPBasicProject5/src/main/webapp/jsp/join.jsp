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
   width:700px;
   margin: 0px auto; /*가운데 정렬*/
}
h1{
    text-align: center;
}
</style>
</head>
<body>
  <div class="container">
   <h1>회원가입</h1>
   <div class="row">
    <form method="post" action="join_ok3.jsp">
     <table class="table">
       <tr>
        <th>이름</th>
        <td><input type=text name=name size=15 class="input-sm"
            autocomplete="off"></td>
       </tr>
       <tr>
        <th>성별</th>
        <td>
         <input type=radio value="남자" checked name=sex>남자
         <input type=radio value="여자" name=sex>여자
        </td>
       </tr>
       <tr>
         <th>나이</th>
         <td>
          <input type=number name=age max="70" min="18">
         </td>
       </tr>
       <tr>
         <th>주소</th>
         <td>
          <input type=text name=addr size=50 class="input-sm"
          autocomplete="off">
         </td>
       </tr>
       <tr>
         <th>전화번호</th>
         <td>
           <input type=text name=tel size=20 class="input-sm"
           autocomplete="off">
         </td>
       </tr>
       <tr>
         <td colspan="2" class="text-center">
           <button class="btn btn-sm btn-primary">회원가입</button>
         </td>
       </tr>
     </table>
     </form>
   </div>
  </div>
</body>
</html>







