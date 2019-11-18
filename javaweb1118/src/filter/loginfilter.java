package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;


@WebFilter({ "/create.do", "/update.do", "/delete.do" })
public class loginfilter implements Filter {


    public loginfilter() {
    	//1번. 객체가만들어 질때 한번 만 호출
    }


	public void destroy() {
    	//4번.한번만 호출
	}
	
public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	//3번. 패턴에 해당하는 요청이 올 때마다 호출
	//요청을 처리하기 전에 수행되는 코드
	System.out.println("비로그인시 로그인 페이지로 이동");
	chain.doFilter(request, response);
	//요청을 처리한 후에 호출되는 코드
	
	}

public void init(FilterConfig fConfig) throws ServletException {
	//2번. 한번만 호출
	
	}

}
