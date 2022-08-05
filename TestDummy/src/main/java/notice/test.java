package notice;

import userInfo.OracleConnector;

public class test {

	public static void main(String[] args) {
		
		OracleConnector ora = new OracleConnector();
		ora.Connect();
		NoticeVO vo = new NoticeVO();
		NoticeDAO dao = new NoticeDAO();
		dao.loadNotice();
		dao.addNotice(vo);
	}
}
