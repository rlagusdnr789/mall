package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import commons.DBUtil;
import vo.Notice;

public class noticeDao {
	public ArrayList<Notice> selectNoticeList(){
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		// to do :
		String sql = "select notice_id, notice_title from notice order by botice_date desc limit0, 2";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt. executeQuery();
		while(rs.next()) {
			Notice n = new Notice();
			n.noticeId=rs.getInt("notice_id");
			n.noticeId=rs.getInt("notice_id");
			n.noticeTitle=rs.getString("notice_title");
			list.add(n);
		}
			conn.close();
				return null;
	}
	
	public Notice selectNoticeOne() {
		return null;
	}
}
