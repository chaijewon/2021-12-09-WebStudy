<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="model" class="com.sist.model.DataBoardModel"/>
<%
    // 이동 => 비밀번호(O)=>list.jsp , 비밀번호(X)=>history.back()
    model.databoardDeleteOk(request);
%>
<c:choose>
 <c:when test="${bCheck==true }">
   <c:redirect url="list.jsp?page=${page }"/>
 </c:when>
 <c:otherwise>
   <script>
    alert("비밀번호가 틀립니다!!");
    history.back();
   </script>
 </c:otherwise>
</c:choose>
