package ko.or.connect.todo.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ko.or.connect.todo.dao.TodoDao;
import ko.or.connect.todo.dto.TodoDto;

public class TodoAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String title = request.getParameter("title");
		String name = request.getParameter("name");
		int sequence = Integer.parseInt(request.getParameter("sequence"));

		System.out.println(sequence);

		TodoDao dao = new TodoDao();
		TodoDto dto = new TodoDto(title, name, sequence);
		dao.insertTodo(dto);
		response.sendRedirect("MainServlet");
	}

}
