package com.sist.dao;
// 10장 / 11장  => 생략
// 데이터베이스 연결 : JDBC 
import java.util.*;
// => ZipcodeVO(한개에 정보) => 여러개 모아서 전송 (컬렉션) => List
import java.sql.*;
/*
 *   1. 드라이버 등록 
 *      Class.forName("oracle.jdbc.driver.OracleDriver")
 *                     ------------------------------- ojdbc8.jar
 *                     11g => ojdbc6.jar
 *   2. 오라클 연결 
 *      Connection conn=DriverManager.getConnection(URL,"user","password")
 *   3. SQL문장 제작(SQL => 문자열로 제작) 
 *      String sql="SQL => ?"; => CRUD(INSERT,SELECT,UPDATE,DELETE:DML)
 *   4. SQL문장 전송 
 *      ps=conn.preparedStatement(sql);
 *   5. 실행전에 필요한 데이터여부 확인 => SQL문장에 ?
 *   6. 실행요청 => 결과값을 메모리에 저장 
 *      ResultSet rs=ps.executeQuery() => 한줄 (Record)
 *       SELECT no ,id ,name FROM table_name
 *      ------------------------------
 *         no      id      name 
 *      ------------------------------
 *         1       aaa     홍길동    | ==> next() => 한줄읽고 => 다음 => 다음
 *        ===     =====    =====
 *     getInt(1)  getString(2) getString(3) 
 *                getString("id")
 *       => 출력한 내용이 정수 ===> getInt(1)
 *       => 출력한 내용이 문자열 ==> getString(index:컬럼명)
 *       => 출력한 내용이 날짜  ==> getDate(index)
 *       => 출력한 내용이 실수  ==> getDouble(index)
 *      ------------------------------
 *         2       bbb     심청이   ==> ~VO
 *      ------------------------------
 *         3       ccc     박문수    | ==> previous()=> 한줄읽고 => 이전 =>이전 
 *      ------------------------------|커서위치 
 *   7. 저장된 데이터를 List(ZipcodeVO)에 채운다
 *   8. 닫기 
 *      ResultSet => close()
 *      PreparedStatement => close()
 *      Connection => close()
 *      
 *   *** 오라클은 연결 (가비지켈렉션이 회수하는 시간) => XE (50)
 *   *** 열고 닫기를 반복해야한다 
 *   *** 데이터수집 : 데이터를 크롤링하는 속도가 오라클 열고 닫는 속도보다 빠르다 
 *                 => 약간 느순하게 크롤링한다 (Thread.sleep())
 */
public class ZipcodeDAO {
   // 연결 객체 => 한번만 사용 => 멤버를 이용한다 
   private Connection conn;
   // SQL전송 / 결과값 받는 객체 
   private PreparedStatement ps;
   // URL주소 (오라클 주소) 
   private final String URL="jdbc:oracle:thin:@211.63.89.131:1521:XE";
   
   // 1. 드라이버 등록 => 싱글턴 (한번만 호출 => 생성자) : 멤버변수 초기화 , 드라이버 등록 , 서버연결
   public ZipcodeDAO()
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
   
   // 4. 각 테이블마다 기능 처리 (CURD)
   public List<ZipcodeVO> zipcodeListData(String dong)
   {
	   List<ZipcodeVO> list=new ArrayList<ZipcodeVO>();
	   try
	   {
		   // 1. 연결 
		   getConnection();
		   // 2. SQL문장 제작
		   String sql="SELECT zipcode, sido , gugun,dong,"
				     +"NVL(bunji,' ') "
				     +"FROM zipcode "
				     +"WHERE dong LIKE '%'||?||'%'";
		   // 3. SQL문장 전송
		   ps=conn.prepareStatement(sql);
		   // 4. ?에 값을 채운다 
		   ps.setString(1, dong);
		   // 5. 실행 요청 
		   ResultSet rs=ps.executeQuery();
		   // 6. List에 값을 채운다 
		   while(rs.next())
		   {
			   ZipcodeVO vo=new ZipcodeVO();
			   vo.setZipcode(rs.getString(1));
			   vo.setSido(rs.getString(2));
			   vo.setGugun(rs.getString(3));
			   vo.setDong(rs.getString(4));
			   vo.setBunji(rs.getString(5));
			   
			   list.add(vo);
		   }
		   rs.close();
	   }catch(Exception ex)
	   {
		   // 오류 처리 
		   ex.printStackTrace();
	   }
	   finally
	   {
		   // 오라클 닫기 
		   disConnection();
	   }
	   return list;
   }
   // 4-1. 우편번호 검색 , 맛집 검색  ==> 사용자 입력 => request
   public int zipcodeCount(String dong)
   {
	   int count=0;
	   try
	   {
		   getConnection();
		   String sql="SELECT COUNT(*) "
				     +"FROM zipcode "
				     +"WHERE dong LIKE '%'||?||'%'";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, dong);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   count=rs.getInt(1);
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   // 닫기 
		   disConnection();
	   }
	   return count;
   }
}






















