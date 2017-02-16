package vo;

import java.sql.Date;

public class BuyVO {

	private String buyUserId;
	private String buyCompleted;
	private Date buyDay;
	private int buyDiscount;
	private int buyOrderNo;
	private String itemname;
	private String itemcolor;
	private int itemCount;
	private int itemOrderNum;

	public String getItemcolor() {
		return itemcolor;
	}

	public void setItemcolor(String itemcolor) {
		this.itemcolor = itemcolor;
	}

	public String getItemname() {
		return itemname;
	}

	public void setItemname(String itemname) {
		this.itemname = itemname;
	}

	public int getItemCount() {
		return itemCount;
	}

	public void setItemCount(int itemCount) {
		this.itemCount = itemCount;
	}

	public int getItemOrderNum() {
		return itemOrderNum;
	}

	public void setItemOrderNum(int itemOrderNum) {
		this.itemOrderNum = itemOrderNum;
	}

	public BuyVO() {

	}

	public String getBuyUserId() {
		return buyUserId;
	}

	public void setBuyUserId(String buyUserId) {
		this.buyUserId = buyUserId;
	}

	public String getBuyCompleted() {
		return buyCompleted;
	}

	public void setBuyCompleted(String buyCompleted) {
		this.buyCompleted = buyCompleted;
	}

	public Date getBuyDay() {
		return buyDay;
	}

	public void setBuyDay(Date buyDay) {
		this.buyDay = buyDay;
	}

	public int getBuyDiscount() {
		return buyDiscount;
	}

	public void setBuyDiscount(int buyDiscount) {
		this.buyDiscount = buyDiscount;
	}

	public int getBuyOrderNo() {
		return buyOrderNo;
	}

	public void setBuyOrderNo(int buyOrderNo) {
		this.buyOrderNo = buyOrderNo;
	}

	@Override
	public String toString() {
		return "BuyVO [buyUserId=" + buyUserId + ", buyCompleted=" + buyCompleted + ", buyDay=" + buyDay
				+ ", buyDiscount=" + buyDiscount + ", buyOrderNo=" + buyOrderNo + "]";
	}

	public BuyVO(String buyUserId, String buyCompleted, Date buyDay, int buyDiscount, int buyOrderNo) {
		super();
		this.buyUserId = buyUserId;
		this.buyCompleted = buyCompleted;
		this.buyDay = buyDay;
		this.buyDiscount = buyDiscount;
		this.buyOrderNo = buyOrderNo;
	}

}
