package com.sist.controller;

import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.model.*;
/*
 *   1. 사용자 요청 => 클래스 찾기 
 *   2. 메소드를 통해서 처리 
 *   3. 해당 JSP이동 (request)
 */
@WebServlet("/Controller")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cmd=request.getParameter("cmd");
		BoardModel model=new BoardModel();
		String jsp="";
		if(cmd.equals("list"))
		{
			jsp=model.boardListData(request);
		}
		else if(cmd.equals("detail"))
		{
			jsp=model.boardDetailData(request);
		}
		else if(cmd.equals("insert"))
		{
			jsp=model.boardInsertData(request);
		}
		else if(cmd.equals("update"))
		{
			jsp=model.boardUpdateData(request);
		}
		else if(cmd.equals("delete"))
		{
			jsp=model.boardDeleteData(request);
		}
		
		RequestDispatcher rd=request.getRequestDispatcher(jsp);
		rd.forward(request, response);
	}

}









