package com.sist.dao;
/*
 *   NO         NUMBER         
	TITLE      VARCHAR2(500)  
	POSTER     VARCHAR2(260)  
	CONTENT    VARCHAR2(4000) 
	AUTHOR     VARCHAR2(50)   
	PRICE      VARCHAR2(20)   
	REGDATE    VARCHAR2(30)   
	ISBN       VARCHAR2(20)   
	TAGS       VARCHAR2(4000) ==> JSP (Bean) => 핵심 
	Bean => VO => DTO ==> 데이터를 모아서 전송 목적 
	JSP    Spring MyBatis 
 */
public class BooksVO {
	// 변수 => 읽기/쓰기 => 메모리에 저장 / 메모리에 읽기 
	//        getter / setter 
	// 은닉화 => 다른 클래스에서 변수 직접사용하지 못하고 => 메소드를 이용해서 
	// 접근하는 방식 => 캡슐화 
	// 8장 : 서블릿 , 9장 : VO , 10장 :  데이터베이스 , 11장 : DAO 
	// 12장 => Session/Cookie 
    private int no;
    private String title;
    private String poster;
    private String content;
    private String author;
    private String price;
    private String regdate;
    private String isbn;
    private String tags;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
    
    
}
