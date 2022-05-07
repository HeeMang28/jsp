package kr.co.ict;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.domain.BoardDAO;
import kr.co.ict.domain.BoardVO;

/**
 * Servlet implementation class getBoardList
 */
@WebServlet("/boardList")
public class GetBoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetBoardList() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		BoardDAO dao = BoardDAO.getInstance();
		//List<BoardVO> boardList = dao.getBoardList();
		// 포워딩 위치로 얻어온 데이터 보내기
	 
		//request.setAttribute("boardList", boardList);
		RequestDispatcher dp = request.getRequestDispatcher("/board/getBoardList.jsp");
		dp.forward(request, response);
		// 보통 수정이나 삭제 등을 할때는 post 방식으로 처리하고 조회 등만 할때는 get방식으로 처리한다.
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// 보통 수정이나 삭제 등을 할때는 post 방식으로 처리하고 조회 등만 할때는 get방식으로 처리한다.
	}

}
