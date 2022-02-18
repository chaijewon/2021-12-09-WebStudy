package com.sist.model;

import javax.servlet.http.HttpServletRequest;
// 관련된 기능을 모아서 처리 => 응집성 
public class BoardModel {
   // 목록 처리 => 사용자가 보내준 request로 요청 처리 => 결과값을 추가해서 재전송
   public String boardListData(HttpServletRequest request)
   {
	   request.setAttribute("msg", "자유 게시판 목록");
	   return "board/list.jsp";
   }
   // 데이터 추가 
   public String boardInsertData(HttpServletRequest request)
   {
	   request.setAttribute("msg", "게시물 추가");
	   return "board/insert.jsp";
   }
   // 데이터 수정
   public String boardUpdateData(HttpServletRequest request)
   {
	   request.setAttribute("msg", "게시물 수정");
	   return "board/update.jsp";
   }
    // 데이터 삭제
   public String boardDeleteData(HttpServletRequest request)
   {
	   request.setAttribute("msg", "게시물 삭제");// List,VO
	   return "board/delete.jsp";
   }
    // 데이터 내용보기
   public String boardDetailData(HttpServletRequest request)
   {
	   request.setAttribute("msg", "게시물 내용보기");
	   return "board/detail.jsp";
   }
}







