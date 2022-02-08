package com.sist.dao;
import java.sql.*;
import java.util.*;
// DAO => table (한개 : DAO,VO)
public class FoodDAO {
  private Connection conn;
  private PreparedStatement ps;
  private final String URL="jdbc:oracle:thin:@211.63.89.131:1521:XE";
  // 드라이버 등록 
  public FoodDAO()
  {
	  try
	  {
		  Class.forName("oracle.jdbc.driver.OracleDriver");
	  }catch(Exception ex)
	  {
		  System.out.println(ex.getMessage());
	  }
  }
  // 오라클 연결 
  public void getConnection()
  {
	  try
	  {
		  conn=DriverManager.getConnection(URL,"hr","happy");
	  }catch(Exception ex){}
  }
  // 오라클 닫기 
  public void disConnection()
  {
	  try
	  {
		  if(ps!=null) ps.close();
		  if(conn!=null) conn.close();
	  }catch(Exception ex) {}
  }
  //--------------- 클래스를 만들어서 DAO제작시마다 적용 (공통 모듈) 
  // 기능 
  // 1. 카테고리 읽기 
  public List<CategoryVO> categoryListData()
  {
	  List<CategoryVO> list=new ArrayList<CategoryVO>();
	  try
	  {
		  // 1. 오라클 연결 
		  getConnection();
		  // 2. SQL문장 전송(문자열로 전송)
		  String sql="SELECT cno,title,subject,poster "
				    +"FROM category "
				    +"ORDER BY cno ASC";
		  ps=conn.prepareStatement(sql);
		  // 3. SQL문장 실행 요청 => 실행된 데이터 받기 
		  ResultSet rs=ps.executeQuery();
		  // 4. 받은 데이터를 => List에 담아 준다
		  // ResultSet에 있는 데이터 첫번째 위치부터 출력 (next()) => Record
		  while(rs.next())
		  {
			  CategoryVO vo=new CategoryVO();
			  vo.setCno(rs.getInt(1));
			  vo.setTitle(rs.getString(2));
			  vo.setSubject(rs.getString(3));
			  vo.setPoster(rs.getString(4));
			  
			  list.add(vo);
		  }
		  rs.close();
		  // 5. => 담아둔 데이터를 브라우저로 전송 
	  }catch(Exception ex)
	  {
		  // 오류 처리 
		  ex.printStackTrace(); // SQL문장에서 주로 오류 발생 
	  }
	  finally
	  {
		  // 오라클 닫기 
		  disConnection();
	  }
	  return list;
  }
  
}










