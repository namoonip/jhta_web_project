package vo;

import java.util.Date;
import java.text.DecimalFormat;

public class ItemVO {

	private int itemNo;
	private int categoryNo;
	private String name;
	private String src;
	private int count;
	private int price;
	private String color;
	private String size;
	private int groupNo;
	private String etc;
	private String viewSrc;
	private Date regdate;
	
	DecimalFormat dmf = new DecimalFormat("###,###,###,###");
	
	public ItemVO() {
		
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	public String getViewSrc() {
		return viewSrc;
	}

	public void setViewSrc(String viewSrc) {
		this.viewSrc = viewSrc;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	public int getDecimalPrice() {
		return price;
	}

	@Override
	public String toString() {
		return "ItemVO [itemNo=" + itemNo + ", categoryNo=" + categoryNo + ", name=" + name + ", src=" + src
				+ ", count=" + count + ", price=" + price + ", color=" + color + ", size=" + size + ", groupNo="
				+ groupNo + ", etc=" + etc + ", viewSrc=" + viewSrc + ", regdate=" + regdate + "]";
	}

	public ItemVO(int itemNo, int categoryNo, String name, String src, int count, int price, String color, String size,
			int groupNo, String etc, String viewSrc, Date regdate) {
		super();
		this.itemNo = itemNo;
		this.categoryNo = categoryNo;
		this.name = name;
		this.src = src;
		this.count = count;
		this.price = price;
		this.color = color;
		this.size = size;
		this.groupNo = groupNo;
		this.etc = etc;
		this.viewSrc = viewSrc;
		this.regdate = regdate;
	}

}
