package vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ReviewVO {
	
	private int no;
	private String contents;
	private Date regdate;
	private int blogNo;
	private String userId;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
	
	public ReviewVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewVO(int no, String contents, Date regdate, int blogNo, String userId) {
		super();
		this.no = no;
		this.contents = contents;
		this.regdate = regdate;
		this.blogNo = blogNo;
		this.userId = userId;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getBlogNo() {
		return blogNo;
	}
	public void setBlogNo(int blogNo) {
		this.blogNo = blogNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getSimpleDate() {
		return sdf.format(getRegdate());
	}
}
