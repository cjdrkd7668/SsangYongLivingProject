package com.test.living.recipe;

import java.util.List;

public interface IRecipeCommentDAO {

	List<RecipeCommentDTO> getRecipeCommentList(String seq);

	int delComment(String commentSeq);

}
