package com.test.living.recipe;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.living.inc.Pagination;


@Controller
public class RecipeController {
	
	@Autowired
	private IRecipeDAO rdao;
	
	@Autowired
	private IRecipeStockDAO rsdao;
	
	@Autowired
	private IRecipeOrderDAO rodao;
	
	@Autowired
	private IRecipeCommentDAO rcdao;
	
	@RequestMapping(value="/recipe/main.action", method=RequestMethod.GET)
	public String main(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		return "recipe.main";
	}
	
	@RequestMapping(value="/recipe/renewRefri.action", method=RequestMethod.GET)
	public String member_renewRefri(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		return "recipe.renewRefri";
	}
	
	@RequestMapping(value="/recipe/board.action", method=RequestMethod.GET)
	public String boardRecipe(HttpServletRequest request, HttpServletResponse response, HttpSession session, String page) {
		
		//현재 페이지 수 구하기
		int nowPage = 0;		//현재 페이지 번호
		int totalCount = 0;		//총 게시물 수
		int pageSize = 6;		//한페이지 당 출력 개수
		int blockSize = 5;		//페이지바 사이즈

		if (page == null || page == "") {
			nowPage = 1;
		} else {
			nowPage = Integer.parseInt(page);
		}

		//페이지 당 첫 글과 마지막 글에 대한 인덱스 구하기
		int begin = 0;			//rnum 시작
		int end = 0;			//rnum 끝
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;

		map.put("begin", begin);
		map.put("end", end);
		
		List<RecipeDTO> list = rdao.getRecipeList(map);
		
		totalCount = rdao.getRecipeTotalCount();
		
		String pageBar = Pagination.getPageBarTag(nowPage, totalCount, pageSize, blockSize, "/living/recipe/board.action");
		
		request.setAttribute("list", list);
		request.setAttribute("page", nowPage);
		request.setAttribute("pageBar", pageBar);
		
		return "recipe.board";
	}
	
	@RequestMapping(value="/recipe/detail.action", method=RequestMethod.GET)
	public String boardDetail(HttpServletRequest request, HttpServletResponse response, HttpSession session, String seq, String page) {
		
		RecipeDTO rdto = rdao.getRecipeDto(seq);
		List<RecipeStockDTO> rsList = rsdao.getRecipeStockList(seq);
		List<RecipeOrderDTO> roList = rodao.getRecipeOrderList(seq);
		List<RecipeCommentDTO> rcList = rcdao.getRecipeCommentList(seq);
		
		request.setAttribute("rdto", rdto);
		request.setAttribute("rsList", rsList);
		request.setAttribute("roList", roList);
		request.setAttribute("rcList", rcList);
		request.setAttribute("page", page);
		
		return "recipe.detail";
	}
	
	@RequestMapping(value="/recipe/delComment.action", method=RequestMethod.GET)
	public void delComment(HttpServletRequest request, HttpServletResponse response, HttpSession session, String commentSeq, String recipeSeq, String page) {
		
		int result = rcdao.delComment(commentSeq);
		
		try {
			if (result == 1) {
				response.sendRedirect("/living/recipe/detail.action?seq=" + recipeSeq + "&page=" + page);				
			} else {				
				response.sendRedirect("/living/recipe/detail.action?seq=" + recipeSeq + "&page=" + page);				
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}
	
	@RequestMapping(value="/recipe/addRecipe.action", method=RequestMethod.GET)
	public String addRecipe(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		return "recipe.addRecipe";
	}
	
	@RequestMapping(value="/recipe/editRecipe.action", method=RequestMethod.GET)
	public String edit(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		return "recipe.editRecipe";
	}
	
	
	
}
