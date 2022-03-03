package com.sist.model;
// 명소 , 호텔 , 자연 (공원)
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.FoodVO;
import com.sist.vo.ReplyVO;
import com.sist.vo.SeoulHotelVO;
import com.sist.vo.SeoulLocationVO;
import com.sist.vo.SeoulNatureVO;
/*
 *  public void display(int a,int b,int c)
 *  {
 *  }
 *  
 *  display(10,20); (X)
 *  
 *  int[] aaa(int[] arr)
 *  {
 *     X 
 *     arr[0]=10;
 *     return arr;
 *  }
 *  
 *  int[] arr=new int[3];
 *  int[] a=aaa(arr)
 *  
 *  void aaa(int[] arr)
 *  {
 *  }
 *  
 *  aaa(arr) 
 */
public class SeoulModel {
  @RequestMapping("seoul/seoul_location.do")// 찾기(인덱스)
  public String seoul_location(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  // 요청값 => request
	  String page=request.getParameter("page");
	  if(page==null)
		  page="1"; // default페이지 (1.면접)
	  // 1.Session VS Cookie 
	  // 2.GET VS POST
	  // 3. MVC (model1,model2) 장단점 
	  // 4. pageing 
	  // 5. DAO VS Service
	  // 6. OOP VS AOP 차이점 , DI , Transaction 
	  // 7. 협업(깃허브)
	  // 오라클 연결 
	  int curpage=Integer.parseInt(page);
	  // curpage에 해당되는 데이터 읽기 
	  // DAO => 1. curpage에 해당되는 데이터 , 2. 총페이지 
	  SeoulDAO dao=new SeoulDAO();
	  List<SeoulLocationVO> list=dao.seoulLocationData(curpage);
	  int totalpage=dao.seoulLocTotalPage();
	  // 블록별 데이터 출력 
	  final int BLOCK=10;
	  int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	  //               10-1 => 9/10 => 0 * 10 = 0+1 1
	  // [1]~~[10] endPage
	  // startPage  1~10 => 1 , 11~20 => 11
	  
	  int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	  // 1~10 => 10 , 11~20 => 20 
	  if(endPage>totalpage)
	  {
		  endPage=totalpage;
	  }
	  // request에 출력에 필요한 모든 데이터 전송 => setAttribute()
	  // 데이터 읽기 => request에 담아서 => JSP재전송 
	  // jsp.forward(request,response)
	  /*
	   *   1. 클라이언트로부터 요청 
	   *   2. 요청처리 =>  Model이 가지고 있는 메소드 호출 
	   *                 ----- 구분자 (@RequestMapping())
	   *   3. request를 JSP역할 
	   */
	  request.setAttribute("curpage", curpage);
	  request.setAttribute("totalpage", totalpage);
	  request.setAttribute("list", list);
	  request.setAttribute("BLOCK", BLOCK);
	  request.setAttribute("startPage", startPage);
	  request.setAttribute("endPage", endPage);
	  
	  request.setAttribute("main_jsp", "../seoul/location.jsp");
	  
	  // request를 공유 : include , forward => url이 변경하지 않는다 
	  // redirect=>url변경 => request가 초기화 
	  return "../main/main.jsp";
  }
  @RequestMapping("seoul/seoul_nature.do")
  public String seoul_nature(HttpServletRequest request,
		  HttpServletResponse response)
  {
	// 요청값 => request
		  String page=request.getParameter("page");
		  if(page==null)
			  page="1"; // default페이지 (1.면접)
		  // 1.Session VS Cookie 
		  // 2.GET VS POST
		  // 3. MVC (model1,model2) 장단점 
		  // 4. pageing 
		  // 5. DAO VS Service
		  // 6. OOP VS AOP 차이점 , DI , Transaction 
		  // 7. 협업(깃허브)
		  // 오라클 연결 
		  int curpage=Integer.parseInt(page);
		  // curpage에 해당되는 데이터 읽기 
		  // DAO => 1. curpage에 해당되는 데이터 , 2. 총페이지 
		  SeoulDAO dao=new SeoulDAO();
		  List<SeoulNatureVO> list=dao.seoulNatureData(curpage);
		  int totalpage=dao.seoulNatureTotalPage();
		  // 블록별 데이터 출력 
		  final int BLOCK=10;
		  int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		  //               10-1 => 9/10 => 0 * 10 = 0+1 1
		  // [1]~~[10] endPage
		  // startPage  1~10 => 1 , 11~20 => 11
		  
		  int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		  // 1~10 => 10 , 11~20 => 20 
		  if(endPage>totalpage)
		  {
			  endPage=totalpage;
		  }
		  // request에 출력에 필요한 모든 데이터 전송 => setAttribute()
		  // 데이터 읽기 => request에 담아서 => JSP재전송 
		  // jsp.forward(request,response)
		  /*
		   *   1. 클라이언트로부터 요청 
		   *   2. 요청처리 =>  Model이 가지고 있는 메소드 호출 
		   *                 ----- 구분자 (@RequestMapping())
		   *   3. request를 JSP역할 
		   */
		  request.setAttribute("curpage", curpage);
		  request.setAttribute("totalpage", totalpage);
		  request.setAttribute("list", list);
		  request.setAttribute("BLOCK", BLOCK);
		  request.setAttribute("startPage", startPage);
		  request.setAttribute("endPage", endPage);
		  
		  request.setAttribute("main_jsp", "../seoul/nature.jsp");
		  
		  // request를 공유 : include , forward => url이 변경하지 않는다 
		  // redirect=>url변경 => request가 초기화 
		  return "../main/main.jsp";
  }
  @RequestMapping("seoul/seoul_hotel.do")
  public String seoul_hotel(HttpServletRequest request,
		  HttpServletResponse response)
  {
	      // 요청값 => request
		  String page=request.getParameter("page");
		  if(page==null)
			  page="1"; // default페이지 (1.면접)
		  // 1.Session VS Cookie 
		  // 2.GET VS POST
		  // 3. MVC (model1,model2) 장단점 
		  // 4. pageing 
		  // 5. DAO VS Service
		  // 6. OOP VS AOP 차이점 , DI , Transaction 
		  // 7. 협업(깃허브)
		  // 오라클 연결 
		  int curpage=Integer.parseInt(page);
		  // curpage에 해당되는 데이터 읽기 
		  // DAO => 1. curpage에 해당되는 데이터 , 2. 총페이지 
		  SeoulDAO dao=new SeoulDAO();
		  List<SeoulHotelVO> list=dao.seoulHotelData(curpage);
		  int totalpage=dao.seoulHotelTotalPage();
		  // 블록별 데이터 출력 
		  final int BLOCK=10;
		  int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		  //               10-1 => 9/10 => 0 * 10 = 0+1 1
		  // [1]~~[10] endPage
		  // startPage  1~10 => 1 , 11~20 => 11
		  
		  int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		  // 1~10 => 10 , 11~20 => 20 
		  if(endPage>totalpage)
		  {
			  endPage=totalpage;
		  }
		  // request에 출력에 필요한 모든 데이터 전송 => setAttribute()
		  // 데이터 읽기 => request에 담아서 => JSP재전송 
		  // jsp.forward(request,response)
		  /*
		   *   1. 클라이언트로부터 요청 
		   *   2. 요청처리 =>  Model이 가지고 있는 메소드 호출 
		   *                 ----- 구분자 (@RequestMapping())
		   *   3. request를 JSP역할 
		   */
		  request.setAttribute("curpage", curpage);
		  request.setAttribute("totalpage", totalpage);
		  request.setAttribute("list", list);
		  request.setAttribute("BLOCK", BLOCK);
		  request.setAttribute("startPage", startPage);
		  request.setAttribute("endPage", endPage);
		  
		  request.setAttribute("main_jsp", "../seoul/hotel.jsp");
		  
		  // request를 공유 : include , forward => url이 변경하지 않는다 
		  // redirect=>url변경 => request가 초기화 
		  return "../main/main.jsp";
  }
  @RequestMapping("seoul/seoul_weather.do")
  public String seoul_weather(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  try
	  {
		  Document doc=Jsoup.connect("https://korean.visitseoul.net/weather").get();
		  Element section=doc.selectFirst("section#content");
		  String temp=section.html();
	      temp=temp.replace("src=\"", "src=\"https://korean.visitseoul.net");
	      String html=temp;
		  request.setAttribute("html", html);
	  }catch(Exception ex){}
	  request.setAttribute("main_jsp", "../seoul/weather.jsp");
	  return "../main/main.jsp";
  }
  // 상세보기 => 명소 => 내용 => 지도 => 인근 맛집 , 인근 자연 , 인근 호텔 
  // JSP(링크) => Model ==> DAO ==> Model => JSP
  /*
   *   JSP(View) => 화면 출력만 한다 
   *   Model => 요청을 받아서 처리후에 결과값 보내기
   *   DAO => 오라클 연결 
   *   Controller => Model의 메소드 호출 ==> invoke()
   */
  @RequestMapping("seoul/location_detail.do")
  public String location_detail(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  // 데이터 받기 
	  String no=request.getParameter("no");
	  
	  // no => 데이터 읽기 (DAO)
	  SeoulDAO dao=new SeoulDAO();
	  SeoulLocationVO vo=dao.locationDetail(Integer.parseInt(no));
	  // vo=> 구 
	  String address=vo.getAddress();
	  String addr1=address.trim().substring(address.indexOf(" "));
	  String addr2=addr1.trim().substring(0,addr1.trim().indexOf(" "));
	  System.out.println("address="+address);
	  System.out.println("addr1="+addr1.trim());
	  System.out.println("addr1="+addr2.trim());
	  //서울 강남구 영동대로 513 (삼성동, 코엑스)
	  List<FoodVO> list=dao.locationFoodData(addr2);
	  // => 읽어온 데이터를 location_detail.jsp로 전송 (request.setAttribute())
	  // 인근 호텔 , 인근 자연 , 인근 맛집 
	  ReplyDAO rDao=new ReplyDAO();
	  List<ReplyVO> rlist=rDao.replyListData(Integer.parseInt(no), 2);
	  request.setAttribute("rList",rlist);
	  
	  request.setAttribute("list", list);
	  request.setAttribute("vo", vo);
	  request.setAttribute("main_jsp", "../seoul/location_detail.jsp");
	  return "../main/main.jsp";
  }
  
