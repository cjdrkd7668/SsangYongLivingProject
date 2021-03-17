package com.test.living.recipe;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RecipeCommentDAO implements IRecipeCommentDAO {
	
	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public List<RecipeCommentDTO> getRecipeCommentList(String seq) {
		
		return template.selectList("recipe.getRecipeCommentList", seq);
	}

	@Override
	public int delComment(String commentSeq) {
		
		return template.update("recipe.delComment", commentSeq);
	}

	@Override
	public int addRecipeComment(RecipeCommentDTO rcdto) {
		
		return template.insert("recipe.addRecipeComment", rcdto);
	}

}
