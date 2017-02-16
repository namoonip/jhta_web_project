package horse;

import java.io.Serializable;

public class UserVO implements Serializable{

	private static final long serialVersionUID = 1L;
	private String id;
	private String pwd;
	private String name;
	private int point;
	
	public UserVO() {
		super();
	}
	public UserVO(String id, String pwd, int point, String name) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.point = point;
		this.name = name;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}