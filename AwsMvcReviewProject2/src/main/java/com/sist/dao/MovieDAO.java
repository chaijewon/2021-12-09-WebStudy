package com.sist.dao;
import java.util.*;//List(ROW여러개 묶어서 처리) => ROW (VO)
import java.sql.*; //Connection : 연결 , Statement:SQL문장 전송 / 결과값을 받는 역할 
// 결과값를 저장 : ResultSet 
// 라이브러리화 : MyBatis(ORM)
public class MovieDAO {
   private Connection conn; // 연결 객체 
   private PreparedStatement ps; // 송신/수신 
   // Statement (전송할 데이터+SQL), PreparedStatement(SQL문장을 먼저 보내준다 , 나중에 첨부할 데이터 전송) , 
   // CallableStatement (PL/SQL => 프로시저 호출)
   private final String URL="jdbc:oracle:thin:@211.63.89.131:1521:XE";
   //            => MySql jdbc:mysql://localhost:3306/mydb
   // 1. 드라이버 등록 
   /*
    *   생성자 역할 
    *   1. 멤버변수 초기화 (초기화) => 초기화 블록  {}
    *   2. 시작과 동시에 처리하는 애요이 있는 경우 
    *      자동 로그인 , 시작과 동시에 서버 연결 , 드라이버 연결 ...
    *   3. 여러개 만들 수 있다 (오버로딩) 
    *      오버로딩 VS 오버라이딩 (******)
    *      ------ new
    *                -------- modify 
    *   4. ***POJO : 스프링에서 주로 사요외는 기법 (다른 클래스와 연관이 없는 클래스)
    *   *** 팁 (먼저 : 정의 , 부연) 
    */
   public MovieDAO()
   {
	   // 한번만 수행되는 기능 처리 
	   try
	   {
		   Class.forName("oracle.jdbc.driver.OracleDriver");
		   // ojdbc8.jar
		   // Class.forName => 클래스의 정보 (멤버변수 , 메소드 , 생성자)
		   // 메모리 할당 
		   // 리플렉션 
	   }catch(Exception ex){}
   }
   // 열고 닫기 
   /*
    *   메소드 VS Function (독립적으로 사용이 가능) => C,Python,Kotlin,JavaScript
    *   -----    
    *     클래스 종속 (클래스안에서 생성)
    *   메소드 원칙 
    *   ---------
    *   1. 한가지 기능만 수행 
    *   2. 반복을 제거할 때 
    *   3. 구조화된 프로그램 (단락) => 수정시에 편리
    *   4. 목적 : 재사용 (오버라이딩)
    */
   // 반복 제거를 위해서 메소드 제작 
   public void getConnection()
   {
	   /*
	    *  예외 처리 : 사전에 에러 방지 (항상 정상 상태를 유지)
	    *   = 예외 복구 => try~catch
	    *   = 예외 회피 => throws 
	    */
	   try
	   {
		   conn=DriverManager.getConnection(URL,"hr","happy");
	   }catch(Exception ex){}
   }
   /*
    *   연결 Connection
    *   전송 Statement 
    *   결과 ResultSet
    *   ---------------
    *       ResultSet
    *       Statement
    *       Connection 
    */
   public void disConnection()
   {
	   try
	   {
		   if(ps!=null) ps.close();
		   if(conn!=null) conn.close();
	   }catch(Exception ex) {}
   }
   
   // 기능 수행 (요청 처리) => 예상  ==> 요청이 없는 경우 (유지 보수) => SM / SI 
   // SM/SI/솔루션/프레임워크(위탁받아 자체 개발) => R&D 
   // => 인원수 (20=>솔루션) 인원수 (50이상 => SI)
   public List<MovieVO> goodsListData(int page)
   {
	   List<MovieVO> list=new ArrayList<MovieVO>();
	   try
	   {
		   // 페이징 기법 / 인라인뷰  
		   // 1. 연결 
		   getConnection();
		   // 2. SQL문장 전송 => 인라인뷰 (보안) => Top-N (위에서 몇개) 
		   String sql="SELECT product_id,product_price,product_poster,"
				     +"product_name,num "
				     +"FROM (SELECT product_id,product_price,product_poster,"
				     +"product_name, rownum as num "
				     +"FROM (SELECT product_id,product_price,product_poster,product_name "
				     +"FROM goods ORDER BY 1 ASC)) "
				     +"WHERE num BETWEEN ? AND ?";
		   ps=conn.prepareStatement(sql); // 오라클로 먼저 SQL문장을 전송 
		   int rowSize=12;
		   int start=(rowSize*page)-(rowSize-1); // 오라클의 rownum => 1
		   int end=rowSize*page;
		   
		   // 값을 채운다 ==> 마이바티스 (매개변수)
		   ps.setInt(1,start);
		   ps.setInt(2, end);
		   
		   // 실행 
		   ResultSet rs=ps.executeQuery();
		   while(rs.next())
		   {
			   // 리턴형으로 전송 
			   MovieVO vo=new MovieVO();
			   vo.setProduct_id(rs.getInt(1));
			   vo.setProduct_price(rs.getInt(2));
			   vo.setProduct_poster(rs.getString(3));
			   vo.setProduct_name(rs.getString(4));
			   list.add(vo);
			   
		   }
		   rs.close();
				   
	   }catch(Exception ex)
	   {
		   ex.printStackTrace(); // 에러확인
	   }
	   finally
	   {
		   disConnection();//서버 닫기 , 데이터베이스 연결 해제 , 파일 닫기 
	   }
	   return list;
   }
   
   // 총페이지 => 
   public int goodsTotalPage()
   {
	   int total=0;
	   try
	   {
		   //1 연결
		   getConnection();
		   String sql="SELECT CEIL(COUNT(*)/12.0) FROM goods";
		   ps=conn.prepareStatement(sql);
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
		   disConnection();
	   }
	   return total;
   }
}









