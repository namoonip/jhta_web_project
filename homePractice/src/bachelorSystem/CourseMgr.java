package bachelorSystem;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Scanner;

public class CourseMgr{
	
	
	// regex 표준식 추가하기
	public CourseMgr() {
		Professor admin = new Professor();
		admin.setId("admin");
		admin.setPassword("admin");
	}
	
	// 파일이 없을 경우 파일 생성 후 객체 넣기
	public void fileCheck() throws Exception{
		File studentFile = new File("student.sav");
		File professorFile = new File("professor.sav");
		File courseFile = new File("course.sav");
		if(!studentFile.isFile()) {
			ObjectOutputStream oisStu= new ObjectOutputStream(new FileOutputStream("student.sav"));
			oisStu.writeObject(studentList);
			oisStu.close();
		}
		if(!professorFile.isFile()) {
			ObjectOutputStream oisPro= new ObjectOutputStream(new FileOutputStream("professor.sav"));
			oisPro.writeObject(professorList);
			oisPro.close();
		}
		if(!courseFile.isFile()) {
			ObjectOutputStream oisCourse= new ObjectOutputStream(new FileOutputStream("course.sav"));
			oisCourse.writeObject(courseList);
			oisCourse.close();
			return;
		}
	}
	
	// 파일 읽어오기
	public void read(){
		try{
			ObjectInputStream oisStu = new ObjectInputStream(new FileInputStream("student.sav"));
			studentList = (ArrayList<Student>) oisStu.readObject();
			oisStu.close();
			
			ObjectInputStream oisPro = new ObjectInputStream(new FileInputStream("professor.sav"));
			professorList = (ArrayList<Professor>) oisPro.readObject();
			oisPro.close();
			
			ObjectInputStream oisCourse = new ObjectInputStream(new FileInputStream("course.sav"));
			courseList = (ArrayList<Course>) oisCourse.readObject();
			oisCourse.close();
			
		} catch(Exception e){
			System.out.println("오류가 발생하였습니다.");
			System.out.println(e.getMessage());
			System.exit(0);
		}
	}
	
	// 저장 기능
	public void save() throws Exception{
		ObjectOutputStream oosStu = new ObjectOutputStream(new FileOutputStream("student.sav"));
		oosStu.writeObject(studentList);
		oosStu.flush();
		oosStu.close();
		
		ObjectOutputStream oosPro = new ObjectOutputStream(new FileOutputStream("professor.sav"));
		oosPro.writeObject(professorList);
		oosPro.flush();
		oosPro.close();
		
		ObjectOutputStream oosCourse = new ObjectOutputStream(new FileOutputStream("course.sav"));
		oosCourse.writeObject(courseList);
		oosCourse.flush();
		oosCourse.close();
	}
	
	ArrayList<Student> studentList = new ArrayList<>();
	ArrayList<Professor> professorList = new ArrayList<>();
	ArrayList<Course> courseList = new ArrayList<>();
	
	Professor loginedProfessor = null;
	Student loginedStudent = null;
	
	Scanner sc = new Scanner(System.in);
	
	// 부가기능
	Calendar now = Calendar.getInstance();
	int year = now.get(Calendar.YEAR);
	String yearNum1 = String.valueOf(year).substring(2, 4);
	int yearNum2 = Integer.parseInt(yearNum1);
	

	
	// 중복 아이디 조회
	private boolean isExistId(String id) {
		boolean isExist = false;
		for(Professor prof : professorList) {
			if(prof.getId().equals(id)) {
				isExist = true;
				break;
			}
		}
		for(Student stu : studentList) {
			if(stu.getId().equals(id)) {
				isExist = true;
				break;
			}
		}
		return isExist;
	}
	
	
	// 중복 번호 조회
	private boolean isExistNum(String num) {
		boolean isExist = false;
		for(Professor pro : professorList) {
			for(Student stu : studentList) {
				if(num.equals(String.valueOf(pro.getDeptNum()))||(num.equals(String.valueOf(stu.getDeptNum())))) {
					isExist = true;
					break;
				}
			}
		}
		return isExist;
	}
	
	// 과목코드 중복 조회
	private boolean isExistCode(String num) {
		boolean isExist = false;
		for(Course course : courseList ) {
			if(num.equals(course.getCode())) {
				isExist = true;
				break;
			}
		}
		return isExist;
	}
	