  @RequestMapping("seoul/nature_detail.do")
  public String nature_detail(HttpServletRequest request,
		  HttpServletResponse response)
  {
	       // 데이터 받기 
		  String no=request.getParameter("no");
		  // no => 데이터 읽기 (DAO)
		  SeoulDAO dao=new SeoulDAO();
		  SeoulNatureVO vo=dao.natureDetail(Integer.parseInt(no));
		  // vo=> 구 
		  String address=vo.getAddress();
		  String addr1=address.trim().substring(address.indexOf(" "));
		  String addr2=addr1.trim().substring(0,addr1.trim().indexOf(" "));
		  System.out.println("address="+address);
		  System.out.println("addr1="+addr1.trim());
		  System.out.println("addr1="+addr2.trim());
		  //서울 강남구 영동대로 513 (삼성동, 코엑스)
		  List<FoodVO> list=dao.locationFoodData(addr2);
		  // => 읽어온 데이터를 location_detail.jsp로 전송 (request.setAttribute())
		  // 인근 호텔 , 인근 자연 , 인근 맛집 
		  ReplyDAO rDao=new ReplyDAO();
		  List<ReplyVO> rlist=rDao.replyListData(Integer.parseInt(no), 4);
		  request.setAttribute("rList",rlist);
		  request.setAttribute("list", list);
		  request.setAttribute("vo", vo);
	  request.setAttribute("main_jsp", "../seoul/nature_detail.jsp");
	  return "../main/main.jsp";
  }
  @RequestMapping("seoul/hotel_detail.do")
  public String hotel_detail(HttpServletRequest request,
		   HttpServletResponse response)
  {
	// 데이터 받기 
	  String no=request.getParameter("no");
	  // no => 데이터 읽기 (DAO)
	  SeoulDAO dao=new SeoulDAO();
	  SeoulHotelVO vo=dao.hotelDetail(Integer.parseInt(no));
	  // vo=> 구 
	  String address=vo.getAddress();
	  String addr1=address.trim().substring(address.indexOf(" "));
	  String addr2=addr1.trim().substring(0,addr1.trim().indexOf(" "));
	  System.out.println("address="+address);
	  System.out.println("addr1="+addr1.trim());
	  System.out.println("addr1="+addr2.trim());
	  //서울 강남구 영동대로 513 (삼성동, 코엑스)
	  List<FoodVO> list=dao.locationFoodData(addr2);
	  // => 읽어온 데이터를 location_detail.jsp로 전송 (request.setAttribute())
	  // 인근 호텔 , 인근 자연 , 인근 맛집 
	  ReplyDAO rDao=new ReplyDAO();
	  List<ReplyVO> rlist=rDao.replyListData(Integer.parseInt(no), 3);
	  request.setAttribute("rList",rlist);
	  request.setAttribute("list", list);
	  request.setAttribute("vo", vo);
	  request.setAttribute("main_jsp", "../seoul/hotel_detail.jsp");
	  return "../main/main.jsp";
  }
  
}








