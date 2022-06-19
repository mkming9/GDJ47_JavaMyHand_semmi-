package com.jmh.product.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
	
	public  List<Product> selectProductList(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Product>list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectProduct"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(getProduct(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	
	public int insertProduct(Connection conn, Product p){
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertProduct"));
			
			
			pstmt.setString(1,p.getMEMBER_ID());
			pstmt.setString(2, p.getA_CODE());
			pstmt.setString(3, p.getANA_NAME());
			pstmt.setInt(4, p.getANA_PRICE());
			pstmt.setString(5, p.getANA_CONTENT());
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
			pstmt=conn.prepareStatement(prop.getProperty("updateProduct"));
			pstmt.setString(1, p.getA_CODE());
			pstmt.setString(2, p.getANA_NAME());
			pstmt.setInt(3,p.getANA_PRICE());
			pstmt.setString(4, p.getANA_CONTENT());
			pstmt.setInt(5, p.getANA_NO());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	//조회수증가
	public int updateCount(Connection conn,Product p) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updateCount"));
			pstmt.setInt(1, p.getANA_VIEW());
			result=pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	
	
	
	private Product getProduct(ResultSet rs)throws SQLException{
		return Product.builder()
				.ANA_NO(rs.getInt("ANA_NO"))
				.MEMBER_ID(rs.getString("MEMBER_ID"))
				.A_CODE(rs.getString("A_CODE"))
				.ANA_NAME(rs.getString("ANA_NAME"))
				.ANA_PRICE(rs.getInt("ANA_PRICE"))
				.ANA_CONTENT(rs.getString("ANA_CONTENT"))
				.ANA_DATE(rs.getDate("ANA_DATE"))
				.ANA_VIEW(rs.getInt("ANA_VIEW"))
				.build();
	}
	
}
