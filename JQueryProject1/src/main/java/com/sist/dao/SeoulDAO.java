package com.sist.dao;
import java.util.*;
import java.sql.*;
/*
 *    클래스 
 *    -----
 *     1. 멤버변수 
 *     2. 생성자 => 멤버변수의 초기화
 *     3. 메소드 => 멤버변수의 활용 
 *        ----- 기능이 동일할때 => 인터페이스 (오버라이딩) 
 *   ---------------------------------------------
 *     오류방지 / 비정상 종료 방지 => 예외처리 
 *     => 모든 프로그램은 데이터 관리 
 *                    ---------
 */
public class SeoulDAO {
   private Connection conn;
   private PreparedStatement ps;
   private final String URL="jdbc:oracle:thin:@211.63.89.131:1521:XE";
   // 드라이버 등록 
   public SeoulDAO()
   {
	   // 시작과 동시에 처리하는 기능이 있는 경우 
	   // 외부에서 데이터를 읽어서 멤버변수에 값 대입 
	   // 한번만 수행할때 수행 
	   // MyBatis => 시작과 동시에 XML을 읽어서 저장 , Spring도 시작과 동시에 XML 읽기
	   try
	   {
		   Class.forName("oracle.jdbc.driver.OracleDriver");
		   // 리플렉션 => 클래스이름으로 메모리 활당 
		   // 멤버변수,메소드 , 생성자를 제어할 목적으로 만드는 프로그램 
		   // => DriverManager
		   // thin(연결만 해주는 역할 : 무료)/oci(드라이버에 오라클의 모든 정보를 첨부해서 사용:유료)
	   }catch(Exception ex) {}
   }
   // 연결 
   public void getConnection()
   {
	   try
	   {
		   conn=DriverManager.getConnection(URL,"hr","happy");
	   }catch(Exception ex) {}
   }
   // 닫기
   public void disConnection()
   {
	   try
	   {
		   if(ps!=null) ps.close();
		   if(conn!=null) conn.close();
	   }catch(Exception ex) {}
   }
   // 기능 설정 
   public List<SeoulLocationVO> locationAllData()
   {
	   List<SeoulLocationVO> list=new ArrayList<SeoulLocationVO>();
	   try
	   {
		   getConnection();
		   String sql="SELECT no,title,poster,msg,address "
				     +"FROM seoul_location "
				     +"ORDER BY 1";
		   ps=conn.prepareStatement(sql);
		   ResultSet rs=ps.executeQuery();
		   while(rs.next())
		   {
			   SeoulLocationVO vo=new SeoulLocationVO();
			   vo.setNo(rs.getInt(1));
			   vo.setTitle(rs.getString(2));
			   vo.setPoster(rs.getString(3));
			   vo.setMsg(rs.getString(4));
			   vo.setAddress(rs.getString(5));
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








