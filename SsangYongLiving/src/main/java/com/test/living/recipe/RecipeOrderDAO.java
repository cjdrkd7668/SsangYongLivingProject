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

	@Override
	public int addRecipeOrder(RecipeOrderDTO rodto) {
		
		return template.insert("recipe.addRecipeOrder", rodto);
	}

	@Override
	public int delRecipeOrder(String recipeSeq) {
		
		return template.delete("recipe.delRecipeOrder", recipeSeq);
	}

}
