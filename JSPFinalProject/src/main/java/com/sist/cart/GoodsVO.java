package com.sist.cart;
/*
 *   PRODUCT_ID                                NOT NULL NUMBER
     PRODUCT_PRICE                             NOT NULL NUMBER
     PROJECT_NAME                              NOT NULL VARCHAR2(500)
     PROJECT_POSTER                            NOT NULL VARCHAR2(260)
 */
public class GoodsVO {
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
