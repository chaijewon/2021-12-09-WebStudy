package com.sist.dao;
import java.util.*;
public class ReplyVO {
	// 댓글 , 공지사항 => 날짜(시간) => 자바에서 처리가 안된다 
	// TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') => String
    private int no,food_no;
    private String id,name,msg;
    private Date regdate;
    private String dbday;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getFood_no() {
		return food_no;
	}
	public void setFood_no(int food_no) {
		this.food_no = food_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getDbday() {
		return dbday;
	}
	public void setDbday(String dbday) {
		this.dbday = dbday;
	}
   
}
