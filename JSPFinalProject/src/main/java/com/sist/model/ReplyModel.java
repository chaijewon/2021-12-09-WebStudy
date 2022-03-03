package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.ReplyDAO;
import com.sist.vo.ReplyVO;

public class ReplyModel {
  @RequestMapping("reply/reply_insert.do")
  public String reply_insert(HttpServletRequest request,
		   HttpServletResponse response)
  {
	  // no(자동증가) , rno(참조번호) , type(맛집) , id ,name(session) , msg ,regdate
	  try
	  {
		  request.setCharacterEncoding("UTF-8");
	  }catch(Exception ex) {}
	  String rno=request.getParameter("rno");// 맛집번호 
	  String type=request.getParameter("type");// 맛집 ==> 1 , 2=명소 ...
	  String msg=request.getParameter("msg");// 댓글 
	  // DAO로 전송 => 오라클 추가 
	  HttpSession session=request.getSession();
	  String id=(String)session.getAttribute("id");
	  String name=(String)session.getAttribute("name");
	  
	  ReplyVO vo=new ReplyVO();
	  vo.setId(id);
	  vo.setMsg(msg);
	  vo.setName(name);
	  vo.setRno(Integer.parseInt(rno));
	  vo.setType(Integer.parseInt(type));
	  ReplyDAO dao=new ReplyDAO();
	  dao.replyInsert(vo);
	   String s="";
	   if(Integer.parseInt(type)==1)
	   {
		   s="food/food";
	   }
	   else if(Integer.parseInt(type)==2)
	   {
		   s="seoul/location";
	   }
	   else if(Integer.parseInt(type)==3)
	   {
		   s="seoul/hotel";
	   }
	   else if(Integer.parseInt(type)==4)
	   {
		   s="seoul/nature";
	   }
		   
	   return "redirect:../"+s+"_detail.do?no="+rno; 
  }
  // annotation=if  => invoke()
  @RequestMapping("reply/reply_delete.do")
  public String reply_delete(HttpServletRequest request,
		  HttpServletResponse response)
  {
	   String no=request.getParameter("no"); // 댓글 번호
	   String rno=request.getParameter("rno"); // 맛집번호 
	   String type=request.getParameter("tp");
	   ReplyDAO dao=new ReplyDAO();
	   // 숙달 
	  
	   dao.replyDelete(Integer.parseInt(no));
	   String s="";
	   if(Integer.parseInt(type)==1)
	   {
		   s="food/food";
	   }
	   else if(Integer.parseInt(type)==2)
	   {
		   s="seoul/location";
	   }
	   else if(Integer.parseInt(type)==3)
	   {
		   s="seoul/hotel";
	   }
	   else if(Integer.parseInt(type)==4)
	   {
		   s="seoul/nature";
	   }
		   
	   return "redirect:../"+s+"_detail.do?no="+rno;  
  }
  
  @RequestMapping("reply/reply_update.do")
  public String replyUpdate(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  try
	  {
		  request.setCharacterEncoding("UTF-8");
	  }catch(Exception ex) {}
	  String no=request.getParameter("no"); // 댓글 번호
	  String rno=request.getParameter("rno"); // 맛집번호 
	  String msg=request.getParameter("msg");
	  String type=request.getParameter("tp");
	  ReplyDAO dao=new ReplyDAO();
	  // 수정 메소드 호출 
	  dao.replyUpdate(Integer.parseInt(no), msg);
	  
	   String s="";
	   if(Integer.parseInt(type)==1)
	   {
		   s="food/food";
	   }
	   else if(Integer.parseInt(type)==2)
	   {
		   s="seoul/location";
	   }
	   else if(Integer.parseInt(type)==3)
	   {
		   s="seoul/hotel";
	   }
	   else if(Integer.parseInt(type)==4)
	   {
		   s="seoul/nature";
	   }
		   
	   return "redirect:../"+s+"_detail.do?no="+rno; 
  }
}


















