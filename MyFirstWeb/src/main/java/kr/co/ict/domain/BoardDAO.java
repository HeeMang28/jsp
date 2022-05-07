package kr.co.ict.domain;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;

public class BoardDAO {
	private DataSource ds = null;
	private static BoardDAO dao = new BoardDAO();
	private BoardDAO() {
		try {
			Context ct = new InitialContext();
			ds = (DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	public static BoardDAO getInstance() {
		if(dao == null) {
			dao = new BoardDAO();
		}
		return dao;
	}
	// 게시판의 전체 글을 가져오는 getBoardList() 메서드를 작성해주세요.
	// 전체 글을 가져오므로 List<BoradVO> 를 리턴하면 됩니다.
	// 작성시 UserDAO의 getAllUserList()메서드를 참조해주세요.
	public List<BoardVO> getBoardList(int pageNum) { 

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		List<BoardVO> BoardList = new ArrayList<>();
		
		try {
			con = ds.getConnection();
			// 페이지 번호에 따른 시작 인덱스 번호는 자바변수로 먼저 구합니다.
			int num = (pageNum -1)* 10;
			String sql = "SELECT * FROM boardtbl ORDER BY board_num DESC limit ?, 10";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pageNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardVO board = new BoardVO();
				board.setBoardNum(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setContent(rs.getString(3));
				board.setWriter(rs.getString(4));
				board.setbDate(rs.getDate(5));
				board.setmDate(rs.getDate(6));
				board.setHit(rs.getInt(7));

				BoardList.add(board);
			}

		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
				pstmt.close();
				rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return BoardList;
	}
	// boradTbl에서 row 1개를 가져오거나 (글번호존재시), 안가져옴(없는글번호 입력시)
	public BoardVO getBoardDetail(int boardNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardVO board = new BoardVO();
		// upHit(boardNum); 이거의 단점은 디테일로직을 실행하는 모든것에 조회수 1씩 증가 한다.
		try {
			// 연결해주세요.
			con = ds.getConnection();
			String sql = "SELECT * FROM boardTbl WHERE board_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardNum); 
			rs = pstmt.executeQuery();
			if(rs.next()) {
				board.setBoardNum(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setContent(rs.getString(3));
				board.setWriter(rs.getString(4));
				board.setbDate(rs.getDate(5));
				board.setmDate(rs.getDate(6));
				board.setHit(rs.getInt(7));
			} else {
				System.out.println("계정이 없습니다.");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
			// con, pstmt 닫기
				con.close();
				pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return board;
	}
	public void boardInsert(String title, String content, String writer) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			
			con = ds.getConnection();
			String join = "INSERT INTO boardTbl (title, content, writer) VALUES ( ? , ? , ? )";
			pstmt = con.prepareStatement(join);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, writer);
			pstmt.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			con.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		}
	}
	public void boardDelete(int boardNum){
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			String sql = "DELETE FROM boardTbl WHERE board_num = ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, boardNum);
		
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
				pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	public void boardUpdate(String content, String title, String writer, int boardNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			
			con = ds.getConnection();
			String up = "UPDATE boardTbl SET content=? , title=?, writer=?, mDate=now() WHERE board_num=?";
			pstmt  = con.prepareStatement(up);
			pstmt.setString(1, content);
			pstmt.setString(2, title);
			pstmt.setString(3, writer);
			pstmt.setInt(4, boardNum);
			pstmt.executeUpdate();
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			try {
				con.close();
				pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
			}
		}
	public void upHit(int boardNum) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			String sql = "UPDATE boardTbl SET hit = hit + 1 WHERE board_num =?";
			pstmt  = con.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			pstmt.executeUpdate();
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			try {
				con.close();
				pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
			}
		} // upHit 끝나는 지점
	public BoardButtonDTO getAllBoardCount(int pageNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardButtonDTO boardButton = new BoardButtonDTO();
		try {
			// 연결해주세요.
			con = ds.getConnection();
			String sql = "SELECT * FROM boardTbl";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pageNum); 
			rs = pstmt.executeQuery();
			if(rs.next()) {
				board.setBoardNum(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setContent(rs.getString(3));
				board.setWriter(rs.getString(4));
				board.setbDate(rs.getDate(5));
				board.setmDate(rs.getDate(6));
				board.setHit(rs.getInt(7));
			} else {
				System.out.println("계정이 없습니다.");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
			// con, pstmt 닫기
				con.close();
				pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return boardButton;
	}
}
	
