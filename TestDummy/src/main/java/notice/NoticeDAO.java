package notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import userInfo.OracleConnector;


public class NoticeDAO {
	// private DataSource ds = null;
	Connection conn;
	PreparedStatement ps;
	
	/*
	public NoticeDAO() {
		try {
			Context initctx = new InitialContext();
			Context envContext = (Context)initctx.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/oracle");
		}
		catch(Exception e) {
			e.printStackTrace();
		}		
	}
	/*
	public static NoticeDAO instance = new NoticeDAO();
	
	public static NoticeDAO getInstance() {
		return instance;
	}
	*/
	
	
//	public Connection getConnection() {
//		
//		try {
//			Context initContext = new InitialContext();
//			Context envContext = (Context)initContext.lookup("java:/comp/env");
//			DataSource datasource = (DataSource)envContext.lookup("jdbc/oracle");
//			
//			conn = datasource.getConnection();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return conn;
//	}
	
	public ArrayList<NoticeVO> loadNotice() {
		ArrayList<NoticeVO> nvos = new ArrayList<NoticeVO>();
		String sql = "select * from qrnotice order by no";
		 
		try {
			conn = OracleConnector.getConnection();
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				NoticeVO nvo = new NoticeVO();
				nvo.setNo(rs.getInt("no"));
				nvo.setTitle(rs.getString("title"));
				nvo.setContent(rs.getString("content"));
				nvo.setRegdates(rs.getDate("regdates"));
				nvos.add(nvo);
				System.out.println("내부" + nvo.getNo());
			}
						
		} catch (Exception e) {
			e.printStackTrace();
		} finally {			
			try {
				ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				rs.close();
				ps.close();
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}		
		return nvos;
	}
	
	public void addNotice(NoticeVO noticeVo) {
		String sql = "insert into qrnotice (no, title, content) values (noseq.nextval, ?, ?)";
		
		try {
			conn = OracleConnector.getConnection();
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, noticeVo.getTitle());
			ps.setString(2, noticeVo.getContent());
			
			ps.executeUpdate();
			ps.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void dropNotice(int no) {
		String sql = "delete from qrnotice where no = ?";
		
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
	
	public void modifyNotice(NoticeVO noticeVo) {
		String sql = "update qrnotice set title=? content=? where no=?";
		
		try {
			conn = OracleConnector.getConnection();
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			ps.setString(1, noticeVo.getTitle());
			ps.setString(2, noticeVo.getContent());
			ps.setInt(3, noticeVo.getNo());
						
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
