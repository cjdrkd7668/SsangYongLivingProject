package com.test.living.used;

import java.util.HashMap;
import java.util.List;

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

//	@Override
//	public List<ProductDTO> list() {
//		
//		return template.selectList("used.list");
//		
//	}

	@Override
	public List<ProductDTO> poplist() {
		
		return template.selectList("used.poplist");
	}

	@Override
	public List<ProductDTO> list(HashMap<String, Integer> map) {
			
		return template.selectList("used.list", map);
	}

	@Override
	public int getProductTotalCount() {
		
		return template.selectOne("used.getProductTotalCount");
	}


//	@Override
//	public List<ProductDTO> view(String seq) {
//		// TODO Auto-generated method stub
//		return null;
//	}

//	@Override
//	public List<ProductDTO> view(String seq) {
//		
//		return template.selectOne("used.view", seq);
//	}

	@Override
	public ProductDTO get(String seq) {
		
		return template.selectOne("used.get", seq);
	}


	

}
