package dao;

import commons.DBUtil;
import vo.Orders;
import java.sql.*;

public class OrdersDao {
	public void insertOrders(Orders orders) throws Exception{
		DBUtil dbUtil=   new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "insert into orders(product_id, orders_amount, orders_price, member_email, orders_"
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, orders.getProductId());
		stmt.setInt(2, orders.getProductAmount());
		stmt.setInt(3, orders.getProductId());
			
	}
}
