/*
 * MemberVO Value Object
 */
package userInfo;

import java.sql.Date;

public class UserVO {
	private String id;
	private String name;
	private String pwd;
	private String email;
	private String tel;

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	private Date regdate;

	public UserVO() {}
	
	public UserVO(String id,String pwd) {
		this.id = id;
		this.pwd = pwd;
	}
	
	public UserVO(String id, String name, String pwd,  String email, String tel) {
		this.id = id;
		this.name = name;
		this.pwd = pwd;
		this.email = email;
		this.tel = tel;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

}
