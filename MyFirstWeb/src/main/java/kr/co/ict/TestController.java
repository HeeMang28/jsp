package kr.co.ict;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoardController
 */
@WebServlet("*.test")
public class TestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("*.test패턴이 감지되었습니다.");
		String uri = request.getRequestURI();
		System.out.println("감지된 패턴 : " + uri);
		
		// 문제 : naver.do 로 접속시 네이버로 리다이렉트
		if(uri.equals("/MyFirstWeb/naver.test")) {
			response.sendRedirect("https://naver.com");
		} else if (uri.equals("/MyFirstWeb/daum.test")) {
			response.sendRedirect("https://daum.net");
		} else if (uri.equals("/MyFirstWeb/youtube.test")) {
			response.sendRedirect("https://youtube.com");
		} else {
			response.sendRedirect("https://google.com");
		}
		// daum.do로 접속시 다음으로 리다이렉트
		
		// youtube.do로 접속시 유뷰트로 리다이렉트
		
		// 이외 패턴으로 접속시 google.com으로 리다이렉트 하도록 짜서 저에게 보내주세요.
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
