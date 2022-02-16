<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%
    Sawon s=new Sawon();
    s.setSabun(1);
    s.setName("홍길동");
    s.setDept("개발부");
    s.setJob("대리"); // ${}는 출력할 수 없다 => request,session에 담는다 
    // 클라이언트 =======> 자바 
    //          request ==> Call by Reference
    //          request에 값을 추가해서 담아주는 방법 : setAttribute()
    // ${} request.getAttribute() , session.getAttribute()
    request.setAttribute("sa", s);
%>
<%--
     메소드 호출 
      => setter는 호출 불가능 , getter만 호출이 가능 
      => class A
         {
             String name="홍길동";
             public void setName(String name)
             {
                 this.name=name;
             }
             public String getName()
             {
                 return name;
             }
         }
         
         => A a=new A();
            request.setAttribute("a",a);
            => ${a.name} => a.getName()
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  사번:${sa.sabun }<br><%-- s.getSabun() --%>
  이름:${sa.name }<br><%-- s.getName() --%>
  이름:${sa.getName()}<br>
  부서:${sa.dept }<br>
  직위:${sa.job } <%-- {} => 변수명이 아니라 getXxx() --%>
</body>
</html>