	//1 로그인
	public void login() {
		if((loginedProfessor!=null)||(loginedStudent!=null)) {
			System.out.println("로그인 중 입니다.");
			return;
		}
		System.out.print("아이디를 입력하세요>");
		String loginId = sc.nextLine();
		System.out.print("비밀번호를 입력하세요>");
		String loginPass = sc.nextLine();
		
		for(Professor pro : professorList) {
			if((pro.getId().equals(loginId))){
				if(pro.getPassword().equals(loginPass)) {
					loginedProfessor = pro;
					System.out.println(pro.getName()+" 교수님 로그인 되었습니다.");
					return;
				}
			}
		}
		for(Student stu : studentList) {				
			if(stu.getId().equals(loginId)) {
				if(stu.getPassword().equals(loginPass)) {
					loginedStudent = stu;
					System.out.println("로그인 되었습니다.");
					return;
				}
			}
		}		
		if((loginedProfessor == null) && (loginedStudent == null)) {
			System.out.println("아이디 혹은 비밀번호가 올바르지 않습니다.");
			return;
		}
	}
	
	//2 회원가입
	public void register(){
		if((loginedProfessor!=null)||(loginedStudent!=null)) {
			System.out.println("로그인 중 입니다.");
			return;
		}
		System.out.print("아이디를 입력하세요>");
		String id = sc.nextLine();
		while(isExistId(id)) {
			System.out.println("이미 사용중인 아이디 입니다.");
			if(!isExistId(id)) {
				break;
			}
			return;
		}
		System.out.print("당신은 학생 입니까?(Y/N)>");
		String choice = sc.nextLine();
		choice = choice.toLowerCase();
		if(choice.equals("n")){
			Professor professor = new Professor();
			professor.setId(id);
			System.out.print("비밀번호를 입력하세요>");
			professor.setPassword(sc.nextLine());
			System.out.print("이름을 입력하세요>");
			professor.setName(sc.nextLine());
			System.out.print("학과를 입력하세요>");
			professor.setDept(sc.nextLine());
			System.out.print("직책을 입력하세요>");
			professor.setLevel(sc.nextLine());
			System.out.print("전화번호를 입력하세요>");
			professor.setTelNum(sc.nextLine());
			System.out.print("이메일을 입력하세요>");
			professor.setEmail(sc.nextLine());
			int num = (int) (Math.random()*999)+1;
			while(!isExistNum(String.valueOf(num))) {
				if(isExistNum(String.valueOf(num)) == false) {
					String num2 = String.valueOf(num);
					String proNum = yearNum2 + num2;
					professor.setDeptNum(Integer.parseInt(proNum));
					break;
				}
			}
			System.out.println("교수번호는 " + professor.getDeptNum() + "입니다.");
			professorList.add(professor);
			return;
		}
		else if (choice.equals("y")){
			Student student = new Student();
			student.setId(id);
			System.out.print("비밀번호를 입력하세요>");
			student.setPassword(sc.nextLine());
			System.out.print("이름을 입력하세요>");
			student.setName(sc.nextLine());
			System.out.print("학과를 입력하세요>");
			student.setDept(sc.nextLine());
			System.out.print("전화번호를 입력하세요>");
			student.setTelNum(sc.nextLine());
			System.out.print("이메일을 입력하세요>");
			student.setEmail(sc.nextLine());
			int num = (int) (Math.random()*99999)+1;
			while(!isExistNum(String.valueOf(num))) {
				if(isExistNum(String.valueOf(num)) == false) {
					String num2 = String.valueOf(num);
					String stuNum = yearNum2 + num2;
					student.setDeptNum(Integer.parseInt(stuNum));
					break;
				}
			}
			System.out.println("당신의 학번은 " + student.getDeptNum() + "입니다.");
			studentList.add(student);
			return;
		}
		
	}
	
	
	
	
	//3 과정 조회
	public void enrollCheck() {
		if((loginedProfessor == null) && (loginedStudent==null)) {
			System.out.println("로그인이 필요합니다.");
			return;
		}
		if(loginedProfessor != null || loginedStudent != null) {
			System.out.println("학과\t과목 코드\t과목명\t\t교수\t(신청인원\\제한인원)");
			System.out.println("------------------------------------------------");
			if(courseList.isEmpty()){
				System.out.println("현재 등록된 과정이 없습니다.");
				return;
			}
			for(Course courses : courseList) { 
				System.out.println(courses.getProfessors().getDept() + "\t" +courses.getCode() +"\t" + courses.getName() 
				+ "\t\t" + courses.getProf() +	"\t    (" +courses.getStudentsList().size() + "\\" + courses.getLimit()+")");
			}
			System.out.println("------------------------------------------------");
		}		
	}
	
	
	//4 과정 등록
	// 한번 입력후 중복 입력 수정
	public void enroll(){
		if((loginedProfessor == null) && (loginedStudent==null)) {
			System.out.println("로그인이 필요합니다.");
			return;
		}
		// 교수가 과정 등록
		if(loginedProfessor!=null) {
			Course course = new Course();
			System.out.print("과정 이름을 입력하세요>");
			String courseName = sc.nextLine();
			course.setName(courseName);
			
			//제한인원 잘못 입력하였을 경우 추가
			System.out.print("제한 인원을 입력하세요>");
			String courseNumStr = sc.nextLine();
			int courseNumInt = Integer.parseInt(courseNumStr);
			if(courseNumInt>=100) {
				System.out.println("최대인원은 100명입니다.");
				return;
			}
			course.setLimit(courseNumInt);
			
			// 부가기능 과목 코드 난수 추가
			int secondNum = (int)(Math.random()*99)+1;
			int firstCode1 = (int)(Math.random()*26)+65;
			char firstCode2 = (char)firstCode1;
			String characterToString = Character.toString(firstCode2);
			String nameCode = (characterToString + characterToString) + yearNum1 + secondNum ;
			while(!isExistCode(nameCode)) {
				if(isExistCode(nameCode) == false) {					
					course.setCode(nameCode);
					break;
				}
			}
			System.out.println("과목 코드는 " + course.getCode() +"입니다.");
			course.setProfessors(loginedProfessor);
			course.setProf(loginedProfessor.getName());
			courseList.add(course);
			return;
		}
		
		
		// 학생 과정 등록 신청
		if(loginedStudent!=null) {
			enrollCheck();
			if(courseList.isEmpty()) {
				return;
			}
			System.out.print("등록할 과정의 과목 코드를 입력하세요>");
			String inputCourse = sc.nextLine();
			boolean isExist = false;
			// 중복 신청 조회와 제한 인원확인
			for(Course course : courseList) {
				if(course.getCode().equals(inputCourse)) {
					if(course.getLimit()<=course.getStudentsList().size()) {
						System.out.println("제한인원이 초과하여 신청할 수 없습니다.");
						return;
					}
					if(course.getStudentsList().contains(loginedStudent)) {
						System.out.println("이미 신청한 과정입니다.");
						return;
					}
					isExist = true;
					course.getStudentsList().add(loginedStudent);
					System.out.println(course.getName() + "과정 접수가 완료 되었습니다.");
					return;
				}
			}
			if(!isExist) {
				System.out.println("올바른 과목코드를 입력하세요.");
			}
		}
	}
	
