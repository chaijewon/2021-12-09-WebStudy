package com.sist.dao;
// record (데이터베이스 단위 => record)
// 컬럼 여러개 모아서 => 레코드) => 한번에 받아서 저장 
/*
 *  PRODUCT_ID                                NOT NULL NUMBER
 PRODUCT_PRICE                             NOT NULL NUMBER
 PRODUCT_NAME                              NOT NULL VARCHAR2(500)
 PRODUCT_POSTER                            NOT NULL VARCHAR2(260)
 */
// 캡슐화 
/*
 *  VO ==> 값을 저장할 목적 
 *  DTO ==> 값을 전송할 목적 
 *  ---------------------- MyBatis 
 *  Entity ==> table을 제어하기 위한 목적 (테이블 컬럼과 동일) => DataSet(Hibernate)
 *                                                       -------- JPA
 */
public class MovieVO {
    private int product_id,product_price;
    private String product_name,product_poster;
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_poster() {
		return product_poster;
	}
	public void setProduct_poster(String product_poster) {
		this.product_poster = product_poster;
	}
	   
}
