package vo;

import java.util.Date;
import javax.servlet.http.HttpSessionActivationListener;
import javax.servlet.http.HttpSessionEvent;

public class UserVO implements HttpSessionActivationListener{

	private String id;
	private String name;
	private String pwd;
	private String phone;
	private String addr;
	private int point;
	private Date regdate;
	
	public UserVO() {
		super();
	}
	
	public UserVO(String id, String name, String pwd, String phone, String addr, int point, Date regdate) {
		super();
		this.id = id;
		this.name = name;
		this.pwd = pwd;
		this.phone = phone;
		this.addr = addr;
		this.point = point;
		this.regdate = regdate;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public void sessionDidActivate(HttpSessionEvent event) {
		
	}
	
	@Override
	public void sessionWillPassivate(HttpSessionEvent event) {
		
	}
}
