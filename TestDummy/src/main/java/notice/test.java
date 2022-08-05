package notice;

import userInfo.OracleConnector;

public class test {

	public static void main(String[] args) {
		
		OracleConnector ora = new OracleConnector();
		ora.Connect();
		NoticeVO vo = new NoticeVO();
		NoticeDAO dao = new NoticeDAO();
		dao.loadNotice();
		NoticeVO nvo = new NoticeVO();
		System.out.println("외부" + nvo.getNo());
		dao.addNotice(vo);
	}
}
