package vo;

public class GalleryVO {
	private int no;
	private String username;
	private String description;
	private String filename;
	public GalleryVO() {
		super();
	}
	public GalleryVO(int no, String username, String description, String filename) {
		super();
		this.no = no;
		this.username = username;
		this.description = description;
		this.filename = filename;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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
}
