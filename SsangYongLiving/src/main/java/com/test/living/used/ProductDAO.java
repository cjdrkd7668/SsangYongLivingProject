package com.test.living.used;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAO implements IProductDAO{
	
	@Autowired
	private SqlSessionTemplate template;

	@Override
	public int productUpload(ProductDTO dto) {
		
		
		return template.insert("used.productUpload", dto);
	}
	
	

}
