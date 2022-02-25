<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
   // 사용자가 보내준 dong을 받는다 
   request.setCharacterEncoding("UTF-8");
   String dong=request.getParameter("dong");
   List<ZipcodeVO> list=null;
   if(dong!=null)
   {
	   ZipcodeDAO dao=new ZipcodeDAO();
	   list=dao.postfind(dong);
   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
  margin-top: 50px
}
.row{
  margin: 0px auto;
  width:410px;
}
h1{
  text-align: center;
}
</style>
<script type="text/javascript">
// function => return(X) , 매개변수 (O)
function ok(zip,addr)
{
	opener.frm.post.value=zip;
	// opener (join.jsp) => document 
	opener.frm.addr.value=addr;
	self.close(); // 팝업창을 닫아라 
}
</script>
</head>
<body>
   <div class="container">
    <h1>우편번호 검색</h1>
    <div class="row">
     <form method=post action="post.jsp">
	     <table class="table">
	      <tr>
	        <td>
	         입력:<input type=text name=dong size=15 class="input-sm">
	         <input type=submit value="검색" class="btn btn-sm btn-primary">
	        </td>
	      </tr>
	      <tr>
	        <td class="text-right">
	         <span style="color:red">※동/읍/면을 입력하세요</span>
	        </td>
	      </tr>
	     </table>
	     <div style="height:10px"></div>
	     <%
	      if(list!=null)
	      {
	     %>
	         <table class="table">
	          <tr class="danger">
	           <th class="text-center">우편번호</th>
	           <th class="text-center">주소</th>
	          </tr>
	          <%
	             for(ZipcodeVO vo:list)
	             {
	            	 String address=vo.getSido()+" "
	            			       +vo.getGugun()+" "
	            			       +vo.getDong()+" "
	            			       +vo.getBunji();
	          %>
	                <tr>
	                 <td class="text-center"><%=vo.getZipcode() %></td>
	                 <td><a href="javascript:ok('<%=vo.getZipcode() %>','<%=address %>')"><%=address %></a></td>
	                </tr>
	          <%
	             }
	          %>
	         </table>
	     <%  
	      }
	     %>
     </form>
    </div>
   </div>
</body>
</html>







