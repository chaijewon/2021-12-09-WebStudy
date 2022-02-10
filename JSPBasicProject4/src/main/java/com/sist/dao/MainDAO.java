package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MainDAO {
	// 연결 객체 
	   private Connection conn;
	   // SQL 전송 객체 
	   private PreparedStatement ps;
	   // URL
	   private final String URL="jdbc:oracle:thin:@211.63.89.131:1521:XE";
	   
	    // 1. 드라이버 등록 => 싱글턴 (한번만 호출 => 생성자) : 멤버변수 초기화 , 드라이버 등록 , 서버연결
	   public MainDAO()
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
	   // 4. Books 읽기
	   public List<BookVO> bookListData()
	   {
		   List<BookVO> list=new ArrayList<BookVO>();
		   try
		   {
			   getConnection();
			   String sql="SELECT title,poster,rownum "
					     +"FROM books "
					     +"WHERE rownum<=20";
			   ps=conn.prepareStatement(sql);
			   ResultSet rs=ps.executeQuery();
			   while(rs.next())
			   {
				   BookVO vo=new BookVO();
				   vo.setTitle(rs.getString(1));
				   vo.setPoster(rs.getString(2));
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
	   // 5. 뮤직 읽기
	   public List<MusicVO> musicListData()
	   {
		   List<MusicVO> list=new ArrayList<MusicVO>();
		   try
		   {
			   getConnection();
			   String sql="SELECT no,title,poster,singer "
					     +"FROM genie_music";
			   ps=conn.prepareStatement(sql);
			   ResultSet rs=ps.executeQuery();
			   while(rs.next())
			   {
				   MusicVO vo=new MusicVO();
				   vo.setNo(rs.getInt(1));
				   vo.setTitle(rs.getString(2));
				   vo.setPoster(rs.getString(3));
				   vo.setSinger(rs.getString(4));
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










