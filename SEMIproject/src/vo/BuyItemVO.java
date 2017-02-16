package vo;

public class BuyItemVO {

	private int BuyItemNo;
	private int BuyItemProductNum;
	private int BuyItemCount;
	private int BuyItemOrderNum;
	private int BuyItemPrice;

	public BuyItemVO() {

	}

	@Override
	public String toString() {
		return "BuyItemVO [BuyItemNo=" + BuyItemNo + ", BuyItemProductNum=" + BuyItemProductNum + ", BuyItemCount="
				+ BuyItemCount + ", BuyItemOrderNum=" + BuyItemOrderNum + ", BuyItemPrice=" + BuyItemPrice + "]";
	}

	public BuyItemVO(int buyItemNo, int buyItemProductNum, int buyItemCount, int buyItemOrderNum, int buyItemPrice) {
		super();
		BuyItemNo = buyItemNo;
		BuyItemProductNum = buyItemProductNum;
		BuyItemCount = buyItemCount;
		BuyItemOrderNum = buyItemOrderNum;
		BuyItemPrice = buyItemPrice;
	}

	public int getBuyItemNo() {
		return BuyItemNo;
	}

	public void setBuyItemNo(int buyItemNo) {
		BuyItemNo = buyItemNo;
	}

	public int getBuyItemProductNum() {
		return BuyItemProductNum;
	}

	public void setBuyItemProductNum(int buyItemProductNum) {
		BuyItemProductNum = buyItemProductNum;
	}

	public int getBuyItemCount() {
		return BuyItemCount;
	}

	public void setBuyItemCount(int buyItemCount) {
		BuyItemCount = buyItemCount;
	}

	public int getBuyItemOrderNum() {
		return BuyItemOrderNum;
	}

	public void setBuyItemOrderNum(int buyItemOrderNum) {
		BuyItemOrderNum = buyItemOrderNum;
	}

	public int getBuyItemPrice() {
		return BuyItemPrice;
	}

	public void setBuyItemPrice(int buyItemPrice) {
		BuyItemPrice = buyItemPrice;
	}

}
