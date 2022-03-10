package com.sist.cart;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.board.dao.BoardVO;

public class GoodsDAO {
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
	   public static void goodsInsert(GoodsVO vo)
	   {
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession(true); // commit() 
			   session.insert("goodsInsert",vo);
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
