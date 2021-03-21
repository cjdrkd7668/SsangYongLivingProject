package com.test.living.recipe;

import java.util.List;

public interface IRecipeOrderDAO {

	List<RecipeOrderDTO> getRecipeOrderList(String seq);

	int addRecipeOrder(RecipeOrderDTO rodto);

	int delRecipeOrder(String recipeSeq);

}
