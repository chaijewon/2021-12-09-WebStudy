<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
    // 1. 사용자가 보내준 데이터를 받는다 (맛집 번호) 
    String no=request.getParameter("no");
    // 2. 맛집번호를 오라클로 보내고 오라클에 저장된 데이터 받기 
    FoodService dao=new FoodService();
    FoodVO vo=dao.foodDetailData(Integer.parseInt(no));
    // => 자바에서 데이터 읽기 : 오라클 , 웹 크롤링 , 파일 
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
   <div class="row">
     <table class="table">
       <tr>
         <%
             StringTokenizer st=new StringTokenizer(vo.getPoster(),"^");
             while(st.hasMoreTokens())
             {
         %>
               <td class="text-center">
                <img src="<%=st.nextToken() %>" width=100%>
               </td>
         <%
             }
         %>
       </tr>
     </table>
   </div>
   <div style="height: 50px">
   <div class="col-sm-8">
     <h3><%=vo.getName() %>&nbsp;<span style="color:orange"><%=vo.getScore() %></span></h3>
     <table class="table">
      <tr>
       <th style="color:gray" width=10%>주소</th>
       <td width=90%>
         <%
            String addr=vo.getAddress();
            String s1=addr.substring(0,addr.lastIndexOf("지"));
            String s2=addr.substring(addr.lastIndexOf("지"));
         %>
         <%=s1%><br>
         <span style="color:gray"><%=s2 %></span>
       </td>
      </tr>
      <tr>
        <th style="color:gray" width=10%>전화번호</th>
        <td width=90%>
         <%= vo.getTel() %>
        </td>
      </tr>
      <tr>
        <th style="color:gray" width=10%>음식종류</th>
        <td width=90%>
         <%= vo.getType() %>
        </td>
      </tr>
      <%
         if(!vo.getPrice().equals("no"))
         {
      %>
      <tr>
        <th style="color:gray" width=10%>가격대</th>
        <td width=90%>
         <%= vo.getPrice() %>
        </td>
      </tr>
      <%
         }
      %>
      <%
         if(!vo.getParking().equals("no"))
         {
      %>
      <tr>
        <th style="color:gray" width=10%>주차</th>
        <td width=90%>
         <%= vo.getParking() %>
        </td>
      </tr>
      <%
         }
      %>
      <%
         if(!vo.getTime().equals("no"))
         {
      %>
      <tr>
        <th style="color:gray" width=10%>영업시간</th>
        <td width=90%>
         <%= vo.getTime() %>
        </td>
      </tr>
      <%
         }
      %>
      <%
         if(!vo.getMenu().equals("no"))
         {
      %>
      <tr>
        <th style="color:gray" width=10%>메뉴</th>
        <td width=90%>
           <ul>
             <%
                 st=new StringTokenizer(vo.getMenu(),"원");
                 while(st.hasMoreTokens())
                 {
             %>
                     <li><%=st.nextToken() %>원</li>
             <%
                 }
             %>
           </ul>
        </td>
      </tr>
      
      <%
         }
      %>
      <tr>
        <td colspan="2" class="text-right">
          <a href="#" class="btn btn-sm btn-success">찜하기</a>
          <a href="#" class="btn btn-sm btn-danger">예약하기</a>
          <a href="javascript:history.back()" class="btn btn-sm btn-primary">목록</a>
        </td>
      </tr>
     </table>
   </div>
   <div class="col-sm-4">
   
   </div>
  </div>
</body>
</html>







