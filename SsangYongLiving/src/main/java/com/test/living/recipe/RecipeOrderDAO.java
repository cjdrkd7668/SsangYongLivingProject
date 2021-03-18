package com.test.living.recipe;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RecipeOrderDAO implements IRecipeOrderDAO {
	
	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public List<RecipeOrderDTO> getRecipeOrderList(String seq) {
		
		return template.selectList("recipe.getRecipeOrderList", seq);
	}

}
