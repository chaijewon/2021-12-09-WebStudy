package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import com.sist.dao.*;
// 일반 자바 => JSP,Servlet으로 request를 전송할 프로그램  
public class GoodsModel {
  public String goodsListData(HttpServletRequest request)
  {
	    String strPage=request.getParameter("page");
	    if(strPage==null)
	    	strPage="1";
	    int curpage=Integer.parseInt(strPage);
	    MovieDAO dao=new MovieDAO();
	    List<MovieVO> list=dao.goodsListData(curpage);
	    int totalpage=dao.goodsTotalPage();
	    
	    request.setAttribute("list", list);
	    request.setAttribute("curpage", curpage);
	    request.setAttribute("totalpage",totalpage);
	    return "main/main.jsp";//view 
  }
}
