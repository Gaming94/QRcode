package userInfo;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class UserDAO {
	private DataSource datasource = null;
	private Connection conn = null;
	private PreparedStatement stmt = null;
	
	public UserDAO() {
		try {
			Context ctx = new InitialContext();
			Context env = (Context)ctx.lookup("java:/comp/env");
			datasource = (DataSource)env.lookup("jdbc/oracle");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	/*
	public int loginCheck(UserVO userVO) {		
		int x = -1;
		try {
			StringBuffer query = new StringBuffer();
			query.append("select pwd from qrmember where id=?");
			
			Connection conn = OracleConnector.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, "id");
			ResultSet rs = pstmt.executeQuery();
			
			conn = datasource.getConnection();
			stmt = conn.prepareStatement(sql);
		
			stmt.setString(1, userVO.getId());
			ResultSet rs = stmt.executeQuery();
			String password;
			rs.next();
			password = rs.getString("pwd");
			
			OracleConnector.closeConnection();
			String password;
			if(rs.next()){
				password = rs.getString("pwd");
				if (password.equals("pwd")) {
					System.out.print("인증성공");
					x = 1;
				}					
				else{
					System.out.print("비밀번호 다름");
					x = 0;
				}				
			}else{
				System.out.println("아이디 없음");
				x = -1;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return x;
	}
	*/
	public void userJoin(UserVO userVo) {
		String sql = "insert into qrmember (id, name, pwd, email, tel) values (?, ?, ?, ?, ?)";
		
		try {
			conn = datasource.getConnection();
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, userVo.getId());
			stmt.setString(2, userVo.getName());
			stmt.setString(3, userVo.getPwd());
			stmt.setString(4, userVo.getEmail());
			stmt.setString(5, userVo.getTel());

			stmt.executeUpdate();
			stmt.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<UserVO> loadUser() {
		List<UserVO> listUser = new ArrayList<UserVO>();
		
		ResultSet rs = null;
		
		try {
			String sql = "select * from qrmember order by id";
			
			// conn = OracleConnector.getConnection();
			conn = datasource.getConnection();
			
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				String pwd = rs.getString("pwd");
				String email = rs.getString("email");
				String tel = rs.getString("tel");
				Date regdate = rs.getDate("regdate");
				
				UserVO user = new UserVO();
				user.setId(id);
				user.setName(name);
				user.setPwd(pwd);
				user.setEmail(email);
				user.setTel(tel);
				user.setRegdate(regdate);
				
				listUser.add(user);
			}
		}
		catch(SQLException e) {
			System.out.println("[loadUser] SQLException: " + e.toString());
		}
		finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(stmt != null) {
					stmt.close();
				}
				
				conn.close();
			}
			catch(Exception e) {
				System.out.println("[loadUser] finally SQLException: " + e.toString());
			}
			
			// OracleConnector.closeConnection();
			
		}	
		return listUser;
	}
	
	public void dropUser(String id) {
		String sql = "delete from qrmember where id = ?";
		
		try {
			conn = datasource.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.executeUpdate();
			stmt.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	public void modifyUser(UserVO userVo) {
		String sql = "update qrmember set name=?, pwd=?, email=?, tel=? where id=?";
		
		try {
			conn = datasource.getConnection();
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, userVo.getName());
			stmt.setString(2, userVo.getPwd());
			stmt.setString(3, userVo.getEmail());
			stmt.setString(4, userVo.getTel());
			stmt.setString(5, userVo.getId());

			stmt.executeUpdate();
			stmt.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	public UserVO joinInfo(String Id) {
		String sql = "select * from qrmember where id=? order by id";
		ResultSet rs = null;
		UserVO user = new UserVO();
		
		try {
			conn = datasource.getConnection();
			
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, Id);

			rs = stmt.executeQuery();
			
			if(rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				String pwd = rs.getString("pwd");
				String email = rs.getString("email");
				String tel = rs.getString("tel");
				Date regdate = rs.getDate("regdate");
				
				user.setId(id);
				user.setName(name);
				user.setPwd(pwd);
				user.setEmail(email);
				user.setTel(tel);
				user.setRegdate(regdate);
			}
		}
		catch(SQLException e) {
			System.out.println("[joinInfo] SQLException: " + e.toString());
		}
		finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(stmt != null) {
					stmt.close();
				}
				
				conn.close();
			}
			catch(Exception e) {
				System.out.println("[joinInfo] finally SQLException: " + e.toString());
			}
		}	
		return user;
	}
	
	public boolean checkUser(String id, String pwd) {
		String sql = "select decode(count(*),1,'true','false') as membered from qrmember where id=? and pwd=?";

		boolean joined = false;
		
		try {
			conn = datasource.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, pwd);
			
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				joined = Boolean.parseBoolean(rs.getString("joined"));
			}
			System.out.println("joined=" + joined);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return joined;
	}	
}
