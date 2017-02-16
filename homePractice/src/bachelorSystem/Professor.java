package bachelorSystem;

import java.io.Serializable;

public class Professor implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5028059897555956851L;
	private String name;
	private String dept;
	private int deptNum;
	private String level;
	private String telNum;
	private String email;
	private String id;
	private String password;
	public Professor() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Professor(String name, String dept, int deptNum, String level, String telNum, String email, String id,
			String password) {
		super();
		this.name = name;
		this.dept = dept;
		this.deptNum = deptNum;
		this.level = level;
		this.telNum = telNum;
		this.email = email;
		this.id = id;
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public int getDeptNum() {
		return deptNum;
	}
	public void setDeptNum(int deptNum) {
		this.deptNum = deptNum;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getTelNum() {
		return telNum;
	}
	public void setTelNum(String telNum) {
		this.telNum = telNum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "교수 [이름:" + name + "(" + dept +" " + level + ")\t 교수번호:" + deptNum + "\t 전화번호:"
				+ telNum + "\t 이메일:" + email + "\t 아이디:" + id + "]";
	}
}