package web;

import java.io.IOException;
import java.util.Set;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
//import jakarta.servlet.annotation.WebFilter;
//import jakarta.servlet.annotation.WebInitParam;

/*
@WebFilter(
      urlPatterns = "/*",
      initParams = {
         @WebInitParam(name = "attrName", value = "LOGIN_USER")
      }
)
*/
public class LoginCheckFilter implements Filter{
   
   // 로그인한 사용자만 접근이 허용된 요청 URI를 저장하는 Set 객체다.
   private Set<String> urlSet = Set.of("/comm/board/form.jsp",
                              "/comm/board/insert.jsp",
                              "/comm/board/modifyform.jsp",
                              "/comm/board/modify.jsp",
                              "/comm/board/delete.jsp",
                              "/comm/user/info.jsp",
                              "/comm/todo/form.jsp",
                              "/comm/todo/insert.jsp",
                              "/comm/file/form.jsp",
                              "/comm/file/insert.jsp");
   @Override
   public void init(FilterConfig filterConfig) throws ServletException {
      
   }
   
   @Override
   public void destroy() {

   }
   
   @Override
   public void doFilter(ServletRequest req, ServletResponse res, FilterChain filterChain) throws IOException, ServletException {
      
      HttpServletRequest httpReq = (HttpServletRequest) req;
      HttpServletResponse httpRes = (HttpServletResponse) res;
      
      
      
      // 요청 URI값을 조회한다.
      // 요청 URI는 URI에서 url-path 값을 반환한다.
      String requestURI = httpReq.getRequestURI();
      
      if (urlSet.contains(requestURI)) {
    	  System.out.println("로그인이 필요한 요청이다.");
         // 로그인이 필요한 요청이다.
    	  HttpSession session = httpReq.getSession();
    	 if( session.getAttribute("LOGIN_USER") != null) {
    		 System.out.println("로그인이 된 상태다.");
    		 filterChain.doFilter(req, res);
    	 } else {
    		 System.out.println("로그인이 안된 상태다.");
    		 httpRes.sendRedirect("/comm/loginform.jsp?error=?=deny");
    	 }
      } else {
    	  // 로그인이 필요하지 않는 요청이다. 
      System.out.println("로그인이 필요하지 않은 요청이다.");
      filterChain.doFilter(req, res);
      }
      System.out.println();
   }
    
   }
