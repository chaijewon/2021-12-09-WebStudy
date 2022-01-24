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
   width:700px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.seat').click(function(){
		
		let s=$(this).attr("class");
		if(s=="btn btn-lg btn-danger")
		{
		   alert("이미 선택된 좌석입니다!!");	
		}
		else
		{
			$(this).attr("class","btn btn-lg btn-danger");
		}
		
		
	});
})
</script>
</head>
<body>
    <div class="container">
      <div class="row">
        <img src="screen.png" width=700>
        <div style="height:50px"></div>
        <table class="table">
         <%
            char c='A';
            for(int i=0;i<7;i++)
            {
         %>
               <tr>
               <td class="text-center"><span class="btn btn-lg btn-primary"><%= c++ %></span></td>
                <%
                   for(int j=0;j<9;j++)
                   {
                %>
                      <td class="text-center"><span class="btn btn-lg btn-info seat"><%=j+1 %></span></td>
                <%
                   }
                %>
               </tr>
         <%
            }
         %>
        </table>
      </div>
    </div>
</body>
</html>






