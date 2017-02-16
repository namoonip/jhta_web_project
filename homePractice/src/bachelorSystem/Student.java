package bachelorSystem;

import java.io.Serializable;

public class Student implements Serializable{

	private static final long serialVersionUID = -4209509460281107924L;
	private String name;
	private String dept;
	private int deptNum;
	private String telNum;
	private String email;
	private String id;
	private String password;
	
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Student(String name, String dept, int deptNum, String telNum, String email, String id, String password) {
		super();
		this.name = name;
		this.dept = dept;
		this.deptNum = deptNum;
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
		return "학생 [이름:" + name + "(" + dept + ")\t학번:" + deptNum + "\t전화번호:" + telNum 
				+ "\t이메일:" + email + "\t아이디:" + id  + "]";
	}
}