package com.sist.cart;
import java.util.*;
/*
 *   CART_ID                                   NOT NULL NUMBER
	 PRODUCT_ID                                         NUMBER
	 AMONT                                              NUMBER
	 ISCHECK                                            NUMBER
	 ISSALE                                             NUMBER
	 ID                                                 VARCHAR2(20)
	 REGDATE                                            DATE
 */
public class CartVO {
	private int cart_id,product_id,amont,ischeck,issale;
    private String id;
    private Date regdate;
    private String poster,title;
    private int price;
    
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	
	public int getAmont() {
		return amont;
	}
	public void setAmont(int amont) {
		this.amont = amont;
	}
	public int getIscheck() {
		return ischeck;
	}
	public void setIscheck(int ischeck) {
		this.ischeck = ischeck;
	}
	public int getIssale() {
		return issale;
	}
	public void setIssale(int issale) {
		this.issale = issale;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
    
    
}
