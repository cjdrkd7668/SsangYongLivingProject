package com.test.living.recipe;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RecipeStockDAO implements IRecipeStockDAO {
	
	@Autowired
	private SqlSessionTemplate template;

	
	@Override
	public List<RecipeStockDTO> getRecipeStockList(String seq) {
		
		return template.selectList("recipe.getRecipeStockList", seq);
	}

	@Override
	public int addRecipeStock(RecipeStockDTO rsdto) {
		
		return template.insert("recipe.addRecipeStock", rsdto);
	}


}
