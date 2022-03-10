package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.cart.CartVO;
import com.sist.cart.GoodsDAO;
import com.sist.controller.RequestMapping;
import com.sist.dao.ReserveDAO;
import com.sist.data.input.ReserveVO;

import java.util.*;
import com.sist.jjim.dao.*;
public class JjimModel {
  @RequestMapping("jjim/jjim_insert.do")
  public String jjim_insert(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  // jjim/jjim_insert.do?fno=${vo.fno }
	  String fno=request.getParameter("fno");
	  HttpSession session=request.getSession();
	  String id=(String)session.getAttribute("id");
	  JjimVO vo=new JjimVO();
	  vo.setFno(Integer.parseInt(fno));
	  System.out.println("fno="+fno);
	  System.out.println("id="+id);
	  vo.setId(id);
	  JjimDAO.jjimInsert(vo);
	  
	  return "redirect:../food/food_detail.do?no="+fno;
	  //request.setAttribute("main_jsp", "../main/mypage");
	  //return "../main/main.jsp"; //마이페이지로 이동 (찜,예약,장바구니)
  }
  @RequestMapping("main/mypage.do")
  public String main_mypage(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  HttpSession session=request.getSession();
	  String id=(String)session.getAttribute("id");
	  List<JjimVO> list=JjimDAO.jjimListData(id);
	  for(JjimVO vo:list)
	  {
		  String poster=vo.getPoster();
		  poster=poster.substring(0,poster.indexOf("^"));
		  vo.setPoster(poster);
	  }
	  
	  List<ReserveVO> rList=ReserveDAO.reserveMyData(id);
	  if(rList!=null)
	  {
		  for(ReserveVO vo:rList)
		  {
			  
			  String poster=vo.getPoster();
			  if(poster!=null)
			  {
			   poster=poster.substring(0,poster.indexOf("^"));
			   vo.setPoster(poster);
			  }
		  }
	  }
	  
	  List<CartVO> cList=GoodsDAO.cartMypageData(id);
	  request.setAttribute("cList", cList);
	  request.setAttribute("rList", rList);
	  request.setAttribute("list", list);
	  request.setAttribute("main_jsp", "../main/mypage.jsp");
	  return "../main/main.jsp";
  }
  @RequestMapping("jjim/jjim_delete.do")
  public String jjim_jjim_delete(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String no=request.getParameter("no");
	  JjimDAO.jjimDelete(Integer.parseInt(no));
	  return "redirect:../main/mypage.do";
  }
  @RequestMapping("main/adminpage.do")
  public String admin_page(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  List<ReserveVO> rList=ReserveDAO.reserveAdminData();
	  List<CartVO> cList=GoodsDAO.cartAdminpageData();
	  request.setAttribute("cList", cList);
	  request.setAttribute("rList", rList);
	  request.setAttribute("main_jsp", "../main/adminpage.jsp");
	  return "../main/main.jsp";
  }
  
}
