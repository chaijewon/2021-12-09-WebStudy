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
h1{
   text-align: center;
}
.row{
  margin: 0px auto;
  width:450px;
}
</style>
</head>
<body>
   <div class="container">
    <h1>개인정보</h1>
    <div class="row">
    <form method=post action="output.jsp">
      <table class="table">
        <tr>
          <th class="text-right">이름</th>
          <%-- id,class:(디자인,자바스크립트) , name:자바에 입력값에 대한 구분자
               request.getParameter("name");
           --%>
          <td><input type=text name=name size=15></td>
        </tr>
        <tr>
          <th class="text-right">성별</th>
          <td>
            <input type=radio value="남자" name=sex checked>남자
            <input type=radio value="여자" name=sex>여자
          </td>
        </tr>
        <tr>
          <th class="text-right">지역</th>
          <td>
            <select name="loc">
             <option>서울</option>
             <option>경기</option>
             <option>인천</option>
             <option>부산</option>
             <option>제주</option>
            </select>
          </td>
        </tr>
        <tr>
          <th class="text-right">소개</th>
          <td>
            <textarea rows="5" cols="30" name="content"></textarea>
          </td>
        </tr>
        <tr>
         <th class="text-right">취미</th>
         <td>
           <input type="checkbox" name=hobby value="운동">운동
           <input type="checkbox" name=hobby value="낚시">낚시
           <input type="checkbox" name=hobby value="등산">등산
           <input type="checkbox" name=hobby value="독서">독서
           <input type="checkbox" name=hobby value="여행">여행
         </td>
        </tr>
        <tr>
          <td colspan="2" class="text-center">
            <input type=submit class="btn btn-sm btn-danger" value="전송">
          </td>
        </tr>
      </table>
      </form>
    </div>
   </div>
</body>
</html>
          






