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

@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void init(ServletConfig config) throws ServletException {
		
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 연결 => Model<=>JSP ==> 결과값을 화면에 출력 
		// service() : GET/POST 동시에 처리 => doGet() , doPost()
		// http://localhost/MVCBasicProject1/Controller
		// 1. 사용자 요청을 받는다 
		// Controller?cmd=list => ListModel=======list.jsp전송
		String cmd=request.getParameter("cmd");
		// 해당 Model을 찾는다
		String jsp="";
		if(cmd.equals("list")) // 사용자가 목록 출력 요청 
		{
			ListModel model=new ListModel();
			model.handlerRequest(request); // MV 
			jsp="list.jsp";
		}
		else if(cmd.equals("update"))
		{
			UpdateModel model=new UpdateModel();
			model.handlerRequest(request);
			jsp="update.jsp";
		}
		else if(cmd.equals("delete"))
		{
			DeleteModel model=new DeleteModel();
			model.handlerRequest(request);
			jsp="delete.jsp";
		}
		else if(cmd.equals("insert"))
		{
			InsertModel model=new InsertModel();
			model.handlerRequest(request);
			jsp="insert.jsp";
		}
		// 메소드 실행 => request => 해당 jsp로 전송 
		// rd가 JSP다
		RequestDispatcher rd=request.getRequestDispatcher("view/"+jsp);
		rd.forward(request, response);
		
	}

}

















