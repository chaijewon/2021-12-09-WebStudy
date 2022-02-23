package com.sist.dao;
import java.util.*;

import com.sist.vo.SeoulHotelVO;
import com.sist.vo.SeoulLocationVO;
import com.sist.vo.SeoulNatureVO;

import java.sql.*;
public class SeoulDAO {
   private Connection conn;
   private PreparedStatement ps;
   private DBCPConnection dbcp=new DBCPConnection();
   // 오라클 연결 / 오라클 닫기 
   //1. 기능 수행
   //1-1. 명소 읽기
   public List<SeoulLocationVO> seoulLocationData(int page)
   {
	   List<SeoulLocationVO> list=new ArrayList<SeoulLocationVO>();
	   try
	   {
		   //1. 주소 읽기 
		   conn=dbcp.getConnection();
		   //2. SQL문장 
		   String sql="SELECT no,title,poster,num "
				     +"FROM (SELECT no,title,poster,rownum as num "
				     +"FROM (SELECT no,title,poster "
				     +"FROM seoul_location ORDER BY no DESC)) "
				     +"WHERE num BETWEEN ? AND ?";
		   // 인라인뷰 => Top-N => 중간에 데이터를 자를 수 없다 
		   ps=conn.prepareStatement(sql);
		   int rowSize=12;
		   int start=(rowSize*page)-(rowSize-1);
		   int end=rowSize*page; 
		   /*
		    *   rownum은 1번부터 시작 
		    *   1page => 1~12 start=(rowSize*page)-(rowSize-1);
		    *                            12       - 11  1
		    *                 int end=rowSize*page =>   12
		    *   2page => 13~24
		    *                 start=(rowSize*page)-(rowSize-1);
		    *                           24   -> 11 => 13
		    *                 int end=rowSize*page => 24
		    *   3     => 25~36
		    */
		   // ?에 값을 채운다 
		   ps.setInt(1, start);
		   ps.setInt(2, end);
		   ResultSet rs=ps.executeQuery();
		   while(rs.next())
		   {
			   SeoulLocationVO vo=new SeoulLocationVO();
			   vo.setNo(rs.getInt(1));
			   vo.setTitle(rs.getString(2));
			   vo.setPoster(rs.getString(3));
			   
			   list.add(vo);
		   }
		   rs.close();
		   
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   dbcp.disConnection(conn, ps);
	   }
	   return list;
   }
   //=> 명소 => 총페이지 
   public int seoulLocTotalPage()
   {
	   int total=0;
	   try
	   {
		   conn=dbcp.getConnection();
		   String sql="SELECT CEIL(COUNT(*)/12.0) "
				     +"FROM seoul_location";
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
		   dbcp.disConnection(conn, ps);
	   }
	   return total;
   }
   //1-2. 명소 상세보기 
   //1-1. 자연 읽기 
   public List<SeoulNatureVO> seoulNatureData(int page)
   {
	   List<SeoulNatureVO> list=new ArrayList<SeoulNatureVO>();
	   try
	   {
		   //1. 주소 읽기 
		   conn=dbcp.getConnection();
		   //2. SQL문장 
		   String sql="SELECT no,title,poster,num "
				     +"FROM (SELECT no,title,poster,rownum as num "
				     +"FROM (SELECT no,title,poster "
				     +"FROM seoul_nature ORDER BY no DESC)) "
				     +"WHERE num BETWEEN ? AND ?";
		   // 인라인뷰 => Top-N => 중간에 데이터를 자를 수 없다 
		   ps=conn.prepareStatement(sql);
		   int rowSize=12;
		   int start=(rowSize*page)-(rowSize-1);
		   int end=rowSize*page; 
		   /*
		    *   rownum은 1번부터 시작 
		    *   1page => 1~12 start=(rowSize*page)-(rowSize-1);
		    *                            12       - 11  1
		    *                 int end=rowSize*page =>   12
		    *   2page => 13~24
		    *                 start=(rowSize*page)-(rowSize-1);
		    *                           24   -> 11 => 13
		    *                 int end=rowSize*page => 24
		    *   3     => 25~36
		    */
		   // ?에 값을 채운다 
		   ps.setInt(1, start);
		   ps.setInt(2, end);
		   ResultSet rs=ps.executeQuery();
		   while(rs.next())
		   {
			   SeoulNatureVO vo=new SeoulNatureVO();
			   vo.setNo(rs.getInt(1));
			   vo.setTitle(rs.getString(2));
			   vo.setPoster(rs.getString(3));
			   
			   list.add(vo);
		   }
		   rs.close();
		   
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   dbcp.disConnection(conn, ps);
	   }
	   return list;
   }
   //=> 자연 => 총페이지
   public int seoulNatureTotalPage()
   {
	   int total=0;
	   try
	   {
		   conn=dbcp.getConnection();
		   String sql="SELECT CEIL(COUNT(*)/12.0) "
				     +"FROM seoul_nature";
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
		   dbcp.disConnection(conn, ps);
	   }
	   return total;
   }
   //1-2. 자연 상세보기 
   //1-1. 호텔 읽기 
   //=> 호텔 => 총페이지 
   // JSP => Model => DAO => Model => JSP => 흐름
   public List<SeoulHotelVO> seoulHotelData(int page)
   {
	   List<SeoulHotelVO> list=new ArrayList<SeoulHotelVO>();
	   try
	   {
		   conn=dbcp.getConnection();
		   // SQL문장 입력 
		   String sql="SELECT no,name,score,poster,num "
				     +"FROM (SELECT no,name,score,poster,rownum as num "
				     +"FROM (SELECT no,name,score,poster "
				     +"FROM seoul_hotel ORDER BY no ASC)) "
				     +"WHERE num BETWEEN ? AND ?";
		   ps=conn.prepareStatement(sql);
		   int rowSize=12;
		   int start=(rowSize*page)-(rowSize-1);
		   int end=rowSize*page;
		   
		   ps.setInt(1, start);
		   ps.setInt(2, end);
		   
		   ResultSet rs=ps.executeQuery();
		   while(rs.next())
		   {
			   SeoulHotelVO vo=new SeoulHotelVO();
			   vo.setNo(rs.getInt(1));
			   vo.setName(rs.getString(2));
			   vo.setScore(rs.getDouble(3));
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
		   dbcp.disConnection(conn, ps);
	   }
	   return list;
   }
   public int seoulHotelTotalPage()
   {
	   int total=0;
	   try
	   {
		   conn=dbcp.getConnection();
		   String sql="SELECT CEIL(COUNT(*)/12.0) FROM seoul_hotel";
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
		   dbcp.disConnection(conn, ps);
	   }
	   return total;
   }
   //1-2. 명소 상세보기
   /*
    *  NO                                        NOT NULL NUMBER
     TITLE                                     NOT NULL VARCHAR2(200)
     POSTER                                    NOT NULL VARCHAR2(500)
     MSG                                       NOT NULL VARCHAR2(4000)
     ADDRESS
    */
   public SeoulLocationVO locationDetail(int no)
   {
	   SeoulLocationVO vo=new SeoulLocationVO();
	   try
	   {
		   conn=dbcp.getConnection();
		   String sql="SELECT no,title,poster,msg,address "
				     +"FROM seoul_location "
				     +"WHERE no=?";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, no);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   vo.setNo(rs.getInt(1));
		   vo.setTitle(rs.getString(2));
		   vo.setPoster(rs.getString(3));
		   vo.setMsg(rs.getString(4));
		   String addr=rs.getString(5);
		   addr=addr.substring(addr.indexOf(" ")+1);
		   vo.setAddress(addr.trim());
		   rs.close();
	   }catch(Exception ex)
	   {
		  ex.printStackTrace();   
	   }
	   finally
	   {
		   dbcp.disConnection(conn, ps);
	   }
	   return vo;
   }
   
}








