package com.sist.dao;
import java.util.*;

import com.sist.vo.CategoryVO;
import com.sist.vo.FoodVO;

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
				     +"FROM category "
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
				     +"FROM foodhouse "
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
		   // 오라클 전송 
		   // ?에 값을 채운다
		   // 실행후에 결과값 저장 
		   // VO에 값을 채운다 
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
}









