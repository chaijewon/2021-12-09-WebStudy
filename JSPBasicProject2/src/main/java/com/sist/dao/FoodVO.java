package com.sist.dao;
/*
 *    NO                                        NOT NULL NUMBER
 CNO                                                NUMBER
 POSTER                                    NOT NULL VARCHAR2(4000)
 NAME                                      NOT NULL VARCHAR2(200)
 SCORE                                     NOT NULL NUMBER(2,1)
 ADDRESS                                   NOT NULL VARCHAR2(500)
 TEL                                       NOT NULL VARCHAR2(20)
 TYPE                                      NOT NULL VARCHAR2(100)
 PRICE                                     NOT NULL VARCHAR2(100)
 TIME                                               VARCHAR2(200)
 MENU                                               CLOB
 GOOD                                               NUMBER
 SOSO                                               NUMBER
 BAD                                                NUMBER
 PARKING                                            VARCHAR2(100)
 */
public class FoodVO {
    private int no;
    private int cno;
    private String poster;
    private String name;
    private double score;
    private String address;
    private String tel;
    private String type;
    private String price;
    private String time;
    private String menu;
    private String parking;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public String getParking() {
		return parking;
	}
	public void setParking(String parking) {
		this.parking = parking;
	}
	   
}
