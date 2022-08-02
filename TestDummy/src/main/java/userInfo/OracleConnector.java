package userInfo;

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
		System.out.println(">>> Oracle Connection DBTest <<<");

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
			
			Statement stmt = conn.createStatement();
			
			boolean resultset = stmt.execute(sql);
			System.out.println("return 성공? = " + resultset);
			
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
