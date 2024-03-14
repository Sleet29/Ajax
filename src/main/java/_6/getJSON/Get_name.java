package _6.getJSON;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;






@WebServlet("/get_name")
public class Get_name extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json;charset=utf-8");
		String dbq="\"";
		// {"name":"홍길동"}
		 String Message="{" + dbq + "name" + dbq + ":" + dbq + "홍길동" + dbq + "}"; // 정상일때 
		
		// {name:"홍길동"} => error status : parsererror
		//String Message="{name:" + dbq + "홍길동" + dbq + "}"; //error인 경우
		
		System.out.println(Message);
		response.getWriter().print(Message);
	}
}
