package fileStatement;

public class FileVO {
	private int fileNo;
	private String fileName;
	private String fileDescription;
	private String fileMaker;
	private String fileConnected;
	public FileVO() {
		
		super();
		// TODO Auto-generated constructor stub
	}

	public FileVO(int fileNo, String fileName, String fileDescription, String fileMaker, String fileConnected) {
		super();
		this.fileNo = fileNo;
		this.fileName = fileName;
		this.fileDescription = fileDescription;
		this.fileMaker = fileMaker;
		this.fileConnected = fileConnected;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileDescription() {
		return fileDescription;
	}
	public void setFileDescription(String fileDescription) {
		this.fileDescription = fileDescription;
	}
	public String getFileMaker() {
		return fileMaker;
	}
	public void setFileMaker(String fileMaker) {
		this.fileMaker = fileMaker;
	}
	public String getFileConnected() {
		return fileConnected;
	}
	public void setFileConnected(String fileConnected) {
		this.fileConnected = fileConnected;
	}
	
}
