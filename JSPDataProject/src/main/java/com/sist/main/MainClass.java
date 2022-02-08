package com.sist.main;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

// no(rank) , poster , title , singer , album , state , idcrement, key
public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        try
        {
         for(int i=1;i<=4;i++)
         {
        	Document doc=Jsoup.connect("https://www.genie.co.kr/chart/top200?ditc=D&ymd=20220208&hh=16&rtm=Y&pg="+i).get();
            Elements poster=doc.select("a.cover img");
            Elements title=doc.select("a.title");
            Elements singer=doc.select("a.artist");
            Elements album=doc.select("a.albumtitle");
            Elements etc=doc.select("span.rank");
            for(int j=0;j<poster.size();j++)
            {
            	System.out.println(poster.get(j).attr("src"));
            	System.out.println(title.get(j).text());
            	System.out.println(singer.get(j).text());
            	System.out.println(album.get(j).text());
            	System.out.println(etc.get(j).text());
            	System.out.println("========================================");
            }
         }
        }catch(Exception ex){}
	}
	// youtube 
	public static String getKey(String title)
	{
		String key="";
		return key;
	}

}
