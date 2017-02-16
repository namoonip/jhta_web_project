package vo;

import java.sql.Date;

public class ItemVO {
	private int no;
	private String name;
	private String maker;
	private int price;
	private Date pubdate;
	
	public ItemVO() {
		super();
	}
	public ItemVO(int no, String name, String maker, int price, Date pubdate) {
		super();
		this.no = no;
		this.name = name;
		this.maker = maker;
		this.price = price;
		this.pubdate = pubdate;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMaker() {
		return maker;
	}
	public void setMaker(String maker) {
		this.maker = maker;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getPubdate() {
		return pubdate;
	}
	public void setPubdate(Date pubdate) {
		this.pubdate = pubdate;
	}
	
	@Override
	public String toString() {
		return "ItemVO [no=" + no + ", name=" + name + ", maker=" + maker + ", price=" + price + ", pubdate=" + pubdate
				+ "]";
	}
}
