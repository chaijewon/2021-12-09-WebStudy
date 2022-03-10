package com.sist.cart;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class GoodDataInput {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        goodsListData();
	}
	public static void goodsListData()
	{
		GoodsDAO cdao=new GoodsDAO();
		try
		{
			// 사이트 연결 => HTML데이터 읽기 
			int k=1;
			for(int i=1;i<=244;i++)
			{
			    Document doc=Jsoup.connect("https://www.10000recipe.com/shop/category.html?sort=popular&page="+i).get();
			    Elements name=doc.select("div.common2_sp_caption div.common2_sp_caption_tit");
			    Elements price=doc.select("div.common2_sp_caption_price_box strong.common2_sp_caption_price span");
			    Elements poster=doc.select("div.common2_sp_thumb img");
			    
			    for(int j=0;j<name.size();j++)
			    {
			    	try
			    	{
			    		System.out.println(name.get(j).text());
			    		System.out.println(price.get(j).text());
			    		System.out.println(poster.get(j).attr("src"));
			    		System.out.println("==============================================");
			    		GoodsVO vo=new GoodsVO();
			    		vo.setProduct_name(name.get(j).text());
			    		// 21900
			    		vo.setProduct_price(Integer.parseInt(price.get(j).text().replace(",", "")));
			    		vo.setProduct_poster(poster.get(j).attr("src"));
			    		
			    		cdao.goodsInsert(vo);
			    		System.out.println("k="+k);
			    		k++;
			    	}catch(Exception ex){ex.printStackTrace();}
			    }
			}
			
		}catch(Exception ex){}
	}


}
