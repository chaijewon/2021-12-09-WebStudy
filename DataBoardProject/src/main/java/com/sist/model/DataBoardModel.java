package com.sist.model;
import java.util.*;
import com.sist.dao.*;
import javax.servlet.http.*;
public class DataBoardModel {
    public void databoardListData(HttpServletRequest request)
    {
    	//1. 페이지 받기 
    	String page=request.getParameter("page");
    	if(page==null)
    		page="1"; // 첫페이지 실행 
    	int curpage=Integer.parseInt(page);// 현재페이지 만들기 
    	//2. Database에서 해당 페이지값을 받는다 
    	DataBoardDAO dao=new DataBoardDAO();
    	List<DataBoardVO> list=dao.databoardListData(curpage);
    	//3. JSP로 전송 
    	request.setAttribute("list", list);// 데이터를 추가 재전송 
    }
}
