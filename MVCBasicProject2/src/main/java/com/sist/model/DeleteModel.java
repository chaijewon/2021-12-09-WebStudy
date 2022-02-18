package com.sist.model;

import javax.servlet.http.HttpServletRequest;
/*
 *   메인 (1)
 *   회원관련 (1) => 로그인 처리 / 회원가입 / 회원수정 / ID/Password찾기 / 회원탈퇴
 *   커뮤니티 (2) => 자유게시판 (댓글)/ 묻고 답하기(계층형)
 *   목록 => 맛집 , 레시피 , 명소(여행)  => 1
 *   상세보기 => 1
 *   공지사항 
 *   ==================================================
 *   예약(1) , 장바구니(1) , 추천(1) ==> 3/4 3/7(스프링) 
 *   => 스프링-부트 , React , Vue...
 *   => 수료 (챗봇) 
 *   => AWS 배포 
 *   --------------------------------------------------
 */
public class DeleteModel implements Model{
	  public String handlerRequest(HttpServletRequest request)
	  {
		  request.setAttribute("msg", "게시판 삭제");
		  return "delete.jsp";
	  }
}
