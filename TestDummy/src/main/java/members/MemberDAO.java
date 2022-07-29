package members;

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

public class MemberDAO {
	private DataSource datasource = null;
	private Connection conn = null;
	private PreparedStatement stmt = null;
	
	public MemberDAO() {
		try {
			Context ctx = new InitialContext();
			Context env = (Context)ctx.lookup("java:/comp/env");
			datasource = (DataSource)env.lookup("jdbc/oracle");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void addMember(MemberVO memberVO) {
		String sql = "insert into qrmember (id, name, pwd, email, tel) values (?, ?, ?, ?, ?)";
		
		try {
			conn = datasource.getConnection();
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, memberVO.getId());
			stmt.setString(2, memberVO.getName());
			stmt.setString(3, memberVO.getPwd());
			stmt.setString(4, memberVO.getEmail());
			stmt.setString(5, memberVO.getTel());

			stmt.executeUpdate();
			stmt.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<MemberVO> getMembers() {
		List<MemberVO> listMembers = new ArrayList<MemberVO>();
		
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
				
				MemberVO member = new MemberVO();
				member.setId(id);
				member.setName(name);
				member.setPwd(pwd);
				member.setEmail(email);
				member.setTel(tel);
				member.setRegdate(regdate);
				
				listMembers.add(member);
			}
		}
		catch(SQLException e) {
			System.out.println("[getMembers] SQLException: " + e.toString());
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
				System.out.println("[getMembers] finally SQLException: " + e.toString());
			}
			
			// OracleConnector.closeConnection();
			
		}	
		return listMembers;
	}
	
	public void delMember(String id) {
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

	public void updateMember(MemberVO memberVO) {
		String sql = "update qrmember set name=?, pwd=?, email=?, tel=? where id=?";
		
		try {
			conn = datasource.getConnection();
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, memberVO.getName());
			stmt.setString(2, memberVO.getPwd());
			stmt.setString(3, memberVO.getEmail());
			stmt.setString(4, memberVO.getTel());
			stmt.setString(5, memberVO.getId());

			stmt.executeUpdate();
			stmt.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	public MemberVO getMember(String Id) {
		String sql = "select * from qrmember where id=? order by id";
		ResultSet rs = null;
		MemberVO member = new MemberVO();
		
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
				
				member.setId(id);
				member.setName(name);
				member.setPwd(pwd);
				member.setEmail(email);
				member.setTel(tel);
				member.setRegdate(regdate);
			}
		}
		catch(SQLException e) {
			System.out.println("[getMembers] SQLException: " + e.toString());
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
				System.out.println("[getMembers] finally SQLException: " + e.toString());
			}
		}	
		return member;
	}
	
	public boolean isMember(String id, String pwd) {
		String sql = "select decode(count(*),1,'true','false') as membered from qrmember where id=? and pwd=?";

		boolean membered = false;
		
		try {
			conn = datasource.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, pwd);
			
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				membered = Boolean.parseBoolean(rs.getString("membered"));
			}
			System.out.println("membered=" + membered);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return membered;
	}	
}
