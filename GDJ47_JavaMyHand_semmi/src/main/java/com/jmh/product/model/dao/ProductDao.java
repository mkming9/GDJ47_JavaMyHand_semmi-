package com.jmh.product.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;
import static com.jmh.common.JDBCTemplate.*;


import com.jmh.product.model.vo.Product;

import oracle.jdbc.proxy.annotation.Pre;

public class ProductDao {
	
	private Properties prop = new Properties();
	
	public ProductDao() {
		String path =ProductDao.class.getResource("/sql/product_sql.properties").getPath();
		
		try {
			
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertProduct(Connection conn, Product p){
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertProduct"));
			
			pstmt.setString(1,p.getANA_NAME());
			pstmt.setInt(2, p.getANA_PRICE());
			pstmt.setString(3, p.getANA_CONTENT());
			result=pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteProduct(Connection conn,Product p) {
		PreparedStatement pstmt =null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("deleteProduct"));
			
			pstmt.setInt(1,p.getANA_NO());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public int updateProduct(Connection conn,Product p) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updatePrice"));
			pstmt.setInt(1, p.getANA_PRICE());
			pstmt.setInt(2, p.getANA_NO());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	
	private Product getProduct(ResultSet rs)throws SQLException{
		return Product.builder()
				.ANA_NO(rs.getInt("ANA_NO"))
				.ANA_NAME(rs.getString("ANA_NAME"))
				.ANA_PRICE(rs.getInt("ANA_PRICE"))
				.ANA_CONTENT(rs.getString("ANA_CONTENT"))
				.ANA_DATE(rs.getDate("ANA_DATE"))
				.ANA_VIEW(rs.getInt("ANA_VIEW"))
				.build();
	}
	
}
