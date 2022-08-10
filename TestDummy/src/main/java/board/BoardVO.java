package board;

import java.util.Date;

public class BoardVO {
	private int no;
	private int pno;
	private String title;
	private String id;
	private String content;
	private Date regdate;
	
	public BoardVO() {}
	
	public BoardVO(String title, String id, String content) {
		this.title = title;
		this.id = id;
		this.content = content;
	}
	
	public BoardVO(String title, String content, int no) {
		this.title = title;
		this.content = content;
		this.no = no;
	}
	
	public BoardVO(int no, String title, String id, String content, Date regdate) {
		this.no = no;
		this.title = title;
		this.id = id;
		this.content = content;
		this.regdate = regdate;
	}
	
	public BoardVO(String title, String id, String content, Date regdate, int pno) {
		this.pno = pno;
		this.title = title;
		this.id = id;
		this.content = content;
		this.regdate = regdate;
	}

	public BoardVO(int no, int pno, String title, String id, String content, Date regdate) {
		this.no = no;
		this.pno = pno;
		this.title = title;
		this.id = id;
		this.content = content;
		this.regdate = regdate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}
	
	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
