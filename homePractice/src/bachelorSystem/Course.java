package bachelorSystem;

import java.io.Serializable;
import java.util.ArrayList;

public class Course implements Serializable{

	private static final long serialVersionUID = -2877975611934194888L;
	private String code;
	private String name;
	private String prof;
	private int limit;
	private Professor professors = new Professor();
	private ArrayList<Student> studentsList = new ArrayList<>();
	public Course() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Course(String code, String name, String prof, int limit, Professor professors,
			ArrayList<Student> studentsList) {
		super();
		this.code = code;
		this.name = name;
		this.prof = prof;
		this.limit = limit;
		this.professors = professors;
		this.studentsList = studentsList;
	}

	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProf() {
		return prof;
	}
	public void setProf(String prof) {
		this.prof = prof;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public Professor getProfessors() {
		return professors;
	}
	public void setProfessors(Professor professors) {
		this.professors = professors;
	}
	public ArrayList<Student> getStudentsList() {
		return studentsList;
	}
	public void setStudentsList(ArrayList<Student> studentsList) {
		this.studentsList = studentsList;
	}

	@Override
	public String toString() {
		return "과목 코드:" + code + "\t강의명:" + name + "\t교수명:" + prof + " (신청:" + studentsList.size() 
		+ "/" +  limit + ")]";
	}
}