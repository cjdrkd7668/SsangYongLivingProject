package com.test.living.recipe;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RecipeController {

	
	@RequestMapping(value="/recipe/main.action", method=RequestMethod.GET)
	public String main(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		return "recipe.main";
	}
	
	@RequestMapping(value="/recipe/renewRefri.action", method=RequestMethod.GET)
	public String member_renewRefri(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		return "recipe.renewRefri";
	}
	
	@RequestMapping(value="/recipe/board.action", method=RequestMethod.GET)
	public String boardRecipe(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		return "recipe.board";
	}
	
	@RequestMapping(value="/recipe/detail.action", method=RequestMethod.GET)
	public String boardDetail(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		return "recipe.detail";
	}
	
	
}
