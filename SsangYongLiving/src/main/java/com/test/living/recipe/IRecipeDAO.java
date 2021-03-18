package com.test.living.recipe;

import java.util.HashMap;
import java.util.List;

public interface IRecipeDAO {

	List<RecipeDTO> getRecipeList(HashMap<String, Integer> map);

	int getRecipeTotalCount();

	RecipeDTO getRecipeDto(String seq);

	int delRecipe(String recipeSeq);

}
