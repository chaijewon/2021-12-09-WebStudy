package com.sist.dao;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.FoodVO;
import com.sist.data.input.*;
import java.io.*;
public class ReserveDAO {
  private static SqlSessionFactory ssf;
  static
  {
	  try
	  {
		  Reader reader=Resources.getResourceAsReader("Config.xml");
		  ssf=new SqlSessionFactoryBuilder().build(reader);
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
  }
  public static List<FoodVO> foodListData()
  {
	  SqlSession session=null;
	  List<FoodVO> list=new ArrayList<FoodVO>();
	  try
	  {
		  session=ssf.openSession();
		  list=session.selectList("foodListData");
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
	  finally
	  {
		  try
		  {
			  if(session!=null)
				  session.close();//반환 (DBCP)
		  }catch(Exception ex) {}
	  }
	  return list;
  }
  public static DaysVO reserveDays(int rno)
  {
	  DaysVO vo=new DaysVO();
	  SqlSession session=null;
	  try
	  {
		  session=ssf.openSession();
		  vo=session.selectOne("reserveInfoDay", rno);
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
	  finally
	  {
		  try
		  {
			  if(session!=null)
				  session.close();//반환 (DBCP)
		  }catch(Exception ex) {}
	  }
	  return vo;
  }
  /*
   *  <select id="reserveDaysGetTime" resultType="string" parameterType="int">
	    SELECT rtime FROM days
	    WHERE rday=#{rday}
	  </select>
	  <select id="reserveTimeData" resultType="string" parameterType="int">
	    SELECT time FROM times 
	    WHERE tno=#{tno}
	  </select>
   */
  public static String reserveDaysGetTime(int rday)
  {
	  SqlSession session=null;
	  String result="";
	  try
	  {
		  session=ssf.openSession();
		  result=session.selectOne("reserveDaysGetTime", rday);
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
	  return result;
  }
  public static String reserveTimeData(int tno)
  {
	  
	  SqlSession session=null;
	  String result="";
	  try
	  {
		  session=ssf.openSession();
		  result=session.selectOne("reserveTimeData", tno);
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
	  finally
	  {
		  try
		  {
			  if(session!=null)
				  session.close();// 반환 => disConnection()
			  // Spring => 자동으로 변환 
		  }catch(Exception ex) {}
		  
	  }
	  return result;
  }
  /*
   *   <insert id="reserveInsert" parameterType="com.sist.data.input.ReserveVO">
    <selectKey keyProperty="no" resultType="int" order="BEFORE">
      SELECT NVL(MAX(no)+1,1) as no FROM reserve
    </selectKey>
    INSERT INTO reserve VALUES(
     #{no},
     #{id},
     #{fno},
     #{day},
     #{time},
     #{inwon},
     SYSDATE,
     0
    )
  </insert>
  <select id="reserveMyData" resultType="com.sist.data.input.ReserveVO" 
    parameterType="string">
    SELECT no,id,(SELECT name FROM food_house WHERE no=reserve.no) as name,
           (SELECT poster FROM food_house WHERE no=reserve.no) as poster,
           day,time,inwon,regdate,ok
    FROM reserve 
    WHERE id=#{id}
    ORDER BY no DESC
  </select>
  <select id="reserveAdminData" resultType="com.sist.data.input.ReserveVO" 
    parameterType="string">
    SELECT no,id,(SELECT name FROM food_house WHERE no=reserve.no) as name,
           (SELECT poster FROM food_house WHERE no=reserve.no) as poster,
           day,time,inwon,regdate,ok
    FROM reserve 
    ORDER BY no DESC
  </select>
   */
  public static void reserveInsert(ReserveVO vo)
  {
	  SqlSession session=null;
	  try
	  {
		  session=ssf.openSession(true);
		  session.insert("reserveInsert", vo);
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
	  finally
	  {
		  try
		  {
			  if(session!=null)
				  session.close();// 반환 => disConnection()
			  // Spring => 자동으로 변환 
		  }catch(Exception ex) {}
		  
	  }
  }
  public static List<ReserveVO> reserveMyData(String id)
  {
	  List<ReserveVO> list=new ArrayList<ReserveVO>();
	  SqlSession session=null;
	  try
	  {
		  session=ssf.openSession();
		  list=session.selectList("reserveMyData",id);
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
	  finally
	  {
		  try
		  {
			  if(session!=null)
				  session.close();// 반환 => disConnection()
			  // Spring => 자동으로 변환 
		  }catch(Exception ex) {}
		  
	  }
	  return list;
  }
  public static List<ReserveVO> reserveAdminData()
  {
	  List<ReserveVO> list=new ArrayList<ReserveVO>();
	  SqlSession session=null;
	  try
	  {
		  session=ssf.openSession();
		  list=session.selectList("reserveAdminData");
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
	  finally
	  {
		  try
		  {
			  if(session!=null)
				  session.close();// 반환 => disConnection()
			  // Spring => 자동으로 변환 
		  }catch(Exception ex) {}
		  
	  }
	  return list;
  }
  /*
   * <update id="adminOk" parameterType="int">
   UPDATE reserve SET
   ok=1
   WHERE no=#{no}
  </update>
   */
  public static void reserveAdminOk(int no)
  {
	  
	  SqlSession session=null;
	  try
	  {
		  session=ssf.openSession(true);
		  session.selectList("adminOk",no);
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
	  finally
	  {
		  try
		  {
			  if(session!=null)
				  session.close();// 반환 => disConnection()
			  // Spring => 자동으로 변환 
		  }catch(Exception ex) {}
		  
	  }
	  
  }
}









