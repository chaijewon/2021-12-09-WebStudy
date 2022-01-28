<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
    MusicDAO dao=new MusicDAO();
    List<MusicVO> list=dao.musicListData();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
img{
  width:30px;
  height: 30px;
}
</style>
</head>
<body>
   <center>
     <h1>뮤직 Top200</h1>
     <table border=1 bordercolor=black width=800>
       <tr bgcolor="#ccffcc">
        <th>순위</th>
        <th></th>
        <th>곡명</th>
        <th>가수명</th>
       </tr>
       <%
          for(MusicVO vo:list)
          {
       %>
             <tr>
               <td align=center><%=vo.getNo() %></td>
               <td align=center><img src="<%=vo.getPoster()%>"></td>
               <td><%=vo.getTitle() %></td>
               <td><%=vo.getSinger() %>
             </tr>
       <%
          }
       %>
     </table>
   </center>
</body>
</html>