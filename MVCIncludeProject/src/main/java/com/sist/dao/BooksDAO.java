package com.sist.dao;
import java.util.*;

import com.sist.vo.BooksVO;

import java.sql.*;
public class BooksDAO {
   private Connection conn;
   private PreparedStatement ps;
   private ConnectionManager cm=new ConnectionManager();
   // DAO에서 공통으로 사용되는 기능 모아서 처리 
   public List<BooksVO> booksListData(int page)
   {
	   List<BooksVO> list=new ArrayList<BooksVO>();
	   try
	   {
		   conn=cm.getConnection();// 재사용기법 (공통모듈) 
		   String sql="SELECT title,poster,num "
				     +"FROM (SELECT title,poster,rownum as num "
				     +"FROM (SELECT title,poster "
				     +"FROM books ORDER BY no ASC)) "
				     +"WHERE num BETWEEN ? AND ?";//1~20 , 21~40
		   int rowSize=20;
		   int start=(rowSize*page)-(rowSize-1);
		   int end=rowSize*page;
		   
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, start);
		   ps.setInt(2, end);
		   
		   ResultSet rs=ps.executeQuery();
		   while(rs.next())
		   {
			   BooksVO vo=new BooksVO();
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
		   cm.disConnection(conn, ps);
	   }
	   return list;
   }
}
