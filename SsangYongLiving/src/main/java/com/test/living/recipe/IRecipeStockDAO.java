package com.test.living.recipe;

import java.util.List;

public interface IRecipeStockDAO {

	List<RecipeStockDTO> getRecipeStockList(String seq);

}
