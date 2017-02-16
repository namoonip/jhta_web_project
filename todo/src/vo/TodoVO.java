package vo;

public class TodoVO {
	private int no;
	private String category;
	private String title;
	private String description;
	private String location;
	private String day;
	private String completed;
	private String userId;
	
	public TodoVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TodoVO(int no, String category, String title, String description, String location, String day,
			String completed, String userId) {
		super();
		this.no = no;
		this.category = category;
		this.title = title;
		this.description = description;
		this.location = location;
		this.day = day;
		this.completed = completed;
		this.userId = userId;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getCompleted() {
		return completed;
	}
	public void setCompleted(String completed) {
		this.completed = completed;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
}
