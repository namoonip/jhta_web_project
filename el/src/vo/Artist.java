package vo;

public class Artist {

	private String name;
	private String company;
	private int age;
	
	public Artist() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Artist(String name, String company, int age) {
		super();
		this.name = name;
		this.company = company;
		this.age = age;
	}
	
	public void setName(String name) {this.name = name;}
	public void setCompany(String company) {this.company = company;}
	public void setAge(int age) {this.age = age;}
	public String getName() {return name;}
	public String getCompany() {return company;}
	public int getAge() {return age;}

	@Override
	public String toString() {
		return "Artist [name=" + name + ", company=" + company + ", age=" + age + "]";
	}
	
	
}
