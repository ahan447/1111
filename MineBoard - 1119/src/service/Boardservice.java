package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import vo2.Board2;

//Board 관련 요청을 처리할 메소드를 소유한 인터페이스
public interface Boardservice {
//게시글 저장을 위한 메소드
	public boolean boardInsert(HttpServletRequest request);
	
//게시글 목록을 가져오기 위한 메소드	
	public List<Board2> boardList(HttpServletRequest request);	
	
//게시글 한 개를 가져오기 위한 메소드
	public Board2 boardDetail(HttpServletRequest request);	
	
	//게시글 삭제을 위한 메소드 (저장과 비슷)
		public boolean boardDelete(HttpServletRequest request);
	
	//게시글 수정을 위해서 데이터를 가져오는 메소드(조회수를 업데이트 하지 않음)
	public Board2 boardGet(HttpServletRequest request);

	//게시글 수정을 위한 메소드
	public boolean boardUpdate(HttpServletRequest request);
	
	//회원가입 처리르 위한 메소드
	public void memInsert(HttpServletRequest request);
	
	//로그인 처리를 위한 메소드
	public boolean login(HttpServletRequest request);
	
}
