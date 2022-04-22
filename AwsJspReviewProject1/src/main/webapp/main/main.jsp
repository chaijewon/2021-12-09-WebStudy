<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
    // 사용자가 요청한 데이터 받기 
    String strPage=request.getParameter("page");
    if(strPage==null)
    	strPage="1";
    int curpage=Integer.parseInt(strPage);
    MovieDAO dao=new MovieDAO();
    List<MovieVO> list=dao.goodsListData(curpage);
    int totalpage=dao.goodsTotalPage();
    // Model에서 처리하는 부분 
%>
<%--
      1. JSP (JavaServer Page) : 서버에서 실행하는 스크립트형 파일 
      1) 실행 요청 ==> Web Application Server ==> java로 변환 ==> 컴파일후 실행
                    ========================    ========= servlet
         a.jsp                                  a_jsp.java     a_jsp.class => 인터프리터에 의해서 실행 (메모리에 HTML만 출력) ==> 브라우저에 읽어서 출력 
                     WAS(Tomcat,JBoss,제우스,웹스페어,웹로직) 
         => servlet VS jsp 
         => 컴파일(javac) VS 인터프리터(java)
            컴파일 에러(CheckException)  ==> 실행시에러(UnCheckException)
      2) 지시자 => <%@ 지시자명 속성="값" %> => 반드시 지정된 속성만 사용 , 속성값 추가시에는 반드시 ""
         page : jsp파일에 대한 정보 
                = 변환 ( text/html , text/xml , text/plain )
                          
                  예)   contentType="text/html" => HTML
                       contentType="text/xml" => XML
                       contentType="text/plain" => JSON , WML
                = import : 외부라이브러리 로딩 
                = errorPage : 에러시 이동하는 페이지 
                = buffer : 기본 (8kb)
         include : file="추가될 파일명을 지정" => JSP안에서 다른 JSP를 추가할 때 사용 
                   조립식 프로그램 => include , tiles 
                   -----------
                   <%@ include %> => JSP+JSP => 정적파일
                   a.jsp
                   <body>
                   <%
                       int a=10;
                   %>
                   <%= i%>
                   <%@ include file="b.jsp"%> => 변경이 안되는 파일 첨부 (메뉴,footer)
                   </body>
                   
                   b.jsp
                   <body>
                     <%
                         int b=20;
                     %>
                     <%= b%>
                   </body>
                   
                   a.jsp=> 변환 
                   <body>
                   <%
                       int a=10;
                   %>
                   <%= i%>
                   <body>
                     <%
                         int b=20;
                     %>
                     <%= b%>
                   </body>
                   </body>
                   <jsp:include> => HTML+HML => 동적파일 
                   a.jsp
                   <body>
                     <%= "hello" %>
                     <jsp:incude page="b.jsp"/>
                   </body>
                   
                   b.jsp
                   <body>
                     <%="Java"%>
                   </body>
                   
                   a.jsp 
                   <body>
                     Hello
                     <body>
                      Java
                     </body>
                   </body>
                   
                   b.jsp
                    <body>
                     Java
                    </body>
           taglib : tag로 자바의 문법을 제작 
                    core : 변수 선언 , 제어문 , URL(화면이동) 
                           변수 선언 : <c:set var="" value="">
                           제어문 : <c:forEach>,<c:if> , <c:choose>
                                   반복문        조건문    다중 조건문 
                           화면 이동 : <c:redirect url="">
                    fmt : 변환 : <fmt:formatDate value="" pattern="">
                                   SimpleDateFormat()
                                <fmt:formatNumber value="" pattern="000,000">
                    fn : String클래스의 메소드 ==> Model에서 보통 처리한다 
                         ${fn:substring()} , ${fn:trim()}
          신입 => SM => SI/솔루션
       2. 자바 / HTML을 구분 
          <% %> : 일반 자바 
          <%! %> : 메소드를 만들때 사용
          <%= %> : 화면 출력 
          ** JSP는 ==> _jspService() => 메소드 안에 소스코딩 
             public class a_jsp extends HttpServlet
             {
                 public void _jspInit(){}
                 public void _jspDestory(){}
                 public void _jspService() // 사용자가 요청시마다 호출하는 메소드 
                 {
                     =====================
                             JSP
                     =====================
                 }
             }
             
             ==> Thread : 가끔 
       3. 내장 객체 
          HttpServletRequest : 클라이언트의 정보 (전송 데이터 , IP)
          HttpServletResponse : 요청한 클라이언트로 결과값 전송 (HTML , Cookie)
          HttpSession : 서버에 클라이언트의 일부 정보 저장 
          Cookie : 클라이언트에 저장 
       4. DataBase연동 
          JDBC ==> DBCP => ORM(MyBatis,JPA)
          -------------
       5. JSTL , EL 사용법 
          태그 lib, ${}: 일반변수가 아니라 
                   = request에 저장된 값 ${requestScope.키명} 
                     request.setAttribute("id","admin")
                     ${requestScope.id} => ${id} => request.getAttribue("id")
                       ============ 생략이 가능 
                   = session에저장된 값 
                     session에 저장된 값 ${sessionScope.키명} 
                     session.setAttribute("id","admin")
                     ${sessionScope.id} => ${id} => session.getAttribue("id")
                       ------------ 생략이 가능 
                       request,session에 저장된 값이 동일할때는 우선 순위 request
       6. MVC구조 
          MVC(질문의 필수) ==> 95%(MVC) , 5%(일반 JSP)
                            =========  ============ 개인업체 , 변경이 별로 없다
                            변경이 많다 , 대규모 프로그램  
          M(Model => java) : 사용자 요청을 처리 (데이터베이스 연동)
          V(View  => jsp) : 사용자 요청에 대한 화면 출력 보여준 역할 
          C(Controller => servlet) : 요청을 받는다 , 결과값을 전송 
          클라이언트(유저) ====> 요청 
                              |
                            Controller 
                              | 요청을 받아서 요청처리를 할 수 있게 해당 Model을 찾는다
                                ==> HandlerMapping
                             Model(요청 처리)
                              | 처리 결과를 request,session에 담아서 Controller로 전송 
                            Controller 
                              | 결과를 해당 JSP를 찾아서 보내준다 : ViewResolver
                                => 결과를 보내준다 (forward)
                                => 재전송 다른 요청을 수행할 수 있게 만들어 준다 (sendRedirect) 
                            View 
                              |
                            브라우저로 전송 
           MVC 
           ----
             Model 찾기 
              => 클래스형 
              => 메소드형 (Annotation) : Index(찾기)
       ==> 자바 : 1. 문법 (변수 , 연산자 , 제어문 , 배열)
                 2. 객체지향 프로그램 (클래스 제작 => 멤버변수 , 메소드 , 
                    클래스의 종류(인터페이스)
                 3. 예외처리 
                 4. 라이브러리 (컬렉션 , 제네릭스 , IO)
                 =====================================
                 PaaS : 플래폼을 사용할 수 있게 만든다 (EC2) 
                        ---- 운영체제 한개를 빌려서 개발자 마음대로 필요한 도구를 설치해서 사용 
                 SaaS : 시스템이 이미 완료 (설치 비용이 절감)
                 리눅스(유료) => 우분투 / CentOS (XWindow)
                              ----- 우리나라 차세대 운영체제  
                 명령어 
                 -----
                 1. 우분투 일반 명령어 (DOS) => 만들기 , 다운로드 , 권한 부여 (sudo)
                    = 디렉토리 목록 확인 
                      ls 
                      ls -l
                      ls -al => 감춘 파일까지 볼 수 있다 
                    = 디렉토리 생성 
                      mkdir [폴더명 설정]
                    = 디렉토리 이동 
                      앞에 한개만 이동 : cd ..
                      cd 경로명 폴더 (홈이동 cd ~)  ~(홈)
                      ** 디렉토리가 길때 경우에는 한두글자 사용후 => tab
                    = 디렉토리 삭제
                      rm : 파일 삭제 (폴더안에 없다)
                      rm -r : 폴더에 있는 모든 데이터까디 삭제 
                    = 파일 관련 명령어(삭제 , 복사,편집,내용보기, 위치 검색)
                      삭제 : rm 파일명 
                      복사 : cp [복사대상] [복사위치]
                            cp server.xml /apache-tomcat-9.xx/conf
                      편집 : vi 파일명 
                            nana 파일명 (일반 메모리)
                            --------------------- 파일명이 없는 경우 (새롭게 생성,기존파일 수정)
                      내용보기 : cat 파일명 
                      파일 위치 : locate *.java
                                find *.java
                                which ls
                                whereis java 
                    = 현재 위치 확인 
                       pwd => 실제 경로명 
                       ==> 장점 (이전 명령어를 기억하고 있다) => 이전 : up , 다음 : down
                    = 설치 
                      내장되어 있는 패키지 : apt-get install 패키지명 
                                        --------------- openj + tab
                      웹을 이용해서 가지고 오기 : wget URL주소 
                    = 업데이트 : 운영체제를 새로 생성 => apt-get update (최신 패키지로 변경)
                    = 다운로드 : wget URL주소
                    = 우분투가 가지고 있는 디렉토리 구조(탐색기)
                      /bin : 사용자 명령어 모음 
                      /sbin : 관리자 명령어 모음 
                      /etc : 설정 파일 저장 
                      /var : 파일을 모음 
                      /tmp : 임시 파일 저장 (빅데이터,크롤링)
                      /home : 루투 경로 
                      /lib : 라이브러리 저장 
                      /usr : 유저가 다운로드 받은 프로그램이 저장 
                    = 톰캣 제어 
                      1. 구동 : startup.sh
                      2. 정지 : shutdown.sh
                      3. 확인 (구동) : ps aux | grep tomcat (상태)
                      
                    = 기타 
                      권한 : chmod (755,646) [-R] 폴더/파일명
                             사용자권한 , 그룹권한 , 외부사용자 권한 
                             111 101  101  ,   110  100 110
                             rwx r-x  r-x      rw-  r-- rw-
                             r(읽기)
                             w(쓰기)
                             x(실행)
                             ===> 한경 설정 => bashrc
                             ===> 저장을 하면 반드시 재부팅없이 설정파일 적용 
                                  source bashrc 
                    = 풀기 
                      tar  -xvf 파일명
                           x => 압축파일 푸는 명령어 
                           v => 압축푼 파일를 보여달라 
                           f => 같은 파일이 있는 경우 덮어 쓴다 
                      jar(war)
                 2. VI 명령어 (VI는 편집기 => 메모장)
                 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container-fluid{
   margin-top: 70px;
}
</style>
</head>
<body>
  <div class="container-fluid">
   <div class="row">
    <%
       for(MovieVO vo:list)
       {
    %>
	     <div class="col-md-4">
		    <div class="thumbnail">
		      <a href="#">
		        <img src="<%=vo.getProduct_poster() %>" style="width:100%">
		        <div class="caption">
		          <p style="font-size: 8px"><%=vo.getProduct_name() %></p>
		        </div>
		      </a>
		    </div>
		  </div>
	 <%
       }
	 %>
   </div>
   <div class="row">
     <div class="text-center">
       <a href="main.jsp?page=<%=curpage>1?curpage-1:curpage %>" class="btn btn-sm btn-primary">이전</a>
        <%= curpage %> page / <%= totalpage %> pages
       <a href="main.jsp?page=<%=curpage<totalpage?curpage+1:curpage %>" class="btn btn-sm btn-primary">다음</a>
     </div>
   </div>
  </div>
</body>
</html>









