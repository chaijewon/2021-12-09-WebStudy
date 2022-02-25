<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
    SeoulDAO dao=new SeoulDAO();
    List<SeoulLocationVO> list=dao.locationAllData();
    // => Model 
%>
<%-- text() 응용 --%>
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
   margin: 0px auto;
   width:700px;
}
h1{
    text-align: center;
}
</style>
<!--  $.ajax({}) -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script> 
<script type="text/javascript">
$(function(){
	$('.titles').css("cursor","pointer")
	$('.titles').click(function(){
		$('.trs').hide();
		let msg=$(this).attr("value");
		let no=$(this).attr("data");
		$('#m'+no).show();
		$('.m'+no).text(msg);
	})
	$('#keyword').keyup(function(){
		let k=$('#keyword').val();
		$('.user-table > tbody > tr').hide("slow")
		let temp=$('.user-table>tbody>tr>td:nth-child(4n+3):contains("'+k+'")')
		$(temp).parent().show("slow");
	})
})
</script>
</head>
<body>
  <div class="container">
    <h1>서울 명소</h1>
    <div class="row">
     <table class="table">
      <tr>
        <td>
         <input type=text id=keyword size=30 placeholder="검색어 입력"
          class="input-sm">
        </td>
      </tr>
     </table>
     <table class="table user-table">
       <tr>
         <th class="text-center">번호</th>
         <th class="text-center"></th>
         <th class="text-center">명소</th>
         <th class="text-center">주소</th>
       </tr>
       <tbody>
       <%
          for(SeoulLocationVO vo:list)
          {
       %>
             <tr>
              <td class="text-center"><%=vo.getNo() %></td>
              <td class="text-center">
                <img src="<%=vo.getPoster() %>" width=30 height=30>
              </td>
              <td class="titles" value="<%=vo.getMsg()%>" data="<%=vo.getNo()%>"><%=vo.getTitle() %></td>
              <td><%=vo.getAddress() %></td>
             </tr>
             <tr id="m<%=vo.getNo()%>" style="display:none" class="trs">
               <td colspan=4 class="m<%=vo.getNo()%>"></td>
             </tr>
       <%
          }
       %>
       </tbody>
     </table>
    </div>
  </div>
</body>
</html>





