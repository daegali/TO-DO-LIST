package ko.or.connect.todo.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import ko.or.connect.todo.dao.TodoDao;
public class TodoTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				TodoDao dao = new TodoDao();
				Long id = Long.parseLong(request.getParameter("id"));			
				dao.updateTodo(id);	
			
//				response.setCharacterEncoding("utf-8");
//				// 응답으로 보낼 데이터 타입을 json으로 설정
//				doGet(request, response);
//				response.setContentType("application/json");
//				
//				// 클라이언트에서 보낸 데이터를 받음
//				Long id = Long.parseLong(request.getParameter("id"));
//				String type = request.getParameter("type");
//				
//				TodoDao dao = new TodoDao();
//				dao.updateTodo(id);
//				
//				List<TodoDto> list = dao.getTodods();
//				List<TodoDto> jsonList = new ArrayList<TodoDto>();
//				
//				// 변경된 일 목록을 list 에 저장
//				for(TodoDto dto : list) {
//					if(type.equals("TODO") && dto.getType().equals("DOING")) {
//						jsonList.add(dto);
//					}else if (type.equals("DOING") && dto.getType().equals("DONE"))  {
//						jsonList.add(dto);
//					}
//				}
//				// list를 json형식으로 변경하기 위해 ObjectMapper 객체 생성
//				ObjectMapper ob = new ObjectMapper();
//				String json = ob.writeValueAsString(jsonList);
//				// json 파일을 전송
//				PrintWriter out = response.getWriter();
//				out.println(json);
//				out.close();
				
						
	}

}
