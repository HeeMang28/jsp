package kr.co.ict.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.ict.domain.BoardDAO;

public class BoardDeleteService implements IBoardService {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//세션에 있는 아이디 추출
		HttpSession session = request.getSession();
		String sId = (String)session.getAttribute("s_id");
		// boardDetail.jsp의 삭제버튼을 눌렀을때 board_writer도 같이 히든으로 보내므로
		// board_writer를 받아서 비교할 수 있습니다.
		// 아이디가 일치하는경우만 아래의 delete로직이 호출되도록 조건문으로 감싸주세요.
		String writer = request.getParameter("board_writer");
		if (sId != null && sId.equals(writer)) {
		BoardDAO dao = BoardDAO.getInstance();
		String strBoardNum = request.getParameter("board_num");
		int boardNum = Integer.parseInt(strBoardNum);
		dao.boardDelete(boardNum);
		}
	}
	
}
