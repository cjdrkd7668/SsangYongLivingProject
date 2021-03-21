package com.test.living.used;

import java.util.HashMap;
import java.util.List;

public interface IProductDAO {

	int productUpload(ProductDTO dto);

	List<ProductDTO> list(HashMap<String, Integer> map);
	//List<ProductDTO> list();

	List<ProductDTO> poplist();


	int getProductTotalCount();

	//List<ProductDTO> view(String seq);

	ProductDTO get(String seq);


	

}
