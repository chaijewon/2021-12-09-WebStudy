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
  margin-top: 50px
}
.row{
  margin: 0px auto;
  width:450px;
}
h1{
  text-align: center;
}
</style>
<script type="text/javascript">
let index=1;
/*
function prev()
{
	index--;
	if(index<1)
		index=7;
	let img=document.querySelector("img");
	let path="m"+index+'.jpg';
	img.src=path;
}
function next()
{
	index++;
	if(index>7)
		index=1;
	let img=document.querySelector("img");
	let path="m"+index+'.jpg';
	img.src=path;
}*/
// 익명의 함수 
let prev=function(){
	index--;
	if(index<1)
		index=7;
	let img=document.querySelector("img");
	let path="m"+index+'.jpg';
	img.src=path;
}
// 함수 포인터 이용 => 람다식 (화살표 함수)
let next=()=>{
	index++;
	if(index>7)
		index=1;
	let img=document.querySelector("img");
	let path="m"+index+'.jpg';
	img.src=path;
}
</script>
</head>
<body>
   <div class="container">
     <h1>이미지 변경 (함수)</h1>
     <div class="row">
       <table class="table">
        <tr>
         <td class="text-center">
          <img src="m1.jpg" width=450 height=450>
         </td>
        </tr>
        <tr>
          <td class="text-center">
           <input type=button value="이전" class="btn btn-sm btn-danger"
            onclick="prev()"
           >
           <input type=button value="다음" class="btn btn-sm btn-success"
            onclick="next()"
           >
          </td>
        </tr>
       </table>
     </div>
   </div>
</body>
</html>









