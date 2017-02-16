package board;

import java.sql.Date;

public class BoardVO {
	private int no;
	private String title;
	private String writer;
	private int likes;
	private String contents;
	private Date regDate;
	private String ip;
	
	public BoardVO() {
		super();
	}
	public BoardVO(int no, String title, String writer, int likes, String contents, Date regDate, String ip) {
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.likes = likes;
		this.contents = contents;
		this.regDate = regDate;
		this.ip = ip;
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
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
}