	//5 등록한 과정 조회
	public void enrollInfo() {
		if((loginedProfessor == null) && (loginedStudent==null)) {
			System.out.println("로그인이 필요합니다.");
			return;
		}
		// 교수가 등록한 과정 조회
		if(loginedProfessor!=null) {
			boolean isExist = false;
			System.out.println("과목코드\t과목명\t\t(신청인원\\제한인원)");
			System.out.println("------------------------------------------------");
			for(Course course : courseList) {
				if(loginedProfessor.getId() == course.getProfessors().getId()) {
					isExist = true;
					System.out.println(course.getCode()+"\t"+course.getName() + "\t\t(" + 
							course.getStudentsList().size()+course.getLimit() +")");
				}
			}if(!isExist) {
				System.out.println("신청한 과목이 없습니다.");
				return;
			}
		}
		
		// 학생이 등록한 과정 조회
		if(loginedStudent!=null) {
			boolean isExist = false;
			System.out.println("학과\t과목코드\t과목명\t\t교수이름\t(신청인원\\제한인원)");
			System.out.println("------------------------------------------------");
			for(Course course : courseList) {
				for(Student stu : course.getStudentsList()) {
					if(loginedStudent.getId() == stu.getId()) {
						isExist = true;
						System.out.println(course.getProfessors().getDept() + "\t" + course.getCode() + "\t" + course.getName() + "\t\t"
								+ course.getProf() + "\t(" + course.getStudentsList().size() 
								+ "\\" + course.getLimit()+")");
					}
				}
			}
			if(!isExist) {
				System.out.println("신청한 과목이 없습니다.");
				return;
			}
		}
	}
	//6.정보 확인
		public void info() {
			if((loginedProfessor == null) && (loginedStudent==null)) {
				System.out.println("로그인이 필요합니다.");
				return;
			}
			System.out.print("비밀번호를 입력하세요>");
			String psCheck = sc.nextLine();
			if(loginedStudent != null) {
				if(loginedStudent.getPassword().equals(psCheck)) {
					System.out.println("----------------------------");
					System.out.println("학번\t학과\t이름\t\t전화번호\tEmail");
					System.out.println(loginedStudent.getDeptNum() + "\t" 
							+ loginedStudent.getDept() + "\t" + loginedStudent.getName()
							+ "\t" + loginedStudent.getTelNum() + "\t" + loginedStudent.getEmail());
					return;
				} else {
					System.out.println("비밀번호가 잘못 되었습니다.");
					return;
				}
			}
			if(loginedProfessor != null){
				if(loginedProfessor.getPassword().equals(psCheck)) {
					System.out.println("----------------------------");
					System.out.println("교수 번호\t학과\t이름\t직책\t전화번호\t\tEmail");
					System.out.println(loginedProfessor.getDeptNum() + "\t" 
							+ loginedProfessor.getDept() + "\t" +
							loginedProfessor.getName() + "\t" +
							loginedProfessor.getLevel() + "\t" +
							loginedProfessor.getTelNum() + "\t" +
							loginedProfessor.getEmail());
					return;
				}				
			} else {
				System.out.println("비밀번호가 잘못 되었습니다.");
				return;
			}
		}

	
	//7.로그아웃
	public void logout(){
		if((loginedProfessor == null) && (loginedStudent==null)) {
			System.out.println("로그인이 필요합니다.");
			return;
		}
		loginedProfessor = null;
		loginedStudent = null;
		System.out.println("로그아웃 되었습니다.");
		return;
	}
	
