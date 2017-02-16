package bachelorSystem;

import java.util.*;

public class CourseApp {
	public static void main(String[] args) throws Exception{
		CourseMgr util = new CourseMgr();
		util.fileCheck();
		util.read();
		
		Scanner sc = new Scanner(System.in);
		while(true) {
			System.out.println("---------------------------------");
			System.out.println("1.로그인   2.회원 가입   3.과정조회   4.과정등록 ");
			System.out.println("5.등록 과정조회   6.정보조회  7.로그아웃  0.종료");
			System.out.println("---------------------------------");
			System.out.print(">");
			
			String num = sc.nextLine();
			if("1".equals(num)) {
				util.login();
			} else if("2".equals(num)){
				util.register();
			} else if("3".equals(num)) {
				util.enrollCheck();
			} else if("4".equals(num)) {
				util.enroll();
			} else if("5".equals(num)) {
				util.enrollInfo();
			} else if("6".equals(num)) {
				util.info();
			} else if("7".equals(num)) {
				util.logout();
			} else if("0".equals(num)) {
				util.save();
				System.out.println("프로그램을 종료합니다.");
				break;
			} else if("admin".equals(num)){
				util.admin();
			} else {
				System.out.println("올바른 번호를 입력하세요.");
			}
			// 현재 정보 운영자 조회 (ID:admin/Password:admin)
		} sc.close();
	}
}