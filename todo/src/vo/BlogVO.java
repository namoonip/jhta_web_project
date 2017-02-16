package vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BlogVO {

	private int no;
	private String title;
	private String writer;
	private String contents;
	private Date regdate;
	private int groupno;
	private String userId;
	private int pwd;
	private int readcount;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
	
	public BlogVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BlogVO(int no, String title, String writer, String contents, Date regdate, int groupno, String userId,
			int pwd, int readcount) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.contents = contents;
		this.regdate = regdate;
		this.groupno = groupno;
		this.userId = userId;
		this.pwd = pwd;
		this.readcount = readcount;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public int getGroupno() {
		return groupno;
	}
	public void setGroupno(int groupno) {
		this.groupno = groupno;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getPwd() {
		return pwd;
	}
	public void setPwd(int pwd) {
		this.pwd = pwd;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
	public String getSimpleDate() {
		return sdf.format(getRegdate());
	}
}
