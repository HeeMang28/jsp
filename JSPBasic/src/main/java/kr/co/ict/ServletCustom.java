package kr.co.ict;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletCustom
 */
@WebServlet("/spring")
public class ServletCustom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCustom() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		System.out.println("/spring 최초접속");
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		System.out.println("/spring 자료가 종료로 파기됩니다.");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("spring 접속 감지");
		// request.getParamter()를 이용해
		String jsp = request.getParameter("jsp");
		String boot = request.getParameter("boot");
		System.out.println("jsp파라미터 값 : " + jsp);
		System.out.println("boot파라미터 값 : " + boot);
		// 들어온 데이터를 콘솔이 아닌 결과화면에 찍어보겠습니다.
		// 리다이렉트를 이용해 springReuslt.jsp로 보내주세요.
		// 리다이렉트 방식은 페이지만 이동하고 데이터는 같이 전송하지 않습니다.
		//response.sendRedirect("http://localhost:8181/JSPBasic/servletForm/springResult.jsp");
		
		// 데이터를 결과페이지로 보내려면 포워딩이라는 방식을 써야합니다.
		// 포워딩 절차 1. 보내고 싶은 데이터를 request.setAttribute("저장명", 자료); 형식으로 저장
		request.setAttribute("jsp", jsp);
		request.setAttribute("boot", boot);
		// 카카오톡에서 전송버튼 안누른상태
		// request.setAttribute로 싫어놓은 변수를 결과페이지로 보내기 위해 forward를 
		// 목적지 주소는 http://localhost:8181/JSPBasic 을 생략한 나머지 주소만 적습니다.
		// 예)/servletForm/springResult.jsp 만 적습니다.
		// 2. RequestDispatcher를 생성
		RequestDispatcher dp = request.getRequestDispatcher("/servletForm/springResult.jsp");
		// 3. formward(request, response); 실행하면 페이지가 넘어가면서 변수들도 같이 넘어감
		dp.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
