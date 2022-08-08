package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.sql.DataSource;

import userInfo.OracleConnector;

public class BoardDAO {
	private DataSource ds = null;
	private Connection conn = null;
	private PreparedStatement ps = null;
	
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
}
