package com.sist.dao;
// DAO VS Service
import java.util.*;
import java.sql.*;
public class FoodService {
	// 연결 객체 => 한번만 사용 => 멤버를 이용한다 
	   private Connection conn;
	   // SQL전송 / 결과값 받는 객체 
	   private PreparedStatement ps;
	   // URL주소 (오라클 주소) 
	   private final String URL="jdbc:oracle:thin:@211.63.89.131:1521:XE";
	   
	   // 1. 드라이버 등록 => 싱글턴 (한번만 호출 => 생성자) : 멤버변수 초기화 , 드라이버 등록 , 서버연결
	   public FoodService()
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
	   // 4. 기능 
	   // 4-1. => 카테고리 출력 
	   public List<CategoryVO> categoryData()
	   {
		   List<CategoryVO> list=new ArrayList<CategoryVO>();
		   try
		   {
			   //1. 연결
			   getConnection();
			   //2. SQL문장
			   String sql="SELECT cno,title,poster,subject "
					     +"FROM category "
					     +"ORDER BY cno ASC";
			   //3. 오라클로 SQL문장 전송 
			   ps=conn.prepareStatement(sql);
			   //4. ? => 값을 채운다 
			   //5. SQL실행 결과값 저장 
			   ResultSet rs=ps.executeQuery();
			   //6. 저장된 위치=> 데이터 읽기 => List
			   while(rs.next())
			   {
				   CategoryVO vo=new CategoryVO();
				   vo.setCno(rs.getInt(1));
				   vo.setTitle(rs.getString(2));
				   vo.setPoster(rs.getString(3));
				   vo.setSubject(rs.getString(4));
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
	   // 4-2. => 카테고리별 맛집 목록 
	   public List<FoodVO> categoryListData(int cno)
	   {
		   List<FoodVO> list=new ArrayList<FoodVO>();
		   try
		   {
			   getConnection();
			   String sql="SELECT no,name,address,tel,type,poster,score "
					     +"FROM foodhouse "
					     +"WHERE cno=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, cno);
			   ResultSet rs=ps.executeQuery();
			   while(rs.next())
			   {
				   FoodVO vo=new FoodVO();
				   vo.setNo(rs.getInt(1));
				   String address=rs.getString(2);
				   //address=address.substring(0,address.lastIndexOf("지"));
				   vo.setName(address);
				   vo.setAddress(rs.getString(3));
				   vo.setTel(rs.getString(4));
				   vo.setType(rs.getString(5));
				   String poster=rs.getString(6);
				   poster=poster.substring(0,poster.indexOf("^"));
				   poster=poster.replace("#","&");
				   vo.setScore(rs.getDouble(7));
				   vo.setPoster(poster);
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
	   // 4-3. => 카테고리 정보 출력 
	   public CategoryVO categoryInfoData(int cno)
	   {
		   CategoryVO vo=new CategoryVO();
		   try
		   {
			   getConnection();
			   String sql="SELECT title,subject "
					     +"FROM category "
					     +"WHERE cno=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, cno);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   vo.setTitle(rs.getString(1));
			   vo.setSubject(rs.getString(2));
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
	   // 4-4. => 맛집 상세 
	   public FoodVO foodDetailData(int no)
	   {
		   FoodVO vo=new FoodVO();
		   try
		   {
			   
		   }catch(Exception ex)
		   {
			   
		   }
		   finally
		   {
			   
		   }
		   return vo;
	   }
	   
}










