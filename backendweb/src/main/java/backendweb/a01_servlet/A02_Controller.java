package backendweb.a01_servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A02_Controller
 */
@WebServlet(name = "mvc.do", urlPatterns = { "/mvc.do" })
public class A02_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A02_Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 요청값 한글 처리..
		request.setCharacterEncoding("utf-8");
		
		// 요청값 처리
		String num01Str = request.getParameter("num01");
		if(num01Str==null) num01Str="0";
		int num01 = Integer.parseInt(num01Str);
		// 요청값 처리
		String num02Str = request.getParameter("num02");
		if(num02Str==null) num02Str="0";
		int num02 = Integer.parseInt(num02Str);
		
		// 모델 데이터 설정 (request범위로설정)
		request.setAttribute("result",num01+"+"+num02+"="+(num01+num02));
		
		// 뷰단 화면(jsp) 호출
		String page="a03_sessionScope\\z01_view.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request,response);
	}

}
