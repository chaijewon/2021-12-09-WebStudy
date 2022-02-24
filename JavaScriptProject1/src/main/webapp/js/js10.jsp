<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
    데이터를 모아서 관리 : 배열 [] , 객체 {} 
    객체표현 => let a={} ==> 자바스크립트에서 객체를 표현하는 방법 (JSON)
    JSON : 예전 (XML => 파싱이 어렵다) , XML 대체 => JSON
    XML , JSON를 사용하는 목적 : 모든 운영체제에서 호환이 된다 
                             -----------
                             윈도우서버 ==> 리눅스
                                      ==> 모바일 (안드로이드 , 아이폰) 
                             리눅스서버 ==> 윈도우 
                             ===>  UTF-8
                             
                                          JSON , Array
                             자바(데이터 관리) ====> 자바스크립트
                                                 코틀린 (웹앱)
    JSON : 면접에 필수 (Ajax , Vue , React)
    JSON 형식) => JSONP => async await 
    ---------
      자바스크립트의 단점 : 데이터 읽기(외부서버로부터) => 블로킹 (크로스도메인) 
    JSON 형식)
      {키:값,키:값,키:값....} => 영화 (영화 1개에 대한 정보) => 자바 (~VO)
      [{],{},{},{}...] => 자바 (List)
      
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
   //let hong={sabun:1,name:"홍길동",dept:"개발부",job:"대리",pay:3000}
   /*
        class Sawon{
	       int sabun;
	       String name;
	       String dept;
	       String job;
	       int pay;
        }
        Sawon s=new Sawon();
        s.sabun=1;
        s.name="홍길동";
        s.dept="개발부";
        s.pay=3000;
   }
   */
   /*console.log("사번:"+hong.sabun)
   console.log("이름:"+hong.name)
   console.log("부서:"+hong.dept)
   console.log("직위:"+hong.job)
   console.log("연봉:"+hong.pay)*/
   let sawon=[
	   {sabun:1,name:"홍길동",dept:"개발부",job:"대리",pay:3000},
	   {sabun:2,name:"김두한",dept:"영업부",job:"사원",pay:2600},
	   {sabun:3,name:"심청이",dept:"총무부",job:"과장",pay:4000},
	   {sabun:4,name:"춘향이",dept:"기획부",job:"부장",pay:5000},
	   {sabun:5,name:"이순신",dept:"개발부",job:"대리",pay:3000}
   ]
   
   //1. 데이터를 묶는다 
   let html='';
   /*for(let sa of sawon)
   {
	   html+='<tr>'
	       +'<td class="text-center">'+sa.sabun+'</td>'
	       +'<td class="text-center">'+sa.name+'</td>'
	       +'<td class="text-center">'+sa.dept+'</td>'
	       +'<td class="text-center">'+sa.job+'</td>'
	       +'<td class="text-center">'+sa.pay+'</td>'
	       +'</tr>'
   }*/
   /*sawon.forEach(function(sa){
	   html+='<tr>'
	       +'<td class="text-center">'+sa.sabun+'</td>'
	       +'<td class="text-center">'+sa.name+'</td>'
	       +'<td class="text-center">'+sa.dept+'</td>'
	       +'<td class="text-center">'+sa.job+'</td>'
	       +'<td class="text-center">'+sa.pay+'</td>'
	       +'</tr>'
   })*/
   sawon.map(function(sa){
	   html+='<tr>'
	       +'<td class="text-center">'+sa.sabun+'</td>'
	       +'<td class="text-center">'+sa.name+'</td>'
	       +'<td class="text-center">'+sa.dept+'</td>'
	       +'<td class="text-center">'+sa.job+'</td>'
	       +'<td class="text-center">'+sa.pay+'</td>'
	       +'</tr>'
   })
   //2. 출력위치 
   document.querySelector("tbody").innerHTML=html;
}
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
  margin-top: 50px
}
.row{
  margin: 0px auto;
  width:800px;
}
h1{
  text-align: center
}
</style>
</head>
<body>
  <div class="container">
   <h1>사원 목록</h1>
   <div class="row">
     <table class="table">
      <tr class="success">
        <th class="text-center">사번</th>
        <th class="text-center">이름</th>
        <th class="text-center">부서</th>
        <th class="text-center">직위</th>
        <th class="text-center">연봉</th>
      </tr>
      <tbody>
      
      </tbody>
     </table>
   </div>
  </div>
</body>
</html>








