package com.sist.dao;
import java.util.*;
import java.sql.*;
public class MusicDAO {
  private Connection conn;
  private PreparedStatement ps;
  private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
  // 드라이버 등록
  public MusicDAO()
  {
	  try
	  {
		  Class.forName("oracle.jdbc.driver.OracleDriver");
	  }catch(Exception ex) {}
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
  // 데이터를 묶어서 => 브라우저로 전송 
  public List<MusicVO> musicListData()
  {
	  List<MusicVO> list=new ArrayList<MusicVO>();
	  try
	  {
		  getConnection();
		  String sql="SELECT no,title,singer,poster "
				    +"FROM genie_music "
				    +"ORDER BY no ASC";
		  // 오라클 SQL문장 전송 
		  ps=conn.prepareStatement(sql);
		  // 결과값 받기 
		  ResultSet rs=ps.executeQuery();
		  // 결과값을 List에 담는다 
		  while(rs.next())
		  {
			  MusicVO vo=new MusicVO();
			  vo.setNo(rs.getInt(1));
			  vo.setTitle(rs.getString(2));
			  vo.setSinger(rs.getString(3));
			  vo.setPoster(rs.getString(4));
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







