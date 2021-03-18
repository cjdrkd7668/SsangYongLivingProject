package com.test.living.recipe;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RecipeDAO implements IRecipeDAO {
	
	@Autowired
	private SqlSessionTemplate template;

	@Override
	public List<RecipeDTO> getRecipeList(HashMap<String, Integer> map) {
		
		return template.selectList("recipe.getRecipeList", map);
	}

	@Override
	public int getRecipeTotalCount() {
		
		return template.selectOne("recipe.getRecipeTotalCount");
	}

	@Override
	public RecipeDTO getRecipeDto(String seq) {
		
		return template.selectOne("recipe.getRecipeDto", seq);
	}

	@Override
	public int delRecipe(String seq) {
		
		return template.update("recipe.delRecipe", seq);
	}
	
}
