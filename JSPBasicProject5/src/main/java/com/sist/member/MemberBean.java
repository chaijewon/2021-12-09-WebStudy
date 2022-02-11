package com.sist.member;
// 회원과 관련된 모든 데이터 모아서 전송 => VO , DTO ==> 회원 한명에 대한 정보
// 회원 한명 => MemberBean => 상세보기 
// 회원 여러명 => List<MemberBean> => 목록 출력
// 변수 => 메모리에 저장 , 메모리 읽기 ==> 읽기/쓰기 
//        setXxx()      getXxx()  => getter/setter
public class MemberBean {
    private String name;
    private int age;
    private String sex;
    private String addr;
    private String tel;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
   
}
