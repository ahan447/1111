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
	
//게시글 한개를 가져오기 위한 메소드
	public Board2 boardDetail(HttpServletRequest request);	
}
