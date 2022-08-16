package notice;

import java.util.Date;

public class NoticeVO {
	private int no;
	private String title;
	private String content;
	private Date regdates;
	
	public NoticeVO() {
	}
	
	public NoticeVO(String title, String content) {
		this.title = title;
		this.content = content;
	}
	
	public NoticeVO(String title, String content, int no) {
		this.title = title;
		this.content = content;
		this.no = no;
	}
	
	public NoticeVO(int no, String title, String content, Date regdates) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.regdates = regdates;
	}

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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdates() {
		return regdates;
	}

	public void setRegdates(Date regdates) {
		this.regdates = regdates;
	}
	
}
