package com.sist.board.dao;
// 과정 => Spring / MyBatis / AWS
/*
 *   MVC 이해 
 *   Oracle SQL 
 *   ---------- 화면 UI (자바스크립트)
 */
import java.util.*;

import javax.websocket.Session;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;
import java.sql.ResultSet;
/*
 *   변수,클래스 초기화 
 *   1) 생성자 => 호출 
 *   2) 초기화 블록 => 호출없이 수행 
 *      --------
 *      class A
 *      {
 *         int a;
 *         {
 *            a=100;
 *         }
 *         static int b;
 *         static{
 *            b=200;
 *         }
 *      }
 */
public class BoardDAO {
   // 1. XML을 읽어서 저장 (파싱) 
   private static SqlSessionFactory ssf;
   // 자동으로 읽어서 저장 => 초기화 블록 , 생성자 
   static
   {
	   try
	   {
		   Reader reader=Resources.getResourceAsReader("Config.xml");
		   ssf=new SqlSessionFactoryBuilder().build(reader);
		   //XML에 저장된 데이터를 읽어서 메모리에 저장 
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
   }
   /*
    *  public List<BoardVO> boardListData(int page)
   {
	   List<BoardVO> list=new ArrayList<BoardVO>();
	   try
	   {
		   // 1. DB연결 
		   getConnection();
		   // 2. SQL문장 제작 
		   String sql="SELECT no,subject,name,regdate,hit,num "
				     +"FROM (SELECT no,subject,name,regdate,hit,rownum as num "
				     +"FROM (SELECT /*+ INDEX_DESC(jspBoard jb_no_pk)no,subject,name,regdate,hit "
				     +"FROM jspBoard)) "
				     +"WHERE num BETWEEN ? AND ?";
		   //  인라인뷰 / INDEX_ASC() / INDEX_DESC()
		  
		   int rowSize=10;
		   int start=(rowSize*page)-(rowSize-1);
		   int end=rowSize*page;
		   
		   // 3. SQL문장 전송 
		   ps=conn.prepareStatement(sql);
		   // 4. ?에 값을 채운다 
		   ps.setInt(1, start);
		   ps.setInt(2, end);
		   
		   // 5. 실행 요청 => 결과값을 메모리에 저장 
		   ResultSet rs=ps.executeQuery();
		   // 6. 메모리에 저장된 값을 List이동 
		   while(rs.next()) // 한줄씩 읽어 온다 
		   {
			  BoardVO vo=new BoardVO();
			  vo.setNo(rs.getInt(1));
			  vo.setSubject(rs.getString(2));
			  vo.setName(rs.getString(3));
			  vo.setRegdate(rs.getDate(4));
			  vo.setHit(rs.getInt(5));
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
    */
   // 구현 
   //<select id="boardListData" resultType="BoardVO" parameterType="hashmap">
   public static List<BoardVO> boardListData(Map map)
   {
	   List<BoardVO> list=new ArrayList<BoardVO>();
	   SqlSession session=null;
	   try
	   {
		   // 생성 
		   session=ssf.openSession(); //getConnection()
		   list=session.selectList("boardListData",map);// XML에서 에러
		   // Spring / MyBatis => XML
		   // row가 여러개 => selectList()
		   // row가 한개   => selectOne()
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   try
		   {
		     if(session!=null)
			    session.close(); // PreparedStatement,ResultSet
		        // disConnection()
		   }catch(Exception ex){}
	   }
	   return list;
   }
   //  데이터 추가 (MyBatis에 대한 설명이 없다 => 교재에 MyBatis연결:스프링) 
   // <insert id="boardInsert" parameterType="BoardVO">
   public static void boardInsert(BoardVO vo)
   {
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession(true); // commit() 
		   session.insert("boardInsert",vo);
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   try
		   {
			   if(session!=null)
				   session.close(); 
		   }catch(Exception ex) {}
	   }
   }
   
   // 총페이지 읽기
   public static int boardTotalPage()
   {
	   // ps=conn.preparedStatement(sql) => ResultSet 
	   int total=0; // resultType => ? (parameterType)
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession();
		   total=session.selectOne("boardTotalPage");
		   /*
		    *   map.put("boardTotalPage",
		    *           "SELECT CEIL(COUNT(*)/10.0) FROM project_freeboard")
		    */
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   try
		   {
			   if(session!=null)
				   session.close(); 
		   }catch(Exception ex) {}
	   }
	   return total;
   }
   
}













