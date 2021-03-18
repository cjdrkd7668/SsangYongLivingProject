package com.test.living.recipe;

import java.util.List;

public interface IRecipeOrderDAO {

	List<RecipeOrderDTO> getRecipeOrderList(String seq);

}
