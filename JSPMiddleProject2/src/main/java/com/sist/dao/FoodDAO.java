package com.sist.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
public class FoodDAO {
   private Connection conn;
   private PreparedStatement ps;
   
   // 1. 미리 생성된 Connection주소를 얻어온다 (톰캣 => 10개 Connection)
   // ==> 저장공간의 이름을 POOL ==> ConnectionPool
   public void getConnection()
   {
	   try
	   {
		   Context init=new InitialContext();
		   // JNDI => 디렉토리 형식 (탐색기) 
		   Context c=(Context)init.lookup("java://comp/env");
		   // java://comp/env => Connection객체가 저장됨 
		   // jdbc/oracle => 저장된 주소의 별칭 
		   DataSource ds=(DataSource)c.lookup("jdbc/oracle");
		   // DataSource => 데이터베이스에 대한 모든 정보가 저장된 클래스 
		   conn=ds.getConnection();
	   }catch(Exception ex) 
	   {
		   ex.printStackTrace();
	   }
   }
   // 2. 사용후에 반환 
   public void disConnection()
   {
	   try
	   {
		   if(ps!=null) ps.close();
		   if(conn!=null) conn.close(); 
		   // 반환 => POOL영역에 설정 => 재사용 
		   // Connection객체의 갯수를 조정할 수 있다 
		   // 웹에서 일반적으로 사용되는 데이터베이스 프로그램 
		   // => ORM (MyBatis => DBCP)
	   }catch(Exception ex){}
   }
   // 기능 (로그인 처리) => 결과값이 3개 => int , String(가독성) 
   //                   결과값이 2개 => boolean 
   public String isLogin(String id,String pwd)
   {
	   String result="";
	   try
	   {
		   // 1. 미리 연결된 Connection주소 얻어오기 
		   getConnection();
		   // 2. SQL문장 => id가 존재하는지 확인 
		   String sql="SELECT COUNT(*) "
				     +"FROM jspMember "
				     +"WHERE id=?";
		   // 3. 오라클로 전송 (SQL)
		   ps=conn.prepareStatement(sql);
		   // 4. ?에 값을 채운다 
		   ps.setString(1, id);
		   // 5. 실행요청 => 결과값 얻기 
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   int count=rs.getInt(1);
		   rs.close();
		   if(count==0) //Id가 없는 상태
		   {
			   result="NOID";
		   }
		   else // Id가 존재
		   {
			    // 3. ID가 존재할때 password => 비교 
			   sql="SELECT pwd,name,addr "
				  +"FROM jspMember "
				  +"WHERE id=?";
			   ps=conn.prepareStatement(sql);
			   // ?에 값을 채운다 
			   ps.setString(1, id); // 'hong'
			   // 실행후에 결과값을 받는다 
			   rs=ps.executeQuery();
			   rs.next(); // 데이터 실행위치에 커서위치 변경 
			   String db_pwd=rs.getString(1);
			   String name=rs.getString(2);
			   String addr=rs.getString(3);
			   rs.close();
			   
			   if(db_pwd.equals(pwd))
			   {
				   // 로그인 
				   result=name+"|"+addr; // session에 저장 
				   // id,name,addr저장 
				   // 화면 이동 => 카테고리 
			   }
			   else
			   {
				   // 비밀번호가 틀린 상태 
				   result="NOPWD"; // 로그인창으로 이동 
			   }
		   }
		   
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   // 사용후에 반환 (Connection)
		   disConnection();
	   }
	   return result;
   }
   // 카테고리 출력 
   // 카테고리별 맛집 출력 
   // 맛집 상세보기 
   // 댓글 
   // 1. 댓글쓰기 
   // 2. 댓글수정 
   // 3. 댓글삭제 
}








