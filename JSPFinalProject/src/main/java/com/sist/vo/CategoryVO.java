package com.sist.vo;
// 변수는 은닉화 => 외부에서 접근시에 메소드를 통해서 접근하는 방식 (캡슐화)
public class CategoryVO {
    private int cno;
    private String title;
    private String subject;
    private String poster;
    private String link;
    //  변수 => 쓰기(메모리에 저장) / 읽기(메모리에서 읽기)
    //         setter            getter
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	   
}
