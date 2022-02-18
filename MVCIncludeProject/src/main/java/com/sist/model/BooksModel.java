package com.sist.model;

import javax.servlet.http.HttpServletRequest;

import com.sist.controller.RequestMapping;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
public class BooksModel {
   @RequestMapping("book/list.do")
   public String books_main(HttpServletRequest request)
   {
	   BooksDAO dao=new BooksDAO();
	   List<BooksVO> list=dao.booksListData(1);
	   request.setAttribute("list", list);
	   request.setAttribute("main_jsp", "../book/list.jsp");
	   //include
	   return "../main/main.jsp";
   }
}
