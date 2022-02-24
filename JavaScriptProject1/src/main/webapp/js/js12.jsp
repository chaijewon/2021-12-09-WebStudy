<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      함수 : 기능 처리 (이벤트 => 사용자가 요청에 대한 처리)
            1. 시작하자 마자 => window.onload=function(){}
            2. click , mouse , key 
               onclick : 버튼 클릭 , 이미지 클릭 , 메뉴 클릭 
               onchange : 콤보 선택이 변경 ...
               onmouseover,onmouseout 
               onkeyup , onkeydown
               
      함수 => 익명의 함수 : function(){}
             선언적 함수 : function func_name(){}
      함수 => 결과값(리턴형) , 매개변수 
             --------------------
             
             함수 종류 (자바:메소드)
             ---------------------------------
              리턴형       매개변수
             ---------------------------------
                O           O
                function func_name(no,id,pwd...) => 매개변수는 변수명만 사용 
                {
                     // 리턴형을 선언하지 않는다 
                     return 결과값;
                } 
             ---------------------------------
                O           X
                function func_name()
                {
                    return 결과값;
                }
             ---------------------------------
                X           O
                function func_name(no,id,....) => void
                {
                    
                }
             ---------------------------------
                X           X
                function func_name() => void
                {
                   
                }
             ---------------------------------
             
             형식)
               function func_name() // 선언부
               {
                  // 구현부 
               }
               *** 매개변수는 let,var을 사용하면 안된다 (변수명만 설정)
               
               let func_name=function(){}
               ***let func_name=()=>{}
               
               let func_name=function(매개변수){}
               ***let func_name=(매개변수)=>{}
               function 제외 => 람다식 
             ------------------- 브라우저 자체에서 처리 (ajax)
             내장 객체 , DOMScript 
             -----------------------------------------통합(Jquery)
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>