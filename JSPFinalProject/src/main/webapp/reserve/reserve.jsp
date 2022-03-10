<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		type:'post',
		url:'../reserve/food_house.do',
		success:function(res)
		{
			$('#food_house').html(res)
		}
	})
})
</script>
</head>
<body>
<div class="wrapper row3">
  <div id="breadcrumb" class="clear"> 
    <!-- ################################################################################################ -->
    <ul>
      <li>맛집 예약</li>
    </ul>
    <!-- ################################################################################################ --> 
   </div>
  </div>
  <div class="wrapper row3">
   <main class="container clear">
    <h2 class="sectiontitle">맛집 예약</h2>
    <table class="table">
     <tr rowspan="2" height="500">
       <td class="text-center" width=20% valign="top">
        <table class="table">
          <tr>
            <td>
             <div id="food_house" style="height: 500px;overflow-y:scroll ">
              
             </div>
            </td>
          </tr>
        </table>
       </td>
       <td class="text-center" width=45% valign="top">
        <div>날짜정보</div>
        <div id="food_date">
         
        </div>
       </td>
       <td class="text-center" width=35% valign="top">
        <div>예약정보</div>
        <table class="table">
         <tr>
          <td class="text-center">
           <img src="" width=150 height=150 id="reserve_poster">
          </td>
         </tr>
         <tr>
           <td class="text-left">
            맛집명:<span id="reserve_name"></span>
           </td>
         </tr>
         <tr>
           <td class="text-left">
            예약:<span id="reserve_day"></span>
           </td>
         </tr>
         <tr>
           <td class="text-left">
            시간:<span id="reserve_time"></span>
           </td>
         </tr>
         <tr>
           <td class="text-left">
            인원:<span id="reserve_inwon"></span>
           </td>
         </tr>
         <%--
            NO (자동 증가)
            ID (session)
            FNO  =
            DAY  =
            TIME =
            INWON =
            REGDATE (SYSDATE) 
            OK = 0(예약대기) , 1(예약완료 => 예약정보 => 메일)
                             -------------------------- admin
          --%>
         <tr id="reserve_btn" style="display:none">
           <td class="text-center">
            <form method=post action="../reserve/reserve_ok.do">
             <input type=hidden name="fno" value="" id="fno_data">
             <input type=hidden name="day" value="" id="day_data">
             <input type=hidden name="time" value="" id="time_data">
             <input type=hidden name="inwon" value="" id="inwon_data">
             <input type=submit value="예약하기" class="btn btn-sm btn-primary">
            </form>
           </td>
         </tr>
        </table>
       </td>
     </tr>
     <tr height="100">
       <td class="text-center" width=35% valign="top">
         <div>시간정보</div>
         <div id="food_time">
         
         </div>
       </td>
       <td class="text-center" width="20%" valign="top">
         <div>인원정보</div>
         <div id="food_inwon">
          
         </div>
       </td>
     </tr>
    </table>
   </main>
  </div>
</body>
</html>







