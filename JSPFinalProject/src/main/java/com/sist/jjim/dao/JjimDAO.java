package com.sist.jjim.dao;
/*
 *  <!-- 찜 등록  -->
 <insert id="jjimInsert" parameterType="JjimVO">
  <selectKey keyProperty="no" resultType="int" order="BEFORE">
    SELECT NVL(MAX(no)+1,1) as no FROM jjim
  </selectKey>
  INSERT INTO jjim VALUES(#{no},#{id},#{fno})
 </insert>
 <!-- 찜 목록  -->
 <select id="jjimListData" parameterType="string" resultType="JjimVO">
   SELECT no,id,fno,
          (SELECT name FROM food_house WHERE no=jjim.fno) as name,
          (SELECT poster FROM food_house WHERE no=jjim.fno) as poster
   FROM jjim
 </select>
 <!-- 찜 대상  -->
 <select id="jjimCountData" parameterType="JjimVO" resultType="int">
   SELECT COUNT(*) 
   FROM jjim
   WHERE id=? AND fno=?
 </select>
 <!-- 찜 삭제  -->
 <delete id="jjimDelete" parameterType="int">
  DELETE FROM jjim
  WHERE no=?
 </delete>
 */
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;
public class JjimDAO {
   // 연결 
   private static SqlSessionFactory ssf;
   // 초기화 (XML 파싱)
   static
   {
	   try
	   {
		   //1.XML파일 읽기 
		   Reader reader=Resources.getResourceAsReader("Config.xml");
		   //2.파싱요청후 데이터 저장 
		   ssf=new SqlSessionFactoryBuilder().build(reader);
		   // resultType , paramterType , SQL => 저장 
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
   }
   /*
    *  기능 수행 
    *  찜 등록하기 
    *  <insert id="jjimInsert" parameterType="JjimVO">
		  <selectKey keyProperty="no" resultType="int" order="BEFORE">
		    SELECT NVL(MAX(no)+1,1) as no FROM jjim
		  </selectKey>
		  INSERT INTO jjim VALUES(#{no},#{id},#{fno})
		 </insert>
    */
   public static void jjimInsert(JjimVO vo)
   {
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession(true);//commit()
		   session.insert("jjimInsert",vo);
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
   /*
    *  <!-- 찜 목록  -->
		 <select id="jjimListData" parameterType="string" resultType="JjimVO">
		   SELECT no,id,fno,
		          (SELECT name FROM food_house WHERE no=jjim.fno) as name,
		          (SELECT poster FROM food_house WHERE no=jjim.fno) as poster
		   FROM jjim
		   WHERE id=#{id}
		 </select>
    *  
    */
   public static List<JjimVO> jjimListData(String id)
   {
	   List<JjimVO> list=new ArrayList<JjimVO>();
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession();
		   list=session.selectList("jjimListData",id);
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
	   
	   return list;
   }
   /*
    *  <!-- 찜 대상  -->
	 <select id="jjimCountData" parameterType="JjimVO" resultType="int">
	   SELECT COUNT(*) 
	   FROM jjim
	   WHERE id=? AND fno=?
	 </select>
    */
   public static int jjimCountData(JjimVO vo)
   {
	   int count=0;
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession();
		   count=session.selectOne("jjimCountData", vo);
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
	   return count;
   }
   /*
    *  <!-- 찜 삭제  -->
		 <delete id="jjimDelete" parameterType="int">
		  DELETE FROM jjim
		  WHERE no=?
		 </delete>
    */
   public static void jjimDelete(int no)
   {
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession(true);
		   session.delete("jjimDelete",no);
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
}










