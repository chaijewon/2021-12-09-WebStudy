<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
     369 => jquery 라이브러리 읽기 
            src="http://code.jquery.com/jquery.js"
            => include에서 jquery 라이브러리 충돌시에는 화면,동작을 수행할 수 없다 
            => 자바스크립트 라이브러리는 main.jsp에 출력 (제외:팝업)
     371 ~ 384 => $(선택자).메소드(function()){} => 이벤트 
            $(선택자).메소드(매개변수,매개변수) => jquery함수 , 자바스크립트 함수 
            --------
            메소드: val() => getter(val())/setter(val("test"))
                           <input> , <textarea> , <select>
                           value의 약자
                  text() => getter/setter
                           <div>, <td> , <th> , <span>
                  attr() => getter/setter
                            <img> , <a>
                  html() => getter/setter
                            innerHTML => 태그와 태그사이에 html을 첨부 
                            --------- 날씨 
                  append() => 같은 태그를 추가 
                  show()   => 보여준다
                  hide()   => 감춘다 
                  remove() => 태그를 삭제 
                  css() => 디자인 
      385~393 이벤트 (태그 선택시에 발생하는 내용) 
           onclick , onchange , onmouseover , onmousedown , onkeyup , onkeydown
           => $(선택자).on('이벤트 종류', function(){여기서 처리})
           => $(선택자).이벤트종류(function(){여기서 처리})
           => mouseenter,mouseleave
      시각효과 
        show(속도) , hide(속도) , fadeIn() fadeOut() => Effect(효과)
        
      413 => 포커스 ==> $(선택자).focus()
      419 => 생성/추가 ==> append()
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