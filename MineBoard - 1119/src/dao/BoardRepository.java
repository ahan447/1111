package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.sql.Date;
import java.util.List;

import vo2.Board2;

//Board 테이블 작업을 위한 클래스
public class BoardRepository {
	private BoardRepository() {
	}

//싱글톤 패턴을 처리하기 위한 코드
	private static BoardRepository boardRepository;

	public static BoardRepository sharedInstance() {
		if (boardRepository == null) {
			boardRepository = new BoardRepository();
		}
		return boardRepository;
	}

	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;

//게시물을 데이터베이스에 저장하는메소드
//DTO 클래스를 매개변수로 받아서 영향받은 행의 개수를 리턴
	public int boardInsert(Board2 board) {
		int result = -1;
		try {
			// 드라이버 클래스 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 데이터베이스 연결
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.240:1521:xe", "user09", "user09");
			// SQL 실행 객체 만들기
			pstmt = con.prepareStatement(
					"insert into board(num, title, content, name, writedate) values(boardseq.nextval, ?, ?, ?, ?)");

			// ?가 있으면 데이터바인딩
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getName());
			// 현재 시간을 만들어서 대입
			// 날짜를 Date를 저장하지 않고 문자열로 저장하기도 함
			Calendar cal = new GregorianCalendar();
			pstmt.setDate(4, new Date(cal.getTimeInMillis()));

			// SQL 실행
			result = pstmt.executeUpdate();

			// 사용한 객체 닫기
			pstmt.close();
			con.close();

		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();

		}
		return result;
	}

//
//게시물 전체를 가져오는 메소드
	public List<Board2> boardList() {
		List<Board2> list = new ArrayList<Board2>();
		try {
			// 드라이버 클래스 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 데이터베이스 연결
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.240:1521:xe", "user09", "user09");
			// SQL 실행 객체 생성
			// 전체 데이터를 가져오는데 작성일의 역순으로 가져오기
			pstmt = con.prepareStatement("select * from board order by num desc");
			// 실행
			rs = pstmt.executeQuery();
			// 데이터를 순회하면서 읽기
			while (rs.next()) {
				Board2 board = new Board2();
				board.setNum(rs.getInt("num"));
				board.setTitle(rs.getString("title"));
				board.setName(rs.getString("name"));
				board.setCnt(rs.getInt("cnt"));
				board.setWritedate(rs.getDate("writedate"));

				list.add(board);
			}
			rs.close();
			pstmt.close();
			con.close();

		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}

		return list;
	}
	
	//글번호에 해당하는 게시물의 조회수를 증가시켜주는 메소드
	public int cntUpdate(int num) {
		int result = -1;
		try {
			
			// 드라이버 클래스 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 데이터베이스 연결
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.240:1521:xe", "user09", "user09");
			pstmt = con.prepareStatement(
					"update board set cnt = cnt + 1 where num = ?");
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
			
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return result;
	}
	
	//글번호에 해당하는 게시물을 찾아서 리턴하는 메소드
	public Board2 boardDetail(int num) {
		Board2 board = null;
	try {
		// 드라이버 클래스 로드			Class.forName("oracle.jdbc.driver.OracleDriver");
		// 데이터베이스 연결
		con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.240:1521:xe", "user09", "user09");
		pstmt = con.prepareStatement(
				"select * from board where num = ?");
		pstmt.setInt(1, num);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			board = new Board2();
			board.setNum(rs.getInt("num"));
			board.setTitle(rs.getString("title"));
			board.setContent(rs.getString("content"));
			board.setName(rs.getString("name"));
			board.setCnt(rs.getInt("cnt"));
			board.setWritedate(rs.getDate("writedate"));
		}
		rs.close();
		pstmt.close();
		con.close();
		
	}catch (Exception e) {
		System.out.println(e.getMessage());
		e.printStackTrace();
	}
		return board;
	}
	
	
	
	
}