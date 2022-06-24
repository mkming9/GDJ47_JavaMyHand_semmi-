package com.jmh.product.model.service;

import java.sql.Connection;


import static com.jmh.common.JDBCTemplate.*;
import com.jmh.product.model.dao.ProductDao;
import com.jmh.product.model.vo.Product;
import java.util.List;

public class ProductService {
	
	private ProductDao dao=new ProductDao();
	
	public List<Product> selectProductList(int cPage, int numPerpage){
		Connection conn=getConnection();
		List<Product>list=dao.selectProductList(conn,cPage,numPerpage);
		close(conn);
		return list;
	}
	
	public int selectProductCount() {
		Connection conn=getConnection();
		int result=dao.selectProducCount(conn);
		close(conn);
		return result;
	}
	
	public Product selectProductview(int ana_No,boolean isRead) {
		Connection conn=getConnection();
		Product p=dao.selectProduct(conn,ana_No);
		if(p!=null&&!isRead) {
			int result=dao.upDateReadCount(conn,ana_No);
			if(result>0) {
				commit(conn);
				p.setAna_View(p.getAna_View()+1);
			}else 
				rollback(conn);
			
		}
		close(conn);
		return p;
	}
	//검색
	public List<Product>searchProduct(String type,String keyword,int cPage,int numPerpage) {
		Connection conn = getConnection();
		List<Product>result=dao.searchProduct(conn,type,keyword,cPage,numPerpage);
		close(conn);
		return result;
	}
	public int searchProductCount(String type, String keyword) {
		Connection conn=getConnection();
		int result=dao.searchProductCount(conn,type,keyword);
		close(conn);
		return result;
	}
	//
	public Product selectProduct(int ana_No) {
		Connection conn = getConnection();
		Product p =dao.selectProduct(conn,ana_No);
		close(conn);
		return p;
	}
	
	
	public int insertProduct(Product p) {
		Connection conn=getConnection();
		int result=dao.insertProduct(conn,p);
		if(result>0)commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int deleteProduct(int ANA_NO) {
		Connection conn=getConnection();
		int result=dao.deleteProduct(conn,ANA_NO);		
		close(conn);
		return result;
	}
	
	public int updataProduct(Product p) {
		Connection conn=getConnection();
		int result=dao.updateProduct(conn,p);
		if(result>0)commit(conn);
		else rollback(conn);
		return result;
	}
	
	
	
	
}
