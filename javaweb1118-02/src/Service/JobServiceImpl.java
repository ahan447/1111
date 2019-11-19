package Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class JobServiceImpl implements JobService {
	// 싱글톤 패턴을 만들기 위한 코드
	private JobServiceImpl() {
	}

	private static JobService JobService;

	public static JobService sharedInstance() {
		if (JobService == null) {
			JobService = new JobServiceImpl();
		}
		return JobService;
	}

	@Override
	public boolean login(HttpServletRequest request) {
		boolean result = false;

		// 파라미터를 전부 읽어오기
		String id = request.getParameter("id");
		String password = request.getParameter("password");

		// 세션 만들기
		HttpSession session = request.getSession();

		if ("saesong".equals(id) && "2323".equals(password)) {
			// 로그인 확인 여부를 판단하기 위한 속석을 저장
			session.setAttribute("id", id);
			session.setAttribute("nickname", "관리자");
			result = true;
		} else {
			// 로그인에 실패해서 로그인 페이지로 돌아간것을 확인하기 위해서 속성을 저장
			session.setAttribute("msg", "없는 아이디 이거나 잘못된 비밀번호");
			session.removeAttribute("id");
			session.removeAttribute("nickname");
			result = false;
		}
		// 파라미터를 가지고 필요한 작업을 수행 - DAO의 파라미터 만들기
		// 알고리즘을 적용해서 계산을 수행
		// Controller에게 넘겨중 데이터를 생성
		// 나머지 필요한 처리 수행

		return result;
	}

}
