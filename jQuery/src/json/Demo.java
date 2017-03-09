package json;

import java.util.ArrayList;

import com.google.gson.Gson;

import vo.Dept;

public class Demo {
	
	public static void main(String[] args) {
		// Gson은 자바 형식의 객체를 JSON 형식의 배열형식의 텍스토로 변환해주는 유틸.
		Gson gson = new Gson();
		
		// 1.자바의 String 배열 객체를 JSON 형식의 텍스트로 변환 --> json 배열 형식의 텍스트
		String[] names = {"김유신", "강감찬", "이순신", "홍길동"};		
		String text1 = gson.toJson(names);
		System.out.println(text1);
		
		// 2.자바의 ArrayList를 JSON 형식의 텍스트로 변환	--> json 배열 형식의 텍스트
		ArrayList<String> nameList = new ArrayList<>();
		nameList.add("홍길동"); nameList.add("김유신"); nameList.add("강감찬");
		String text2 = gson.toJson(nameList);
		System.out.println(text2);
		
		// 자바의 객체를 json 형식의 텍스트로 변환 --> json 오브젝트 형식의 텍스트
		Dept dept = new Dept(100, "영업부");
		String text3 = gson.toJson(dept);
		System.out.println(text3);
		
		ArrayList<Dept> deptList = new ArrayList<>();
		deptList.add(new Dept(100, "영업부"));
		deptList.add(new Dept(200, "관리부"));
		deptList.add(new Dept(300, "총무부"));
		String text4 = gson.toJson(deptList);
		System.out.println(text4);
		
	}
}