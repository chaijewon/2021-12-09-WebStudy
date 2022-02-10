package com.sist.dao;
import java.util.*;
import java.sql.*;
public class BoardDAO {
   // 연결 객체 
   private Connection conn;
   // SQL 전송 객체 
   private PreparedStatement ps;
   // URL
   private final String URL="jdbc:oracle:thin:@211.63.89.131:1521:XE";
   
    // 1. 드라이버 등록 => 싱글턴 (한번만 호출 => 생성자) : 멤버변수 초기화 , 드라이버 등록 , 서버연결
   public BoardDAO()
   {
	   try
	   {
		   Class.forName("oracle.jdbc.driver.OracleDriver");
		   // 클래스의 정보를 읽어 온다 (리플렉션)
		   // 클래스 메모리 활동 
		   // 메소드 제어 , 멤버변수 제어 , 생성자 ... => 스프링 (클래스 관리)
		   // 등록시에 반드시 (패키지.클래스명)
	   }catch(ClassNotFoundException cf)
	   {
		   System.out.println(cf.getMessage());
	   }
   }
   // 2. 오라클 연결 
   public void getConnection()
   {
	   try
	   {
		   conn=DriverManager.getConnection(URL,"hr","happy");
		   // 오라클로 전송 => conn hr/happy
	   }catch(Exception ex) {}
   }
   // 3. 오라클 닫기
   public void disConnection()
   {
	   try
	   {
		   if(ps!=null) ps.close();
		   if(conn!=null) conn.close();
		   // 오라클로 전송 => exit
	   }catch(Exception ex) {}
   }
   
