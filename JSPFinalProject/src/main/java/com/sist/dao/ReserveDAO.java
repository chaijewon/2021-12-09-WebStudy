package com.sist.dao;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.FoodVO;

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
}
