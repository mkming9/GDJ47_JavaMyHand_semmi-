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
	
	public int upDateReadCount(Connection conn,int ANA_NO) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("upDateReadCount"));
			pstmt.setInt(1, ANA_NO);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	
	
	
	
	public  List<Product> selectProductList(Connection conn,int cPage, int numPerpage){
		PreparedStatement pstmt = null;
		List<Product>list=new ArrayList();
		ResultSet rs = null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("SELECTPRODUCT"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
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
	
	
	public Product selectProduct(Connection conn,int ANA_NO) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Product p=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectProduct"));
			pstmt.setInt(1, ANA_NO);
			rs=pstmt.executeQuery();
			if(rs.next()) p=getProduct(rs);
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return p;
	}
	
	public int selectProducCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectproductCount"));
			rs=pstmt.executeQuery();
			if(rs.next())result=rs.getInt(1);
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	public int insertProduct(Connection conn, Product p){
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertProduct"));
			
			
			pstmt.setString(1,p.getMember_Id());
			pstmt.setString(2, p.getA_Code());
			pstmt.setString(3, p.getAna_Name());
			pstmt.setInt(4, p.getAna_Price());
			pstmt.setString(5, p.getAna_Content());
			result=pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteProduct(Connection conn,int ANA_NO) {
		PreparedStatement pstmt =null;
		
		 int result =0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("deleteProduct"));
			pstmt.setInt(1, ANA_NO);
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
			pstmt.setString(1, p.getA_Code());
			pstmt.setString(2, p.getAna_Name());
			pstmt.setInt(3,p.getAna_Price());
			pstmt.setString(4, p.getAna_Content());
			pstmt.setInt(5, p.getAna_No());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	//검색
	public List<Product> searchProduct(Connection conn,String type, String  keyword,
			int cPage, int numPerpage){
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	List<Product> result=new ArrayList();
	String sql=prop.getProperty("searchProduct");
	sql=sql.replace("$COL", type);
	try {
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, type.equals("ana_Name")?"%"+keyword+"%":keyword);
		pstmt.setInt(2, (cPage-1)*numPerpage+1);
		pstmt.setInt(3, cPage*numPerpage);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			result.add(ProductDao.getProduct(rs));
		}
	}catch(SQLException e) {
		e.printStackTrace();
	}finally {
		close(rs);
		close(pstmt);
	}return result;
}
	public int searchProductCount(Connection conn, String type, String keyword) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("searchProductCount").replace("$COL",type);		
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, type.equals("ana_Name")?"%"+keyword+"%":keyword);
			rs=pstmt.executeQuery();
			if(rs.next()) result=rs.getInt(1);
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
		
	}
	//
	
	
	private static Product getProduct(ResultSet rs)throws SQLException{
		return Product.builder()
				.ana_No(rs.getInt("ana_No"))
				.member_Id(rs.getString("member_Id"))
				.a_Code(rs.getString("a_Code"))
				.ana_Name(rs.getString("ana_Name"))
				.ana_Price(rs.getInt("ana_Price"))
				.ana_Content(rs.getString("ana_Content"))
				.ana_Date(rs.getDate("ana_Date"))
				.ana_View(rs.getInt("ana_View"))
				.build();
	}
	
}