   // 4.기능 
   // 4-1 . 목록 ==> 페이지 (인라인뷰)
   public List<BoardVO> boardListData(int page)
   {
	   List<BoardVO> list=new ArrayList<BoardVO>();
	   try
	   {
		   // 1. DB연결 
		   getConnection();
		   // 2. SQL문장 제작 
		   String sql="SELECT no,subject,name,regdate,hit,num "
				     +"FROM (SELECT no,subject,name,regdate,hit,rownum as num "
				     +"FROM (SELECT /*+ INDEX_DESC(jspBoard jb_no_pk)*/no,subject,name,regdate,hit "
				     +"FROM jspBoard)) "
				     +"WHERE num BETWEEN ? AND ?";
		   //  인라인뷰 / INDEX_ASC() / INDEX_DESC()
		   /*
		    *   1page => 1~10
		    *   2page => 11~20
		    *            21
		    *            31
		    */
		   int rowSize=10;
		   int start=(rowSize*page)-(rowSize-1);
		   int end=rowSize*page;
		   
		   // 3. SQL문장 전송 
		   ps=conn.prepareStatement(sql);
		   // 4. ?에 값을 채운다 
		   ps.setInt(1, start);
		   ps.setInt(2, end);
		   
		   // 5. 실행 요청 => 결과값을 메모리에 저장 
		   ResultSet rs=ps.executeQuery();
		   // 6. 메모리에 저장된 값을 List이동 
		   while(rs.next()) // 한줄씩 읽어 온다 
		   {
			  BoardVO vo=new BoardVO();
			  vo.setNo(rs.getInt(1));
			  vo.setSubject(rs.getString(2));
			  vo.setName(rs.getString(3));
			  vo.setRegdate(rs.getDate(4));
			  vo.setHit(rs.getInt(5));
			  list.add(vo);
		   }
		   rs.close();
				     
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();
	   }
	   return list;
   }
   // 4-2 . 총페이지 구하기
   /*
    *   결과값 (리턴형) 
    *   1. 목록 => List
    *   2. 상세보기 => VO 
    *   3. 총페이지, 갯수 => int
    *   4. 찾기 => List
    *   
    *   매개변수 
    *   1. 목록 (페이지) => int
    *   2. 추가 => VO
    *   3. 수정 => VO
    *   4. 찾기 => String 
    *   5. 상세보기 => int 
    */
   public int boardTotalPage()
   {
	   int total=0;
	   try
	   {
		   // 1. 연결
		   getConnection();
		   // 2. SQL
		   String sql="SELECT CEIL(COUNT(*)/10.0) FROM jspBoard";
		   // 3. 오라클로 전송 
		   ps=conn.prepareStatement(sql);
		   // 4. 실행요청 
		   ResultSet rs=ps.executeQuery();
		   // 5. 출력위치에 커서 이동 
		   rs.next();
		   // 6. 커서가 있는 데이터 읽기
		   total=rs.getInt(1);
		   // 7. 메모리 종료
		   rs.close();
		   
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();
	   }
	   return total;
   }
   // 4-3 . 글쓰기 ==> INSERT (Primary Key)
   public void boardInsert(BoardVO vo)
   {
	   try
	   {
		   // 1. 연결 
		   getConnection();
		   // 2. SQL문장 제작
		   String sql="INSERT INTO jspBoard(no,name,subject,content,pwd) "
				     +"VALUES((SELECT NVL(MAX(no)+1,1) FROM jspBoard),?,?,?,?)";
		   // ?는 사용자 보내준 데이터가 첨부 => 매개변수를 이용해서 => 대입 
		   // 3. 오라클로 SQL문장 전송 
		   ps=conn.prepareStatement(sql);
		   // 4. ?에 값을 채워서 실행 요청 
		   ps.setString(1, vo.getName());
		   ps.setString(2, vo.getSubject());
		   ps.setString(3, vo.getContent());
		   ps.setString(4, vo.getPwd());
		   // 5. 실행 요청 
		   ps.executeUpdate(); 
		   /*
		    *   오라클 실행 요청 
		    *   executeQuery() : 실행된 결과값이 있는 경우 
		    *                    SELECT
		    *   executeUpdate() : 실행 결과값 없고 데이터가 변경될때
		    *                    INSERT , UPDATE , DELETE
		    *                    => 첨부 : Commit
		    *                    자바 (JDBC) => autocommit을 사용 
		    *                    ------------------------------
		    *   INSERT => UPADTE ==> 동시처리 (트랜잭션)
		    *     |
		    *    오류  
		    */
	   }catch(Exception ex)
	   {
		   // 오류 처리
		   ex.printStackTrace();
	   }
	   finally
	   {
		   // 닫기
		   disConnection();
	   }
   }
   // 4-4 . 내용보기 ==> 조회수 증가 , 실제 상세 보기 
   public BoardVO boardDetailData(int no)
   {
	   BoardVO vo=new BoardVO();
	   try
	   {
		   //1. 연결
		   getConnection();
		   // 조회수 증가 
		   String sql="UPDATE jspBoard SET "
				     +"hit=hit+1 "
				     +"WHERE no=?";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, no);
		   // 실행 
		   ps.executeUpdate();
		   
		   // 실제 데이터 읽기 
		   sql="SELECT no,name,subject,content,regdate,hit "
			  +"FROM jspBoard "
			  +"WHERE no=?";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, no);
		   // 실행 요청
		   ResultSet rs=ps.executeQuery();
		   // 메모리(rs)에 데이터를 vo에 채워준다 
		   rs.next();
		   vo.setNo(rs.getInt(1));
		   vo.setName(rs.getString(2));
		   vo.setSubject(rs.getString(3));
		   vo.setContent(rs.getString(4));
		   vo.setRegdate(rs.getDate(5));
		   vo.setHit(rs.getInt(6));
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();
	   }
	   return vo;
   }
   // 4-5 . 수정 데이터 읽기 
   public BoardVO boardUpdateData(int no)
   {
	   BoardVO vo=new BoardVO(); // 이름 , 제목 , 내용 
	   try
	   {
		   // 1. 연결
		   getConnection();
		   // 2. SQL문장 제작
		   String sql="SELECT name,subject,content "
				     +"FROM jspBoard "
				     +"WHERE no=?";
		   // 3. SQL문장을 오라클로 전송
		   ps=conn.prepareStatement(sql);
		   // 4. ?에 값을 채운다
		   ps.setInt(1, no);
		   // 5. 실행후 결과값 저장 요청 
		   ResultSet rs=ps.executeQuery();
		   // 6. 데이터 읽기 
		   rs.next();
		   vo.setName(rs.getString(1));
		   vo.setSubject(rs.getString(2));
		   vo.setContent(rs.getString(3));
		   
		   // 7. 메모리 해제 
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();
	   }
	   return vo;
   }
   ////////////////////// => 비밀번호 검사 
   // 4-6 . 실제 수정 ==>  UPDATE 
   public boolean boardUpdate(BoardVO vo)
   {
	   boolean bCheck=false;
	   try
	   {
		   // 1. 연결 
		   getConnection();
		   // 2. SQL문장 
		   String sql="SELECT pwd FROM jspBoard "
				     +"WHERE no=?";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, vo.getNo());
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   String db_pwd=rs.getString(1);
		   rs.close();
		   
		   if(db_pwd.equals(vo.getPwd()))
		   {
			   bCheck=true;
			   // 실제 수정 
			   sql="UPDATE jspBoard SET "
				  +"name=?,subject=?,content=?,regdate=SYSDATE "
				  +"WHERE no=?";
			   ps=conn.prepareStatement(sql);
			   // ?에 값을 채운다 
			   ps.setString(1, vo.getName());
			   ps.setString(2, vo.getSubject());
			   ps.setString(3, vo.getContent());
			   ps.setInt(4, vo.getNo());
			   // 실행 
			   ps.executeUpdate(); // commit포함
		   } 
		   else
		   {
			   bCheck=false;
		   }
		   
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();
	   }
	   return bCheck;
   }
   // 4-7 . 삭제 ==> DELETE
   public boolean boardDelete(int no,String pwd)
   {
	   // 매개변수 1,2 => 일반데이터형으로 받는다 , 3이상 => ~VO에 묶어서 처리 
	   boolean bCheck=false;
	   // true=> 비밀번호(O) => 삭제 
	   // false=>비밀번호(X) => 리턴 => 비밀번호 재입력
	   try
	   {
		   // 1. 연결
		   getConnection();
		   // 2. SQL => 데이터베이스에 저장된 비밀번호 읽기 
		   String sql="SELECT pwd FROM jspBoard "
				     +"WHERE no=?";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, no);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   String db_pwd=rs.getString(1);
		   rs.close();
		   // 3. 비교 (오라클에 있는 값 , 사용자가 보내준 비밀번호 비교)
		   if(db_pwd.equals(pwd))
		   {
			   bCheck=true;
			   // 실제 데이터베이스 삭제 
			   sql="DELETE FROM jspBoard "
				  +"WHERE no=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, no);
			   ps.executeUpdate();
		   }
		   else
		   {
			   bCheck=false;
		   }
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();
	   }
	   return bCheck;
   }
   // 4-8. 검색 (영화(장르,영화명,출연진,등급) , 맛집(종류,이름,지역,평점) ....)
   public List<BoardVO> boardFind(String fs,String ss)
   {
	   List<BoardVO> list=new ArrayList<BoardVO>();
	   try
	   {
		   // 1. 연결 
		   getConnection();
		   // 2. SQL문장을 만든다 
		   String sql="SELECT no,subject,name,regdate,hit "
				     +"FROM jspBoard "
				     +"WHERE "+fs+" LIKE '%'||?||'%'";
		   // 컬럼명 , 테이블명 => ?를 사용하지 않는다 
		   // setString(번호,fs) ==> name ==> 'name'
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, ss);
		   // 3. 실행
		   ResultSet rs=ps.executeQuery();
		   while(rs.next())
		   {
			   BoardVO vo=new BoardVO();
			   vo.setNo(rs.getInt(1));
			   vo.setSubject(rs.getString(2));
			   vo.setName(rs.getString(3));
			   vo.setRegdate(rs.getDate(4));
			   vo.setHit(rs.getInt(5));
			   list.add(vo);
		   }
		   rs.close();
	   }catch(Exception ex) 
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();
	   }
	   return list;
   }
   
}











