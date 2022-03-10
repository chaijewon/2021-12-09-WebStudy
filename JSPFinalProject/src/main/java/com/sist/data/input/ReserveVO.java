package com.sist.data.input;
/*
 *   NO                                                 NUMBER
 ID                                                 VARCHAR2(20)
 FNO                                                NUMBER
 DAY                                                VARCHAR2(20)
 TIME                                               VARCHAR2(20)
 INWON                                              VARCHAR2(20)
 REGDATE                                            DATE
 OK                                                 NUMBER
 */
import java.util.*;
public class ReserveVO {
    private int no,fno,ok;
    private String day,time,inwon,id;
    private Date regdate;
    /// 출력 
    private String name,poster;
    
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public int getOk() {
		return ok;
	}
	public void setOk(int ok) {
		this.ok = ok;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getInwon() {
		return inwon;
	}
	public void setInwon(String inwon) {
		this.inwon = inwon;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
   
}
