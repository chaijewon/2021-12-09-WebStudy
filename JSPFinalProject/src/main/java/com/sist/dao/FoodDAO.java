package com.sist.dao;
import java.util.*;

import com.sist.vo.CategoryVO;
import com.sist.vo.FoodVO;
import com.sist.vo.SeoulLocationVO;

import java.sql.*;
public class FoodDAO {
   private Connection conn;
   private PreparedStatement ps;
   private DBCPConnection dbcp=new DBCPConnection(); // 포함 (재사용)
   //getConnection() , disConnection()
   //기능 
   //1.카테고리 읽기 
   public List<CategoryVO> categoryAllData()
   {
	   List<CategoryVO> list=new ArrayList<CategoryVO>();
	   try
	   {
		   // 미리 생성된 Connection 객체를 얻어 온다 
		   conn=dbcp.getConnection();
		   String sql="SELECT cno,title,subject,poster "
				     +"FROM food_category "
				     +"ORDER BY cno ASC";
		   ps=conn.prepareStatement(sql);
		   ResultSet rs=ps.executeQuery();
		   while(rs.next())
		   {
			   //rs=> Record
			   CategoryVO vo=new CategoryVO();
			   vo.setCno(rs.getInt(1));
			   vo.setTitle(rs.getString(2));
			   vo.setSubject(rs.getString(3));
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
		   // Connection을 사용후에 재사용을 위해서 반환 
		   dbcp.disConnection(conn, ps);
	   }
	   return list;
   }
   // 2. 카테고리별 맛집을 출력 => 카테고리에 해당되는 맛집을 출력 
   public List<FoodVO> categoryFoodListData(int cno)
   {
	   List<FoodVO> list=new ArrayList<FoodVO>();
	   try
	   {
		   //1. Connection 주소 얻기 
		   conn=dbcp.getConnection();
		   //2. SQL문장 
		   String sql="SELECT no,cno,poster,name,score,tel,address,type "
				     +"FROM food_house "
				     +"WHERE cno=? "
				     +"ORDER BY no ASC";
		   //3. 오라클 전송 
		   ps=conn.prepareStatement(sql);
		   //4. ?에 값을 채운다 
		   ps.setInt(1, cno);
		   //5. 결과값을 받는다 => list에 값을 채운다 
		   ResultSet rs=ps.executeQuery();
		   while(rs.next())
		   {
			   FoodVO vo=new FoodVO();
			   vo.setNo(rs.getInt(1));
			   vo.setCno(rs.getInt(2));
			   String poster=rs.getString(3);
			   poster=poster.substring(0,poster.indexOf("^"));
			   // 이미지가 5개 묶여있다 => ^
			   vo.setPoster(poster);
			   vo.setName(rs.getString(4));
			   vo.setScore(rs.getDouble(5));
			   vo.setTel(rs.getString(6));
			   String address=rs.getString(7);
			   address=address.substring(0,address.lastIndexOf("지"));
			   vo.setAddress(address.trim());
			   vo.setType(rs.getString(8));
			   list.add(vo);
		   }
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace(); // 오류 확인 
	   }
	   finally
	   {
		   // 반환 
		   dbcp.disConnection(conn, ps);
	   }
	   return list;
   }
   // 카테고리 정보 읽기 
   public CategoryVO categoryInfoData(int cno)
   {
	   CategoryVO vo=new CategoryVO();
	   try
	   {
		   // 주소값 얻기 
		   conn=dbcp.getConnection();
		   // SQL
		   String sql="SELECT title,subject "
				     +"FROM food_category "
				     +"WHERE cno=?";
		   // 오라클 전송 
		   ps=conn.prepareStatement(sql);
		   // ?에 값을 채운다
		   ps.setInt(1, cno);
		   // 실행후에 결과값 저장
		   ResultSet rs=ps.executeQuery();
		   // VO에 값을 채운다 
		   rs.next();
		   vo.setTitle(rs.getString(1));
		   vo.setSubject(rs.getString(2));
		   rs.close();
	   }catch(Exception ex)
	   {
		   // 에러 확인 
		   ex.printStackTrace();
	   }
	   finally
	   {
		   // 반환 
		   dbcp.disConnection(conn, ps);
	   }
	   return vo;
   }
   // 상세보기
   public FoodVO foodDetailData(int no)
   {
	   FoodVO vo=new FoodVO();
	   try
	   {
		   //1. 주소값을 얻어 온다 
		   conn=dbcp.getConnection();
		   //2. SQL 
		   String sql="SELECT no,cno,name,score,address,tel,type,"
				     +"price,parking,menu,time,poster "
				     +"FROM food_house "
				     +"WHERE no=?";
		   //3. 전송 (SQL)
		   ps=conn.prepareStatement(sql);
		   //4. ?에 값을 채운다 
		   ps.setInt(1, no);
		   //5. 결과값 => vo
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   vo.setNo(rs.getInt(1));
		   vo.setCno(rs.getInt(2));
		   vo.setName(rs.getString(3));
		   vo.setScore(rs.getDouble(4));
		   vo.setAddress(rs.getString(5));
		   vo.setTel(rs.getString(6));
		   vo.setType(rs.getString(7));
		   //MVC => 가장 쉬운 방법을 선택 
		   vo.setPrice(rs.getString(8));
		   vo.setParking(rs.getString(9));
		   vo.setMenu(rs.getString(10));
		   vo.setTime(rs.getString(11));
		   vo.setPoster(rs.getString(12));
		   System.out.println(vo.getName());
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   // 반환 
		   dbcp.disConnection(conn, ps);
	   }
	   return vo;
   }
   // 지역별 찾기 (동,구) ==> 
   public List<FoodVO> foodLocationFindData(String ss,int page)
   {
	   List<FoodVO> list=new ArrayList<FoodVO>();
	   try
	   {
		   conn=dbcp.getConnection();
		   //SQL
		   String sql="SELECT no,poster,name,num "
				     +"FROM (SELECT no,poster,name,rownum as num "
				     +"FROM (SELECT no,poster,name "
				     +"FROM food_location WHERE address LIKE '%'||?||'%' "
				     +"ORDER BY 1)) "
				     +"WHERE num BETWEEN ? AND ?";
		   ps=conn.prepareStatement(sql);
		   int rowSize=12;
		   int start=(rowSize*page)-(rowSize-1);
		   int end=rowSize*page;
		   
		   ps.setString(1, ss);
		   ps.setInt(2, start);
		   ps.setInt(3, end);
		   
		   ResultSet rs=ps.executeQuery();
		   while(rs.next())
		   {
			   FoodVO vo=new FoodVO();
			   vo.setNo(rs.getInt(1));
			   String poster=rs.getString(2);
			   poster=poster.substring(0,poster.indexOf("^"));
			   vo.setPoster(poster);
			   vo.setName(rs.getString(3));
			   
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
   
   public int foodLoactionFindTotalPage(String ss)
   {
	   int total=0;
	   try
	   {
		   conn=dbcp.getConnection();
		   String sql="SELECT CEIL(COUNT(*)/12.0) FROM food_location "
				     +"WHERE address LIKE '%'||?||'%'";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, ss);
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
   
}









