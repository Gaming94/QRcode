package notice;

import userInfo.OracleConnector;

public class OracleStart {

	public static void main(String[] args) {
		OracleConnector ora = new OracleConnector(); 
		ora.Connect();
	}
}
