package vo;

import java.util.Date;

public class UserVO {
	private int no;
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String birth;
	private String addr;
	private String grade;
	private int point;
	private int totalPoint;
	private Date regdate;
	private String emailcode;
	private String emailcheck;
	
	public UserVO() {}

	public UserVO(int no, String id, String pw, String name, String phone, String birth, String addr, String grade,
			int point, int totalPoint, Date regdate, String emailcode, String emailcheck) {
		super();
		this.no = no;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.birth = birth;
		this.addr = addr;
		this.grade = grade;
		this.point = point;
		this.totalPoint = totalPoint;
		this.regdate = regdate;
		this.emailcode = emailcode;
		this.emailcheck = emailcheck;
	}



	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getTotalPoint() {
		return totalPoint;
	}

	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "UserVO [no=" + no + ", id=" + id + ", pw=" + pw + ", name=" + name + ", phone=" + phone + ", birth="
				+ birth + ", addr=" + addr + ", grade=" + grade + ", point=" + point + ", totalPoint=" + totalPoint
				+ ", regdate=" + regdate + ", emailcode=" + emailcode + ", emailcheck=" + emailcheck + "]";
	}

	public String getEmailcode() {
		return emailcode;
	}

	public void setEmailcode(String emailcode) {
		this.emailcode = emailcode;
	}

	public String getEmailcheck() {
		return emailcheck;
	}

	public void setEmailcheck(String emailcheck) {
		this.emailcheck = emailcheck;
	}
}
