package vo;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpSession;
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
		// TODO Auto-generated constructor stub
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
		
		try {
			HttpSession session = event.getSession();
			BufferedReader reader = new BufferedReader(new FileReader(session.getId() + ".txt"));
			String text = reader.readLine();
			String[] arr = text.split(":");
			
			id = arr[0];
			name = arr[1];
			phone = arr[2];
					
			/*UserVO user = new UserVO();
			user.setId(arr[0]);
			user.setName(arr[1]);
			user.setPhone(arr[2]); */
			
			reader.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.getStackTrace();
		}
	}
	
	@Override
	public void sessionWillPassivate(HttpSessionEvent event) {
		
		try {
			HttpSession session = event.getSession();
			String sessionId = session.getId();
			
			String text = id + ":" + name + ":" + phone;
			
			FileWriter writer = new FileWriter(sessionId + ".txt");
			writer.write(text);
			writer.write("\n");
			writer.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
