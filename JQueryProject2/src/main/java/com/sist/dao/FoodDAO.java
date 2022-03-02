package com.sist.dao;
import java.util.*;
import java.sql.*;
public class FoodDAO {
  private Connection conn;
  private PreparedStatement ps;
  private final String URL="jdbc:oracle:thin:@211.63.89.131:1521:XE";
  
  public FoodDAO()
  {
	  try
	  {
		  Class.forName("oracle.jdbc.driver.OracleDriver");
	  }catch(Exception ex){}
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
  // 맛집 찾기 
  public List<FoodVO> foodSerachData(String addr)
  {
	  List<FoodVO> list=new ArrayList<FoodVO>();
	  try
	  {
		  getConnection();
		  String sql="SELECT name,poster, rownum "
				    +"FROM (SELECT name,poster "
				    +"FROM food_location "
				    +"WHERE address LIKE '%'||?||'%') "
				    +"WHERE rownum<=20";
		  ps=conn.prepareStatement(sql);
		  ps.setString(1, addr);
		  ResultSet rs=ps.executeQuery();
		  while(rs.next())
		  {
			  FoodVO vo=new FoodVO();
			  vo.setName(rs.getString(1));
			  String poster=rs.getString(2);
			  poster=poster.substring(0,poster.indexOf("^"));
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
}









