package com.sist.dao;
import java.util.*;
import java.sql.*;
public class BooksDAO {
   private Connection conn;
   private PreparedStatement ps;
   private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
   
   // 1. 드라이버 등록 
   public BooksDAO()
   {
	   try
	   {
		   Class.forName("oracle.jdbc.driver.OracleDriver");
	   }catch(Exception ex){}
   }
   
   // 2. 오라클 연결 
   public void getConnection()
   {
	   try
	   {
		   conn=DriverManager.getConnection(URL,"hr","happy");
	   }catch(Exception ex) {}
   }
   // 3. 오라클 닫기 
   public void disConnection()
   {
	   try
	   {
		   if(ps!=null) ps.close();
		   if(conn!=null) conn.close();
	   }catch(Exception ex) {}
   }
   
   // 4. 기능 
   public List<BooksVO> booksListData(int page)
   {
	   List<BooksVO> list=new ArrayList<BooksVO>();
	   try
	   {
		   // 1. 연결 
		   getConnection();
		   // 2. SQL문장을 만든다 => title,poster
		   String sql="SELECT title,poster "
				     +"FROM books "
				     +"ORDER BY no ASC";
		   // 3. 오라클 전송 
		   ps=conn.prepareStatement(sql);
		   // 4. 실행 결과를 읽어온다 
		   ResultSet rs=ps.executeQuery();
		   
		   // 페이지 나누기 
		   int i=0; // 10개씩 나눠주는 변수 
		   int j=0; // while이 돌아가는 횟수 
		   int rowSize=12;
		   int pagecnt=(page*rowSize)-rowSize;
		   // 출력 시작위치 
		   /*
		    *    1 page => 0 ~ 9
		    *    2 page => 10 ~ 19
		    */
		   while(rs.next())
		   {
			   if(i<rowSize && j>=pagecnt)
			   {
				   BooksVO vo=new BooksVO();
				   vo.setTitle(rs.getString(1));
				   vo.setPoster(rs.getString(2));
				   list.add(vo);
				   i++;
			   }
			   j++;
		   }
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();// 오류처리
	   }
	   finally
	   {
		   disConnection();// 닫기
	   }
	   return list;
   }
   
   // 총페이지 
   public int booksTotalPage()
   {
	   int total=0;
	   try
	   {
		   //1. 연결 
		   getConnection();
		   //2. SQL문장 
		   String sql="SELECT CEIL(COUNT(*)/12.0) FROM books";
		   //3. 오라클 전송 
		   ps=conn.prepareStatement(sql);
		   //4. 결과값 받기
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   //5. 변수에 저장
		   total=rs.getInt(1);
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();
	   }
	   return total;
   }
}






