package test;

import org.junit.Test;

import repository.MemberDAO;

public class TestClass {
	@Test
	public void TestMethod() {
		MemberDAO dao = MemberDAO.sharedInstance();
		System.out.println(dao.emailCheck("neo@kakao.com"));
		
	}
}
