<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%-- 
    요청 처리만 담당 (로그인처리 => 화면이동)
    로그인 
     경우의 수 3개 
     -----------
      -----------------------
      1) ID가 없는 경우 
      2) Password가 틀린 경우 
      ----------------------- 로그인창으로 다시 이동 
      3) 로그인  
      ----------------------- 카테고리 출력창으로 이동 
--%>
<%
     // 1. 사용자 요청한 ID,PWD를 받는다 ==> 전송한 모든 데이터는 request안에 있다 
     // *** GET / POST와는 관계없이 무조건 request로 받는다 
     /*
         GET : ~/login_ok.jsp?id=hong&pwd=1234
                              --
         POST : <input type=text name=id>
                                      --
     */
     String id=request.getParameter("id");
     String pwd=request.getParameter("pwd");
     // 요청처리 => 오라클안에 있는지 확인 => DAO연결 => AJAX,Jquery
     // 2. 오라클에서 결과값을 받는다 
     FoodDAO dao=new FoodDAO();
     String result=dao.isLogin(id, pwd);
     if(result.equals("NOID"))
     {
    	 // 아이디가 없는 상태 => login.jsp로 이동 
%>
         <script>
         alert("아이디 존재하지 않습니다!!");
         history.back();
         </script>
<%
     }
     else if(result.equals("NOPWD"))
     {
    	 // 비밀번호가 틀린상태 => login.jsp로 이동 
%>
         <script>
         alert("비밀번호가 틀립니다!!");
         history.back();
         </script>
<%
     }
     else
     {
    	 // 로그인
    	 /*
    	     프로그램에 필요한 개인의 일부를 서버할 저장할 목적 => 세션
    	     세션 : 저장이 되면 모든 JSP에서 사용이 가능 
    	     === 브라우저 종료 / 로그아웃 => 세션에 저장된 기록이 없어진다 
    	     === 저장하는 시간 (기본 디폴트 : 30분)
    	     세션 => JSP제공하는 메소드 
    	     1) 저장 
                setAttribute(키,값) => cookie는 값(문자열)
                                   => session은 값 (Object)
             2) 데이터 읽기 
                Object getAttribute(키) 
             3) 저장 기간 설정 
                setMaxInactiveInterval(초단위); => 1800초 
             4) 저장정보 일부 삭제 
                removeAttribute(키) 
             5) 전체 삭제(로그아웃)
                invalidate()
             *** Map형식 => 키가 중복되는 덮어쓴다 
             *** 웹에서 사용하는 방식 : Map => 키,값
             *** session은 HttpSession => request를 이용해서 생성이 가능 
                 => 쿠키 : request.getCookie()
                 => 세션 : request.getSession() 
                 => 세션은 각 브라우저마다 1개씩만 생성 (저장공간)
                         ------------------ id를 부여 => getId()
                                                       -------- 웹 채팅
                 => 사용처 : 장바구니 , 예매(예약) , 결제 , 댓글 ....
                 => 웹에서 사용되는 기본 객체 : request,response,session
                     jsp , asp , aspx , php , dango 
    	 */
    	 session.setAttribute("id", id);
         StringTokenizer st=new StringTokenizer(result,"|");
         String name=st.nextToken();
         String addr=st.nextToken();
         session.setAttribute("name", name);
         session.setAttribute("addr", addr);
         // 화면 이동 
         response.sendRedirect("category.jsp");
    	 
     }
%>










