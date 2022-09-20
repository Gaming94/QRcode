package oracle;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class OracleConnector {
	final static String driver = "oracle.jdbc.driver.OracleDriver";
	final static String url = "jdbc:oracle:thin:@localhost:1521:xe";
	final static String userid = "QRCODE";
	final static String password = "QRCODE";
	
	private static Connection _stconn = null;
	
	public static Connection getConnection() {
		try {
			if(_stconn != null) {
				return _stconn;	
			}
			
			Class.forName(driver);
			
			_stconn = DriverManager.getConnection(url, userid, password);
			
			System.out.println("[getConnection] Connection: success: " + (_stconn != null));
			System.out.println("[getConnection] Connection: autocommit: " + _stconn.getAutoCommit());
			
			boolean dbclosed = _stconn.isClosed();
			System.out.println("[getConnection] isClosed: " + dbclosed);
			}
		catch(ClassNotFoundException e) {
			System.out.println("[main] ClassNotFoundException: " + e.toString());
		}
		catch(SQLException e) {
			System.out.println("[main] SQLException: " + e.toString());
		}
		catch(Exception e) {
			System.out.println("[main] Exception: " + e.toString());
		}
		return _stconn;
	}
	
	public static void closeConnection() {
		try {
			if(_stconn != null && _stconn.isClosed() != true) {
				_stconn.close();
			}
			_stconn = null;
		}
		catch(SQLException e) {
			System.out.println("[closeConnection] SQLException: " + e.toString());
		}
		catch(Exception e) {
			System.out.println("[closeConnection] Exception: " + e.toString());
		}
	}

	public void Connect() {
		System.out.println(">>> Oracle Connection <<<");
		
		try {
			Class.forName(driver);
			
			Connection conn = DriverManager.getConnection(url, userid, password);
			System.out.println("[main] Connection: success: " + (conn != null));
			
			String sql = "CREATE TABLE QRMEMBER (";
				sql += "id VARCHAR2(20) CONSTRAINT qr_id_pk PRIMARY KEY,";
				sql += "name VARCHAR2(30) CONSTRAINT qr_name_uqnn UNIQUE NOT NULL,";
				sql += "pwd VARCHAR2(30) CONSTRAINT qr_pwd_ch CHECK (LENGTH(pwd) >= 4),";
				sql += "email VARCHAR2(50) CONSTRAINT qr_email_uq UNIQUE,";
				sql += "tel VARCHAR2(20),";
				sql += "REGDATE DATE DEFAULT SYSDATE)";
			
			String sqlAdm = "INSERT INTO QRMEMBER VALUES ('QRCODE', 'QRCODE', 'QRCODE',";
				sqlAdm += "'QRCODE@naver.com', '010-1111-1111', SYSDATE)";
			
			String sqlSeq = "CREATE SEQUENCE noseq INCREMENT BY 1 START WITH 1";
				sqlSeq += "MINVALUE 1 NOCYCLE NOCACHE ORDER";
			
			String sqlNotice = "CREATE TABLE QRNOTICE (";
			sqlNotice += "no number(5) CONSTRAINT no_no_pk PRIMARY KEY,";
			sqlNotice += "title VARCHAR2(50) CONSTRAINT no_title_nn NOT NULL,";
			sqlNotice += "content VARCHAR2(200) CONSTRAINT no_content_nn NOT NULL,";
			sqlNotice += "regdates DATE DEFAULT SYSDATE)";
			
			String sqlSeq2 = "CREATE SEQUENCE boseq INCREMENT BY 1 START WITH 1";
			sqlSeq2 += "MINVALUE 1 NOCYCLE NOCACHE ORDER";
			
			String sqlBoard = "CREATE TABLE QRBOARD (";
				sqlBoard += "no number(5),";
				sqlBoard += "pno number(5),";
				sqlBoard += "title VARCHAR2(50) CONSTRAINT bo_title_nn NOT NULL,";
				sqlBoard += "id VARCHAR2(20) CONSTRAINT bo_id_nn NOT NULL,";
				sqlBoard += "content VARCHAR2(200) CONSTRAINT bo_content_nn NOT NULL,";
				sqlBoard += "regdate DATE DEFAULT SYSDATE)";
			
			Statement stmt = conn.createStatement();
			
			boolean resultset1 = stmt.execute(sql);
			System.out.println("return 성공1 = " + resultset1);
			
			boolean resultset2 = stmt.execute(sqlAdm);
			System.out.println("return 성공2 = " + resultset2);
			
			boolean resultset3 = stmt.execute(sqlSeq);
			System.out.println("return 성공3 = " + resultset3);
			
			boolean resultset4 = stmt.execute(sqlNotice);
			System.out.println("return 성공4 = " + resultset4);
	
			boolean resultset5 = stmt.execute(sqlSeq2);
			System.out.println("return 성공5 = " + resultset5);
			
			boolean resultset6 = stmt.execute(sqlBoard);
			System.out.println("return 성공6 = " + resultset6);
			
			boolean dbclosed = conn.isClosed();
			System.out.println("[main] isClosed: " + dbclosed);
			
			conn.close();
			System.out.println("[main] close: " + conn.isClosed());
		}
		catch(ClassNotFoundException e) {
			System.out.println("[main] ClassNotFoundException: " + e.toString());
		}
		catch(SQLException e) {
			System.out.println("[main] SQLException: " + e.toString());
		}
		catch(Exception e) {
			System.out.println("[main] Exception: " + e.toString());
		}
	}
	
	public void Drop() {
		System.out.println(">>> Oracle Drop <<<");
		
		try {
			Class.forName(driver);
			
			Connection conn = DriverManager.getConnection(url, userid, password);
			System.out.println("[main] Connection: success: " + (conn != null));
			
			String sql1 = "DROP TABLE qrmember";
			String sql2 = "DROP TABLE qrnotice";
			String sql3 = "DROP TABLE qrboard";
			String sql4 = "DROP SEQUENCE noseq";
			String sql5 = "DROP SEQUENCE boseq";
			
			Statement stmt = conn.createStatement();
			
			boolean resultset1 = stmt.execute(sql1);
			System.out.println("return 성공1 = " + resultset1);
			
			boolean resultset2 = stmt.execute(sql2);
			System.out.println("return 성공2 = " + resultset2);
			
			boolean resultset3 = stmt.execute(sql3);
			System.out.println("return 성공3 = " + resultset3);
			
			boolean resultset4 = stmt.execute(sql4);
			System.out.println("return 성공4 = " + resultset4);
			
			boolean resultset5 = stmt.execute(sql5);
			System.out.println("return 성공5 = " + resultset5);
			
			boolean dbclosed = conn.isClosed();
			System.out.println("[main] isClosed: " + dbclosed);
			
			conn.close();
			System.out.println("[main] close: " + conn.isClosed());
		}
		catch(ClassNotFoundException e) {
			System.out.println("[main] ClassNotFoundException: " + e.toString());
		}
		catch(SQLException e) {
			System.out.println("[main] SQLException: " + e.toString());
		}
		catch(Exception e) {
			System.out.println("[main] Exception: " + e.toString());
		}
	}
}
