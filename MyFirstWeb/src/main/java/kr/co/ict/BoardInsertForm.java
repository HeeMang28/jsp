package kr.co.ict;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.domain.BoardDAO;
import kr.co.ict.domain.BoardVO;

/**
 * Servlet implementation class boardInsertForm
 */
@WebServlet("/boardInsertForm")
public class BoardInsertForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// redirect로 주소를 그냥 보내도 되지만(아무것도 받지 않앗을경우 ) 리다이렉트로 보낼경우 주소가 .jsp 형식으로 그대로 남기때문에
		// 보이게 하지 않기 위해 requestdispatcher 사용(포워딩 처리)
		RequestDispatcher dp = request.getRequestDispatcher("/board/boardInsertForm.jsp");
		dp.forward(request, response);
	}

}
