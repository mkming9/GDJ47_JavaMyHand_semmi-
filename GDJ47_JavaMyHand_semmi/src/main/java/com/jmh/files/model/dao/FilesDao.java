package com.jmh.files.model.dao;



import java.io.FileReader;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.util.Properties;

import com.jmh.product.model.dao.ProductDao;

public class FilesDao {

private Properties prop = new Properties();

public FilesDao() {
	String path =ProductDao.class.getResource("/sql/product_sql.properties").getPath();
	
	try {
		
		prop.load(new FileReader(path));
	}catch(IOException e) {
		e.printStackTrace();
	}
}
	
}
	
	