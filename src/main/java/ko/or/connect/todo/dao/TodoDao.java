package ko.or.connect.todo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ko.or.connect.todo.dto.TodoDto;

public class TodoDao {
	private static String dburl = "jdbc:mysql://localhost:3306/todo?serverTimezone=Asia/Seoul&useSSL=false";
	private static String dbUser = "todo";
	private static String dbpwd = "todo123!@#";
	
	private static TodoDao instance = new TodoDao();
	
	public static TodoDao getInstance() {
		return instance;
	}
	
	public List<TodoDto> getTodods() {
		ArrayList<TodoDto> list = new ArrayList<TodoDto>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select id, title, name, sequence, type, regdate from todo where type = 'TODO' order by regdate desc";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dburl, dbUser, dbpwd);
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				TodoDto dto = new TodoDto();
				dto.setId(rs.getLong("id"));
				dto.setTitle(rs.getString("title"));
				dto.setName(rs.getString("name"));
				dto.setSequence(rs.getInt("sequence"));
				dto.setType(rs.getString("type"));
				dto.setRegdate(rs.getString("regdate"));
				list.add(dto);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try {
					rs.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}			
	}
			if(ps != null) {
				try {
					ps.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
				if(conn != null) {
					try {
						conn.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
				}
			}
		}
		return list;
	}
	
	public void updateTodo(TodoDto dto) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql1 = "update todo set type = 'DOING' where id = ?";
		String sql2 = "update todo set type = 'DONE' where id = ?";
		try {
			conn = DriverManager.getConnection(dburl, dbUser, dbpwd);
			if(sql1.equals("TODO")) {
			ps = conn.prepareStatement(sql1);
			}else if(sql2.equals("DOING")) {
				ps = conn.prepareStatement(sql2);
			}
			
			ps.setString(1, dto.getType());
			ps.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try {
					rs.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}			
	}
			if(ps != null) {
				try {
					ps.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
				if(conn != null) {
					try {
						conn.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
				}
			}
		}
	}
}
