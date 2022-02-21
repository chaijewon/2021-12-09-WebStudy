package com.sist.controller;

import java.io.*;
import java.lang.reflect.Method;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import java.net.*;
import java.util.*;
/*
 *                       appication에 등록된 모든 클래스(Model)
 *   브라우저 (요청)  ====> DispatcherServlet(Controller)
 *     => main.do       1) 요청처리 
 *                           => method를 찾아 준다 (수행)
 *                      2) 요청처리 => 결과를 request,session에 담는다
 *                         
 *     => food.do       3) request,session에 담긴 데이터(결과값)를
 *                         jsp로 전송  
 *     => music.do         => 1. JSP에서 request가 필요없는 경우
 *                               => _ok.jsp => 화면 이동 
 *                               sendRedirct()
 *                         => 2. request를 받아서 출력 
 *                               forward() => request를 넘겨준다
 *                               
 *                               
 *     => movie.do 
 *                     실제 요청에 대한 처리 (Model)
 *                     -------------------------
 *                      1. 요청값(request)을 받아서
 *                      2. 처리 (DAO) 
 *                      3. 처리 결과(화면 출력할 모든 내용을 request에 담아 준다
 *  
 *        요청  ===>  요청을 받아서 
 *                   요청처리를 하고 결과값을 보내준다 
 *                   ----------------- 분업을 위해서 나눠서 작업 
 *                   => 파일이 한개 작업 (DispatcherServlet)
 *        JSP  <=====> Model
 *            Controller는 연결만 담당 (스프링에서도 만들어져 있다) 
 *            ------------ Model클래스를 다 가지고 있다 
 */
@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private List<String> clsList=new ArrayList<String>();
    // XML에 등록된 Model 클래스를 읽어와서 저장 => 메소드를 찾아서 요청처리가 가능하게 만든다 
	public void init(ServletConfig config) throws ServletException {
		try
		{
			URL url=this.getClass().getClassLoader().getResource(".");
			File file=new File(url.toURI());
			System.out.println(file.getPath());
			// C:\webDev\webStudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\SpringMVCProject\WEB-INF\classes
		    // => 맥/윈도우 => 충돌 
			String path=file.getPath();
			path=path.replace("\\", File.separator); //\\ , /
			// File.sepqrator => Mac: / , Window :\\
			// => SI , 솔루션 
			path=path.substring(0,path.lastIndexOf(File.separator));
			// XML파일을 읽어 온다 
			// XML => 읽어온다 (파싱) => (DOM / SAX):JAXP => JAXB
			// JSoup => HTML 
			// 1. 파서기 생성 ==> (클래스를 여러개 모아서=> 요청하는 클래스 생성)
			//    XML , WML , HDML , VML 
			DocumentBuilderFactory dbf=
					DocumentBuilderFactory.newInstance();
			
			// 2. 파서기 생성 
			DocumentBuilder db=dbf.newDocumentBuilder();
			// 3. XML문서를 메모리에 저장 (파싱)
			Document doc=db.parse(new File(path+File.separator+"application.xml"));
			// 4. XML은 계층구조 => root부터 읽어 온다 
			Element beans=doc.getDocumentElement();
			// 5. 태그를 읽기 시작(같은 태그를 모아서 반복)
			// NodeList => Elements
			NodeList list=beans.getElementsByTagName("bean");
			for(int i=0;i<list.getLength();i++)
			{
				Element bean=(Element)list.item(i);
				String cls=bean.getAttribute("class");
				System.out.println(cls);
				clsList.add(cls);
			}
		}catch(Exception ex){}
	}
    // View => Controller에서 전송한 Requst를 화면에 출력 
	// 요청 받기 => 메소드 찾기 => requet를 JSP전송 
	// 요청 처리 => request값을 담아주는 역할 => Model 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//  사용자 요청을 처리하는 메소드 
		//  소스코딩을 하면 => 문제점 ==> 나눠서 처리 => Model을 만들어서 분업 
		try
		{
			// 사용자 요청한 URI 읽어 온다 (클라이언트가 서버로 전송 => 브라우저 주소)
			String uri=request.getRequestURI();
			// http://localhost/SpringMVCProject/main/main.do
			//                 ------------------------------URI
			uri=uri.substring(request.getContextPath().length()+1);
			// main/main.do
			// Model에 있는 등록된 RequestMapping을 찾는다 
			// Model클래스 메모리 할당 => 메소드 (메소드구분=>어노테이션)
			for(String strClass:clsList)
			{
				//1. 메모리 할당 
				Class clsName=Class.forName(strClass);
				Object obj=clsName.getDeclaredConstructor().newInstance();
				// new를 사용 , 클래스 이름으로 메모리 할당이 가능 (리플렉션)
				//2. 할당된 클래스안에서 메소드를 찾는다 
				Method[] methods=clsName.getDeclaredMethods();
				//3. 메소드 찾기 
				/*
				 *   @RequestMapping("main/main.do")
				 *   public String main_main(HttpServletRequest request)
				 *   {
				 *        return "main/main.jsp"; => view찾기 
				 *   }
				 *   
				 *   => 어노테이션 밑에 있는 메소드 , 클래스 
				 *      -------- 찾기만 하는 역할 
				 *      -------- 자동 처리 
				 */
				for(Method m:methods)
				{
					// 구분자 => 어노테이션으로 만들어져 있다 
					RequestMapping rm=
							m.getAnnotation(RequestMapping.class);
					if(rm.value().equals(uri))
					{
						// 메소드를 찾은 상태 
						/*
						 *   class A
						 *   {
						 *      public String display()
						 *      {
						 *          return "";
						 *      }
						 *   }
						 *   
						 *   A a=new A();
						 *   a.display();
						 *   
						 *   Class cls=Class.forName("클래스명");
						 *   Object obj=cls.newInstance();
						 *   
						 *   obj.display()
						 *       --------- invoke()
						 */
						String jsp=(String)m.invoke(obj, request,response);
						//obj(객체), request,response(매개변수) 
						if(jsp.startsWith("redirect"))
						{
							// sendRedirect => request를 전송하지 않는다 
							String s=jsp;
							s=s.substring(jsp.indexOf(":")+1);
							response.sendRedirect(s);
						}
						else
						{
							// forward => JSP에 request를 전송 
							RequestDispatcher rd=
									request.getRequestDispatcher(jsp);
							rd.forward(request, response);
						}
						return;
					}
				}
			}
			
		}catch(Exception ex){ex.printStackTrace();}
		
	}

}











