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
	
	public Product selectProductview(int ANA_NO,boolean isRead) {
		Connection conn=getConnection();
		Product p=dao.selectProduct(conn,ANA_NO);
		if(p!=null&&!isRead) {
			int result=dao.upDateReadCount(conn,ANA_NO);
			if(result>0) {
				commit(conn);
				p.setANA_VIEW(p.getANA_VIEW()+1);
			}else 
				rollback(conn);
			
		}
		close(conn);
		return p;
	}
	
	
	public Product selectProduct(int ANA_NO) {
		Connection conn = getConnection();
		Product p =dao.selectProduct(conn,ANA_NO);
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
