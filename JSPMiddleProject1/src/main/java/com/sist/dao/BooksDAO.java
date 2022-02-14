package com.sist.dao;
import java.util.*;
import java.sql.*;
import javax.naming.*; // Context 
import javax.sql.*;// DataSource => 데이터베이스에 대한 정보 
/*
 *    JDBC 
 *     => 드라이버 등록 
 *     ----------------
 *     => 오라클 연결 getConnection()
 *     => 오라클 닫기 disConnection() 
 *     ---------------- 요청시마다 반복 => 오라클에 연결하는 시간이 많이 걸린다 
 *    DBCP 
 *      commons-dbcp.jar
 *      commons-pool.jar
 *     ------------------------------------------
 *     => 미리 Connection을 만들어 둔다 (저장 => POOL)
 *        톰캣에 의해 Connection이 미리 생성 
 *        => server.xml : 설정 
 *           <Resource />
 *             1. driverClassName => 드라이버 등록 
 *             2. 오라클 연결 => url/username/password 
 *             3. 찾기 (메모리 주소=>name이름) => jdbc/oracle
 *             4. 갯수 
 *                maxActive => 사용자가 10개를 초과했을 경우 => 최대한 Connection 20
 *                maxIdle   => 사용중인 Connection => 10
 *                maxWait   => 반환시까지 대기시간 => 음수면 무한정 (-1) 
 *     => 사용후에는 반환 
 *     => DBCP ==> Connection과 관련 (열기/닫기) 
 *                                  미리생성 => 사용이 가능 
 *                                  닫기(반환) 
 *     ------------------------------------------
 */
public class BooksDAO {
   private Connection conn;
   private PreparedStatement ps;
   // 미리 만들어진 Connection을 가지고 온다 
   public void getConnection()
   {
	   try
	   {
		   // 메모리 구조 => 탐색기 : JNDI의 초기화 => 탐색기를 연다 
		   // JNDI => Java Naming Directory Interface
		   Context init=new InitialContext();
		   // C드라이버에 접근 => java://comp//env
		   Context c=(Context)init.lookup("java://comp//env");
		   DataSource ds=(DataSource)c.lookup("jdbc/oracle");
		   conn=ds.getConnection();
		   
		   // DBCP가 만들어진 것이 있다(실무) => ORM(MyBatis,JPA)
		   //  보안 
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
   }
   // Connection 반환
   public void disConnection()
   {
	   try
	   {
		   if(ps!=null) ps.close();
		   if(conn!=null) conn.close();
	   }catch(Exception ex) {}
   }
   // 기능 설정 => JDBC와 동일 (연결(객체주소 읽기) / 해제(반환)
   public List<BooksVO> bookListData(int page)
   {
	   List<BooksVO> list=new ArrayList<BooksVO>();
	   try
	   {
		   getConnection();
		   // 미리 생성된 Connection(관리하는 메모리 공간 => POOL) 주소를 얻어서 사용한다 
		   // 1. SQL문장을 생성 
		   String sql="SELECT no,title,poster,num "
				     +"FROM (SELECT no,title,poster,rownum as num "
				     +"FROM (SELECT no,title,poster "
				     +"FROM books ORDER BY no ASC)) "
				     +"WHERE num BETWEEN ? AND ?";//인라인뷰 => 페이지 나누기 
		   // 2. 오라클에 SQL문장을 먼저 전송 
		   ps=conn.prepareStatement(sql);
		   // 3. ?에 값을 채운후에 실행을 요청 
		   int rowSize=20;
		   int start=(rowSize*page)-(rowSize-1); // rownum은 1번부터 시작한다 
		   // 자바 => 0 , 데이터베이스 => 1
		   int end=rowSize*page;
		   /*
		    *     1page => 1~20
		    *     2page => 21~40
		    *     3page => 41~60 
		    */
		   ps.setInt(1, start);
		   ps.setInt(2, end);
		   // 4. 실행 => 결과값을 가지고 온다 
		   ResultSet rs=ps.executeQuery();
		   // 5. 브라우저에 전송하기 위해서 => List에 저장 
		   while(rs.next())
		   {
			   BooksVO vo=new BooksVO(); //Record단위 => 
			   // while 한바쿼 => no,title,poster
			   vo.setNo(rs.getInt(1));
			   vo.setTitle(rs.getString(2));
			   vo.setPoster(rs.getString(3));
			   list.add(vo);
		   }
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   // 재사용을 위해서 Connection을 반환 
		   disConnection(); // conn.close() => 자동으로  POOL반환  
	   }
	   return list;
   }
   // 총페이지 가지고 오기 => DBCP,서블릿,페이지기법 (블록단위 처리)
   public int booksTotalPage()
   {
	   int total=0;
	   try
	   {
		   // connection주소 얻기
		   getConnection();
		   // 1. SQL문장 만들기 
		   String sql="SELECT CEIL(COUNT(*)/20.0) FROM books";
		   // CEIL 올림 (소수점이 0이 아니면 올려준다)
		   // 2. 오라클로 SQL문장 전송 
		   ps=conn.prepareStatement(sql);
		   // 3. 결과값 읽어오기 
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   total=rs.getInt(1);
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   // 반환
		   disConnection();
	   }
	   return total;
   }
   // 내일 : session,cookie 
   // 수: MVC구조 
   // 목: EL/JSTL 
   // 금: 프로젝트 메인 
   // 다음 주 : 로그인 / 회원 관리 / 목록 / 상세보기 / 장바구니 / 예매 / 추천 / 묻고 답하기
   // 업로드 / 다운로드 ,  댓글형 게시판 / 승인(결제) => 수료 40일 
   
   public BooksVO booksDetailData(int no)
   {
	   BooksVO vo=new BooksVO();
	   return vo;
   }
}











