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
	private static String dburl = "jdbc:mysql://localhost:3306/todo?serverTimezone=Asia/Seoul&useUnicode=true&characterEncoding=euckr";
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
		String sql = "select id, title, name, sequence, type, regdate from todo ";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dburl, dbUser, dbpwd);
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Long id = rs.getLong(1);
				String title = rs.getString(2);
				String name = rs.getString(3);
				int sequence = rs.getInt(4);
				String type = rs.getString(5);
				String regdate = rs.getString(6);
				TodoDto dto = new TodoDto(id, title, name, sequence, type, regdate);
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
	
	public int updateTodo(Long id) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		String sql1 = "update todo set type = 'DONE' where type='DOING' and id = ?";
		String sql2 = "update todo set type = 'DOING' where type='TODO' and id = ?";
			
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		// DOING -> DONE
		try{
			 	conn = DriverManager.getConnection(dburl, dbUser, dbpwd);
				 ps = conn.prepareStatement(sql1);
				ps.setLong(1, id);
				cnt = ps.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		// TODO -> DOING
		try{
			conn = DriverManager.getConnection(dburl, dbUser, dbpwd);
			ps = conn.prepareStatement(sql2);
			ps.setLong(1, id);
			cnt = ps.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return  cnt;
	}
	
	
	public int insertTodo(TodoDto dto) {
		String sql = "insert into todo(title, name, sequence) values(?,?,?)";
		
		int cnt = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dburl, dbUser, dbpwd);
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getName());
			ps.setInt(3, dto.getSequence());
			cnt = ps.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
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
			return cnt;
	}
}
