package com.sist.controller;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private List<String> clsList=new ArrayList<String>();
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		clsList.add("com.sist.model.MainModel");
		clsList.add("com.sist.model.FoodModel");
		clsList.add("com.sist.model.SeoulModel");
		clsList.add("com.sist.model.MemberModel");
		clsList.add("com.sist.model.ChatModel");
		clsList.add("com.sist.model.ReplyModel");
		clsList.add("com.sist.model.FreeBoardModel");
		clsList.add("com.sist.model.JjimModel");
		clsList.add("com.sist.model.ReserveModel");
		clsList.add("com.sist.model.CartModel");
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
			//1. 사용자가 보내준 URL주소 읽어 온다 : main/main.do...
			/*
			 *    http://localhost:8080/JSPFinalProject/main/main.do (URL)
			 *                         ------------------------------ URI
			 *    /JSPFinalProject/main/main.do
			 */
			String cmd=request.getRequestURI();
			cmd=cmd.substring(request.getContextPath().length()+1);
			
			// 클래스를 찾아서 메소드 수행 => HandlerAdapter
			// ----------- HandlerMapping 
			for(String cls:clsList)
			{
				// WebAppicationContext
				Class clsName=Class.forName(cls);// 클래스정보를 읽어 온다 
				Object obj=clsName.getDeclaredConstructor().newInstance();
				// 객체 => 클래스 객체 생성 => new (Spring => 자체 처리)
				// Method를 찾는다 
				Method[] methods=clsName.getDeclaredMethods();
				for(Method m:methods)
				{
					RequestMapping rm=m.getAnnotation(RequestMapping.class);
					if(rm.value().equals(cmd))
					{
						String jsp=(String)m.invoke(obj,request,response);
						if(jsp.startsWith("redirect"))
						{
							// return "redirect:../main/main.do"
							response.sendRedirect(jsp.substring(jsp.indexOf(":")+1));// request초기화
						}
						else
						{
							RequestDispatcher rd=request.getRequestDispatcher(jsp);
							rd.forward(request, response);//forward => request공유 
						}
						return;
					}
				}
				
			}
			
		}catch(Exception ex){}
	}

}





