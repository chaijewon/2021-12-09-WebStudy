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
}
