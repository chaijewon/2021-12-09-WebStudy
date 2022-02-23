<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="wrapper row3">
  <div id="breadcrumb" class="clear"> 
    <!-- ################################################################################################ -->
    <ul>
      <li>${vo.title } 상세보기</li>
    </ul>
    <!-- ################################################################################################ --> 
  </div>
 </div>
<!-- ################################################################################################ --> 
<!-- ################################################################################################ --> 
<!-- ################################################################################################ -->
 <div class="wrapper row3">
  <main class="container clear">
    <h1 class="text-center">${vo.title }</h1>
    <table class="table">
      <tr>
        <td>
         <img src="${vo.poster }" style="width:978px;height:400px">
        </td>
      </tr>
      <tr>
        <td>${vo.msg }</td>
      </tr>
      <tr>
        <td>${vo.address }</td>
      </tr>
      <tr>
        <td></td>
      </tr>
    </table>
    <h2 class="sectiontitle">인근 맛집</h2>
    
    <h2 class="sectiontitle">인근 자연</h2>
    
    <h2 class="sectiontitle">인근 호텔</h2>
  </main>
 </div>
</body>
</html>







