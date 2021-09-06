package ko.or.connect.todo.servlet;

import java.io.IOException;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ko.or.connect.todo.dao.TodoDao;
import ko.or.connect.todo.dto.TodoDto;
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		TodoDao dao = new TodoDao();
		List<TodoDto> todoList = new ArrayList<TodoDto>();
		todoList = dao.getTodods();
		
		// DB에서 얻은 TodoList를 request scope에 저장한다.
		request.setAttribute("todoList", todoList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/main.jsp");
		dispatcher.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
