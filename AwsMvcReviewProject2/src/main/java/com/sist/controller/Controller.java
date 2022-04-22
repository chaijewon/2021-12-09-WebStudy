package com.sist.controller;

import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sist.model.*;

@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		try
		{
			// 받을 수 있는 내용 : URL
			/*
			 *  http://localhost/AwsMvcReviewProject2/*.do URL
			 *  /AwsMvcReviewProject2/*.do URI
			 *  /AwsMvcReviewProject2 ContextPath
			 *  /AwsMvcReviewProject2/list.do
			 */
			String cmd=request.getRequestURI();
			cmd=cmd.substring(request.getContextPath().length()+1);
			if(cmd.equals("list.do"))
			{
				GoodsModel m=new GoodsModel();
				String jsp=m.goodsListData(request);
				
				RequestDispatcher rd=request.getRequestDispatcher(jsp);
				rd.forward(request, response);
			}
		}catch(Exception ex){}
	}
    
}
