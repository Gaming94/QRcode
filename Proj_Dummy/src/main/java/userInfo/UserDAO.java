package userInfo;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import board.BoardVO;
import oracle.OracleConnector;


public class UserDAO {
	private Connection conn = null;
	private PreparedStatement ps = null;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:oracle:thin:@localhost:1521/xe";
			String dbID = "QRCODE";
			String dbPassword = "QRCODE";
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
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
			PreparedStatement pps = conn.prepareStatement(query.toString());
			pps.setString(1, "id");
			ResultSet rs = pps.executeQuery();
			
			conn = datasource.getConnection();
			ps = conn.prepareStatement(sql);
		
			ps.setString(1, userVO.getId());
			ResultSet rs = ps.executeQuery();
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
			conn = OracleConnector.getConnection();
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, userVo.getId());
			ps.setString(2, userVo.getName());
			ps.setString(3, userVo.getPwd());
			ps.setString(4, userVo.getEmail());
			ps.setString(5, userVo.getTel());

			ps.executeUpdate();
			ps.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<UserVO> loadUser() {
		ArrayList<UserVO> listUser = new ArrayList<UserVO>();		
		ResultSet rs = null;		
		try {
			String sql = "select * from qrmember";	
			conn = OracleConnector.getConnection();			
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				UserVO user = new UserVO();
				user.setId(rs.getString("id"));
				user.setName(rs.getString("name"));
				user.setPwd(rs.getString("pwd"));
				user.setEmail(rs.getString("email"));
				user.setTel(rs.getString("tel"));
				user.setRegdate(rs.getDate("regdate"));				
				listUser.add(user);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return listUser;
	}
	public UserVO loadUserinfo(String id) {
		String sql ="select * from qrmember where id = ?";		
		try {
			conn = OracleConnector.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();			
			if(rs.next()) {
				UserVO uvo = new UserVO();
				uvo.setId(rs.getString("id"));
				uvo.setName(rs.getString("name"));
				uvo.setPwd(rs.getString("pwd"));
				uvo.setEmail(rs.getString("email"));
				uvo.setTel(rs.getString("tel"));
				uvo.setRegdate(rs.getDate("regdate"));
				return uvo;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	return null;
	}
	public void dropUser(String id) {
		String sql = "delete from qrmember where id = ?";
		
		try {
			conn = OracleConnector.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.executeUpdate();
			ps.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	public void modifyUser(UserVO userVo) {
		String sql = "update qrmember set name=?, pwd=?, email=?, tel=? where id=?";
		
		try {
			conn = OracleConnector.getConnection();
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, userVo.getName());
			ps.setString(2, userVo.getPwd());
			ps.setString(3, userVo.getEmail());
			ps.setString(4, userVo.getTel());
			ps.setString(5, userVo.getId());

			ps.executeUpdate();
			ps.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public boolean checkUser(String id, String pwd) {
		String sql = "select decode(count(*),1,'true','false') as membered from qrmember where id=? and pwd=?";

		boolean joined = false;
		
		try {
			conn = OracleConnector.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pwd);
			
			ResultSet rs = ps.executeQuery();
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
	
	public int joinIdCheck(String id){
		int result = -1;
		String sql = "select id from qrmember where id=?";
		try {
			conn = OracleConnector.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			
			ResultSet rs = ps.executeQuery();

			if(rs.next()){	
				result = 0;
			} else {
				result = 1;
			}
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
