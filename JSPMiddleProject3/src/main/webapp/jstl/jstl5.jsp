<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <c:set var="msg" value="      Hello JSTL AND EL AND JSP"/>
   <h1>원본:${msg }</h1>
   <h4>문자열 길이:${fn:length(msg) }</h4>
   <h4>문자열 길이:${fn:substring(msg,0,10) }</h4>
   <h4>소문자변경:${fn:toLowerCase(msg) }</h4>
   <h4>소문자변경:${fn:toUpperCase(msg) }</h4>
   <h4>문자의 위치:${fn:indexOf(msg,'J') }</h4>
   <h4>문자변경:${fn:replace(msg,'JSP','Spring') }</h4>
   <h4>공백문자 제거:${fn:trim(msg)}</h4>
   <h4>시작문자:${fn:startsWith(msg,'JSP') }</h4>
   <h4>끝문자:${fn:endsWith(msg,'JSP') }</h4>
   <h4>포함문자:${fn:contains(msg,'JSP') }</h4>
</body>
</html>