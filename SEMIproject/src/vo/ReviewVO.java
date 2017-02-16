package vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ReviewVO {
	private int reviewNo;
	private String reviewContents;
	private Date reviwRegDate;
	private int reviewGroupNo;
	private int reviewUserNo;
	private String reviewUserName;
	private int reviewLike;
	
	String pattern = "YYYY-MM-DD hh:mm:ss";
	SimpleDateFormat smf = new SimpleDateFormat(pattern);
	
	public ReviewVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReviewVO(int reviewNo, String reviewContents, Date reviwRegDate, int reviewGroupNo, int reviewUserNo,
			String reviewUserName, int reviewLike) {
		super();
		this.reviewNo = reviewNo;
		this.reviewContents = reviewContents;
		this.reviwRegDate = reviwRegDate;
		this.reviewGroupNo = reviewGroupNo;
		this.reviewUserNo = reviewUserNo;
		this.reviewUserName = reviewUserName;
		this.reviewLike = reviewLike;
	}



	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getReviewContents() {
		return reviewContents;
	}
	public void setReviewContents(String reviewContents) {
		this.reviewContents = reviewContents;
	}
	public Date getReviwRegDate() {
		return reviwRegDate;
	}
	public void setReviwRegDate(Date reviwRegDate) {
		this.reviwRegDate = reviwRegDate;
	}
	public int getReviewGroupNo() {
		return reviewGroupNo;
	}
	public void setReviewGroupNo(int reviewGroupNo) {
		this.reviewGroupNo = reviewGroupNo;
	}	
	public int getReviewUserNo() {
		return reviewUserNo;
	}
	public void setReviewUserNo(int reviewUserNo) {
		this.reviewUserNo = reviewUserNo;
	}
	public String getReviewUserName() {
		return reviewUserName;
	}
	public void setReviewUserName(String reviewUserName) {
		this.reviewUserName = reviewUserName;
	}
	public int getReviewLike() {
		return reviewLike;
	}
	public void setReviewLike(int reviewLike) {
		this.reviewLike = reviewLike;
	}
	public String getSimpleDateFormat() {
		return smf.format(getReviwRegDate());
	}
}
