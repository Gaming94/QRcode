package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import userInfo.OracleConnector;

public class BoardDAO {
	private DataSource datasource = null;
	private Connection conn = null;
	private PreparedStatement ps = null;
	
	public BoardDAO() {
		try {
			Context ctx = new InitialContext();
			Context env = (Context)ctx.lookup("java:/comp/env");
			datasource = (DataSource)env.lookup("jdbc/oracle");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<BoardVO> loadBoard() {
		ArrayList<BoardVO> bvos = new ArrayList<>();
		String sql ="select * from qrboard order by no";
		
		try {
			conn = OracleConnector.getConnection();
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				BoardVO bvo = new BoardVO();
				bvo.setNo(rs.getInt("no"));
				bvo.setTitle(rs.getString("title"));
				bvo.setId(rs.getString("id"));
				bvo.setContent(rs.getString("content"));
				bvo.setRegdate(rs.getDate("regdates"));
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
				bvo.setTitle(rs.getString(2));
				bvo.setId(rs.getString(3));
				bvo.setContent(rs.getString(4));
				bvo.setRegdate(rs.getDate(5));
				return bvo;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void addBoard(BoardVO boardVo) {
		String sql = "insert into qrboard (no, title, id, content) values (boseq.nextval, ?, ?, ?)";
		
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
		String sql = "update qrboard set title=? content=? where no=?";
		
		try {
			conn = OracleConnector.getConnection();
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			ps.setString(1, boardVo.getTitle());
			ps.setString(2, boardVo.getContent());
			ps.setInt(3, boardVo.getNo());
						
			int no = rs.getInt(3);
			System.out.println(no);
			ps.executeUpdate();
			ps.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}
