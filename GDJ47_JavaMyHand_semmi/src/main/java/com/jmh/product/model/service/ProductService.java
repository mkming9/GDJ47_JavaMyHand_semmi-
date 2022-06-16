package com.jmh.product.model.service;

import java.sql.Connection;
import static com.jmh.common.JDBCTemplate.*;
import com.jmh.product.model.dao.ProductDao;
import com.jmh.product.model.vo.Product;

public class ProductService {
	
	private ProductDao dao=new ProductDao();
	
	public int insertProduct(Product p) {
		Connection conn=getConnection();
		int result=dao.insertProduct(conn,p);
		if(result>0)commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int deleteProduct(Product p) {
		Connection conn=getConnection();
		int result=dao.deleteProduct(conn,p);
		if(result>0)commit(conn);
		else rollback(conn);
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
