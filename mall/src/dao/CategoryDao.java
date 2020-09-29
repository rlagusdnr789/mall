package dao;
import java.util.ArrayList;

import commons.DBUtil;
import vo.Category;
import java.sql.*;

public class CategoryDao {
	// Category ���
	public ArrayList<Category> selectCategoryList() throws Exception {
		ArrayList<Category> list = new ArrayList<Category>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select category_id, category_name from category";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Category category = new Category();
			category.categoryId = rs.getInt("category_id");
			category.categoryName = rs.getString("category_name");
			list.add(category);
		}
		conn.close();
		return list;
	}
	// ��õ Category pic ���
		public ArrayList<Category> selectCategoryCkList() throws Exception {
			ArrayList<Category> list = new ArrayList<Category>();
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			String sql = "select category_id, category_pic from category where category_ck='Y' limit 0,4";
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				Category category = new Category();
				category.categoryId = rs.getInt("category_id");
				category.categoryPic = rs.getString("category_pic");
				category.categoryName = rs.getString("category_name");
				category.categoryPrice = rs.getInt("category_price");
				list.add(category);
			}
			conn.close();
			return list;
		}
}
