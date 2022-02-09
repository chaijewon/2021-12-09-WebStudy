<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
    //1. 이전 JSP에 보내준 데이터를 받는다
    String cno=request.getParameter("cno"); // 문자로만 받는다 
    //2. cno에 해당되는 데이터베이스 값을 가지고 온다 
    FoodService dao=new FoodService();
    List<FoodVO> list=dao.categoryListData(Integer.parseInt(cno));
    CategoryVO vo=dao.categoryInfoData(Integer.parseInt(cno));
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
}
.row {
   width:960px;
   margin: 0px auto; /*가운데 정렬*/
}

</style>
</head>
<body>
  <div class="container">
    <div class="jumbotron">
     <h1 class="text-center"><%=vo.getTitle() %></h1>
     <h4 class="text-center" style="color:gray"><%=vo.getSubject() %></h4>
    </div>
    <div class="row">
    <table class="table">
    <tr>
    <td>
   <%
     for(FoodVO fvo:list)
     {
   %>
       <table class="table">
         <tr>
           <td width=30% class="text-center" rowspan="4">
            <a href="food_detail.jsp?no=<%=fvo.getNo()%>">
             <img src="<%=fvo.getPoster() %>" width=100% class="img-rounded">
            </a>
           </td>
           <td width=70%><h1><a href="food_detail.jsp?no=<%=fvo.getNo()%>"><%=fvo.getName() %></a>&nbsp;<span style="color:orange"><%=fvo.getScore() %></span></h1></td>
         </tr>
         <tr>
           <td width=70%>주소:<%=fvo.getAddress() %></td>
         </tr>
         <tr>
           <td width=70%>전화:<%=fvo.getTel() %></td>
         </tr>
         <tr>
           <td width=70%>음식종류:<%=fvo.getType() %></td>
         </tr>
         
       </table>
   <%
     }
   %>
   </td>
   </tr>
   </table>
    </div>
  </div>
</body>
</html>





           