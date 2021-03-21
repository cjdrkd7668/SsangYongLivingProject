package com.test.living.recipe;

import java.util.List;

import lombok.Data;

@Data
public class MultiRowIngredient {
	
	private List<String> ingredientSeq;
	private List<String> recipeStockNum;
	
}
