package com.sist.dao;
// 멤버변수 == 컬럼명 (한번에 모아서 전송할 목적) => 자바빈 (데이터를 모아서 관리)
/*
 *    컬럼명            멤버변수 (데이터형 매칭) 
 *    문자형 
 *      CHAR 
 *      VARCHAR2
 *      CLOB
 *      --------------- String
 *    숫자형
 *      NUMBER    
 *      ---------------저장된 데이터가 정수형(int) , 실수형(double)
 *    날짜형 
 *      DATE 
 *      --------------- java.util.Date
 */
public class ZipcodeVO {
    private String zipcode;
    private String sido;
    private String gugun;
    private String dong;
    private String bunji;
    private String address;
    // 데이터를 모아서 출력 => 변수를 별도를 잡아서 처리
	public String getAddress() {
		return sido+" "+gugun+" "+dong+" "+bunji;
	}
	
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getGugun() {
		return gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getBunji() {
		return bunji;
	}
	public void setBunji(String bunji) {
		this.bunji = bunji;
	}
  
  
}
