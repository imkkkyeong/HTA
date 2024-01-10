package app;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


// url패턴을 지정해주어야 한다. 반드시 / 작성해야한다. 
@WebServlet(urlPatterns = "/home")
public class HomeServlet extends HttpServlet {
	
	
	// init 메서드는 서블릿 초기화를 담당하는 메서드다.
	// 서블릿객체는 생성자 메서드 대신 init()메서드가 초기화작업을 실행한다.

	@Override
	public void init() throws ServletException {
		System.out.println("HomeServlet의 init() 실행됨");
	}
	
	// 서블릿 객체가 폐기되기 직전에 실행되는 메서드다.
	// 서블릿 객체가 사용한 자원을 반납하는 작업을 수행한다.
	@Override
	public void destroy() {
		System.out.println("HomeServlet의 destroy() 실행됨");
	}
	
	// 클라이언트에서 HTTP 요청이 올때마다 실행되는 메서드다. 
	// 클라이언트의 요청을 분석해서 적절한 응답을 제공하는 작업을 수행한다. 
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("HomeServlet의 service() 실행됨");
		
		String message = "샘플 홈";
		
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		
		out.println("<!doctype html>");
		out.println("<html lang = 'ko'>");
		out.println("<head>");
		out.println("<meta harset='UTF-8'>");
		out.println("</head>");
		out.println("<h1>"+message+"</h1>");
		out.println("</body>");
		out.println("</html>");
	}
	
	
}

