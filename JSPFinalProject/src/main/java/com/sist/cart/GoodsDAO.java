package com.sist.cart;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.board.dao.BoardVO;
import java.util.*;
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
	   /*
	    *  <select id="goodsListData" resultType="com.sist.cart.GoodsVO" 
		   parameterType="hashmap">
		   SELECT product_id,product_name,product_poster,num
		   FROM (SELECT product_id,product_name,product_poster,rownum as num 
		   FROM (SELECT + INDEX_ASC(goods goods_pi_pk)  product_id,product_name,product_poster 
		   FROM goods))
		   WHERE num BETWEEN #{start} AND #{end}
		 </select>
		 <select id="goodsTotalPage" resultType="int">
		  SELECT CEIL(COUNT(*)/12.0) FROM goods
		 </select>
	    */
	   public static List<GoodsVO> goodsListData(Map map)
	   {
		   List<GoodsVO> list=new ArrayList<GoodsVO>();
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectList("goodsListData",map);
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
	   public static int goodsTotalPage()
	   {
		   int total=0;
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   total=session.selectOne("goodsTotalPage");
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
	   /*
	    *  <select id="goodsDetailData" resultType="com.sist.cart.GoodsVO" parameterType="int">
			   SELECT product_id,product_name,product_poster,product_price
			   FROM goods
			   WHERE product_id=#{product_id}
			 </select>
	    */
	   public static GoodsVO goodsDetailData(int product_id)
	   {
		   GoodsVO vo=new GoodsVO();
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   vo=session.selectOne("goodsDetailData",product_id);
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
		   return vo;
	   }
	   /*
	    *  <select id="cartMypageData" resultType="com.sist.cart.CartVO" parameterType="string">
			   SELECT cart_id,
			          (SELECT product_name FROM goods WHERE product_id=cart.product_id) as title,
			          (SELECT product_poster FROM goods WHERE product_id=cart.product_id) as poster,
			          (SELECT product_price FROM goods WHERE product_id=cart.product_id) as price,
			          amount,regdate
			   FROM cart
			   WHERE id=#{id}
			   ORDER BY cart_id DESC
			 </select>
			 <select id="cartAdminpageData" resultType="com.sist.cart.CartVO">
			   SELECT cart_id,
			          (SELECT product_name FROM goods WHERE product_id=cart.product_id) as title,
			          (SELECT product_poster FROM goods WHERE product_id=cart.product_id) as poster,
			          (SELECT product_price FROM goods WHERE product_id=cart.product_id) as price,
			          amount,regdate,id
			   FROM cart
			   ORDER BY cart_id DESC
			 </select>
	    */
	   public static List<CartVO> cartMypageData(String id)
	   {
		   List<CartVO> list=new ArrayList<CartVO>();
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectList("cartMypageData",id);
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
	   
	   public static List<CartVO> cartAdminpageData()
	   {
		   List<CartVO> list=new ArrayList<CartVO>();
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectList("cartAdminpageData");
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
	    *  <insert id="cartInsert" parameterType="com.sist.cart.CartVO">
   INSERT INTO cart VALUES((SELECT NVL(MAX(cart_id)+1,1) FROM cart),
     #{product_id},
     #{amount},
     0,
     0,
     #{id},
     SYSDATE
   )
 </insert>
	    */
	   
	 public static void cartInsert(CartVO vo)
	 {
		 SqlSession session=null;
		 try
		 {
			 session=ssf.openSession(true);
			 session.insert("cartInsert",vo);
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
	  *  <update id="cartAdminOk" parameterType="int">
   UPDATE cart SET
   ischeck=1
   WHERE cart_id=#{cart_id}
 </update>
	  */
	 public static void cartAdminOk(int cart_id)
	 {
		 SqlSession session=null;
		 try
		 {
			 session=ssf.openSession(true);
			 session.update("cartAdminOk",cart_id);
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
	  * <delete id="cartDelete" parameterType="int">
  DELETE FROM cart
  WHERE cart_id=#{cart_id}
 </delete>
	  */
	 public static void cartDelete(int cart_id)
	 {
		 SqlSession session=null;
		 try
		 {
			 session=ssf.openSession(true);
			 session.delete("cartDelete",cart_id);
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





