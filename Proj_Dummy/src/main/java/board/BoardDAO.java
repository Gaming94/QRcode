package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import oracle.OracleConnector;

public class BoardDAO {
	private Connection conn = null;
	private PreparedStatement ps = null;
	
	public BoardDAO() {
		/*
		try {
			DataSource datasource = null;
			Context ctx = new InitialContext();
			Context env = (Context)ctx.lookup("java:/comp/env");
			datasource = (DataSource)env.lookup("jdbc/oracle");
		}
		*/
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
	
	public ArrayList<BoardVO> loadBoard() {
		ArrayList<BoardVO> bvos = new ArrayList<>();
		String sql ="select * from qrboard order by no, pno";
		
		try {
			conn = OracleConnector.getConnection();
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				BoardVO bvo = new BoardVO();
				bvo.setNo(rs.getInt("no"));
				bvo.setPno(rs.getInt("pno"));
				bvo.setTitle(rs.getString("title"));
				bvo.setId(rs.getString("id"));
				bvo.setContent(rs.getString("content"));
				bvo.setRegdate(rs.getDate("regdate"));
				bvos.add(bvo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	return bvos;
	}
	
	public BoardVO getBoard(int no) {
		String SQL = "select * from qrboard where no = ?";
		try {
			conn = OracleConnector.getConnection();
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				BoardVO bvo = new BoardVO();
				bvo.setNo(rs.getInt(1));
				bvo.setTitle(rs.getString(3));
				bvo.setId(rs.getString(4));
				bvo.setContent(rs.getString(5));
				bvo.setRegdate(rs.getDate(6));
				return bvo;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void addBoard(BoardVO boardVo) {
		String sql = "insert into qrboard (no, pno, title, id, content) values (boseq.nextval, 0, ?, ?, ?)";
		
		try {
			conn = OracleConnector.getConnection();
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, boardVo.getTitle());
			ps.setString(2, boardVo.getId());
			ps.setString(3, boardVo.getContent());
			
			ps.executeUpdate();
			ps.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void dropBoard(int no) {
		String sql = "delete from qrboard where no = ?";
		
		try {
			conn = OracleConnector.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.executeUpdate();
			ps.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void modifyBoard(BoardVO boardVo) {
		String sql = "update qrboard set title=?, content=? where no=?";
		
		try {
			conn = OracleConnector.getConnection();
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, boardVo.getTitle());
			ps.setString(2, boardVo.getContent());
			ps.setInt(3, boardVo.getNo());
						
			ps.executeUpdate();
			ps.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public BoardVO getReply(int no, int pno) {
		String SQL = "select * from qrboard where no = ? and pno = ?";
		try {
			conn = OracleConnector.getConnection();
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, no);
			ps.setInt(2, pno);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				BoardVO bvo = new BoardVO();
				bvo.setNo(rs.getInt(1));
				bvo.setPno(rs.getInt(2));
				bvo.setTitle(rs.getString(3));
				bvo.setId(rs.getString(4));
				bvo.setContent(rs.getString(5));
				bvo.setRegdate(rs.getDate(6));
				return bvo;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void addReply(BoardVO boardVo) {
		String sql = "insert into qrboard (no, pno, title, id, content) values (?, ?, ?, ?, ?)";
		try {
			conn = OracleConnector.getConnection();
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, boardVo.getNo());
			ps.setInt(2, boardVo.getPno());
			ps.setString(3, boardVo.getTitle());
			ps.setString(4, boardVo.getId());
			ps.setString(5, boardVo.getContent());
			
			ps.executeUpdate();
			ps.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void dropReply(int no, int pno) {
		String sql = "delete from qrboard where no = ? and pno = ?";
		
		try {
			conn = OracleConnector.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.setInt(2, pno);
			ps.executeUpdate();
			ps.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void modifyReply(BoardVO boardVo) {
		String sql = "update qrboard set title=?, content=? where no = ? and pno = ?";
		
		try {
			conn = OracleConnector.getConnection();
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, boardVo.getTitle());
			ps.setString(2, boardVo.getContent());
			ps.setInt(3, boardVo.getNo());
			ps.setInt(4, boardVo.getPno());
						
			ps.executeUpdate();
			ps.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
