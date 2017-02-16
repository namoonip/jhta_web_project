package vo;

public class GalVO {
	private int no;
	private String title;
	private String description;
	private String filename;
	private String day;
	private String location;
	private String userId;
	public GalVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GalVO(int no, String title, String description, String filename, String day, String location,
			String userId) {
		super();
		this.no = no;
		this.title = title;
		this.description = description;
		this.filename = filename;
		this.day = day;
		this.location = location;
		this.userId = userId;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
}