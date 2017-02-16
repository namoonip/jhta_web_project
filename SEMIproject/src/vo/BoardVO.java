package vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BoardVO {

	private int boardNo;
	private String boardTitle;
	private String boardContents;
	private String uccURL;
	private String boardFileName1;
	private String boardFileName2;
	private String boardFileName3;
	private String boardFileName4;
	private String boardFileName5;
	private String boardPwd;
	private String secret;
	private String userName;
	private Date boardRegdate;
	private int boardReadCount;
	private int boardType;
	private String boardCategory;
	private int boardUserNo;
	private double boardSatis;
	private int boardItemNo;
	private String boardItemInfo;
	private int boardItemGroupNo;
	private String boardItemSrc;
	private int boardGroupNo;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

	public String getSimpleDate() {
		return sdf.format(getBoardRegdate());
	}

	public BoardVO() {
		super();
	}

	

	public BoardVO(int boardNo, String boardTitle, String boardContents, String uccURL, String boardFileName1,
			String boardFileName2, String boardFileName3, String boardFileName4, String boardFileName5, String boardPwd,
			String secret, String userName, Date boardRegdate, int boardReadCount, int boardType, String boardCategory,
			int boardUserNo, double boardSatis, int boardItemNo, String boardItemInfo, int boardItemGroupNo,
			String boardItemSrc, int boardGroupNo, SimpleDateFormat sdf) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContents = boardContents;
		this.uccURL = uccURL;
		this.boardFileName1 = boardFileName1;
		this.boardFileName2 = boardFileName2;
		this.boardFileName3 = boardFileName3;
		this.boardFileName4 = boardFileName4;
		this.boardFileName5 = boardFileName5;
		this.boardPwd = boardPwd;
		this.secret = secret;
		this.userName = userName;
		this.boardRegdate = boardRegdate;
		this.boardReadCount = boardReadCount;
		this.boardType = boardType;
		this.boardCategory = boardCategory;
		this.boardUserNo = boardUserNo;
		this.boardSatis = boardSatis;
		this.boardItemNo = boardItemNo;
		this.boardItemInfo = boardItemInfo;
		this.boardItemGroupNo = boardItemGroupNo;
		this.boardItemSrc = boardItemSrc;
		this.boardGroupNo = boardGroupNo;
		this.sdf = sdf;
	}

	public int getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}


	public String getBoardTitle() {
		return boardTitle;
	}


	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}


	public String getBoardContents() {
		return boardContents;
	}


	public void setBoardContents(String boardContents) {
		this.boardContents = boardContents;
	}


	public String getUccURL() {
		return uccURL;
	}


	public void setUccURL(String uccURL) {
		this.uccURL = uccURL;
	}


	public String getBoardFileName1() {
		return boardFileName1;
	}


	public void setBoardFileName1(String boardFileName1) {
		this.boardFileName1 = boardFileName1;
	}


	public String getBoardFileName2() {
		return boardFileName2;
	}


	public void setBoardFileName2(String boardFileName2) {
		this.boardFileName2 = boardFileName2;
	}


	public String getBoardFileName3() {
		return boardFileName3;
	}


	public void setBoardFileName3(String boardFileName3) {
		this.boardFileName3 = boardFileName3;
	}


	public String getBoardFileName4() {
		return boardFileName4;
	}


	public void setBoardFileName4(String boardFileName4) {
		this.boardFileName4 = boardFileName4;
	}


	public String getBoardFileName5() {
		return boardFileName5;
	}


	public void setBoardFileName5(String boardFileName5) {
		this.boardFileName5 = boardFileName5;
	}


	

	public String getBoardPwd() {
		return boardPwd;
	}




	public void setBoardPwd(String boardPwd) {
		this.boardPwd = boardPwd;
	}




	public String getSecret() {
		return secret;
	}


	public void setSecret(String secret) {
		this.secret = secret;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public Date getBoardRegdate() {
		return boardRegdate;
	}


	public void setBoardRegdate(Date boardRegdate) {
		this.boardRegdate = boardRegdate;
	}


	public int getBoardReadCount() {
		return boardReadCount;
	}


	public void setBoardReadCount(int boardReadCount) {
		this.boardReadCount = boardReadCount;
	}


	public int getBoardType() {
		return boardType;
	}


	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}


	public String getBoardCategory() {
		return boardCategory;
	}


	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}
	
	public String getUserNameEdited() {
		return (getUserName().substring(0, 1) + "****");
	}

	public int getBoardUserNo() {
		return boardUserNo;
	}

	public void setBoardUserNo(int boardUserNo) {
		this.boardUserNo = boardUserNo;
	}

	public double getBoardSatis() {
		return boardSatis;
	}

	public void setBoardSatis(double boardSatis) {
		this.boardSatis = boardSatis;
	}

	public int getBoardItemNo() {
		return boardItemNo;
	}

	public void setBoardItemNo(int boardItemNo) {
		this.boardItemNo = boardItemNo;
	}

	public String getBoardItemInfo() {
		return boardItemInfo;
	}

	public void setBoardItemInfo(String boardItemInfo) {
		this.boardItemInfo = boardItemInfo;
	}

	public int getBoardItemGroupNo() {
		return boardItemGroupNo;
	}

	public void setBoardItemGroupNo(int boardItemGroupNo) {
		this.boardItemGroupNo = boardItemGroupNo;
	}

	public String getBoardItemSrc() {
		return boardItemSrc;
	}

	public void setBoardItemSrc(String boardItemSrc) {
		this.boardItemSrc = boardItemSrc;
	}

	public int getBoardGroupNo() {
		return boardGroupNo;
	}

	public void setBoardGroupNo(int boardGroupNo) {
		this.boardGroupNo = boardGroupNo;
	}
	
}