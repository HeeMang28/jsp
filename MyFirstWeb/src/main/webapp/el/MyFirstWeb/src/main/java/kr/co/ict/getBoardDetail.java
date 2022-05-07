package kr.co.ict;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.domain.BoardDAO;
import kr.co.ict.domain.BoardVO;

/**
 * Servlet implementation class getBoardDetail
 */
@WebServlet("/boardDetail")
public class getBoardDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getBoardDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터로 글번호("board_num") 을 받아오세요.
		// request.getParameter()는 무조건 문자로만 데이터를 전달함
		String strBoardNum = request.getParameter("board_num");
		// 정수로 바꿔줘야함.
		int boardNum = Integer.parseInt(strBoardNum);
		// 바뀐 글 번호가 잘 나오는지 체크
		System.out.println("조회예정인 글번호 : " + boardNum);
		// DAO를 생성하세요.
		BoardDAO dao = BoardDAO.getInstance();
		// DAO에서 호출한 디테일 글 정보를 저장해주세요.
		BoardVO board = dao.getBoardDetail(boardNum);
		// 얻어온 글 정보를 디버깅해주세요.
		System.out.println(board);
		// 바인딩해주세요.
		
		// 포워딩해주세요.(/board/boardDetail.jsp로)
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
