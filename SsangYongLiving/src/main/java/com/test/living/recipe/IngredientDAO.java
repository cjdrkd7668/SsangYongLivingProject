package com.test.living.recipe;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class IngredientDAO implements IingredientDAO {
	
	@Autowired
	private SqlSessionTemplate template;

	@Override
	public List<IngredientDTO> getIngredientList() {
		
		return template.selectList("recipe.getIngredientList");
	}
	
}
