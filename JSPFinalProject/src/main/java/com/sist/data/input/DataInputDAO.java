package com.sist.data.input;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.FoodVO;

import java.io.*;
public class DataInputDAO {
   /*
    *   <bean id="ssf" class="org.mybatis.spring.SqlSessionFactoryBean"
    *    p:configLocation="Config.xml"/>
    */
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
   /*
    *  <!-- days (시간)-->
		  <insert id="daysInsert" parameterType="DaysVO">
		    <selectKey keyProperty="rno" resultType="int" order="BEFORE">
		      SELECT NVL(MAX(rno)+1,1) as rno FROM days
		    </selectKey>
		    INSERT INTO days VALUES(#{rno},#{rday},#{rtime})
		  </insert>
		  <!-- food_house (날짜) -->
		  <update id="foodHouseUpdate" parameterType="com.sist.vo.FoodVO">
		    UPDATE food_house SET
		    reserve_days=#{reserve_days}
		    WHERE no=#{no}
		  </update>
    */
   public static void daysInsert(DaysVO vo)
   {
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession(true);//commit()
		   session.insert("daysInsert",vo);
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
   public static void foodHouseUpdate(FoodVO vo)
   {
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession(true);
		   session.update("foodHouseUpdate",vo);
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




