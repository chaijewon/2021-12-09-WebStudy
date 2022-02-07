<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%--
      JSP에서 사용하는 기본 제어문 (p135~p144)
      => 조건문 
         = 단일 조건문
           if(조건문)
           {
              조건문이 true면 실행하는 문장 => JSP에서는 주로 HTML
           }
           
           => 형식
              <%
                  if(조건문)
                  {
              %>
                     HTML출력 
              <%
                  }
              %>
              ==> 구분을 잘해야 한다 
         = 선택 조건문 
            if(조건문)
            {
               조건문이 true일때 처리 문장 
            }
            else
            {
               조건문이 false일때 처리 문장 
            }
            
            형식)
            
              <%
                  if(조건문)
                  {
              %>
                      조건문이 true일때 HTML로 화면에 출력 
              <%
                  }
                  else
                  {
              %>
                      조건문이 false일때 HTML로 화면에 출력 
              <%
                  }
              %>
         = 다중 조건문 
             if(조건문)
             {
                 조건문이 true면 처리문장 => 종료
                 조건문이 false면
                        ↙
             }
             else if(조건문)
             {
                 조건문이 true면 처리문장 => 종료
                 조건문이 false면
                        ↙
             }
             else if(조건문)
             {
                 조건문이 true면 처리문장 => 종료
                 조건문이 false면 else로 이동 
                        
             }
             else
             {
                 해당 조건이 없는 경우 처리문장 
             }
             
             형식)
             <%
              if(조건문)
              {
             %>
                 조건문이 true면 처리문장 => 종료
                 조건문이 false면
                        ↙
            <%
             }
             else if(조건문)
             {
            %>
                 조건문이 true면 처리문장 => 종료
                 조건문이 false면
                        ↙
            <%
             }
             else if(조건문)
             {
            %>
                 조건문이 true면 처리문장 => 종료
                 조건문이 false면 else로 이동 
            <%            
             }
             else
             {
            %>
                 해당 조건이 없는 경우 처리문장 (HTML)
            <%
             }
            %>
      => 반복문 
            while : 반복횟수가 지정이 없는 경우 (무한루프)
                    => 서버,데이터베이스 
                  
                    초기값 ------------  1
                    while(조건문)  ----  2
                    {
                       반복 수행문장 ---- 3
                       증가식 ---------- 4
                    }
                    1=>2=>3=>4
                       2=>3=>4
                       2=>3=>4
                       --
                        false면 종료 
                        true명 => 2=>3=>4를 반복
            for : 반복횟수가 지정된 경우
                               ---false면 종료 
                       1   →    2   ←   4
                  for(초기화 ; 조건문 ; 증가식)
                  {           
                               ↓      ↗
                        반복 수행문장 3
                  }
                  
            형식)
            
                <%
                    for(초기값;조건문;증가식)
                    {
                %>
                       처리문장 (HTML) => 브라우저에 실행
                <%
                    }
                %>
               --------------------------------------- 
                <%
                    초기값 
                    while(조건문)
                    {
                %>
                      반복적으로 수행되는 문장 HTML
                <%
                      증가식 
                    }
                %>
              ----------------------------------------
                for-each : 향상된 for (출력만 전용)
                           --------- 배열,컬렉션에 들어가 있는 데이터만 출력
                int[] arr={1,2,3,4,5}
                   〓
                for(int i:arr) ==> 
                    i=1 , i=2 ....(** 받는 데이터는 클수 있다)
                for(long i:arr)
                for(double i:arr)
                index를 이용하는 것이 아니라 실제 저장된 데이터를 한개씩 읽어 온다
                {
                    출력 => 웹에서 가장 많이 사용되는 for형식 
                }
                
                <%
                    for(데이터형 변수:배열,컬렉션)
                    {
                %>
                       <%= 변수%>
                <%
                    }
                %>
            
      => 선택문
           switch(정수/문자/문자열)
           {
              case 값1:
                처리문장 
              case 값2:
                처리문장 
              .....
              .....
              .....
              default: 해당 사항이 없는 경우 
           }
      => 반복제어문 
         break: 반복문을 종료할때 사용 
         continue: 특정부분을 제외 할때 주로 사용 
 --%>
<%-- 1. 오라클로부터 데이터를 받아 온다 --%>
<%
    FoodDAO dao=new FoodDAO();
    //오라클 연결 준비 (객체 생성)
    List<CategoryVO> list=dao.categoryListData();
    //연결이 되었다면 해당 데이터를 가지고 온다 
    // list안에는 맛집 카테고리 데이터가 존재 (30)
    
    // JSP에서 주로 사용되는 반복문 (for,for-each을 주로 사용한다)
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap" rel="stylesheet">
<style type="text/css">
*{
  font-family: 'Cute Font', cursive;
}
.container{
  margin-top: 50px;
}
.table{
  background-image: url('back.png');
  background-size: cover;
  /*opacity: 0.2*/
}

</style>
</head>
<body>
  <div class="container">
  <div class="row row_find">
   <table class="table">
    <tr>
     <td class="text-center">
      <input type=text size=50 class="input-sm">
      <input type=button value="검색" class="btn btn-sm btn-danger">
     </td>
    </tr>
   </table>
  </div>
  <h1>믿고 보는 맛집리스트</h1>
  <hr>
  <%--
         1~12 => 믿고 보는 맛집리스트
         13~18 => 지역별 맛집리스트
         19~30 => 메뉴별 인기맛집 
   --%>
  <div class="row">
    <%
        for(int i=0;i<list.size();i++)
        {
        	if(i>=0 && i<12)
        	{
        		CategoryVO vo=list.get(i);
        		// HTML로 출력 
    %>
                  <div class="col-md-3">
				    <div class="thumbnail">
				      <a href="#">
				        <img src="<%=vo.getPoster() %>" alt="Lights" style="width:100%">
				        <div class="caption">
				          <p><%=vo.getTitle() %></p>
				        </div>
				      </a>
				    </div>
  </div>
    <%
        	}
        }
    %>
  </div>
  <h1>지역별 인기맛집</h1>
  <hr>
  <div class="row">
  <%
      for(int i=12;i<18;i++)
      {
    	 CategoryVO vo=list.get(i);
  %>
         <div class="col-md-4">
		    <div class="thumbnail">
		      <a href="#">
		        <img src="<%=vo.getPoster() %>" alt="Lights" style="width:100%">
		        <div class="caption">
		          <p><%=vo.getTitle() %></p>
		        </div>
		      </a>
		    </div>
		  </div>
  <%
      }
  %>
  </div>
  <h1>메뉴별 인기맛집</h1>
  <hr>
  <div class="row">
    <%
       for(int i=18;i<30;i++)
       {
    	   CategoryVO vo=list.get(i);
    %>
           <div class="col-md-3">
		    <div class="thumbnail">
		      <a href="#">
		        <img src="<%=vo.getPoster() %>" alt="Lights" style="width:100%">
		        <div class="caption">
		          <p><%=vo.getTitle() %></p>
		        </div>
		      </a>
		    </div>
		  </div>
    <%
       }
    %>
  </div>
  </div>
</body>
</html>










