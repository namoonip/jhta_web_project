package vo;

public class Song {

	private String title;
	private Artist artist;
	private int runningTime;
	private String company;
	
	public Song() {}

	public Song(String title, Artist artist, int runningTime, String company) {
		super();
		this.title = title;
		this.artist = artist;
		this.runningTime = runningTime;
		this.company = company;
	}
		
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public Artist getArtist() {
		return artist;
	}

	public void setArtist(Artist artist) {
		this.artist = artist;
	}

	public int getRunningTime() {
		return runningTime;
	}

	public void setRunningTime(int runningTime) {
		this.runningTime = runningTime;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	@Override
	public String toString() {
		return "Song [title=" + title + ", artist=" + artist + ", runningTime=" + runningTime + ", company=" + company
				+ "]";
	}
	
	public String getRunningTime2() {
		int minute = runningTime/60;
		String minutes = "";
		if(minute < 10) {
			minutes = 0 + String.valueOf(minute);
		} else {
			minutes = String.valueOf(minute);
		}
		
		int seconds = runningTime%60;
		return minutes + ":" + seconds; 
	}
}
