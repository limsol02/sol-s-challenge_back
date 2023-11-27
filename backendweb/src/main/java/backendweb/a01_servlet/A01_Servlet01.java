package backendweb.a01_servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A01_Servlet01
 */
@WebServlet(name = "search", urlPatterns = { "/search" })
public class A01_Servlet01 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A01_Servlet01() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, 
									  HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String q = request.getParameter("q");

//		화면 출력시 사용되는 코드
		PrintWriter out = response.getWriter();
//		out.print("jsp에 처리하는 태그를 이쪽에서 선언하여 처리한다.(css, js,html)")
		out.print("<h2>request value : "+q+"</h2>");
	}

}
