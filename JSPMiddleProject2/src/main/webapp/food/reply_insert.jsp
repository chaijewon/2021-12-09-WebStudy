<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
    request.setCharacterEncoding("UTF-8");
    String fno=request.getParameter("fno");
    String msg=request.getParameter("msg");
    String id=(String)session.getAttribute("id");
    String name=(String)session.getAttribute("name");
    
    ReplyVO vo=new ReplyVO();
    vo.setFood_no(Integer.parseInt(fno));
    vo.setMsg(msg);
    vo.setId(id);
    vo.setName(name);
    
    FoodDAO dao=new FoodDAO();
    dao.replyInsert(vo);
    
    response.sendRedirect("detail.jsp?no="+fno);
%>
