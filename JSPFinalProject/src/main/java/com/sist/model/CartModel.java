package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.cart.*;
public class CartModel {
  @RequestMapping("cart/goods_list.do")
  public String cart_goods_list(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String page=request.getParameter("page");
	  if(page==null)
		  page="1";
	  int curpage=Integer.parseInt(page);
	  Map map=new HashMap();
	  int rowSize=12;
	  int start=(rowSize*curpage)-(rowSize-1);
	  int end=rowSize*curpage;
	  map.put("start", start);
	  map.put("end", end);
	  List<GoodsVO> list=GoodsDAO.goodsListData(map);
	  int totalpage=GoodsDAO.goodsTotalPage();
	  
	  final int BLOCK=10;
	  int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	  int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	  if(endPage>totalpage)
	  {
		  endPage=totalpage;
	  }
	  request.setAttribute("curpage", curpage);
	  request.setAttribute("totalpage", totalpage);
	  request.setAttribute("list", list);
	  request.setAttribute("BLOCK", BLOCK);
	  request.setAttribute("startPage", startPage);
	  request.setAttribute("endPage", endPage);
	  request.setAttribute("main_jsp", "../cart/goods_list.jsp");
	  return "../main/main.jsp";
  }
  @RequestMapping("cart/goods_detail.do")
  public String cart_goods_detail(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String no=request.getParameter("no");
	  // 번호에 해당되는 데이터를 읽어 온다 (오라클)
	  GoodsVO vo=GoodsDAO.goodsDetailData(Integer.parseInt(no));
	  request.setAttribute("vo", vo);
	  request.setAttribute("main_jsp", "../cart/goods_detail.jsp");
	  return "../main/main.jsp";
  }
  
  @RequestMapping("cart/cart_insert.do")
  public String cart_cart_insert(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  System.out.println("데이터 전송 완료");
	  String no=request.getParameter("no");
	  String amount=request.getParameter("amount");
	  HttpSession session=request.getSession();
	  String id=(String)session.getAttribute("id");
	  CartVO vo=new CartVO();
	  vo.setAmont(Integer.parseInt(amount));
	  vo.setProduct_id(Integer.parseInt(no));
	  vo.setId(id);
	  // DAO연결 
	  GoodsDAO.cartInsert(vo);
	  return "../main/main.jsp";
  }
  
  @RequestMapping("cart/cart_adminOk.do")
  public String cart_cart_adminOk(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String no=request.getParameter("no");
	  //DAO연결 
	  GoodsDAO.cartAdminOk(Integer.parseInt(no));
	  return "redirect:../main/adminpage.do";
  }
  @RequestMapping("cart/cart_delete.do")
  public String cart_delete(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String no=request.getParameter("no");
	  //DAO연결 
	  GoodsDAO.cartDelete(Integer.parseInt(no));
	  return "redirect:../main/mypage.do";
  }
}







