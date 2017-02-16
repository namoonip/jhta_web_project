package vo;

import java.util.Date;

public class Book {
	
	private int no;
	private String title;
	private String author;
	private String publisher;
	private int price;
	private Date pubdate;
	
	public Book() {	super(); }
	
	public Book(int no, String title, String author, String publisher, int price, Date pubdate) {
		super();
		this.no = no;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.price = price;
		this.pubdate = pubdate;
	}
	
	public int getNo() {return no;}
	public void setNo(int no) {this.no = no;}
	public String getTitle() {return title;}
	public void setTitle(String title) {this.title = title;}
	public String getAuthor() {	return author;}
	public void setAuthor(String author) {this.author = author;}
	public String getPublisher() {return publisher;	}
	public void setPublisher(String publisher) {this.publisher = publisher;}
	public int getPrice() {return price;}
	public void setPrice(int price) {this.price = price;}
	public Date getPubdate() {return pubdate;	}
	public void setPubdate(Date pubdate) {this.pubdate = pubdate;}
	
}