	// 운영자 계정으로 정보 조회 / 정보 초기화 / 강의 삭제
	public void admin() throws Exception{
		System.out.print("운영자 ID>");
		String adminId = sc.nextLine();
		System.out.print("운영자 Password>");
		String adminPs = sc.nextLine();
		if(adminId.equals("admin")) {
			if(adminPs.equals("admin")) {
				System.out.println("-------------------------------");
				System.out.println("1.정보 조회       2.정보 초기화       3.강좌 삭제");
				System.out.println("-------------------------------");
				System.out.print(">");
				String num = sc.nextLine();
				if(num.equals("1")) {
					if(studentList.size()==0) {
						System.out.println("------------------");
						System.out.println("등록된 학생 정보가 없습니다.");
					}
					if(professorList.size()==0) {
						System.out.println("등록된 교수 정보가 없습니다.");
					}
					if(courseList.size()==0) {
						System.out.println("등록된 과정 정보가 없습니다.");
						System.out.println("-------------------");
					}
					for(Student stuinfo : studentList) {
						System.out.println(stuinfo);
					}
					for(Professor proInfo : professorList) {
						System.out.println(proInfo);
					}
					for(Course courInfo : courseList) {
						System.out.println(courInfo);
					}
					return;					
				} else if(num.equals("2")) {
					System.out.print("정보를 초기화 하시겠습니까?(Y/N)>");
					String deleteInfo = sc.nextLine();
					deleteInfo = deleteInfo.toLowerCase();
					if(deleteInfo.equals("y")){
						studentList.clear();
						professorList.clear();
						courseList.clear();
						System.out.println("초기화가 완료되었습니다.");
						return;
					}
					
				} else if(num.equals("3")) {
						System.out.println("번호     학과\t과목 코드\t과목명\t\t교수\t(신청인원\\제한인원)");
						System.out.println("------------------------------------------------");
						if(courseList.isEmpty()){
							System.out.println("현재 등록된 과정이 없습니다.");
							return;
						}
						
						int count = 0;
						for(Course course : courseList) {
							System.out.println(count+"  "+course.getProfessors().getDept() + "\t" +course.getCode() 
							+ "\t" + course.getName() + "\t\t" + course.getProf() + "\t" + course.getStudentsList().size() + 
							"\\"+ course.getLimit() + ")");
							count++;
						}
						System.out.println("------------------------------------------------");
						System.out.print("삭제할 강좌의 강좌 번호를 입력하세요(없을경우 n입력)>");
						String deleteCourse = sc.nextLine();
						deleteCourse = deleteCourse.toLowerCase();
						if(deleteCourse.equals("n")) {
							return;
						}
						courseList.remove(Integer.parseInt(deleteCourse));
						System.out.println("삭제가 완료되었습니다.");							
						return;
				}
			} else {
				System.out.println("운영자만 접근할 수 있습니다.");
			}
		}
	}
}